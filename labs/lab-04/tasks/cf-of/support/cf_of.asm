; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov al, 128
    PRINTF64 `the Carry Flag and the Overflow Flag are not active\n\x0`
    test al, al
    ; 128 + 128 = 256: unsigned carry (CF) and signed overflow of two
    ; negatives (OF), so both flags become active
    add al, 128

    jc cf_on
    jmp end

cf_on:
    jo cf_of_on
    jmp end

cf_of_on:
    PRINTF64 `the Carry Flag and the Overflow Flag are active\n\x0`

end:
    xor rax, rax

    leave
    ret
