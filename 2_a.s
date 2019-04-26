.data   

quotient:	.word	0
remainder:	.word	0

.text

main:
	li $s0, 75				# Dividend
	li $s1, 23				# Divisor
	li $s2, 0				# Remainder.
	li $t0, 0				# Quotient.
	li $t1, 0				# Quotient * Divisor.

	slt $t2, $s0, $s1			# Dividend < Divisor, set flag = 1.
	beq $t2, 1, end

divide:
	add $t1, $t1, $s1		# Add divisor
	addi $t0, $t0, 1		# counter
	slt $t2, $t1, $s0		# check if less than dividend
	beq $t2, 1, divide		# next iteration  if less than dividend
	beq $t1, $s0, end_loop	# end loop if equal to dividend
	slt $t3, $s0, $t1		# if greater than dividend
	beq $t3, 1, last
	j divide



last:
	sub $t1, $t1, $s1		# going one step back
	addi $t0, $t0, -1		# decresing counter by 1

end_loop:
	sub $s2, $s0, $t1		# Remainder calculation
	sw $s2, remainder
	sw $t0, quotient
	jr $ra

end:							# if dividend < divisor
	add $s2, $zero, $s0			# Remainder = Dividend. 
	sw $s2, remainder
	sw $t0, quotient
	jr $ra