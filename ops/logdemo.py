import os
import django
import logging
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend_ch1_sec1.settings')
django.setup()


def logdemo():
    logger = logging.getLogger('django')
    logger.debug('hello logging')


if __name__ == '__main__':
    logdemo()
