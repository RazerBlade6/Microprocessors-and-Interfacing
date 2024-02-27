.model small
.stack 20

.data
    org 1000h
    num db 95h, 85h, 75h, 65h, 55h, 45h, 35h, 25h
    len equ $ - num

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov cx, len
    outer_loop:
        mov si, 0
        mov di, 1
        inner_loop:
            mov al, num[si]
            mov ah, num[di]
            cmp al, ah
            jbe next
            mov num[si], ah
            mov num[di], al
            next:
            inc si
            inc di
        cmp di, len
        jb inner_loop
    loop outer_loop
end start