#!/bin/bash
chmod 750 /home/mpiuser
chmod 700 /home/mpiuser/.ssh
runuser -l mpiuser -c 'ssh-keygen -t rsa -f ~/.ssh/id_rsa -P ""'
runuser -l mpiuser -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
chmod 600 /home/mpiuser/.ssh/*

echo '/home *(rw,no_root_squash,no_all_squash,async)' | sudo tee -a /etc/exports
/bin/systemctl start nfs.service

