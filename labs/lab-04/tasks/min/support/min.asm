; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    FIRST_NUMBER dq 4  ; The first number
    SECOND_NUMBER dq 1 ; The second number

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    ; The two numbers can be found in the registers r9 and r10
    mov r9, QWORD [FIRST_NUMBER]  ; The first number
    mov r10, QWORD [SECOND_NUMBER] ; The second number
    PRINTF64 `%d\n\x0`, r9 ; print the first number
                            ; DO NOT REMOVE/MODIFY THIS LINE
    PRINTF64 `%d\n\x0`, r10 ; print the second number
                            ; DO NOT REMOVE/MODIFY THIS LINE

    ; if r9 already holds the smaller value keep it, otherwise swap them
    cmp r9, r10
    jl skip_swap
    xchg r9, r10
skip_swap:
    PRINTF64 `%d\n\x0`, r9 ; print the minimum
    xor rax, rax

    leave
    ret
