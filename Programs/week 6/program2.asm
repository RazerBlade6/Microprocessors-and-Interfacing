.model small
.stack 20

.data
    ms db "PRESENT TIME IS: $"

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 00
    mov al, 03h
    int 10h
    mov ah, 02
    mov bh, 0
    mov dh, 12
    mov dl, 30
    int 10h
    lea dx, ms
    mov ah, 09
    int 21h

    mov ah, 2ch
    int 21h

    mov al, ch
    call disp
    mov dl, ':'
    mov ah, 02
    int 21h

    mov al, cl
    call disp
    mov dl, ':'
    mov ah, 02
    int 21h

    mov al, dh
    call disp
    mov ah, 02
    
    mov bh, 0
    mov dh, 24
    mov dl, 00
    int 10h
    mov ah, 4ch
    int 21h
disp proc near
    aam
    add ax, 3030h
    mov bx, ax
    mov dl, bh
    mov ah, 02
    int 21h
    mov dl, bl
    mov ah, 02
    int 21h
    ret
endp
end start
