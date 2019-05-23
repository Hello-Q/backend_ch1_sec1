from django.http import HttpResponse


def test(request):
    print('hello')
    return HttpResponse('word')
