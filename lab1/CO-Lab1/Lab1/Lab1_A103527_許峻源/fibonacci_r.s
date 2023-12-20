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
		
		move	$a1, $s0	#set arugument of function factorial
		jal	fibonacci	# call fibonacci function to count the numbers
		
		move 	$a0, $v0	# laod the argument			
		li      $v0, 1		# call system call: print integer			
		syscall			# run the syscall
		
		li      $v0, 4		# call system call: print string
		la      $a0, msg3	# load address of string into $a0
		syscall  		# run the system call
		
		li $v0, 10		# call system call: exit
  		syscall	        	# run the system call
 
#----------------------------------------------------------------------------------------------------------
 
 		
#------------------------------fibonacci--------------------------------------------------------------------		

fibonacci:
		addi	$sp, $sp, -12	# adjust stack for 3 items
		move	$s1, $a1	# put argument k into $s1
		sw	$ra, 8($sp)	# save the return address
		sw	$s1, 4($sp)	# save the $s1
		sw	$s2, 0($sp)	# save the $s2
		
		li	$v0, 0		# set $v0 = 0
		
		bgt	$s1, 1, L3	# if $s1 > 1, jump to L3 
		beq	$s1, 1, L2	# if $s1 = 1, jump to L2
		
		addi 	$sp, $sp, 12	# pop 3 items out of stack
		jr	$ra		# return to the caller

L2:		li	$v0, 1		# set $v0 = 1
		addi 	$sp, $sp, 12	# pop 3 items out of stack
		jr	$ra		# return to the caller
		
L3: 		addi	$a1, $s1, -1	# set argument k - 1
		jal 	fibonacci	# call fibonacci function to count the numbers
		move	$s2, $v0	# put the result into $s2
		
		lw	$s1, 4($sp)	# laod the previous $s1
		
		addi	$a1, $s1, -2	# set argument k - 2
		jal 	fibonacci	# call fibonacci function to count the numbers
		
		
		add	$v0, $s2, $v0	# add the results of fibonacci(k- 1) and fibonacci(k - 2) 
		lw	$ra, 8($sp)	# load the return address to $ra
		lw	$s1, 4($sp)	# load $s1
		lw	$s2, 0($sp)	# load $s2
		addi 	$sp, $sp, 12	# pop 3 items out of stack
		jr	$ra		# return to the caller
		
#-------------------------------------------------------------------------------------------------------	
