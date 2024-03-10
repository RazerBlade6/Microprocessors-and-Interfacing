.model small
.stack 20

.data
    array1 db 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h
    array2 db 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h
    len equ $ - array2

    msg_identical db 'identical$'
    msg_not_identical db 'not identical$'

.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax

    lea si, array1
    lea di, array2
    mov cx, len

    cld
    rep cmpsb
    je identical

not_identical:
    mov ah, 09
    lea dx, msg_not_identical
    int 21h
    jmp end_program

identical:
    mov ah, 09
    lea dx, msg_identical
    int 21h

end_program:
    mov ah, 4ch
    int 21h

end start
