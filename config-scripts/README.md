# pjclock_infra

#add to ~/.ssh/config on client:

Host bastion
        HostName bastion_IP
        User username
        IdentityFile ~/.ssh/username
Host someinternalhost
        HostName someinternalhost_IP
        User username
        IdentityFile ~/.ssh/username
        ProxyJump username@bastion_IP

bastion_IP = 178.154.201.116
someinternalhost_IP = 10.128.0.27

#create instance via cli

testapp_IP = 51.250.81.46
testapp_port = 9292

yc compute instance create --name reddit-app --hostname reddit-app --metadata-from-file user-data=./startup_script.sh --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --ssh-key ~/.ssh/yabloko.pub

# packer
- для создания образа диска и дальнейших действий в удаленной системе созданы ssh-ключи для пользователя ubuntu
- скрипты и команды установки и запуска описаны описаны в immutable.json
- задержки в скриптах использованы для разрешения конфликтов apt
- скрипт create-reddit-vm.sh создает инстанс виртуальной машины на основе образа, созданного packer'ом (предварительно получая id образа)

