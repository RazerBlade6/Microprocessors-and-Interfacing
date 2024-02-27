.model small
.stack 20
.data
    org 1000h
    num1 db 89
    num2 db 78
    res dw ?

.code
start:
    mov ax, @data
    mov ds, ax
    mov ah, 0
    mov al, num1
    add al, num2
    daa
    adc ah, 0
    mov res, ax
    int 3
end start