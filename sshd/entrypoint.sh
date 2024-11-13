#!/bin/bash
ssh-keygen -t ed25519 -f /home/user/ssh_host_ed25519_key -q -N ""
mkdir -p /home/user/.ssh
echo $PUBLIC_KEY > /home/user/.ssh/authorized_keys
/usr/sbin/sshd -D -p 2222