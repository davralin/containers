#!/bin/bash
if [ ! -f "/home/user/ssh/ssh_host_ed25519_key" ]; then
    ssh-keygen -t ed25519 -f /home/user/ssh/ssh_host_ed25519_key -q -N ""
fi
echo $PUBLIC_KEY > /home/user/ssh/authorized_keys
/usr/sbin/sshd -D -e -p 2222