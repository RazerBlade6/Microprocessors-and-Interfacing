.model small
.stack 20

.data
    org 1000h
    num1 db 40h
    num2 db 17h
    uq db ?
    ur db ?
    sq db ?
    sr db ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov al, num1
    div num2
    mov uq, al
    mov ur, ah
    mov ax, 0
    mov al, num1
    idiv num2
    mov sq, al
    mov sr, ah
    int 3
end start