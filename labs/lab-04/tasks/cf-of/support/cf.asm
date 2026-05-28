; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov al, 0xFF
    PRINTF64 `the Carry Flag is not active\n\x0`
    test al, al
    ; 0xFF + 1 = 0x100 -> unsigned carry out of the byte, CF = 1
    add al, 1

    jc carry_flag
    jmp end

carry_flag:
    PRINTF64 `the Carry Flag is active\n\x0`

end:
    xor rax, rax

    leave
    ret
