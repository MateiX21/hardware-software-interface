%include "printf64.asm"

%define NUM 5

section .text

extern printf
global main
main:
    mov rbp, rsp

    mov rcx, NUM
init_nums:
    sub rsp, 8
    mov [rsp], rcx
    loop init_nums

    sub rsp, 8
    mov qword [rsp], 0

    mov rax, "handsome"
    sub rsp, 8
    mov [rsp], rax
    mov rax, "is very "
    sub rsp, 8
    mov [rsp], rax
    mov rax, "Anthony "
    sub rsp, 8
    mov [rsp], rax

    lea rsi, [rsp]
    PRINTF64 `%s\n\x0`, rsi

    mov rbx, rbp
dump_loop:
    mov rdx, [rbx]
    PRINTF64 `0x%lx: 0x%lx\n\x0`, rbx, rdx
    sub rbx, 8
    cmp rbx, rsp
    jae dump_loop

    mov rbx, rsp
str_loop:
    movzx rdx, byte [rbx]
    test dl, dl
    jz str_done
    PRINTF64 `%c\x0`, rdx
    inc rbx
    jmp str_loop
str_done:
    PRINTF64 `\n\x0`

    mov rbx, rbp
    sub rbx, 8 * NUM
    mov rdx, [rbx]
    PRINTF64 `%ld\x0`, rdx
    add rbx, 8
    mov rcx, NUM - 1
arr_loop:
    mov rdx, [rbx]
    PRINTF64 ` %ld\x0`, rdx
    add rbx, 8
    loop arr_loop
    PRINTF64 `\n\x0`

    mov rsp, rbp

    xor rax, rax
    ret
