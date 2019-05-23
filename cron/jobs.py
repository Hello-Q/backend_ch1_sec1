import logging
import datetime
import os
from django.conf import settings

logger = logging.getLogger('django')


def demo():
    message = 'Job log in crontab, now time is ' + str(datetime.datetime.now())
    print(message)
    logging.info(message)


# 分析日志任务
def statistics():
    data_file = os.path.join(settings.BASE_DIR, 'log', 'statistics.log')
    if not data_file:
        logger.warning('file not exists. file=[%s]' %data_file)
