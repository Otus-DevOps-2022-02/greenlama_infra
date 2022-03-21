# greenlama_infra
greenlama Infra repository

# Подключение к ВМ через bastion
Добавить в ~/.ssh/config следующий блок:
    Host someinternalhost
        ProxyCommand ssh -A appuser@<bastion_ip> -W %h:%p
После чего можно подключаться к someinternalhost через:
    ssh appuser@someinternalhost

# Добавление алиаса someinternalhost
Добавить в ~/.ssh/config к предыдущему блоку "User appuser":
    Host someinternalhost
        User appuser
        ProxyCommand ssh -A appuser@<bastion_ip> -W %h:%p
После чего можно будет подключаться к someinternalhost через:
    ssh someinternalhost

# Подключение сертификата Let's Encrypt
Зарегистрировать доменное имя. В настройках pritunl указать это доменное имя. Сервер pritunl должен будет получить сертификат.

# Конфигурация и данные для подключения
bastion_IP = 51.250.12.112
someinternalhost_IP = 10.128.0.23
