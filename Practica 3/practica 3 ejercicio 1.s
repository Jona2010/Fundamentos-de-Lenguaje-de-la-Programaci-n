.data
 out_string: .asciiz "\Ingrese un primer numero\n"
 out_string2: .asciiz "\Ingrese otro numero\n"
 out_string3: .asciiz "\nLa suma es\n"
 out_string4: .asciiz "\nLa diferencia es\n"
 out_string5: .asciiz "\nLa multiplicacion es\n"
 out_string6: .asciiz "\nLa division es\n"
 out_string7: .asciiz "\nEl promedio es\n"
.text
main: 
 li.s $f5, 2.0

 li $v0 4 #ingreso 1
 la $a0, out_string
 syscall

 li $v0, 6 #muevo 
 syscall
 mov.s $f1, $f0 
 
 li $v0 4 #ingreso 2
 la $a0, out_string2
 syscall

 li $v0, 6 #muevo
 syscall
 mov.s $f2, $f0 

 li $v0 4 #res1
 la $a0, out_string3
 syscall
 
 li $v0, 2 #suma
 add.s $f12,  $f1, $f2
 #move.s $a0 $t1
 syscall

 li $v0 4 #res2
 la $a0, out_string4
 syscall
 
 li $v0, 2 #diferencia
 sub.s $f12,  $f1, $f2
 syscall
 
 li $v0 4 #res3
 la $a0, out_string5
 syscall
 
 li $v0, 2 #multipl
 mul.s $f12, $f1, $f2
 syscall

 li $v0 4 #res4
 la $a0, out_string6
 syscall
 
 li $v0, 2 #dividir
 div.s $f12,  $f1, $f2
 syscall

 li $v0 4 #res5
 la $a0, out_string7
 syscall
 
 #li $v0, 2 #promedio
 add.s $f12, $f1, $f2
 #div.s $f12,  $f12, $f5
 
 li $v0, 2 #promedio
 div.s $f12, $f12, $f5
 syscall

 
 jr $ra
