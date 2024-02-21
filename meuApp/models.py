from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

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
    imagem = models.ImageField(upload_to='images/', blank=True, null=True, verbose_name="Imagem")
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
    def dias_restantes(self):
        dias_restantes = (self.dataValidade - timezone.now().date()).days
        return dias_restantes
    def condicao(self):
        dias_restantes = self.dias_restantes()
        if dias_restantes < 0:
            condicao = 'VENCIDO'
        elif 0 <=  dias_restantes <= 14:
            condicao = 'PRÓXIMO DE VENCER'
        else:
            condicao = 'PROVEITOSO'
        return condicao
