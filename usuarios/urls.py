from django.urls import include, path
from django.contrib.auth import views as auth_views
from usuarios import views
from .views import PerfilCreate
from .forms import CustomAuthenticationForm

urlpatterns = [
    path('', views.origin, name='origin'),
    path('login/', auth_views.LoginView.as_view(authentication_form=CustomAuthenticationForm, template_name='login/login.html'), name="login"),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('cadastrar/', PerfilCreate.as_view(), name='cadastrar'),
    path('redefinirSenha/', views.redefinirSenha, name='redefinirSenha'),
    path('enviarEmail/', views.enviarEmail, name='enviarEmail'),
]