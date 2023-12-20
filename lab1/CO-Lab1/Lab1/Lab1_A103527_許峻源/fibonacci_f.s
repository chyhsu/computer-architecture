.data
msg1:	.asciiz "Please input i : "
msg2:	.asciiz "th Fibonacci numbers is "
msg3:   .asciiz "."

.text
.globl main

#---------------------------------------------- main ---------------------------------------------------------

main:
		li      $v0, 4		# call system call: print string
		la      $a0, msg1	# load address of string into $a0
		syscall  		# run the system call
		
		li      $v0, 5    	# call system call: read integer
  		syscall         	# run the syscall
  		move	$s0, $v0	# store input in $s0 
  		
  		move 	$a0, $s0	# laod the argument			
		li      $v0, 1		# call system call: print integer			
		syscall			# run the syscall
  		
  		li      $v0, 4		# run the syscall
		la      $a0, msg2	# load address of string into $a0
		syscall  		# run the system call
		
		move	$a0, $s0	#set arugument of function factorial
		jal	fibonacci	# call fibonacci function to count the numbers
		
		move 	$a0, $v0	# laod the argument			
		li      $v0, 1		# call system call: print integer			
		syscall			# run the syscall
		
		li      $v0, 4		# call system call: print string
		la      $a0, msg3	# load address of string into $a0
		syscall  		# run the system call
		
		li $v0, 10		# call system call: exit
  		syscall	        	# run the system call
 
 #------------------------------------------------------------------------------------------------------
 
 
 
 #---------------------------fibonacci-------------------------------------------------------------------
 
fibonacci:
		
		addi	$sp, $sp, -8	# adjust stack for 2 items
		sw	$ra, 4($sp)	# save the return address
		sw	$a0, 0($sp)	# save the argument k
		
		bgt	$a0, 1, L3	# if k>1, jump to L3
		beq	$a0, 0, L2	# if k=0, jump to L2
		beq	$a0, 1, L1	# if k=1, jump to L1

L1:		addi	$v0, $zero, 1	# return the result 1
		addi	$sp, $sp, 8	# adjust stack pointer to pop 2 items
		jr	$ra		# return to the caller

L2:		move	$v0, $zero	# return the result 0
		addi	$sp, $sp, 8	# adjust stack pointer to pop 2 items
		jr	$ra		# return to the caller

L3:		addi	$t0, $zero, 2		# $t0(i) = 2
		add	$t1, $zero, $zero	# $t1(a) = 0 
		addi	$t2, $zero, 1		# $t2(b) = 1
		addi	$t3, $zero, 1		# $t3(c) = 1
		
L4:		add	$t3, $t2, $t1	# set c = a + b
		move	$t1, $t2	# set a = b
		move	$t2, $t3	# set b = c
		
		addi 	$t0, $t0, 1	# i = i + 1
		ble	$t0, $a0, L4	# if i != k, jump to L4
		
		move	$v0, $t3	# return c
 		addi	$sp, $sp, 8	# pop 2 items out of stack
		jr	$ra		# return to the caller
		
 #------------------------------------------------------------------------------------------------------		
		
		
		
