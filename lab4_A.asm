.text
findinArray:
	# Your code here
        addi $sp, $sp, -28
        sw $s0, 0($sp)
        sw $s1, 4($sp)   
        sw $s2, 8($sp)
        sw $s3, 12($sp) 
        sw $s4, 16($sp)   
        sw $s5, 20($sp)
        sw $s6, 24($sp) 
                
	move $s0, $a0 # myarray
	move $s1, $a1 # rows
	move $s2, $a2 # cols
	move $s3, $a3 # mychar
	
	li $t0, 0 # i
	li $t1, 0 # j
	
	loop1:
	bge $t0, $s1, endL1
	
	loop2: # Problem in the future
	bge $t1, $s2, endL2
	
	# if statement
	mul $s4, $t0, $s2
	add $s5, $t1, $s4
	
	add $t2, $s0, $s5

	lb $s6, ($t2)
	
	beq $s6, $s3, found
	j nvm
	found:
	move $v0, $t0
	move $v1, $t1
	
        lw $s6, 24($sp)
        lw $s5, 20($sp)
        lw $s4, 16($sp)   
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 28
        jr $ra
	nvm:
	
	addi $t1, $t1, 1
	j loop2
	endL2:
	move $t1, $zero
	addi $t0, $t0, 1
	j loop1
	endL1:
	
        li $v0, -1
        li $v1, -1

        lw $s6, 24($sp)
        lw $s5, 20($sp)
        lw $s4, 16($sp)   
        lw $s3, 12($sp)
        lw $s2, 8($sp)
        lw $s1, 4($sp)
        lw $s0, 0($sp)
        addi $sp, $sp, 28
	jr $ra
