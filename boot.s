[org 0x7c00]
mov sp, bp

mov ah, 0x0e
mov bx, message

printString:
	mov al, [bx]
	cmp al, 0
	je printKey
	int 0x10
	inc bx
	jmp printString


printKey:
	mov ah, 0
	int 0x16
	cmp al, "0" 
	je end
	mov ah, 0x0e
	int 0x10
	jmp printKey

message: db "Hello world!", 0

end:
jmp $

	
times 510-($-$$) db 0
dw 0xaa55
