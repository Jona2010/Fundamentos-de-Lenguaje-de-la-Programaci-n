.data
	array_1: .word 1:5 #array len=10 of 1 values
	str1: .asciiz "Ingrese un numero: "
	str2: .asciiz "Los 5 primeros multiplos de "
	str3: .asciiz " son: "
        str4: .asciiz "\n"
.text
main:
	li $v0, 4
 	la $a0, str1
 	syscall

	li $v0, 5
 	syscall
 	move $t0, $v0 #Numero n	

	la $t1, array_1
	li $t2, 1 #contador

     while1: 
	beq $t5, $t0 end_while1
	mult $t2, $t0 #hallando los multiplos del numero n
	mflo $a0 

	sw $a0, 0($t1) 
	add $t1, $t1, 4
	add $t2, $t2, 1
	add $t5, $t5, 1
	j while1 # regresa al inicio del ciclo

    end_while1:
	li $v0, 4
 	la $a0, str2
 	syscall
 	li $v0, 1
 	move $a0, $t0
 	syscall
 	li $v0, 4
 	la $a0, str3
 	syscall

	la $t1, array_1
	li $t5, 0
        
     #inicio del segundo ciclo
     while2: 
        beq $t5, $t0 end_while2
	lw $t3, 0($t1)
	add $t1, $t1, 4

        li $v0, 4
 	la $a0, str4
 	syscall

	li $v0, 1 #print int
	move $a0, $t3
	syscall

	add $t5, $t5, 1 #contador
	j  while2 # regresa al inicio del ciclo

    end_while2:
	jr $ra
