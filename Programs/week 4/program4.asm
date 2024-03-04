.model small
.stack 20

.code
start:
        call readline
        mov bl, al
        call nextline
        call readline
        mul bl
        mov bl, al
        call nextline
        call disp
        mov ah, 4Ch
        int 21h

readline proc near
        mov ah, 01
        int 21h
        call asctohex
        ret
readline endp

asctohex proc near
        cmp al, 3Ah
        jc sub30
        sub al, 7
        sub30:
        sub al, 30h
        and al, 0Fh
        ret
asctohex endp

nextline proc near
        mov ah, 2
        mov dl, 0Ah
        int 21h
        mov dl, 0Dh
        int 21h
        ret
nextline endp

disp proc near
        mov al, bl
        and al, 0F0h
        ror al, 4
        call hexasc
        mov dl, al
        mov ah, 02
        int 21h
        mov al, bl
        and al, 0Fh
        call hexasc
        mov dl, al
        mov ah, 2
        int 21h
        ret
disp endp

hexasc proc near
        cmp al, 0Ah
        jb num
        add al, 7
        num:
        add al, 30h
        ret
hexasc endp
end start