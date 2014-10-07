#head startup script
#!/bin/bash
usermod -d /home/shared -m mpiuser
touch /tmp/f1
runuser -l mpiuser -c 'ssh-keygen -t dsa -f /home/shared/.ssh/id_rsa -P \"\"'
touch /tmp/f2
runuser -l mpiuser -c 'cat /home/shared/.ssh/id_rsa.pub >> /home/shared/.ssh/authorized_keys'
touch /tmp/f3
chmod 700 /home/shared/.ssh
touch /tmp/f4
chmod 600 /home/shared/.ssh/authorized_keys
touch /tmp/f5
sudo echo '/home/shared *(rw,sync)' | sudo tee -a /etc/exports
touch /tmp/f6
/bin/systemctl start nfs.service
touch /tmp/f7
