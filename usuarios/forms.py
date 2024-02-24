from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

class CustomAuthenticationForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['placeholder'] = 'Usuário'
        self.fields['password'].widget.attrs['placeholder'] = 'Senha'

class UsuarioForm(UserCreationForm):
    email = forms.EmailField(max_length=100)
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
        widgets = {
            'username':forms.TextInput(attrs={'placeholder':'Usuário'}),
        }
    def clean_email(self):
        e = self.cleaned_data['email']
        if User.objects.filter(email = e).exists():
            raise ValidationError(f"O email {e} já está em uso.")
        return e
    
class CustomUsuarioForm(UsuarioForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['email'].widget = forms.EmailInput(attrs={'placeholder': 'E-mail'})
        self.fields['password1'].widget = forms.PasswordInput(attrs={'placeholder': 'Senha'})
        self.fields['password2'].widget = forms.PasswordInput(attrs={'placeholder': 'Confirmação de senha'})
