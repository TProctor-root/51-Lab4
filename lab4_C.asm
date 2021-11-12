.data
str_empty: .asciiz "empty"

.text

updateList:
   	# Place your code here
   	# Delete this line
   	
   	lw $t0, 0($sp)
   	   	
   	move $k0, $a1
   	sub $k0, $k0, $a1
   	sub $k0, $k0, $a1
   	
   	blt $a2, $k0, theEnd
   	bge $a2, $a1, theEnd
   	j cool
   	theEnd:
   	li $v0, -1
	jr $ra
	
	cool:
	bltz $a2, newRow
	move $k1, $a2
	j top
	
	newRow:
	add $k1, $a1, $a2
	
	top:
	li $t7, 2
	li $t5, 4
	
	mul $t6, $k1, $t7
	addi $t6, $t6, 0
	mul $t6, $t5, $t6
	add $t6, $a0, $t6
	sw $a3, ($t6)
	
        mul $t6, $k1, $t7
	addi $t6, $t6, 1
	mul $t6, $t5, $t6
	add $t6, $a0, $t6
	sw $t0, ($t6)
	
	li $v0, 0
	
	jr $ra	

printListItem:
   	# Place your code here
   	# Delete this line
        move $k0, $a1
   	sub $k0, $k0, $a1
   	sub $k0, $k0, $a1
   	
   	blt $a2, $k0, theEnd2
   	bge $a2, $a1, theEnd2
   	j cool2
   	theEnd2:
   	li $v0, -1
	jr $ra
	
	cool2:
	bltz $a2, newRow2
	move $k1, $a2
	j top2
	
	newRow2:
	add $k1, $a1, $a2
   	
   	top2:
   	
   	li $t7, 0 # pure
   	li $t6, 2
   	li $t5, 4
   	
   	mul $t6, $k1, $t6
	addi $t6, $t6, 0
	mul $t6, $t5, $t6
   	add $t6, $a0, $t6
   	lb $t4, ($t6)
   	
   	beq $t4, $t7, zero
   	j next
   	zero:
   	li $v0, 4
   	la $a0, str_empty
   	syscall 
   	j done  	
   	
   	next:
   	li $t7, 1
   	   	
   	beq $t4, $t7, one
   	j next2
   	one:
   	lb $t4, 4($t6)
   	li $v0, 11
   	move $a0, $t4
   	syscall 
   	j done  
   	
   	next2:
   	li $t7, 2
   	
    	beq $t4, $t7, two
   	j next3
   	two:
   	lh $t4, 4($t6)
   	li $v0, 1
   	move $a0, $t4 
   	syscall 
   	j done 
   	
   	next3:
   	li $t7, 3
   	
    	beq $t4, $t7, three
   	j next4
   	three:
   	lw $t4, 4($t6)
   	li $v0, 1
   	move $a0, $t4
   	syscall    	  	
   	j done
   	
   	next4:
   	li $t7, 4
   	
    	beq $t4, $t7, four
   	j default
   	four:
   	lw $t4, 4($t6)
   	li $v0, 4
   	move $a0, $t4
   	syscall      	
   	j done   	
   	
   	default:
   	li $v0, -1
   	jr $ra
   	  	
   	done:
   	
   	li $v0, 0

	jr $ra
