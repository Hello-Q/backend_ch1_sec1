import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend_ch1_sec1.settings')
django.setup()

from django.core.mail import send_mail
from django.conf import settings

from_email = settings.EMAIL_HOST_USER

send_mail('MyDjango', 'This is Django test', from_email, ['984430071@qq.com'])

print('已发送')