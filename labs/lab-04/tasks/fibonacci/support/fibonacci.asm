; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    N: dq 7          ; N-th fibonacci number to calculate

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]       ; we want to find the N-th fibonacci number; N = RCX = 7
    PRINTF64 `%d\n\x0`, rcx  ; DO NOT REMOVE/MODIFY THIS LINE

    ; rcx still holds N; compute F(N) iteratively into rax
    xor rax, rax            ; rax = F(0) = 0
    test rcx, rcx
    jz fib_done             ; F(0) = 0

    mov rax, 1              ; rax = current = F(1)
    xor rbx, rbx            ; rbx = previous = F(0)
    mov rdx, 1             ; rdx = index i (we already have F(1))
fib_loop:
    cmp rdx, rcx
    jge fib_done
    mov r8, rax
    add r8, rbx            ; r8 = F(i) + F(i-1)
    mov rbx, rax           ; previous = current
    mov rax, r8            ; current = next
    inc rdx
    jmp fib_loop

fib_done:
    PRINTF64 `%d\n\x0`, rax

    xor rax, rax

    leave
    ret
