default:
	rm -rf sum
	riscv64-linux-gnu-as sum.s -o sum.o
	riscv64-linux-gnu-gcc -o sum sum.o -nostdlib -static