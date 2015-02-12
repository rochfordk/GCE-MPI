#node startup script
#!/bin/bash
echo "Executing startup script for cluster node"
mkdir /home/shared
chown mpiuser:mpiuser /home/shared
chmod 740 /home/shared
usermod -d /home/shared -m mpiuser
mount -rw -t nfs head-node:/home/shared /home//shared
#sudo setsebool -P use_nfs_home_dirs on
