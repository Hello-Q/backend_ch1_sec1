import logging

from django.utils.deprecation import MiddlewareMixin
logger = logging.getLogger('django')


class TestMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        logger.info('请求之前')
        response = self.get_response(request)
        logger.info('请求之后')
        return response
