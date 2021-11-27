all:hw4_test.s numsort.s
	arm-none-eabi-gcc -g ./hw4_test.s  ./numsort.s -o hw4
clean:
	rm -f hw4
