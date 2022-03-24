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

# Исполнение скриптов на удаленной машине
ssh -i ~/.ssh/appuser yc-user@<ip_address> 'bash -s' < ./<script_name>

# Создание ВМ через YC CLI
```
yc compute instance create \
 --name reddit-app \
 --hostname reddit-app \
 --memory=4 \
 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
 --metadata serial-port-enable=1 \
 --metadata-from-file user-data=metadata.yml
```

# Конфигурация и данные для подключения
bastion_IP = 51.250.12.112
someinternalhost_IP = 10.128.0.23

testapp_IP = 51.250.70.39
testapp_port = 9292
