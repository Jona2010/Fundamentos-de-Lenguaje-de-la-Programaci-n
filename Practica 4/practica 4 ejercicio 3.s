.data
	array_1: .word 1:3 #array 1
	array_2: .word 1:3 #array 2
	str1: .asciiz "Ingrese un numero del vector 1: "
	str2: .asciiz "Ingrese un numero del vector 2: "
	str3: .asciiz "El producto escalar es: "
        str4: .asciiz "\n"
.text

main:
	la $t0, array_1
	la $t1, array_2

  while1: 
	beq $t2, 3 end_while1
	li $v0, 4
 	la $a0, str1
 	syscall

 	li $v0, 5
 	syscall

 	move $a0, $v0
 	sw $a0, 0($t0) 

 	add $t0, $t0, 4
 	add $t2, $t2, 1
	j while1 # regresa al inicio del ciclo

  end_while1:

	li $t2, 0
        li $v0, 4
 	la $a0, str4
 	syscall
        #inicio del segundo ciclo

	while2:
		beq $t2, 3 end_while2

		li $v0, 4
 		la $a0, str2
 		syscall

 		li $v0, 5
 		syscall
 		move $a0, $v0
 		sw $a0, 0($t1) 
 		add $t1, $t1, 4
 		add $t2, $t2, 1
 		j while2 # regresa al inicio del ciclo

 	end_while2:
 		li $t2, 0
 		la $t0, array_1
 		la $t1, array_2
 		li $t6, 0
                
                #iniciio del tercer ciclo 
 		while3:
			beq $t2, 3 end_while3
			lw $t3, 0($t0) #cargo el array 1
			lw $t4, 0($t1) #cargo el array 2
			mult $t3, $t4  #hacemos la multiplicacion
			mflo $t5 

			add $t6, $t6, $t5 #sumamos sus valores

			add $t0, $t0, 4
			add $t1, $t1, 4

			add $t2, $t2, 1 #contador
			j while3 # regresa al inicio del ciclo

		end_while3:
                        li $v0, 4
 	                la $a0, str4
 	                syscall

			li $v0, 4
			la $a0, str3
			syscall 

			li $v0, 1 #imprimer el valor de la suma
			move $a0, $t6
			syscall

			jr $ra