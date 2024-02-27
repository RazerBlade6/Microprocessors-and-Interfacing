data segment
    org 1000h
    num1 db 89h
    num2 db 7Ch
    res dw ?
data ends

code segment
    assume cs: code, ds: data
    start:
        mov ax, data
        mov ds, ax
        mov ah, 0
        mov al, num1
        add al, num2
        adc ah, 0
        mov res, ax
        int 3
    code ends
end start