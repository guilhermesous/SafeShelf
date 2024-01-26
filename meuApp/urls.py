from django.urls import path
from .views import HomeView, ProdutoUpdate, ProdutoCreate, ProdutoDelete, EstoqueCreate, EstoqueUpdate, EstoqueDelete, ProdutoList, EstoqueList
from meuApp import views

urlpatterns = [
    path('home/', HomeView.as_view(), name='home'),

    path('ListarProdutos/', ProdutoList.as_view(), name='ProdutoList'),
    path('CadastrarProduto/', ProdutoCreate.as_view(), name='ProdutoCreate'),
    path('produto/<int:pk>', ProdutoUpdate.as_view(), name='ProdutoUpdate'),

    path('ListarEstoque/', EstoqueList.as_view(), name='EstoqueList'),
    path('CadastrarEstoque/', EstoqueCreate.as_view(), name='EstoqueCreate'),
    path('estoque/<int:pk>', EstoqueUpdate.as_view(), name="EstoqueUpdate"),

    path('ExcluirProduto/<int:pk>', ProdutoDelete.as_view(), name="ProdutoDelete"),
    path('ExcluirEstoque/<int:pk>', EstoqueDelete.as_view(), name="EstoqueDelete")
]