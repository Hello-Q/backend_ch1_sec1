import json
import requests
from backend_ch1_sec1 import settings


def already_authorize(reqeust):
    # 用户登录验证
    is_authorize = False
    if requests.session['is_authorize']:
        is_authorize = True
    return is_authorize


def c2s(appid, code):
    return code2session(appid, code)


def code2session(appid, code):
    api = 'https://api.weixin.qq.com/sns/jscode2session'
    params = 'appid=%s&secret=%s&js_code=%s&grant_type=authorization_code' %\
             (appid, settings.WX_APP_SECRET, code)
    url = api + '?' + params
    response = requests.get(url)
    data = json.loads(response.text)
    print(data)
    return data

