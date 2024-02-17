import smtplib
import email.message
import conexao
conectar = conexao.conectar

def EmailProxVencimento(destinatario, assunto, descricao, validade):
    corpo_Email = f"<p>Olá</p><p>Seu fardo de {descricao} está próximo do vencimento {validade}, se atente a validade!</p>"
    msg = email.message.Message()
    msg['Subject'] = f'{assunto}'
    msg['From'] = 'safeshelf.bot@gmail.com'
    msg['To'] = f'{destinatario}'
    password = 'adlgdvwnkcebpnxe'
    msg.add_header('Content-type', 'text/html')
    msg.set_payload(corpo_Email)

    s = smtplib.SMTP('smtp.gmail.com: 587')
    s.starttls()
    s.login(msg['From'], password)
    s.sendmail(msg['From'], [msg['To']], msg.as_string().encode('utf-8'))
    print('Email Enviado.')

def EnviarEmailProxVencimento():
    comando_visualizar = """SELECT meuapp_produto.descricao, DATE_FORMAT(meuapp_estoque.dataValidade, '%d/%m/%Y') AS dataValidade, auth_user.email 
                            FROM meuapp_estoque
                            INNER JOIN meuapp_produto ON meuapp_produto.id = meuapp_estoque.codproduto_id
                            INNER JOIN auth_user ON auth_user.id = meuapp_estoque.usuario_id
                            WHERE DATEDIFF(meuapp_estoque.dataValidade, CURDATE()) <= 14 and DATEDIFF(meuapp_estoque.dataValidade, CURDATE()) >= 0;"""
    cursor = conectar.cursor()
    cursor.execute(comando_visualizar)
    retornoDeDados = cursor.fetchall()
    assunto = "SafeShelf: Aviso de Produto Próximo do Vencimento"
    for x in retornoDeDados:
        EmailProxVencimento(x[2], assunto, x[0], x[1])

def EmailVencido(destinatario, assunto, descricao, validade):
    corpo_Email = f"<p>Olá</p><p>Seu fardo de {descricao} está VENCIDO desde dia {validade}, por favor tome alguma providência.</p>"
    msg = email.message.Message()
    msg['Subject'] = f'{assunto}'
    msg['From'] = 'safeshelf.bot@gmail.com'
    msg['To'] = f'{destinatario}'
    password = 'adlgdvwnkcebpnxe'
    msg.add_header('Content-type', 'text/html')
    msg.set_payload(corpo_Email)

    s = smtplib.SMTP('smtp.gmail.com: 587')
    s.starttls()
    s.login(msg['From'], password)
    s.sendmail(msg['From'], [msg['To']], msg.as_string().encode('utf-8'))
    print('Email Enviado.')

def EnviarEmailVencido():
    comando_visualizar = """SELECT meuapp_produto.descricao, DATE_FORMAT(meuapp_estoque.dataValidade, '%d/%m/%Y') AS dataValidade, auth_user.email 
                            FROM meuapp_estoque
                            INNER JOIN meuapp_produto ON meuapp_produto.id = meuapp_estoque.codproduto_id
                            INNER JOIN auth_user ON auth_user.id = meuapp_estoque.usuario_id
                            WHERE meuapp_estoque.dataValidade < CURDATE();"""
    cursor = conectar.cursor()
    cursor.execute(comando_visualizar)
    retornoDeDados = cursor.fetchall()
    assunto = "SafeShelf: Aviso de Vencimento de Estoque"
    for x in retornoDeDados:
        EmailVencido(x[2], assunto, x[0], x[1])