import os
os.system ('cls')
import mysql.connector
conectar = mysql.connector.connect(host = 'localhost',
                                   database = 'django',
                                   user = 'guilherme',
                                   password = '789456')
if conectar.is_connected():
    print('Conexão realizado com sucesso!')
else:
    print('falha na conexão')