; Assignment 1 Not Complete

; DO NOT USE

.model small
.stack 20

.data
    org 1000h
    hex dw 1234h
    bcd db 5 dup(0)

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, hex
    mov cx, 10
    lea si, bcd
    repeat:
        mov dx, 0
        div cx
        mov [si], dl
        inc si
    cmp ax, cx
    jae repeat
    mov [si], al
    mov ah, 4Ch
    int 21h