.model small
.stack 20

disp macro msg
    mov ah, 09h
    mov dx, offset msg
    int 21h
endm

.data
    msg1 db 0dh, 0ah, 'Input a string:$'
    src db 80
    db ?
    db 30 dup (?)
    msg2 db 0dh, 0ah, 'The reversed string is:'
    rev db 30 dup (?)


.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax
    disp msg1
    mov dx, offset src
    mov ah, 0ah
    int 21h
    mov si, offset src+2
    mov di, offset rev-1
    mov cl, src+1
    mov ch, 00
    add di, cx
    mov byte ptr [di+1], '$'
    cld
next:
    movsb
    sub di, 0002
    loop next
    disp msg2
    mov ah, 4ch
    int 21h
end start
