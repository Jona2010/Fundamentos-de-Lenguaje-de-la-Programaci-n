.data

numero: .asciiz "\n Ingrese un numero: "
noprimo: .asciiz "\n El numero no es primo"
primo: .asciiz "\n El numero es primo"

.text

main:	
        li $v0, 4
	la $a0, numero #primer texto
	syscall
	li $v0, 5 #pidiendo numero
	syscall
	move $t0, $v0 #moviendolo al registro $t0
	li $t1, 2
	
while1:   
        beq $t0, $t1 es_primo #verifica si el contenido del registro de $t0 #es igual al del $t1
	div $t0, $t1 #division de los dos registros
	mfhi $t2 #mueve el contenido del registro a $t2
	beqz $t2, no_primo #si el contenido es mayor igual que 0 
	addi $t1, $t1 1
	j while1
	
no_primo:
	li $v0, 4
	la $a0, noprimo
	syscall
	j exit
	
es_primo:
	li $v0, 4
	la $a0, primo
	syscall
	j exit
	
exit:	li $v0, 10 #system call 10; exit
	syscall