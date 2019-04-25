import json
import requests


def weather(city):
    """
    :param city:城市名称
    :return: 实况天气
    """
    api = 'https://www.tianqiapi.com/api/'
    version = 'v6'
    params = 'version=%s&city=%s' % (version, city)
    url = api + '?' + params
    print(url)
    response = requests.get(url)
    weather_data = json.loads(response.text)
    print(weather_data)
    response = dict()
    response['wea'] = weather_data['wea']  # 天气情况
    response['tem'] = weather_data['tem']  # 温度
    response['win'] = weather_data['win']  # 风向
    response['win_speed'] = weather_data['win_speed']  # 风力
    response['humidity'] = weather_data['humidity']  # 湿度
    response['tip'] = weather_data['air_tips']  # 提醒
    return response


if __name__ == '__main__':
    f = weather('南京')
    print(f)
