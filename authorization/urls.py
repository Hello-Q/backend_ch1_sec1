from django.urls import path
from . import views

urlpatterns = [
    path('test/', views.test_session),
    path('authorize/', views.authorize),
    path('user/', views.UserView.as_view()),
    path('logout/', views.logout),
    path('status/', views.get_status),
]
