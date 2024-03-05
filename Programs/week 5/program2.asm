.model small
.stack 20
.data
    array db 35h, 56h, 82h, 89h, 90h, 23h, 12h, 51h, 88h
    len dw $-array
    msg1 db 0dh, 0ah, ' Enter two digit numbers: $'
    msg2 db 0dh, 0ah, ' The number is present $'
    msg3 db 0dh, 0ah, ' The number is not present $'
.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax
    mov cx, len
    lea dx, msg1
    mov ah, 09
    int 21h
    call readkb
    ror al, 4
    mov bl, al
    call readkb
    add al, bl
    lea dx, msg2
    lea di, array
    cld
    repne scasb
    je go
    lea dx, msg3
    go:
    mov ah, 09
    int 21h

    mov ah, 4ch
    int 21h

    readkb proc near
        mov ah, 01
        int 21h
        cmp al, 3ah
        jc sub30
        sub al, 07h
        sub30:
        sub al, 30h
        ret
    readkb endp
end start
