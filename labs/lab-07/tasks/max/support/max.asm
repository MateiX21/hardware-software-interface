%include "printf64.asm"

section .text

extern printf
global main
main:
    push rbp
    mov rbp, rsp

    ; numbers are placed in these two registers
    mov rax, 1
    mov rbx, 4

    cmp rax, rbx
    jge .done
    push rax
    push rbx
    pop rax
    pop rbx
.done:

    PRINTF64 `Max value is: %ld\n\x0`, rax ; print maximum value

    mov rsp, rbp
    pop rbp
    ret
