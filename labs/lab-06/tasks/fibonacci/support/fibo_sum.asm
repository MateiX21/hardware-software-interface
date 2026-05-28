; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    N dq 9 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE VALUE OF N!
           ; compute the sum of the first N fibonacci numbers
    sum_print_format db "Sum first %ld fibonacci numbers is %ld", 10, 0

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    push rbx

    xor rax, rax
    mov rcx, [N]
    xor r8, r8
    mov r9, 1
.fib_loop:
    add rax, r8
    mov r10, r8
    add r10, r9
    mov r8, r9
    mov r9, r10
    loop .fib_loop

    mov rdi, sum_print_format
    mov rsi, [N]
    mov rdx, rax
    xor eax, eax     ; Required for variadic functions,
                     ; AL = number of XMM args (0 here)
    call printf

    pop rbx
    add rsp, 8
    xor rax, rax
    leave
    ret
