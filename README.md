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
