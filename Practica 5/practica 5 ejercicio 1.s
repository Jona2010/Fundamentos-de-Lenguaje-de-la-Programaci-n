.data

text_par: .asciiz "El numero es par"
tex_impar:.asciiz "El numero es impar"
text_numero:.asciiz "Ingrese un numero: "

.text

main: 
  addi $t0, $0, 2
  la $a0, text_numero #mostrando mensaje para pedir el numero
  li $v0, 4
  syscall

  li $v0, 5 #leemos el numero
  syscall

  div $2, $t0 #hacemos la division para saber si el residuo es 0 o 1
  mfhi $t1

  beq $t1, $0, print_1 #verifica si el contenido del registro es igual a 0

  la $a0, tex_impar #Si es impar
  li $v0, 4
  syscall
  j fin

  print_1: la $a0, text_par #si es par
  li $v0, 4
  syscall
  j fin

  fin: li $v0, 10 #system call 10; exit
  syscall