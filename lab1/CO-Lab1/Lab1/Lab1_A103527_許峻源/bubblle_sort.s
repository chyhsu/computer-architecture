.data
msg1:	.asciiz "Array before sort : \n"
msg2:	.asciiz "\nArray after sort : \n"
blank:  .asciiz " "
target_array: .word 5,3,6,7,31,23,43,12,45,1
size: .word 10

.text
.globl main
	
#----------------------------main----------------------------------
main:
		li      $v0, 4		# call system call: print string
		la      $a0, msg1	# load address of string into $a0
		syscall			# run the system call
		
		la 	$t3, size 	# load the address of "size" into $t3  
		lw	$t3, 0($t3)	# load the value of "size" into $t3
		
		jal func_output		# call "func_output" function to print the numbers
		
	
		jal func_bubble_sort	# call "func_bubble_sort" function to scrt the numbers
		
		li      $v0, 4		# call system call: print string
		la      $a0, msg2	# load address of string into $a0
		syscall			# run the system call
		
		jal func_output		# call "func output" function to print the numbers
		     
		li $v0, 10		# call system call: exit
  		syscall			# run the system call

#------------------------------------------------------------------





#-------------------------------func_bubble_sort---------------------------------------------------------------------------------------------------

func_bubble_sort:	addi	$sp, $sp, -4			# adjust stack for 1 item
			sw	$ra, 0($sp)			# save the return address
			add	$s0, $zero, $zero 		# set $s0(i)=0
		
#------------------------------inner loop--------------------
L2:			addi	$s1, $s0, -1			# set $s1(j)=s0(i)-1
L4:			blt	$s1, $zero, L3			# if $s1(j)<0 jump to L3 (break the loop)
			sll	$t1, $s1, 2			# $t1=$s1*4, count the offset
			lw	$s2, target_array($t1)		# load the number in array with address "$t1 + target_array" into s2
			lw	$s3, target_array+4($t1)	# load the number in array with address "$t1 + target_array + 4" into s3
			ble	$s2, $s3, L3			# if the the number in the $s2 <= $s3, jump to L3 (break the loop) 
			move	$a0, $s2			# load the number in $s2 into $a0
			move	$a1, $s3			# load the number in $s3 into $a1
			move	$a2, $t1			# load the offset in $t1 into $a2
			jal	func_swap			# call "func_swap" function to swap the number in $s2 and $s3
			addi	$s1, $s1, -1			# $s1(j)=$s1-1
			j	L4				# keep looping 
#-------------------------------------------------------------
L3:			addi	$s0, $s0, 1			# $s0(i) = $s0(i) + 1
 			bne	$s0, $t3, L2			# if $s0(i) != 10 jump to L2 (keep looping) 
			lw	$ra, 0($sp)			# load the return address to $ra
			addi 	$sp, $sp, 4			# pop 1 item out of stack
			jr	$ra				# return to the caller
			
#--------------------------------------------------------------------------------------------------------------------------------------------------
																																																								
																														
																																				

			
#-----------------------------func_output---------------------------------------------------------------------------------------------------------------

func_output:	addi 	$sp, $sp, -4				# adjust stack for 1 item
		sw 	$ra, 0($sp)				# save the return address
		add	$t0, $zero, $t3			# set $t0(i) = n
		add	$t1, $zero, $zero			# set $t1 = 0
L1:		lw	$s0, target_array($t1)			# load the number in the array with address " address + $t1 "
		addi	$t1, $t1, 4				# $t1 = $t1 + 4 
		
		move 	$a0, $s0				# laod the argument
		li      $v0, 1					# call system call: print integer
		syscall						# call system call
		
		li      $v0, 4					# call system call: print string
		la      $a0, blank				# load address of string into $a0
		syscall						# run the system call
		
		addi	$t0, $t0,-1				# $t0 = $t0 - 1
		bne	$t0, $zero, L1				# if $t0 != 0, jump to L1 ( keep looping )
		addi 	$sp, $sp, 4				# pop 1 item out of stack
		jr 	$ra					# return to the caller

#------------------------------------------------------------------------------------------------------------------------------------------------	




#--------------------------func_swap--------------------------------------------------------------------------------------------------------------

func_swap:	addi 	$sp, $sp, -16				# adjust stack for 4 items
		sw	$ra, 12($sp)				# save the return address
		sw	$a2, 8($sp)				# save the argument $a2
		sw	$a1, 4($sp)				# save the argument $a1
		sw	$a0, 0($sp)				# save the argument $a0
		
		xor	$a0, $a0, $a1				# 
		xor	$a1, $a0, $a1				# swap the number in the $a1 and $a0 
		xor	$a0, $a0, $a1				# 
		
		sw	$a0, target_array($a2)			# after swaping, store the number in $a0 to the address " target_array + $a2 "  
		sw	$a1, target_array+4($a2)		# after swaping, store the number in $a1 to the address " target_array + $a2 + 4 " 
		addi 	$sp, $sp, 16				# pop 4 items out of stack
		jr 	$ra					# return to the caller

#--------------------------------------------------------------------------------------------------------------------------------------------------
