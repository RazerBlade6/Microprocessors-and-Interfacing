.model small
.stack 20

.data
    org 1000h
    num db 95h, 48h, 22h, 17h, 10h, 14h, 21h, 19h, 0
    count_even db ?
    count_odd db ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov cx, 0
    mov si, 0
    mov dl, 2
    repeat:
        mov al, num[si]
        cmp al, 0
        je stop
        div dl
        cmp ah, 0
        jne odd
        inc cl
        jmp next
        odd:
        inc ch
        next:
        inc si
    loop repeat
    mov count_even, cl
    mov count_odd, ch
    ret
end start