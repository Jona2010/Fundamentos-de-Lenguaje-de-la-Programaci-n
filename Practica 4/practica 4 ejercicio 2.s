.data
	array_1: .word 1:5 #array 
	str1: .asciiz "Ingrese un numero: "
        str2: .asciiz "Los elementos en orden inverso son: "
.text
main:
	la $t1, array_1

while1: 
	beq $t0, 5 end_while1

	li $v0, 4
 	la $a0, str1
 	syscall

 	li $v0, 5
 	syscall
 	move $a0, $v0
 	sw $a0, 0($t1) 
 	add $t1, $t1, 4
 	add $t0, $t0, 1
	j while1 # regresa al inicio del ciclo

end_while1:

	li $t0, 0
        li $v0, 4
 	la $a0, str2
 	syscall

        #inicio del segundo ciclo

	while2:
		beq $t0, 5 end_while2
		sub $t1, $t1, 4
		lw $t3, 0($t1)

		li $v0, 1 #imprime los enteros en forma inversa
		move $a0, $t3
		syscall

		li $a0, 32 #print space
		li $v0, 11 #código del sistema para imprimir un carácter
		syscall

		add $t0, $t0, 1 #contador
		j while2 # regresa al inicio del ciclo

	end_while2:
		jr $ra
