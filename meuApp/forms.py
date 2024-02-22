from django.utils import timezone
from django import forms
from .models import Estoque, Produto
from usuarios.models import Perfil
from django.core.exceptions import ValidationError
from django.http import request
from django.contrib.auth.views import PasswordChangeForm

class ProdutoForm(forms.ModelForm):
    class Meta:
        model = Produto
        fields = ['descricao', 'marca', 'tipo', 'preco', 'imagem']
        widgets = {
            'descricao': forms.TextInput(attrs={'type': 'text', 'placeholder': 'Descrição do Produto'}),
            'marca': forms.TextInput(attrs={'type': 'text', 'placeholder': 'Marca do Produto'}),
            'preco': forms.NumberInput(attrs={'placeholder': 'Preço Unitário'})
        }
    def clean_preco(self):
        preco = self.cleaned_data['preco']
        if preco <= 0:
            raise ValidationError("Não é possível registrar um preço igual ou menor que zero.")
        return preco

class EstoqueFormCreate(forms.ModelForm):
    class Meta:
        model = Estoque
        fields = ['codProduto', 'quantidade', 'dataFabricacao', 'dataValidade']
        widgets = {
            'quantidade': forms.NumberInput(attrs={'placeholder': 'Quantidade do Fardo'}),
            'dataFabricacao': forms.DateInput(attrs={'type': 'date'}),
            'dataValidade': forms.DateInput(attrs={'type': 'date'}),
        }
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
        widgets = {
            'quantidade': forms.NumberInput(attrs={'placeholder': 'Quantidade do Fardo'}),
        }
    def clean_quantidade(self):
        quant = self.cleaned_data['quantidade']
        if quant <= 0:
            raise ValidationError("Não é possível cadastrar um fardo com quantidade zero ou menor que isso.")
        return quant
    
class PerfilUpdateForm(forms.ModelForm):
    class Meta:
        model = Perfil
        fields = ["nomeCompleto", "telefone"]
        widgets = {
            'nomeCompleto': forms.TextInput(attrs={'placeholder': 'Digite seu nome'}),
            'telefone': forms.TextInput(attrs={'placeholder': 'Digite seu telefone'})
        }

class CustomPasswordChangeForm(PasswordChangeForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['old_password'].widget = forms.PasswordInput(attrs={'placeholder': 'Digite a senha atual'})
        self.fields['new_password1'].widget = forms.PasswordInput(attrs={'placeholder': 'Digite a senha nova'})
        self.fields['new_password2'].widget = forms.PasswordInput(attrs={'placeholder': 'Repita a senha'})