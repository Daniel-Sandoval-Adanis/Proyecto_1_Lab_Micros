;****************************************************** seccion de datos 
section .data
	cons_pantalla: db '--------------------------------------------------------------------------------',0xa
	cons_tamano_pantalla:equ $-cons_pantalla

	cons_bloques1:db '- +----------------------+  +----------------------+  +----------------------+ -',0xa
	cons_tamano_bloques1: equ $-cons_bloques1

	cons_bloques2:db '- !                      !  !                      !  !                      ! -',0xa
	cons_tamano_bloques2: equ $-cons_bloques2

	cons_lineas: db '-                                                                              -',0xa
	cons_tamano_lineas: equ $-cons_lineas

	cons_1: db '-                           Bienvenido a Micronoid     ',0xa
	cons_tamano_1: equ $-cons_1

	cons_2: db '-        El-4313- Lab.Estrcutura de Microprocesadores  2S-2016',0xa
	cons_tamano_2: equ $-cons_2

	pide: db '-                             Nombre y enter:'
	tamano_pide: equ $-pide

	consola: db 27,'[2J'
	tamano_consola: equ 4

	cursor: db 27,'[14;00H'
	tamano_cursor: equ 8

	cursor00:db 27,'[00;00H' ; para ubicar el cursor en 00_00

	nombre: db''   ;variable para guardar el nombre

;**************************************************** codigo del programa

section .text

	global _start
	global cursor_inicio
	global limpiar_pantalla
	global pintar_pantalla
	global pedir_nombre
	global final


_start:
	call limpiar_pantalla
	call cursor_inicio
	call pintar_pantalla
	call pedir_nombre
	call limpiar_pantalla
	call cursor_inicio
	call pintar_pantalla
	call final

cursor_inicio:
	mov rax,1
	mov rdi,1
	mov rsi,cursor00
	mov rdx,tamano_cursor
	syscall
	ret


limpiar_pantalla:

	mov rax,1
	mov rdi,1
	mov rsi,consola
	mov rdx,tamano_consola
	syscall
	ret


pintar_pantalla:

	mov rax,1
	mov rdi,1
	mov rsi,cons_pantalla
	mov rdx,cons_tamano_pantalla
	syscall

mov r8,0x3
.bloques:
cmp r8,0x1
sbb r8,0x1

mov rax,1
mov rdi,1
mov rsi,cons_bloques1
mov rdx,cons_tamano_bloques1
syscall

mov rax,1
mov rdi,1
mov rsi,cons_bloques2
mov rdx,cons_tamano_bloques2
syscall

mov rax,1
mov rdi,1
mov rsi,cons_bloques1
mov rdx,cons_tamano_bloques1
syscall

jne .bloques
jmp .sig1

.sig1:

mov r8,0x16
.lineas:
	cmp r8,0x1
	sbb r8,0x1

	mov rax,1
	mov rdi,1
	mov rsi,cons_lineas
	mov rdx,cons_tamano_lineas
	syscall

	jne .lineas
	jmp .sig2

.sig2:
	mov rax,1
	mov rdi,1
	mov rsi,cons_pantalla
	mov rdx,cons_tamano_pantalla
	syscall
ret

pedir_nombre:
	mov rax,1
	mov rdi,1
	mov rsi,cursor
	mov rdx,tamano_cursor
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,cons_1
	mov rdx,cons_tamano_1
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,cons_2
	mov rdx,cons_tamano_2
	syscall
;--------------------ingresar nombre---------------
mov rax,1
mov rdi,1
mov rsi,pide
mov rdx,tamano_pide
syscall

mov rax,0
mov rdi,0
mov rsi,nombre
mov rdx,10
syscall

ret

;--------------------limpieza sistema---------------

final:
	mov rax,60
	mov rdi,0
	syscall

