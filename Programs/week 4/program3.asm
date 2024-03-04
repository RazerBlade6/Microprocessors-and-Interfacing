.model small
.stack 20

.code
start:
    mov al, 45h
    mov bl, al
    and al, 0F0h
    ror al, 4
    call hexconvert
    mov dl, al
    mov ah, 2
    int 21h
    mov al, bl
    and al, 0Fh
    call hexconvert
    mov ah, 4Ch
    int 21

    hexconvert:
        cmp al, 0Ah
        jb num
        add al, 7
        num:
        add al, 30h
    ret   
end start


    