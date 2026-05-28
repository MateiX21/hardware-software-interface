; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

%define ARRAY_SIZE    10

section .data
    qword_array dq 1392, -12544, -7992, -6992, 7202, 27187, 28789, -17897, 12988, 17992

section .text
extern printf
global main
main:

    mov r9,0;iterator
    mov rax,qword_array
    mov rcx,0 ;contor pozitiv
    mov rdx,0 ;contor negativ

    for:
    mov r10,qword[rax+r9*8]
    cmp r10,0
    jl e_neg
    jmp e_poz
    e_neg:
    inc rdx
    jmp aici
    e_poz:
    inc rcx
    jmp aici
    aici:
    

    inc r9
    cmp r9,ARRAY_SIZE
    jl for

    PRINTF64 `%llu %llu` ,rcx,rdx
	; TODO: Implement the code to count negative and positive numbers in the array
    ret
