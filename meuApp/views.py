from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse_lazy
from django.views.generic.edit import UpdateView, CreateView, DeleteView
from django.views.generic.list import ListView
import pandas as pd
from meuApp.forms import EstoqueFormCreate, ProdutoForm, EstoqueFormUpdate, PerfilUpdateForm, CustomPasswordChangeForm
from .models import Produto, Estoque
from django.contrib.auth.mixins import LoginRequiredMixin
from usuarios.models import Perfil
from django.contrib.auth.views import PasswordChangeView, PasswordChangeForm
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from openpyxl import Workbook
from django.contrib import messages

class HomeView(LoginRequiredMixin, ListView):
    login_url = reverse_lazy('login')
    model = Estoque
    template_name = 'home/home.html'
    def get_queryset(self):
        self.object_list = Estoque.objects.filter(usuario=self.request.user).order_by('dataValidade')
        return self.object_list

class ProdutoCreate(LoginRequiredMixin, CreateView):
    login_url = reverse_lazy('login')
    model = Produto
    form_class = ProdutoForm
    template_name = "cadastros/CadastrarProduto.html"
    success_url = reverse_lazy('ProdutoCreate')
    def form_valid(self, form):
        form.instance.usuario = self.request.user
        url = super().form_valid(form)
        messages.success(self.request, 'Produto Cadastrado!')
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
    form_class = ProdutoForm
    template_name = "editar/produto.html"
    success_url = reverse_lazy('ProdutoList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Produto, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Produto Atualizado com sucesso!')
        return response

class ProdutoDelete(LoginRequiredMixin, DeleteView):
    login_url = reverse_lazy('login')
    model = Produto
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('ProdutoList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Produto, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Produto Deletado com sucesso!')
        return response

class EstoqueCreate(LoginRequiredMixin, CreateView):
    login_url = reverse_lazy('login')
    model = Estoque
    form_class = EstoqueFormCreate
    template_name = "cadastros/CadastrarEstoque.html"
    success_url = reverse_lazy('EstoqueCreate')
    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        form.fields['codProduto'].queryset = form.fields['codProduto'].queryset.filter(usuario=self.request.user)
        return form
    def form_valid(self, form):
        form.instance.usuario = self.request.user
        url = super().form_valid(form)
        messages.success(self.request, 'Fardo Criado!')
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
    form_class = EstoqueFormUpdate
    template_name = "editar/estoque.html"
    success_url = reverse_lazy('EstoqueList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Estoque, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object
    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        form.fields['codProduto'].queryset = form.fields['codProduto'].queryset.filter(usuario=self.request.user)
        return form
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Fardo Atualizado com sucesso!')
        return response

class EstoqueDelete(LoginRequiredMixin, DeleteView):
    login_url = reverse_lazy('login')
    model = Estoque
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('EstoqueList')
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Estoque, pk=self.kwargs['pk'], usuario=self.request.user)
        return self.object
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Fardo Deletado com Sucesso!')
        return response
    
class PerfilUpdate(LoginRequiredMixin, UpdateView):
    login_url = reverse_lazy('login')
    template_name = "perfil/perfil.html"
    model = Perfil
    form_class = PerfilUpdateForm
    success_url = reverse_lazy("PerfilUpdate")
    def get_object(self, queryset=None):
        self.object = get_object_or_404(Perfil, usuario=self.request.user)
        return self.object
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Perfil Atualizado com sucesso!')
        return response
    
class AlteraSenha(LoginRequiredMixin, PasswordChangeView):
    login_url = reverse_lazy('login')
    form_class = CustomPasswordChangeForm
    template_name = "perfil/senha.html"
    success_url = reverse_lazy('alteraSenha')
    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Senha Atualizada com Sucesso!')
        return response

@login_required
def UploadExcelProdutos(request):
    if request.method == 'POST':
        arquivo = request.FILES.get('inputexcel')
        try:
            df = pd.read_excel(arquivo)
            for index, row in df.iterrows():
                Produto.objects.create(
                    descricao=row['Descrição'],
                    tipo=row['Tipo'],
                    marca=row['Marca'],
                    preco=row['Preço'],
                    usuario=request.user
                )
            messages.success(request, "Produtos Adicionados.")
            return redirect('/ListarProdutos')
        except Exception as e:
            messages.error(request, "Houve um erro com o arquivo.")
            return redirect('/ListarProdutos')
    else:
        return redirect('/ListarProdutos')
    
@login_required
def UploadExcelEstoque(request):
    if request.method == 'POST':
        arquivo = request.FILES.get('inputexcel')
        try:
            df = pd.read_excel(arquivo)
            for index, row in df.iterrows():
                codProduto=get_object_or_404(Produto, id=row['Código do Produto'], usuario=request.user)
                Estoque.objects.create(
                    codProduto=codProduto,
                    quantidade=row['Quantidade'],
                    dataFabricacao=row['Data de Fabricação'],
                    dataValidade=row['Data de Validade'],
                    usuario=request.user
                )
            messages.success(request, "Fardos Adicionados.")
            return redirect('/ListarEstoque')
        except Exception as e:
            messages.error(request, "Houve um erro com o arquivo.")
            return redirect('/ListarEstoque')
    else:
        messages.error(request, "Houve um erro com o arquivo.")
        return redirect('/ListarEstoque')
    
@login_required
def DownloadExcelProduto(request):
    produtos = Produto.objects.filter(usuario=request.user)
    wb = Workbook()
    ws = wb.active
    ws.append(["Descrição", "Tipo", "Marca", "Preço"])
    for produto in produtos:
        ws.append([produto.descricao, produto.tipo, produto.marca, produto.preco])
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=produtos.xlsx'
    wb.save(response)
    return response

@login_required
def DownloadExcelEstoque(request):
    estoques = Estoque.objects.filter(usuario=request.user)
    wb = Workbook()
    ws = wb.active
    ws.append(["Código do Produto", "Quantidade", "Data de Fabricação", "Data de Validade"])
    for estoque in estoques:
        data_fabricacao = estoque.dataFabricacao.strftime('%d/%m/%Y') if estoque.dataFabricacao else ''
        data_validade = estoque.dataValidade.strftime('%d/%m/%Y') if estoque.dataValidade else ''
        ws.append([estoque.codProduto.id, estoque.quantidade, data_fabricacao, data_validade])
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=estoques.xlsx'
    wb.save(response)
    return response