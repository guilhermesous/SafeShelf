import schedule
import funcoes

schedule.every().day.at("11:46").do(funcoes.EnviarEmailProxVencimento)
schedule.every().day.at("11:46").do(funcoes.EnviarEmailVencido)


while True:
    schedule.run_pending()