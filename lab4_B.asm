.text
setArray:
   	# Place your code here
        
   	#$a0 # myarray
   	#$a1 # numRows
   	#$a2 # numCols
   	#$a3 # myrow
   	#$t0 # mycol
   	#$t1 # myvalue
   	
   	lw $t1, 0($sp)	
	lw $t0, 4($sp)
	
	
        mul $k0, $a3, $a2
	add $k1, $t0, $k0
	li $t3, 4
	mul $k1, $k1, $t3
	add $t7, $a0, $k1

	sw $t1, ($t7)
	
	jr $ra
