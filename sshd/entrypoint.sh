#!/bin/bash
ssh-keygen -t ed25519 -f /home/user/ssh_host_ed25519_key -q -N ""
/usr/sbin/sshd -D -p 2222