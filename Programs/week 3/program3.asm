.model small
.stack 20

.data
    org 1200h
    arr1 db 5, 15h, 25h, 35h, 45h, 55h, 65h, 75h, 85h, 95h
    org 1220h
    arr2 db 0A1h, 0A2h, 0A3h, 0A4h, 0A5h, 0A6h, 0A7h, 0A8h, 0A9h, 0AAh 
    len equ $ - arr1

.code
start:
    mov ax, @data
    mov ds, ax
    mov cx, len
    mov si, 0
    repeat:
        mov al, arr1[si]
        xchg al, arr2[si]
        mov arr1[si], al
        inc si
    loop repeat
    ret
end start