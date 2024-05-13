sudo apt-get update
sudo apt install gcc-riscv64-linux-gnu
sudo apt install qemu-user

make 
qemu-riscv64 ./hello