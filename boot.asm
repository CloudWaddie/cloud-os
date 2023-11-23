mov ah, 0x0e
mov al, 'A'
int 0x10
loop:
    inc al
    cmp al, 'Z'
    jg nocaps
    jmp caps
caps:
    mov ah, 0x0e
    int 0x10
    jmp loop
nocaps:
    cmp al, 'Z'
    jg exit
    mov ah, 0x0e
    sub al, 32
    int 0x10
    jmp loop
exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa