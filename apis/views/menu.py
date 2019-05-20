import os

import utils.response
import yaml
import json
from authorization.models import User
from backend_ch1_sec1 import settings
from django.http import JsonResponse
from django.views import View
from utils.response import CommonResponseMixin, ReturnCode
from utils.wx.auth import already_authorize, get_user
from apis.models import App


def init_app_data():
    data_file = os.path.join(settings.BASE_DIR, 'app.yaml')
    with open(data_file, 'r', encoding='utf-8') as f:
        apps = yaml.load(f)
        return apps


def get_menu(request):
    global_app_data = init_app_data()
    published_app_data = global_app_data.get('published')
    response = utils.response.wrap_json_response(data=published_app_data,
                                                 code=utils.response.ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


class MenuList(View, CommonResponseMixin):
    def get(self, request):
        menu_list = App.objects.all()
        app_list = list()
        for app in menu_list:
            app_list.append(app.to_dict())
            print(type(app))
            print(type(app.to_dict()))
        response = self.wrap_json_response(data=app_list, code=ReturnCode.SUCCESS)
        return JsonResponse(data=response, safe=False)


class UserMenu(View, CommonResponseMixin):
    def get(self, request):
        if not already_authorize(request):
            response = self.wrap_json_response(code=ReturnCode.UNAUTHORIZED)
            return JsonResponse(data=response, safe=False)
        open_id = request.session.get('open_id')
        user = User.objects.get(open_id=open_id)
        menu_list = user.menu.all()
        user_menu = list()
        for app in menu_list:
            user_menu.append(app.to_dict())
        response = self.wrap_json_response(data=user_menu, code=ReturnCode.SUCCESS)
        return JsonResponse(data=response, safe=False)

    def post(self, request):
        if not already_authorize(request):
            response = self.wrap_json_response(code=ReturnCode.UNAUTHORIZED)
            return JsonResponse(data=response, safe=False)
        user = get_user(request)
        post_menu = json.loads(request.body.decode('utf-8'))
        post_menu = post_menu.get('data')
        focus_menu = list()
        for item in post_menu:
            item = App.objects.get(appid=item.get('appid'))
            focus_menu.append(item)
        user.menu.set(focus_menu)
        user.save()
        response = self.wrap_json_response(code=ReturnCode.SUCCESS)
        return JsonResponse(data=response, safe=False)
