from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import TemplateView
from django.views.generic.edit import UpdateView, CreateView, DeleteView
from django.views.generic.list import ListView
from .models import Produto, Estoque
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from usuarios.models import Perfil
from usuarios.forms import UsuarioForm
from django.contrib.auth.views import PasswordChangeView, PasswordChangeForm

class HomeView(LoginRequiredMixin, TemplateView):
    login_url = reverse_lazy('login')
    template_name = 'home/home.html'

class ProdutoCreate(LoginRequiredMixin, CreateView):
    login_url = reverse_lazy('login')
    model = Produto
    fields = ['descricao', 'marca', 'tipo', 'preco']
    template_name = "cadastros/CadastrarProduto.html"
    success_url = reverse_lazy('ProdutoCreate')
    def form_valid(self, form):
        form.instance.usuario = self.request.user
        url = super().form_valid(form)
        return url

class ProdutoList(LoginRequiredMixin, ListView):
    login_url = reverse_lazy('login')
    model = Produto
    template_name = 'listar/produto.html'
    def get_queryset(self):
        self.object_list = Produto.objects.filter(usuario=self.request.user)
        return self.object_list

class ProdutoUpdate(LoginRequiredMixin, UpdateView):
    login_url = reverse_lazy('login')
    model = Produto
    fields = ['descricao', 'marca', 'tipo', 'preco']
    template_name = "editar/produto.html"
    success_url = reverse_lazy('ProdutoList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Produto, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object

class ProdutoDelete(LoginRequiredMixin, DeleteView):
    login_url = reverse_lazy('login')
    model = Produto
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('ProdutoList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Produto, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object

class EstoqueCreate(LoginRequiredMixin, CreateView):
    login_url = reverse_lazy('login')
    model = Estoque
    fields = ['codProduto', 'quantidade', 'dataFabricacao', 'dataValidade']
    template_name = "cadastros/CadastrarEstoque.html"
    success_url = reverse_lazy('EstoqueCreate')
    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        form.fields['codProduto'].queryset = form.fields['codProduto'].queryset.filter(usuario=self.request.user)
        return form
    def form_valid(self, form):
        form.instance.usuario = self.request.user
        url = super().form_valid(form)
        return url

class EstoqueList(LoginRequiredMixin, ListView):
    login_url = reverse_lazy('login')
    model = Estoque
    template_name = 'listar/estoque.html'
    def get_queryset(self):
        self.object_list = Estoque.objects.filter(usuario=self.request.user)
        return self.object_list

class EstoqueUpdate(LoginRequiredMixin, UpdateView):
    login_url = reverse_lazy('login')
    model = Estoque
    fields = ['codProduto', 'quantidade']
    template_name = "editar/estoque.html"
    success_url = reverse_lazy('EstoqueList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Estoque, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object
    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        form.fields['codProduto'].queryset = form.fields['codProduto'].queryset.filter(usuario=self.request.user)
        return form

class EstoqueDelete(LoginRequiredMixin, DeleteView):
    login_url = reverse_lazy('login')
    model = Estoque
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('EstoqueList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Estoque, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object
    
class PerfilUpdate(LoginRequiredMixin, UpdateView):
    login_url = reverse_lazy('login')
    template_name = "perfil/perfil.html"
    model = Perfil
    fields = ["nomeCompleto", "telefone"]
    success_url = reverse_lazy("PerfilUpdate")
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Perfil, usuario=self.request.user)
        return self.object
    
class AlteraSenha(LoginRequiredMixin, PasswordChangeView):
    login_url = reverse_lazy('login')
    form_class = PasswordChangeForm
    template_name = "perfil/senha.html"
    success_url = reverse_lazy('alteraSenha')