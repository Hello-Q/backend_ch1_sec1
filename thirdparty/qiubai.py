import requests
from lxml import etree
import random
from spider import ua


def qiubai():
    headers = {
        'User-Agent': ua.random_ua()
    }

    url = 'https://www.qiushibaike.com/text/'
    response = requests.get(url=url, headers=headers)
    html = etree.HTML(response.text)
    joke_list = html.xpath('//div[@class="content"]')
    data = []
    for joke in joke_list:
        joke = joke.xpath('./span')
        if len(joke) == 1:
            joke = joke[0].xpath('.//text()')
            joke = '\n'.join(joke)
            data.append({'text': joke})

    return data

q = qiubai()

