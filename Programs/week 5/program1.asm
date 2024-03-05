.model small
.stack 20

.data
    srcstr db 'ELECTRONICS'
    len equ $-srcstr
    msg db 'The Transferred String='
    dststr db 40 dup ('$')

.code
start:
    mov ax, @data
    mov ds, ax

    mov es, ax
    mov cx, len
    lea si, srcstr
    lea di, dststr
    cld
    rep movsb

    lea dx, msg
    mov ah, 09
    int 21h
    
    mov ah, 4ch
    int 21h
end start
