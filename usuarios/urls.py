from django.urls import path
from django.contrib.auth import views as auth_views
from usuarios import views

urlpatterns = [
    path('', views.origin, name='origin'),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name="login"),
    path('logout/', auth_views.LogoutView.as_view(), name='logout')
]