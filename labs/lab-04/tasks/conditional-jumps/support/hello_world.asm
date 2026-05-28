; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    myString: db "Hello, World!", 0
    byeString: db "Goodbye, World!", 0
    N: dq 6                         ; N = 6

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]              ; rcx will store the value of N
    PRINTF64 `%d\n\x0`, rcx         ; DO NOT REMOVE/MODIFY THIS LINE

    mov rax, 2
    mov r8, 1
    cmp rax, r8
    jg print                        ; TODO1: print only if rax > r8
    xor rax, rax

    leave
    ret

print:
    ; rcx still holds N (PRINTF64 preserves all caller-saved regs)
    test rcx, rcx
    jz goodbye                      ; nothing to print for N == 0
hello_loop:
    PRINTF64 `%s\n\x0`, myString
    dec rcx
    jnz hello_loop

goodbye:
    PRINTF64 `%s\n\x0`, byeString
    xor rax, rax

    leave
    ret
