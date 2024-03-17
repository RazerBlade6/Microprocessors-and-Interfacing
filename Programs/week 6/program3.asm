.model small
.stack 20

print macro msg
    mov ah, 09h
    mov dx, offset msg
    int 21h
endm

.data
    day db ?, ?, '-'
    month db ?, ?, '-'
    year db ?, ?, ?, ?, '$'

.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax

    mov ah, 2ah
    int 21h
    push cx
    push dx
    mov al, dl
    lea si, day
    mov ah, 00h
    call conv
    pop dx
    mov al, dh
    lea si, month
    mov ah, 00h
    call conv
    pop ax
    lea si, year
    call conv
    print day
    mov ah, 4ch
    int 21h

conv proc near
    mov cx, 0000h
    mov bx, 000ah

next:
    mov dx, 0000
    div bx
    add dl, 30h
    push dx
    inc cx
    cmp ax, 000ah
    jge next
    add al, 30h
    mov [si], al

up:
    pop ax
    inc si
    mov [si], al
    loop up
    ret
conv endp

end start
