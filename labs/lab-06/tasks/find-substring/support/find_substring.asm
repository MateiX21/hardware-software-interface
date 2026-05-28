; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES
substring: db "BABC", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES

print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp
    push rbx
    sub rsp, 8

    xor rbx, rbx
.outer:
    mov al, [source_text + rbx]
    test al, al
    jz .done
    xor r8, r8
.inner:
    mov dl, [substring + r8]
    test dl, dl
    jz .match
    mov al, [source_text + rbx + r8]
    cmp al, dl
    jne .next
    inc r8
    jmp .inner
.match:
    mov rsi, rbx
    mov rdi, print_format
    xor eax, eax
    call printf
.next:
    inc rbx
    jmp .outer
.done:
    add rsp, 8
    pop rbx
    xor eax, eax
    leave
    ret
