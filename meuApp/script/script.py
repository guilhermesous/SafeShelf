import schedule
import funcoes

schedule.every().day.at("08:00").do(funcoes.EnviarEmailProxVencimento)
schedule.every().day.at("08:00").do(funcoes.EnviarEmailVencido)


while True:
    schedule.run_pending()