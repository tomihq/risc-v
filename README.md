sudo apt-get update
sudo apt install gcc-riscv64-linux-gnu
sudo apt install qemu-user
sudo apt install gcc-riscv64-unknown-elf

make 
qemu-riscv64 ./hello