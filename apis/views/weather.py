from django.http import HttpResponse, JsonResponse, FileResponse
from thirdparty import weatherapi
import json
from utils.response import CommonResponseMixin
from django.views import View


class Weather(View, CommonResponseMixin):
    def get(self, request):
        pass

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
