from django.http import HttpResponse, JsonResponse, FileResponse
from thirdparty import weatherapi
import json
from utils.response import CommonResponseMixin
from utils.response import ReturnCode
from django.views import View
from utils.wx.auth import already_authorize
from authorization.models import User
from django.views.decorators.cache import cache_page


class Weather(View, CommonResponseMixin):

    def get(self, request):
        if not already_authorize(request):
            response = self.wrap_json_response(code=ReturnCode.UNAUTHORIZED)
        else:
            data = []
            open_id = request.session.get('open_id')
            user = User.objects.filter(open_id=open_id)[0]
            cities = json.loads(user.focus_cities)
            for city in cities:
                result = weatherapi.weather(city['area'][:-1])
                result['city'] = city
                data.append(result)
            response = self.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
        return JsonResponse(response, safe=False)

    def post(self, request):
        data = []
        received_body = request.body
        received_body = json.loads(received_body)
        cities = received_body.get('cities')
        print(cities)
        for city in cities:
            result = weatherapi.weather(city)
            result['city'] = city
            data.append(result)
        data = self.wrap_json_response(data=data)
        return JsonResponse(data=data, safe=False)
