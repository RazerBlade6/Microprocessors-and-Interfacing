.model small
.stack 20

.data
    msg1 db 13, 10, 'Enter a string: $'
    buffer db 80
    db ?
    db 80 dup(?)

    msg2 db 13, 10, 'Enter a character to search: $'
    char db 0

    msg3 db 13, 10, 'Character found in the string.$'
    msg4 db 13, 10, 'Character not found in the string.$'

    found db 0

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 10
    lea dx, buffer
    int 21h
    lea si, buffer + 2 
    mov cl, buffer + 1

    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    mov char, al

search_loop:
    mov bh, byte ptr[si]
    cmp bh, 0    
    je end_search

    cmp bh, char 
    je char_found

    inc si             
    loop search_loop
    jmp end_search   

char_found:
    mov found, 1       
    jmp end_search

end_search:
    mov ah, 9
    cmp found, 1
    je character_found
    lea dx, msg4
    int 21h
    jmp end_program

character_found:
    mov ah, 9
    lea dx, msg3
    int 21h

end_program:
    mov ah, 4Ch
    int 21h

end start
