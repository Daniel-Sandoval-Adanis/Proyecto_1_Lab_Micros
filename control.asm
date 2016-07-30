section .data

	num1: equ 100
	num2: equ 50
	
	msj_1: db 'Este el primer bloque de codigo.',0xa
	tamano_msj_1: equ $-msj_1

	msj_2: db 'Este es el segundo bloque de codigo.',0xa
	tamano_msj_2: equ $-msj_2

	msj_3: db 'Este es el tercer bloque de codigo.',0xa
	tamano_msj_3: equ $-msj_3

section .text
	global _start
_start:

.primer_bloque:
mov rax,1
mov rdi,1
mov rsi,msj_1
mov rdx,tamano_msj_1
syscall

mov rax,num1
mov rbx,num2
cmp rax,rbx
je .segundo_bloque
jne .tercer_bloque


.segundo_bloque:

mov rax,1
mov rdi,1
mov rsi,msj_2
mov rdx,tamano_msj_2
syscall

mov rax,num1
mov rbx,num2
cmp rax,rbx
ja .final

.tercer_bloque:
mov rax,1
mov rdi,1
mov rsi,msj_3
mov rdx,tamano_msj_3
syscall

mov rax,num1
mov rbx,num1
cmp rax,rbx
je .segundo_bloque
jne .tercer_bloque

.final:
mov rax,60
mov rdi,0
syscall

