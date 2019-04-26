main:
	li   $t0,-1111					#Multiplicand
	li   $t1,777					#Multiplier
	mult $t0,$t1					#Multiplication
	mfhi $s0						#first 32 bits  (by default -1 is stored)
	mflo $s1						#last 32 bits

end:
	jr $ra