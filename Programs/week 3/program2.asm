.model small
.stack 20

.data
    org 1200h
    num db 25h, 35h, 45h, 32h, 56h, 98h, 76h, 76h, 28h, 56h, 5, 35h, 25h, 0, 98h, 21h
    len equ $ - num
    org 1220h
    count db ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov cx, len
    mov si, 0
    mov ax, 0
    counter:
        cmp num[si], 25h
        jnz next
        inc al
        next:
        inc si
    loop counter
    mov count, al
    int 3
end start