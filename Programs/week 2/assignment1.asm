.model small
.stack 20

.data
    org 1000h
    num dw 6
    ans dw ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov cx, num
    mov ax, 1
    repeat:
        imul cx
    loop repeat
    mov ans, ax
end start