from django.urls import path
from .views import ProdutoUpdate, ProdutoCreate, ProdutoDelete, EstoqueCreate, EstoqueUpdate, EstoqueDelete
from meuApp import views

urlpatterns = [
    path('home/', views.home, name='home'),

    path('listarProd/', views.listarProd, name='listarProd'),
    path('listarProdutos/', views.listarProdutos, name='listarProdutos'),
    path('listarFard/', views.listarFard, name='listarFard'),
    path('listarFardos/', views.listarFardos, name='listarFardos'),

    path('CadastrarProduto/', ProdutoCreate.as_view(), name='ProdutoCreate'),
    path('produto/<int:pk>', ProdutoUpdate.as_view(), name='ProdutoUpdate'),

    path('CadastrarEstoque/', EstoqueCreate.as_view(), name='EstoqueCreate'),
    path('estoque/<int:pk>', EstoqueUpdate.as_view(), name="EstoqueUpdate"),

    path('ExcluirProduto/<int:pk>', ProdutoDelete.as_view(), name="ProdutoDelete"),
    path('ExcluirEstoque/<int:pk>', EstoqueDelete.as_view(), name="EstoqueDelete")
]