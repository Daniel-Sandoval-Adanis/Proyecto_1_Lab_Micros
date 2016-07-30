section .data
	
	cons_banner: db 'Presione una tecla, y luego Enter:'
	cons_tamano_banner: equ $-cons_banner
	
	cons_prueba: db '------------------------------'
	cons_tamano_prueba: equ $-cons_prueba
 

	cons_salida: db 'Usted presiono la tecla: '
	cons_tamano_salida: equ $-cons_salida

	cons_final: db 0ax, 'Fin Programa',0xa
	cons_tamano_final: equ $-cons_final

	variable: db ''

section .text
	global _start

_start:
; imprimir el banner
mov rax,1
mov rdi,1
mov rsi,cons_prueba
mov rdx,cons_tamano_prueba
syscall

;captura tecla
mov rax,0
mov rdi,0
mov rsi,variable
mov rdx,25
syscall

;imprime banner 2
mov rax,1
mov rdi,1
mov rsi,cons_salida
mov rdx,cons_tamano_salida
syscall

;imprimimos tecla
mov rax,1
mov rdi,1
mov rsi,variable
mov rdx,25
syscall

;fin de programa
mov rax,1
mov rdi,1
mov rsi,cons_final
mov rdx,cons_tamano_final
syscall

;limpio
mov rax,60
mov rdi,0
syscall

