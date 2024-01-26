from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import TemplateView
from django.views.generic.edit import UpdateView, CreateView, DeleteView
from django.views.generic.list import ListView
from .models import Produto, Estoque
from datetime import datetime
from django.contrib.auth.mixins import LoginRequiredMixin

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
    paginate_by = 10
    def get_queryset(self):
        if 'tipo_pesquisa' in self.request.GET and 'campo_pesquisa' in self.request.GET:
            tipo = self.request.GET.get('tipo_pesquisa')
            campo = self.request.GET.get('campo_pesquisa')
            produtos = Produto.objects.filter(usuario=self.request.user, **{f"{tipo}__icontains": campo})
        else:
            produtos = Produto.objects.filter(usuario=self.request.user)

        return produtos

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
    def form_valid(self, form):
        form.instance.usuario = self.request.user
        url = super().form_valid(form)
        return url

class EstoqueList(LoginRequiredMixin, ListView):
    login_url = reverse_lazy('login')
    model = Estoque
    template_name = 'listar/estoque.html'
    paginate_by = 20
    def get_queryset(self):
        if 'tipo_pesquisa' in self.request.GET and 'campo_pesquisa' in self.request.GET:
            tipo = self.request.GET.get('tipo_pesquisa')
            campo = self.request.GET.get('campo_pesquisa')
            if tipo == 'dataFabricacao' or 'dataValidade':
                try:
                    data_datetime = datetime.strptime(campo, "%d/%m/%Y")
                    campo = data_datetime.strftime("%Y-%m-%d")
                except ValueError:
                    pass
            elif tipo == 'codProduto':
                sql = "SELECT "
                pass
            else:
                pass
            fardos = Estoque.objects.filter(usuario=self.request.user, **{f"{tipo}__icontains": campo})
        else:
            fardos = Estoque.objects.filter(usuario=self.request.user)
        return fardos

class EstoqueUpdate(LoginRequiredMixin, UpdateView):
    login_url = reverse_lazy('login')
    model = Estoque
    fields = ['codProduto', 'quantidade']
    template_name = "editar/estoque.html"
    success_url = reverse_lazy('EstoqueList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Estoque, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object

class EstoqueDelete(LoginRequiredMixin, DeleteView):
    login_url = reverse_lazy('login')
    model = Estoque
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('EstoqueList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Estoque, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object