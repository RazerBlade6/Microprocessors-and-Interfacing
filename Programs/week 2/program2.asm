.model small
.stack 20

.data
    org 1000h
    num1 db 89h, 35h, 45h, 32h, 56h, 98h, 76h, 76h
    num2 db 32h, 56h, 43h, 75h, 89h, 10h, 34h, 22h
    res db 9 dup(?)
    len equ $ - num1

.code
start:
    mov ax, @data
    mov ds, ax
    mov cx, len
    mov si, 0
    clc
    repeat:
        mov al, num1[si]
        sbb al, num2[si]
        mov res[si], al
        inc si
    loop repeat
    ret
end start