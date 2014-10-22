#head startup script
#!/bin/bash
usermod -d /home/shared -m mpiuser
chmod 740 /home/shared
runuser -l mpiuser -c 'ssh-keygen -t rsa -f /home/shared/.ssh/id_rsa -P ""'
runuser -l mpiuser -c 'cat /home/shared/.ssh/id_rsa.pub >> /home/shared/.ssh/authorized_keys'
#runuser -l mpiuser -c 'cat /home/shared/.ssh/id_rsa.pub >> /home/shared/.ssh/authorized_keys2'
#runuser -l mpiuser -c 'chmod go-w ~'
runuser -l mpiuser -c 'chmod 700 /home/shared/.ssh'
runuser -l mpiuser -c 'chmod 644 /home/shared/.ssh/authorized_*'
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
echo '/home/shared *(rw,async)' | tee -a /etc/exports
/bin/systemctl start nfs.service

