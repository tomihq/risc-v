sudo apt-get update
sudo apt install gcc-riscv64-linux-gnu
sudo apt install qemu-user
sudo apt install gcc-riscv64-unknown-elf

HACER ESTO: https://bernardnongpoh.github.io/posts/riscv
Luego de editar el ~/.bashrc colocar en la terminal "source ~/.bashrc"

make 
qemu-riscv64 ./hello