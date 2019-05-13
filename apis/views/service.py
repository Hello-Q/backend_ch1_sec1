import json
from django.http import JsonResponse
from thirdparty import juhe, qiubai
from utils.response import *
from utils.wx.auth import already_authorize, get_user

all_constellations = ['巨蟹座']
popular_stocks = [
    {
        'code': '000001',
        'name': '平安银行',
        'market': 'sz'
    },
    {
        'code': '000002',
        'name': '万科A',
        'market': 'sz'
    },
    {
        'code': '600036',
        'name': '招商银行',
        'market': 'sh'
    },
    {
        'code': '601398',
        'name': '工商银行',
        'market': 'sh'
    }
]


def stock(request):
    data = []
    if already_authorize(request):
        user = get_user(request)
        stocks = json.loads(user.focus_stock)
    else:
        stocks = popular_stocks

    for stock in stocks:
        result = juhe.stock(stock['market'], stock['code'])
        data.append(result)
    response = wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def constellation(request):
    data = []
    if already_authorize(request):
        user = get_user(request)
        constellations = json.loads(user.focus_constellations)
    else:
        constellations = all_constellations
    for c in constellations:
        result = juhe.constellation(c)
        data.append(result)
    response = wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def joke(request):
    data = qiubai.qiubai()
    response = wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)
