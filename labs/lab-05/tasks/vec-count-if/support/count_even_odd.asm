; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

%define ARRAY_SIZE    10

section .data
    qword_array dq 1392, 12544, 7991, 6992, 7202, 27187, 28789, 17897, 12988, 17992

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp

    xor r9, r9          ; iterator
    xor rcx, rcx        ; even counter
    xor rdx, rdx        ; odd counter

count_loop:
    mov r10, qword [qword_array + r9*8]
    test r10, 1         ; bit 0 set => odd
    jnz is_odd
    inc rcx
    jmp next
is_odd:
    inc rdx
next:
    inc r9
    cmp r9, ARRAY_SIZE
    jl count_loop

    PRINTF64 `%llu %llu\n\x0`, rcx, rdx

    xor rax, rax
    leave
    ret
