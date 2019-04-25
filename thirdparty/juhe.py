import requests
import json


def stock(market, code):
    """
    沪深股票
    :param market: 上交所 = sh, 深交所 = sz
    :param code: 股票编号
    :return:
    """
    key = 'd235c32da0bf63505b0f90ebda5069cf'
    api = 'http://web.juhe.cn:8080/finance/stock/hs'
    params = 'gid=%s&key=%s' % (market+code, key)
    url = api + '?' + params
    response = requests.get(url)
    data = json.loads(response.text)
    data = data.get('result')[0].get('data')

    response = dict({
        "name": data["name"],  # 名称
        "now_price": data["nowPri"],  # 当前价格
        "today_min": data["todayMin"],  # 今日最低
        "today_max": data["todayMax"],  # 今日最高
        "start_price": data["todayStartPri"],  # 今日开盘价
        "date": data["date"],  # 日期
        "time": data["time"],  # 时间
        })
    response['is_rising'] = data['nowPri'] > data['todayStartPri']  # 涨跌
    sub = abs(float(data['nowPri'])-float(data['todayStartPri']))  # 涨幅
    response['sub'] = float('%.3f' % sub)
    return response


def constellation(cons_name):
    """
    :param cons_name:星座名字
    :return: 星座运势
    """
    key = '658878bf95ee59a58bb215773cc82ff2'
    api = 'http://web.juhe.cn:8080/constellation/getAll'
    types = ('today',)
    params = 'consName=%s&type=%s&key=%s' % (cons_name, types[0], key)
    url = api + '?' + params
    response = requests.get(url)
    data = json.loads(response.text)
    return {
        'name': cons_name,
        'text': data['summary'],
    }
