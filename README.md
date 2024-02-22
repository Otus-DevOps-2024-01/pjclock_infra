# pjclock_infra
# ssh someinternalhost

add to ~/.ssh/config on client:

Host bastion
        HostName public_ip
        User username
        IdentityFile ~/.ssh/username
Host someinternalhost
        HostName someinternalhost_int_ip
        User username
        IdentityFile ~/.ssh/username
        ProxyJump username@public_ip
