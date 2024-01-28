from django.db import models
from django.contrib.auth.models import User

class Produto(models.Model):
    OPCAO_1 = 'Medicamento'
    OPCAO_2 = 'Alimento'
    OPCAO_3 = 'Limpeza'

    OPCOES_ENUM = [
        (OPCAO_1, 'Medicamento'),
        (OPCAO_2, 'Alimento'),
        (OPCAO_3, 'Limpeza'),
    ]

    descricao = models.TextField(max_length=255, verbose_name="Descrição")
    tipo = models.CharField(max_length=20, choices=OPCOES_ENUM)
    marca = models.TextField(max_length=255)
    preco = models.DecimalField(max_digits=8, decimal_places=2, verbose_name="Preço")
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    def __str__(self):
        return self.descricao

class Estoque(models.Model):
    codProduto = models.ForeignKey(Produto, on_delete=models.CASCADE, related_name='fardos', verbose_name="Produto")
    quantidade = models.IntegerField()
    dataFabricacao = models.DateField(verbose_name="Data de Fabricação")
    dataValidade = models.DateField(verbose_name="Data de Validade")
    usuario = models.ForeignKey(User, on_delete=models.CASCADE) 
    def __str__(self):
        return f"Fardo de {self.codProduto.descricao} ({self.dataValidade})"