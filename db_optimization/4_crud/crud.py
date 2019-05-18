import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend_ch1_sec1.settings')
django.setup()

from authorization.models import User
from django.db.models import Value
from django.db.models.functions import Concat, Length, Upper, Lower
from apis.models import App

def concat_function():
    user = User.objects.filter(open_id='osYBs5ZmG1SobLJ_821dW9CvzcXw').annotate(
        screen_name=Concat(
            Value('open_id='),
            'open_id',
            Value(','),
            Value('nickname='),
            'nickname')
    )[0]
    print(user.screen_name)


def length_function():
    user = User.objects.filter(open_id='osYBs5ZmG1SobLJ_821dW9CvzcXw').annotate(
        open_id_length=Length('open_id')
    )[0]
    print(user.open_id_length)


def case_function():
    user = User.objects.filter(open_id='osYBs5ZmG1SobLJ_821dW9CvzcXw').annotate(
        upper_open_id=Upper('open_id'),
        lower_open_id=Lower('open_id'),
    )[0]
    print(user.upper_open_id)
    print(user.lower_open_id)

from django.db.models.functions import Now

def now_function():
    apps = App.objects.filter(publish_date__lte=Now())
    for app in apps:
        print(app)

from django.db.models.functions import Trunc
from django.db.models import Count

def trunc_function():
    app_per_day = App.objects.annotate(publish_day=Trunc('publish_date', 'month'))\
        .values('publish_day')\
        .annotate(publish_num=Count('appid'))
    for app in app_per_day:
        print(app)

if __name__ == '__main__':
    trunc_function()
