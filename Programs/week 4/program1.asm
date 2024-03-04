.model small
.stack 20

.data
    org 1000h
    bcd dw 1234h
    hex dw 0

.code
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0
    mov bx, 1
    call bcd2bin
    mov bx, 0Ah
    call bcd2bin
    mov bx, 64h
    call bcd2bin
    mov bx, 3E8h
    call bcd2bin
    int 3
    bcd2bin proc near
        mov ax, bcd
        and ax, 0Fh
        mul bx
        add hex, ax
        mov cl, 4
        ror bcd, cl
        ret
    bcd2bin endp
end start


    