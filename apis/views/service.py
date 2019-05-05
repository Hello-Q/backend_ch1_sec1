from utils.response import *
from thirdparty import juhe, qiubai
from django.http import JsonResponse
from utils.wx.auth import already_authorize, get_user


constellations = ['巨蟹座', '白羊座']
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
    for stock in popular_stocks:
        result = juhe.stock(stock['market'], stock['code'])
        data.append(result)
    response = wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def constellation(request):
    data = []
    for c in constellations:
        result = juhe.constellation(c)
        data.append(result)
    response = wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def joke(request):
    data = qiubai.qiubai()
    response = wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)
