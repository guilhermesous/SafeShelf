from django.utils import timezone
from django import forms
from .models import Estoque, Produto
from django.core.exceptions import ValidationError
from django.http import request

class ProdutoForm(forms.ModelForm):
    class Meta:
        model = Produto
        fields = ['descricao', 'marca', 'tipo', 'preco', 'imagem']
    def clean_preco(self):
        preco = self.cleaned_data['preco']
        if preco <= 0:
            raise ValidationError("Não é possível registrar um preço igual ou menor que zero.")
        return preco

class EstoqueFormCreate(forms.ModelForm):
    class Meta:
        model = Estoque
        fields = ['codProduto', 'quantidade', 'dataFabricacao', 'dataValidade']
    def clean_dataFabricacao(self):
        dataFab = self.cleaned_data['dataFabricacao']
        data_atual = timezone.now().date()
        if dataFab > data_atual:
            raise ValidationError("A data de Fabricação deve ser anterior ou igual a hoje.")
        return dataFab
    def clean_dataValidade(self):
        dataVal = self.cleaned_data['dataValidade']
        data_atual = timezone.now().date()
        if dataVal < data_atual:
            raise ValidationError("A data de Validade deve ser igual ou posterior a hoje.")
        return dataVal
    def clean_quantidade(self):
        quant = self.cleaned_data['quantidade']
        if quant <= 0:
            raise ValidationError("Não é possível cadastrar um fardo com quantidade zero ou menor que isso.")
        return quant
    
class EstoqueFormUpdate(forms.ModelForm):
    class Meta:
        model = Estoque
        fields = ['codProduto', 'quantidade']
    def clean_quantidade(self):
        quant = self.cleaned_data['quantidade']
        if quant <= 0:
            raise ValidationError("Não é possível cadastrar um fardo com quantidade zero ou menor que isso.")
        return quant