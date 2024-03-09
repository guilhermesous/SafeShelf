
# SafeShelf

O SafeShelf foi construído com o principal próposito: Ajudar o público-alvo (pequenos e médios comerciantes) no monitoramento do estoque e do controle do vencimento dos seus Produtos.




![Logo](meuApp/static/meuApp/imagens/Picsart_24-03-04_12-57-56-236.png)


## Funcionalidades

- Cadastro de Produtos
- Cadastro de Fardos (Estoque de Produtos)
- Listagem de Produtos e seus Fardos
- Alertas Diários por e-mails sobre os fardos que estão próximos de seu vencimento (Fardos Vencidos inclusos também)
- Responsivo: Adaptado a diversas telas de diferentes aparelhos eletrônicos
- Contagem de dias restantes até o vencimento do produto e priorização dos produtos próximos ao vencimento

## Ferramentas
- Django FrameWork
- MySQL (Workbench)
- Pandas
- openpyxl
- Pillow
- Bootstrap
- AlertifyJS
- DataTables
- Font Awesome
- etc...


## Rodando localmente

Clone o projeto
```bash
    git clone https://github.com/guilhermesous/SafeShelf.git
```

Instale o MySQL Community Server
```
    https://dev.mysql.com/downloads/mysql/
```

Importe nosso banco de dados em db/banco.sql
```
    mysql -u seu_usuario_mysql -p sua_senha_mysql django < banco.sql
```


Entre no diretório do projeto

```bash
    cd SafeShelf
```

Altere os campos 'user' e 'password' em meuProjeto/settings.py
```bash
  DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django',
        'USER': 'seu_usuario_mysql',
        'PASSWORD': 'sua_senha_mysql',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

Instale as dependências

```bash
  pip install django-admin
  pip install mysqlclient
  pip install pandas
  pip install openpyxl
  pip install Pillow
```

Faça as devidas migrações
```bash
    py manage.py makemigrations
    py manage.py migrate
```

Inicie o servidor

```bash
  py manage.py runserver
```

