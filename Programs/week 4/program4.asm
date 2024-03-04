.model small
.stack 20

.code
start:
    call readLine
    mov bl, al
    call nextLine
    call readLine
    mul bl
    call nextLine
    call display
    mov ah, 4Ch
    int 21h

    readLine proc near
        mov ah, 01
        int 21h
        call asctohex
        ret
    readLine endp

    asctohex proc near
        cmp al, 3Ah
        jc sub30
        sub al, 7
        sub30:
        sub al, 30h
        and al, 0Fh
        ret
    asctohex endp
    
    nextLine proc near
        mov ah, 2
        mov dl, 0Ah
        int 21h
    nextLine endp

    display proc near
        mov al, bl
        and al, 0F0h
        ror al, 4
        call hexasc
        mov dl, al
        mov ah, 2
        int 21h
        mov al, bl
        and al, 0Fh
        and al, 0Fh
        call hexasc
        mov dl, al
        int 21
        ret
    display endp

    hexasc proc near
        cmp al, 0Ah
        jb num
        add al, 7
        num:
        add al, 30h
        ret
    hexasc endp
end start


    