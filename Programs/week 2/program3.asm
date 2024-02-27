.model small
.stack 20

.data
    org 1000h
    num1 db 35h
    num2 db 82h
    usp dw ?
    sip dw ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov al, num1
    mul num2
    mov usp, ax
    mov ax, 0
    mov al, num1
    imul num2
    mov sip, ax
    int 3
end start