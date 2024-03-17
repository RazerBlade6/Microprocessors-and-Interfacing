.model small
.stack 20

print macro msg
    mov ah, 09h
    lea dx, msg
    int 21h
    endm

read macro str
    lea dx, str
    mov ah, 10
    int 21h
    endm

.data
    msg1 db 13, 10, 'Enter a filename:$'
    msg2 db 13, 10, 'File is created$'
    msg3 db 13, 10, 'Error in File creation$'
    msg4 db 13, 10, 'Enter a text:$'
    msg5 db 13, 10, 'Error in File opening$'
    msg6 db 13, 10, 'Error in writing$'
    msg7 db 13, 10, 'Creating and writing successful$'
    
    fname db 80
    db ?
    db 80 dup(0)
    text db 80
    db ?
    db 80 dup(?)

.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax

    print msg1
    read fname

    lea si, fname + 2
    mov cl, fname + 1
    mov ch, 0
    add si, cx

    mov byte ptr[si], 0
    lea dx, fname+2

    mov ah, 3ch
    mov cx, 0
    int 21h
    jnc succ1

    print msg3
    jmp exit

succ1:
    print msg2
    print msg4
    read text
    mov ah, 3dh
    mov al, 02h
    lea dx, fname+2
    int 21h
    jnc succ2
    print msg5
    jmp exit

succ2:
    mov bx, ax
    mov ah, 40h
    mov ch, 00h
    mov cl, text+1
    lea dx, text+2
    int 21h
    jnc succ3
    print msg6
    mov ah, 3eh
    int 21h
    jmp exit

succ3:
    print msg7

exit:
    mov ah, 4ch
    int 21h

end start