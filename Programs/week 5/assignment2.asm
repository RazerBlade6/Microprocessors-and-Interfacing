.model small
.stack 20

.data
    msg1 db 13, 10, 'Enter the String: $'
    buffer db 80
    db ?
    db 80 dup(?)
    count_a db 30h
    count_w db 31h
    msg2 db 13, 10, 'Number of a/A in the string is: $'
    msg3 db 13, 10, 'Numer of words in the string is: $'

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

a_counter:
    cmp byte ptr[si], '$'
    je stop_a_counter
    cmp byte ptr[si], 'a'
    jne not_a
    inc count_a
    jmp next_a

not_a:
    cmp byte ptr[si], 'A'
    jne next_a
    inc count_a
    jmp next_a

next_a:
    inc si
    loop a_counter
stop_a_counter:
    lea si, buffer + 2
    mov cl, buffer + 1
    jmp w_counter
    
w_counter:
    cmp byte ptr[si], '$'
    je output
    cmp byte ptr[si], ' '
    jne next_w
    inc count_w

next_w:
    inc si
    loop w_counter

output:
    lea dx, msg2
    mov ah, 9
    int 21h

    mov ah, 2
    mov dl, count_a
    int 21h

    lea dx, msg3
    mov ah, 9
    int 21h

    mov ah, 2
    mov dl, count_w
    int 21h

    mov ah, 4Ch
    int 21h

end start