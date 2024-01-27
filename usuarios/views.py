from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from .forms import UsuarioForm
from django.core.mail import send_mail
from .models import Perfil
from django.core.exceptions import ValidationError

def origin(request):
    return redirect('/login')

class PerfilCreate(CreateView):
    template_name = "login/cadastro.html"
    form_class = UsuarioForm
    success_url = reverse_lazy('login')
    def form_valid(self, form):
        url = super().form_valid(form)
        Perfil.objects.create(usuario=self.object)
        return url

def redefinirSenha(request):
    return render(request, 'login/email.html')

def enviarEmail(request):
    render(request, 'login/email.html')
    email = request.POST.get('emailsenha')

    senha_padrao = 'SAFEshelf@#789'
    subject = 'SafeShelf: Redefinição de Senha'
    message = f'Olá. Sua Senha foi redefinida para {senha_padrao}. Para alterar esta senha basta logar e ir em: Minha Conta -> Alterar Senha'
    from_email = 'guilherme.sousathe@gmail.com'
    recipient_list = [f'{email}']
    send_mail(subject, message, from_email, recipient_list)

    try:
        usuario = User.objects.get(email=email)
        usuario.set_password(senha_padrao)
        usuario.save()
    except ValueError:
        raise ValidationError(f"O email {email} não está cadastrado.")

    return redirect('/redefinirSenha')