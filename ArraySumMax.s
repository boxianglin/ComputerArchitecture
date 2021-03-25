
.data
	TheArray: .word 11, 12, -10, 13,  9, 12, 14, 15, -20, 0
	maxString: .asciiz "The max value in the array is: "
	sumString: .asciiz "\nThe summation of this array is: "

.text
.globl main

	main:
		
		li $a1, 10  #size 
		la $t0, TheArray  #address of array
		lw $s0, 0($t0)  #first element of array: tempMax-->finalMax
		li $t1, 0  #counter
		
		li $s1, 0 #sum 0-->finalSum
		
		
		j findMax_and_Sum
		
		
	
	findMax_and_Sum:
		beq $t1, $a1, printResult
		la $t0, TheArray
		sll $t2, $t1, 2 
		add $t0, $t0, $t2  #array index ++ by +4
		lw $t3, 0($t0)
		
		add $s1, $s1, $t3  #add each index++ element value 
		slt $t4, $s0, $t3  #t3>t4 
		add $t1,$t1,1
		
		beq $t4, 1, tempMax
		j findMax_and_Sum
	
	tempMax:
		move $s0, $t3
		j findMax_and_Sum
		
	
	printResult:
		li $v0, 4
		la $a0, maxString
		syscall
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		
		li $v0, 4
		la $a0, sumString
		syscall 
		
		li $v0, 1
		move $a0, $s1
		syscall
		
		li $v0, 10
		syscall
		
		