from django.contrib import admin
from django.urls import path
from meuApp import views

urlpatterns = [
    path('home/', views.home, name='home'),
    path('cadProduto/', views.cadProduto, name='cadProduto'),
    path('cadastroProdutos/', views.cadastroProdutos, name='cadastroProdutos'),
    path('cadFardo/', views.cadFardo, name='cadFardo'),
    path('cadastroFardos/', views.cadastroFardos, name='cadastroFardos'),
    path('listarProd/', views.listarProd, name='listarProd'),
    path('listarProdutos/', views.listarProdutos, name='listarProdutos'),
    path('listarFard/', views.listarFard, name='listarFard'),
    path('listarFardos/', views.listarFardos, name='listarFardos'),
    path('admin/', admin.site.urls),
]
