; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    num dq 100000

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp

    mov rcx, [num]     ; counter, also the value being squared
    xor rbx, rbx       ; rbx accumulates the sum of squares

add_square:
    mov rax, rcx
    mul rax            ; rax = rcx * rcx (fits in 64 bits for rcx <= 100000)
    add rbx, rax
    loop add_square    ; mul clobbers rdx, but loop only needs rcx

    PRINTF64 `Sum of squares: %lu\n\x0`, rbx

    leave
    ret
