from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from django.views.generic.edit import UpdateView, CreateView, DeleteView
from .models import Produto, Estoque
from datetime import datetime
btn_pesquisa = False
tipo = ''
campo = ''

def home(request):
    return render(request, 'home/home.html')

def listarProd(request):
    global btn_pesquisa
    global tipo
    global campo
    produtos = {'produtos':Produto.objects.all()}
    if btn_pesquisa == True:
        pesquisa = Produto.objects.raw(f"SELECT * FROM meuapp_produto WHERE {tipo} LIKE %s;", [f'{campo}%'])
        resultados = [{'id':f.id, 'descricao':f.descricao, 'marca':f.marca, 'tipo':f.tipo, 'preco':f.preco} for f in pesquisa]
        produtos = {'produtos': resultados}
    else:
        produtos = {'produtos':Produto.objects.all()}
    btn_pesquisa = False
    campo = ''
    tipo = ''
    return render(request, 'listar_Produtos/listarProdutos.html', produtos)

def listarProdutos(request):
    global btn_pesquisa
    global tipo
    global campo
    if request.method == 'POST':
        if 'pesquisar' in request.POST:
            tipo = request.POST.get('tipo-pesquisa')
            campo = request.POST.get('campo-pesquisa')
            btn_pesquisa = True
    return redirect('/listarProd')

def listarFard(request):
    global btn_pesquisa
    global tipo
    global campo
    pesquisa = Estoque.objects.raw("SELECT id, codProduto_id, quantidade, DATE_FORMAT(dataFabricacao, '%%d/%%m/%%Y') AS dataFabricacao, DATE_FORMAT(dataValidade, '%%d/%%m/%%Y') AS dataValidade FROM meuapp_estoque")
    resultados = [{'id': f.id, 'codProduto': f.codProduto_id, 'quantidade': f.quantidade, 'dataFabricacao': f.dataFabricacao, 'dataValidade': f.dataValidade} for f in pesquisa]
    fardos = {'fardos': resultados}
    if btn_pesquisa == True:
        pesquisa = Estoque.objects.raw(f"SELECT id, codProduto_id, quantidade, DATE_FORMAT(dataFabricacao, '%%d/%%m/%%Y') AS dataFabricacao, DATE_FORMAT(dataValidade, '%%d/%%m/%%Y') AS dataValidade FROM meuapp_estoque WHERE {tipo} LIKE %s;", [f'{campo}%'])
        resultados = [{'id': f.id, 'codProduto': f.codProduto_id, 'quantidade': f.quantidade, 'dataFabricacao': f.dataFabricacao, 'dataValidade': f.dataValidade} for f in pesquisa]
        fardos = {'fardos': resultados}
    return render(request, 'listar_Fardos/listarFardos.html', fardos)

def listarFardos(request):
    global btn_pesquisa
    global tipo
    global campo
    if request.method == 'POST':
        if 'pesquisar' in request.POST:
            btn_pesquisa = True
            tipo = request.POST.get('tipo-pesquisa')
            campo = request.POST.get('campo-pesquisa')
            if tipo == 'dataFabricacao' or 'dataValidade':
                try:
                    data_datetime = datetime.strptime(campo, "%d/%m/%Y")
                    campo = data_datetime.strftime("%Y-%m-%d")
                except ValueError:
                    pass
            else:
                pass
    return redirect('/listarFard')

class ProdutoCreate(CreateView):
    model = Produto
    fields = ['descricao', 'marca', 'tipo', 'preco']
    template_name = "cadastros/CadastrarProduto.html"
    success_url = reverse_lazy('ProdutoCreate')

class ProdutoUpdate(UpdateView):
    model = Produto
    fields = ['descricao', 'marca', 'tipo', 'preco']
    template_name = "editar/produto.html"
    success_url = reverse_lazy('listarProdutos')

class ProdutoDelete(DeleteView):
    model = Produto
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('listarProdutos')

class EstoqueCreate(CreateView):
    model = Estoque
    fields = ['codProduto', 'quantidade', 'dataFabricacao', 'dataValidade']
    template_name = "cadastros/CadastrarEstoque.html"
    success_url = reverse_lazy('EstoqueCreate')

class EstoqueUpdate(UpdateView):
    model = Estoque
    fields = ['codProduto', 'quantidade']
    template_name = "editar/estoque.html"
    success_url = reverse_lazy('listarFardos')

class EstoqueDelete(DeleteView):
    model = Estoque
    template_name = "excluir/excluir.html"
    success_url = reverse_lazy('listarFardos')