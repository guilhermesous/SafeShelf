from django.db import models
from django.contrib.auth.models import User

class Perfil(models.Model):
    nomeCompleto = models.CharField(max_length=255, null=True, verbose_name="Nome Completo")
    telefone = models.CharField(max_length=15, null=True)
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    def __str__(self):
        return self.usuario.username