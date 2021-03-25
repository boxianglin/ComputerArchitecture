

.data

firstNum: .asciiz "Enter the first number: "
secondNum: .asciiz "Enter the second Number: "
operation: .asciiz "Enter the type of operation(0-add, 1-subtract, 2-Multiply): "
result: .asciiz "The result is: "

.text
.globl main

	main:
		
		li $v0, 4            #print the string of firstNum
		la $a0,firstNum      #Load firstNum address to a0 argument
		syscall
		li $v0, 5            #read integer to v0
		syscall
		add $t0, $v0, $zero  #stored firstNum in t0
		
		
		li $v0, 4            #print the string of secondNum
		la $a0,secondNum     #Load firstNum address to a0 argument
		syscall
		li $v0, 5            #read integer to v0
		syscall
		add $t1, $v0, $zero  #stored secondNum in t1
				
		li $v0, 4            #print the string of operation 
		la $a0, operation    #Load operation address to a0 argument
		syscall
		li $v0,5             #read the integer from operation
		syscall 
		add $t2, $v0, $zero  #stored the operation number in t2

		
		#0-addition, 1-subtract, 2-multiply
		beq $t2,0,addition 
                beq $t2,1,subtract 
               beq $t2,2,multiply 
		j exit               #else exist..


		
#branch of arthmethic 
addition:
	add $s0, $t0,$t1
	j print

subtract: 
	sub $s0,$t0, $t1
	j print

multiply: 
	mul $s0, $t0, $t1
	j print



#method to print 
print: #print label
   li $v0,4               #print result string
   la $a0,result          #pass result string into argument a0
   syscall
   li $v0,1               #syscall 1 to print integer
   addi $a0,$s0,0         #move result in $a0 =$s0
   syscall
  
   exit:                  #exit label
   li $v0,10              #syscall 10 to terminate program
   syscall		
		
		