.data 	
 texto1: .asciiz "Ingrese un numero: "
 texto2: .asciiz "\nEl numero "
 texto3: .asciiz " si es multiplo de "
 texto4: .asciiz " no es multiplo de "
.text 
main: 
	li $v0, 4 #texto 1
 	la $a0, texto1
 	syscall

 	li $v0, 5
 	syscall
 	move $t0, $v0 #numero n	
 	li $t1, 1 #contador
	Loop:
		beq $t1, 21 Exit				
		div $t1, $t0
		mfhi $a0
		beq $a0, 0, LABEL_IF
		 LABEL_ELSE:
		 	li $v0, 4
		 	la $a0, texto2
		 	syscall
		 	
		 	li $v0, 1
		 	move $a0, $t1
		 	syscall
		 	
		 	li $v0, 4
		 	la $a0, texto4
		 	syscall

		 	li $v0, 1
		 	move $a0, $t0
		 	syscall
		 	b END_LABEL_IF
		  LABEL_IF:
		  	li $v0, 4
		 	la $a0, texto2
		 	syscall
		 	
		 	li $v0, 1
		 	move $a0, $t1
		 	syscall
		 	
		 	li $v0, 4
		 	la $a0, texto3
		 	syscall

		 	li $v0, 1
		 	move $a0, $t0
		 	syscall
		  END_LABEL_IF:
		  	add $t1, $t1, 1 #contador del loop	
		j Loop
	Exit:			
jr $ra
