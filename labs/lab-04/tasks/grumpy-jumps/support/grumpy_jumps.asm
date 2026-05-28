; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    wrong: db 'Not today, son.',0
    right: db 'Well done!',0

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rax, 2                  ; rax < rbx (signed) -> jns not taken
    mov rbx, 3                  ; rbx <= rcx (unsigned) -> jb not taken
    mov rcx, 0x5                ; hardcoded; DO NOT change
    cmp rax, rbx
    jns bad
    cmp rcx, rbx
    jb bad
    add rax, rbx                ; rax + rbx = 5
    xor rax, rcx                ; 5 ^ 5 = 0 -> jnz not taken
    jnz bad

good:
    PRINTF64 `%s\n\x0`, right
    xor rax, rax
    jmp done                    ; skip the wrong message

bad:
    PRINTF64 `%s\n\x0`, wrong
    xor rax, rax

done:
    leave
    ret
