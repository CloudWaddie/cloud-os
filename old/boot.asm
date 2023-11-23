mov ah, 0x0e ; test comment
mov al, 'A'
int 0x10
loop:
    inc al
    cmp al, 97
    jge nocaps
    jmp caps
caps:
    mov ah, 0x0e
    add al, 32
    int 0x10
    jmp loop
nocaps:
    cmp al, 123
    jge exit
    mov ah, 0x0e
    sub al, 32
    int 0x10
    jmp loop
exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa