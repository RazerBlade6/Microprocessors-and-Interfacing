.model small
.stack 20

.data
    filename db 'file.txt', '$'
    buffer db 100 dup(?)
    db '$'
    file_error_msg db 'Error opening file.', 13, 10, '$'
    read_error_msg db 'Error reading file.', 13, 10, '$'
    NULL equ 0

.code
start:
    mov ax, @data
    mov ds, ax
    mov ah, 3dh
    mov al, 0
    lea dx, filename
    int 21h
    jc file_error
    mov bx, ax

read_loop:
    mov ah, 3fh
    mov cx, 100
    lea dx, buffer
    int 21h
    jc read_error
    cmp ax, NULL
    je end_of_file
    mov ah, 09h
    lea dx, buffer
    int 21h
    jmp read_loop

file_error:
    mov ah, 09h
    lea dx, file_error_msg
    int 21h
    jmp end_program

read_error:
    mov ah, 09h
    lea dx, read_error_msg
    int 21h
    jmp end_program

end_of_file:
    mov ah, 3eh
    mov bx, ax
    int 21h

end_program:
    mov ah, 4ch
    int 21h

end start
