#!/bin/bash
sudo yum install wget
wget http://www.mpitutorial.com/lessons/mpi_hello_world.tgz
tar -zxvf mpi_hello_world.tgz
cd mpi_hello_world
export MPICC=/usr/local/bin/mpicc
make

# create the host_file

cat <<EOF > host_file
mpi-node01:4
mpi-node02:4
EOF

echo "Dont forget to update run.perl with the correct number of processors"

export MPIRUN=/usr/local/bin/mpirun
export MPI_HOSTS=host_file

./run.perl mpi_hello_world

