.data
 text_1: .asciiz "\nEl primer lado del triangulo\n"
 text_2: .asciiz "\nEl segundo lado del triangulo\n"
 text_3: .asciiz "\nEl tercer lado del triangulo\n"
 text_4: .asciiz "\nTriangulo no valido\n"
 text_5: .asciiz "\nTriangulo valido\n"

.text

main:

  li $v0, 4 
  la $a0, text_1
  syscall

  li $v0, 5
  syscall

  move $a1, $v0

  li $v0, 4 
  la $a0, text_2
  syscall

  li $v0, 5
  syscall

  move $t2, $v0


  li $v0, 4 
  la $a0, text_3
  syscall

  li $v0, 5
  syscall

  move $t3, $v0

  add $a0, $a1, $t2
  bgtu $a0, $t3, et0 #si la suma de los dos primeros es mayor al ultimo 
  #et0 = IF 

  LABEL_ELSE_0:
    la $a0, text_4
    b END_LABEL_IF

  et0:
    la $a0, text_5

  add $a0, $t2, $t3
  bgtu $a1, $a0, et1 #si la suma de los dos ultimos es mayor al primero
  #et1 = IF 

  LABEL_ELSE_1:
    la $a0, text_4
    b END_LABEL_IF

  et1:
    la $a0, text_5

  add $a0, $a1, $t3
  bgtu $t2, $a0, et2 #si la suma de el primero y el ultimo es mayor al numero del medio 
  #et2 = IF
 
  LABEL_ELSE_2:
    la $a0, text_4
    b END_LABEL_IF

  et2:
    la $a0, text_5

  END_LABEL_IF:
    li $v0, 4
    syscall

  jr $ra