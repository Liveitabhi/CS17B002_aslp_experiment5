main:
	li   $t0,17				#Multiplicand
	li   $t1,3				#Multiplier
	multu $t0,$t1			#Multiplication
	mfhi $s0				#first 32 bits of result
	mflo $s1				#last 32 bits 
jr $ra