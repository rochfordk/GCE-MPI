#node startup script
#!/bin/bash
sudo mkdir /home/shared
sudo chown mpiuser:mpiuser /home/shared
sudo chmod 740 /home/shared
sudo usermod -d /home/shared -m mpiuser
sudo mount -rw -t nfs head-node:/home/shared /home//shared
#sudo setsebool -P use_nfs_home_dirs on
