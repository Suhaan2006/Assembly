section .data
    msg db 'Hello, world!', 0xa  ; string to be printed (0xa is a newline)
    len equ $ - msg             ; calculate message length

section .text
    global _start               ; entry point for the linker

_start:
    ; Use system call 4 (sys_write)
    mov edx, len                ; 3rd argument: message length
    mov ecx, msg                ; 2nd argument: address of string
    mov ebx, 1                  ; 1st argument: file descriptor (stdout)
    mov eax, 4                  ; system call number (4 = write)
    int 0x80                    ; call the kernel

    ; Use system call 1 (sys_exit)
    mov ebx, 0                  ; exit status 0 (success)
    mov eax, 1                  ; system call number (1 = exit)
    int 0x80                    ; call the kernel
