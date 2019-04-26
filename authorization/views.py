from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse
from utils.response import *
from utils.wx.auth import c2s, already_authorize
from .models import User
from django.views import View
import json


def test_session(request):
    response = wrap_json_response(code=ReturnCode.SUCCESS)

    response = JsonResponse(data=response, safe=False)
    return response


class UserView(View, CommonResponseMixin):
    def get(self, request):
        if not already_authorize(request):
            response = self.wrap_json_response(code=ReturnCode.SUCCESS)
            return JsonResponse(data=response, safe=False)
        open_id = request.session['open_id']
        user = User.objects.get(open_id=open_id)
        data = dict()
        data['focus'] = dict()
        data['focus']['city'] = json.loads(user.focus_cities)
        data['focus']['stock'] = json.loads(user.focus_stock)
        data['focus']['constellation'] = json.loads(user.focus_constellations)
        response = self.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
        return JsonResponse(data=response, safe=False)

    def post(self, request):
        if not already_authorize(request):
            response = self.wrap_json_response(data=0, code=ReturnCode.SUCCESS)
            return JsonResponse(data=response, safe=False)
        open_id = request.session['open_id']
        user = User.objects.get(open_id=open_id)
        received_body = request.body.decode('utf-8')
        received_body = eval(received_body)
        cities = received_body['city']
        stocks = received_body['stock']
        constellation = received_body['constellation']
        user.focus_cities = json.dumps(cities)
        user.focus_stock = json.dumps(stocks)
        user.focus_constellations = json.dumps(constellation, ensure_ascii=False)
        print(user.focus_constellations)
        print(constellation)
        user.save()
        response = self.wrap_json_response(code=ReturnCode.SUCCESS, message='modify user info success.')
        return JsonResponse(data=response, safe=False)


def __authorize_by_code(request):
    """
    使用wx.Login得到的临时code到微信提供的code2session接口授权
    """
    post_data = request.body.decode('utf-8')
    post_data = json.loads(post_data)
    code = post_data['code']
    app_id = post_data['appId']
    nickname = post_data['nickname']

    response = dict()
    if not code or not app_id:
        response['message'] = 'authorize failed, need entire authorization data'
        response['code'] = ReturnCode.BROKEN_AUTHORIZED_DATA
        return JsonResponse(data=response, safe=False)

    data = c2s(app_id, code)
    openid = data['openid']
    print('get openid: ', openid)
    if not openid:
        response = wrap_json_response(code=ReturnCode.FAILED, message='auth failed')
        return JsonResponse(data=response, safe=False)
    request.session['open_id'] = openid
    request.session['is_authorize'] = True

    if not User.objects.filter(open_id=openid):
        new_user = User(open_id=openid, nickname=nickname)
        new_user.save()

    response = wrap_json_response(code=ReturnCode.SUCCESS, message='auth success')
    return JsonResponse(data=response, safe=False)


def authorize(request):
    return __authorize_by_code(request)
