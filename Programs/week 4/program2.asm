.model small
.stack 20

.data
    org 1000h
    hex db 3E8h
    ascii db ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov al, hex
    cmp al, 3Ah
    jc sub30
    sub al, 7
    sub30:
    mov ascii, al
    int 3
end start


    