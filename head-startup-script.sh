#head startup script
#!/bin/bash
sudo usermod -d /home/shared -m mpiuser
sudo chmod 740 /home/shared
sudo runuser -l mpiuser -c 'ssh-keygen -t rsa -f /home/shared/.ssh/id_rsa -P ""'
sudo runuser -l mpiuser -c 'cat /home/shared/.ssh/id_rsa.pub >> /home/shared/.ssh/authorized_keys'
sudo runuser -l mpiuser -c 'cat /home/shared/.ssh/id_rsa.pub >> /home/shared/.ssh/authorized_keys2'
sudo runuser -l mpiuser -c 'echo "StrictHostKeyChecking no" >> /etc/ssh/sshd_config'
sudo runuser -l mpiuser -c 'chmod go-w ~'
sudo runuser -l mpiuser -c 'chmod 700 /home/shared/.ssh'
sudo runuser -l mpiuser -c 'chmod 644 /home/shared/.ssh/authorized_*'
sudo echo '/home/shared *(rw,async)' | sudo tee -a /etc/exports
sudo /bin/systemctl start nfs.service

