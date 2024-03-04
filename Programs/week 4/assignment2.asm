.model small 
.stack 20

.code
start:
    mov cx, 2

    repeat:
        mov ah, 1
        int 21h
        cmp al, 39h 
        jbe numeric
        sub al, 7 
        numeric:
        sub al, 30h
        add bl, al
        cmp cx, 1
        je next 
        rol bl, 4 
        next:
    loop repeat

    mov dl, bl
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h
end start
