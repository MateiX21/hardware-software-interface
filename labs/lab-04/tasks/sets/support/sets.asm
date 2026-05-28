; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    FIRST_SET: dq 139   ; The first set
    SECOND_SET: dq 169  ; The second set

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    ; The two sets can be found in the FIRST_SET and SECOND_SET variables
    mov rax, QWORD [FIRST_SET]
    mov rbx, QWORD [SECOND_SET]
    PRINTF64 `%u\n\x0`, rax ; print the first set
    PRINTF64 `%u\n\x0`, rbx ; print the second set

    ; TODO1: reunion of the two sets (rax stays the first set)
    mov r8, rax
    or r8, rbx
    PRINTF64 `%u\n\x0`, r8

    ; TODO2: add two elements (bits 8 and 9) to the first set in rax
    or rax, 0x300
    PRINTF64 `%u\n\x0`, rax

    ; TODO3: intersection of the two sets
    mov r8, rax
    and r8, rbx
    PRINTF64 `%u\n\x0`, r8

    ; TODO4: complement of the first set, on 32 bits
    mov r8, rax
    not r8d
    PRINTF64 `%u\n\x0`, r8

    ; TODO5: remove element 0 from the first set in rax
    btr rax, 0
    PRINTF64 `%u\n\x0`, rax

    ; TODO6: difference first \ second = first AND (NOT second)
    mov r8, rax
    mov r9, rbx
    not r9
    and r8, r9
    PRINTF64 `%u\n\x0`, r8

    xor rax, rax

    leave
    ret
