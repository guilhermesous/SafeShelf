from django.shortcuts import render, redirect
from .models import Produto, Estoque
from datetime import datetime
btn_pesquisa = False
tipo = ''
campo = ''

def home(request):
    return render(request, 'home/home.html')

def cadProduto(request):
    return render(request, 'cadastro_Produtos/cadProduto.html')

def cadastroProdutos(request):
    novoProduto = Produto()
    novoProduto.descricao = request.POST.get('desc')
    novoProduto.marca = request.POST.get('marca')
    novoProduto.tipo = request.POST.get('tipo')
    novoProduto.preco = request.POST.get('preco')
    novoProduto.save()
    return redirect('/cadProduto')

def cadFardo(request):
    return render(request, 'cadastro_Fardos/cadFardo.html')

def cadastroFardos(request):
    novoFardo = Estoque()

    codProduto = int(request.POST.get('codProduto'))
    produto = Produto.objects.get(id=codProduto)

    novoFardo.codProduto = produto
    novoFardo.quantidade = request.POST.get('quant')
    novoFardo.dataFabricacao = request.POST.get('dataFab')
    novoFardo.dataValidade = request.POST.get('dataVal')
    novoFardo.save()
    return redirect('/cadFardo')

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
    