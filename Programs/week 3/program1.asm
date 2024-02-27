.model small
.stack 20

.data
    org 1000h
    num db 25h, 35h, 45h, 32h, 56h, 98h, 76h, 76h
    len equ $ - num
    sum dw ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov cx, len
    repeat:
        add al, num[si]
        jnc next
        adc ah, 0
        next:
        inc si
    loop repeat
    mov sum, ax
    int 3
end start