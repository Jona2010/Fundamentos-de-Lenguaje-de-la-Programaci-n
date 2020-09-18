.data 	
 texto1: .asciiz "\Ingrese la cantidad de numeros: "
 texto2: .asciiz "\Ingrese un numero: "
 texto3: .asciiz "\nLa suma es: "
 texto4: .asciiz "\nEl promedio es: "
 texto5: .asciiz "\nEl mayor es: "
 texto6: .asciiz "\nEl menor es: "

.text 

main: 
	li $v0, 4 #texto 1
 	la $a0, texto1
 	syscall
        
 	li $v0, 5
 	syscall
   	move $t1, $v0
	
	
	#li.s $f1, 0.0
	li.s $f4, 1.0 #solo es para sumar de 1 en 1
	li.s $f5, 0.0
	li $t2, 0 #contador
	Loop:
		beq $t1, $t2 Exit
		li $v0, 4 #texto 2
 		la $a0, texto2
 		syscall

		li $v0, 6
		syscall

		#mayor y menor
		#mayor#
		#c.lt.d $f
                #0, $f1, LABEL_IF
		#LABEL_IF:#
		#mov.s $f5, $f0
		mov.s $f1, $f0 

		add.s $f2, $f2, $f1 #suma de n numeros
		add $t2, $t2, 1 #contador del loop					
		add.s $f3, $f3, $f4 #para el promedio


		j Loop
	Exit:	
	li $v0, 4 #texto 3
 	la $a0, texto3
 	syscall
	li $v0, 2
	mov.s $f12 $f2
	syscall	

	li $v0, 4 #texto 4
 	la $a0, texto4
 	syscall
	li $v0, 2
	div.s $f12, $f2, $f3 
	syscall
		
jr $ra
