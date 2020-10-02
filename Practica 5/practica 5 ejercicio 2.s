.data 	
 str1: .asciiz "Ingrese un numero: "
 str2: .asciiz "\nLos numeros impares hasta "
 str3: .asciiz " son: "
.text 
main:
	li $v0, 4
	la $a0, str1 #primer texto
	syscall 

	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, str2 #segundo texto
	syscall	

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, str3 #tercer texto
	syscall

	li $t1, 1
	while1:
		bge $t1, $t0 end_while1 #saber si es el registro $t1 es mayor o igual al registro $t0
		
		li $v0, 1
		move $a0, $t1 #moviendo el registro $t1 al $a0
		syscall 

		li $a0, 32 #print space
		li $v0, 11 #código del sistema para imprimir un carácter
		syscall
		
		add $t1, $t1, 2
		j while1

        end_while1:
                li $v0, 10 #system call 10; exit
                syscall