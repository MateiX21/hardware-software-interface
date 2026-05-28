; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

struc my_struct
    int_x: resb 4
    char_y: resb 1
    string_s: resb 32
endstruc

section .data
    sample_obj:
        istruc my_struct
            at int_x, dd 1000
            at char_y, db 'a'
            at string_s, db 'My string is better than yours', 0
        iend

    new_int dd 2000
    new_char db 'b'
    new_string db 'Are you sure?', 0

    fmt_int db "int_x: %d", 10, 0
    fmt_char db "char_y: %c", 10, 0
    fmt_str db "string_s: %s", 10, 0

section .text
extern printf
global main

main:
    push rbp
    mov rbp, rsp

    call print_obj

    mov eax, [new_int]
    mov [sample_obj + int_x], eax

    mov al, [new_char]
    mov [sample_obj + char_y], al

    lea rdi, [sample_obj + string_s]
    mov rsi, new_string
.strcpy:
    mov al, [rsi]
    mov [rdi], al
    inc rsi
    inc rdi
    test al, al
    jnz .strcpy

    call print_obj

    xor rax, rax
    leave
    ret

print_obj:
    push rbp
    mov rbp, rsp

    mov esi, [sample_obj + int_x]
    mov rdi, fmt_int
    xor eax, eax
    call printf

    movzx esi, byte [sample_obj + char_y]
    mov rdi, fmt_char
    xor eax, eax
    call printf

    lea rsi, [sample_obj + string_s]
    mov rdi, fmt_str
    xor eax, eax
    call printf

    leave
    ret
