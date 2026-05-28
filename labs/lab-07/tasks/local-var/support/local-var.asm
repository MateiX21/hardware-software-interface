%include "printf64.asm"

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12

%define OFF1 0
%define OFF2 20
%define OFFO 48

section .data

array_1 dd 27, 46, 55, 83, 84
array_2 dd 1, 4, 21, 26, 59, 92, 105


section .text

extern printf
global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 96

    xor rcx, rcx
copy_in_1:
    mov edx, [array_1 + 4 * rcx]
    mov [rsp + 4 * rcx + OFF1], edx
    inc rcx
    cmp rcx, ARRAY_1_LEN
    jb copy_in_1

    xor rcx, rcx
copy_in_2:
    mov edx, [array_2 + 4 * rcx]
    mov [rsp + 4 * rcx + OFF2], edx
    inc rcx
    cmp rcx, ARRAY_2_LEN
    jb copy_in_2

    mov rax, 0
    mov rbx, 0
    mov rcx, 0

merge_arrays:
    mov edx, [rsp + 4 * rax + OFF1]
    cmp edx, [rsp + 4 * rbx + OFF2]
    jg array_2_lower
array_1_lower:
    mov [rsp + 4 * rcx + OFFO], edx
    inc rax
    inc rcx
    jmp verify_array_end
array_2_lower:
    mov edx, [rsp + 4 * rbx + OFF2]
    mov [rsp + 4 * rcx + OFFO], edx
    inc rcx
    inc rbx

verify_array_end:
    cmp rax, ARRAY_1_LEN
    jge copy_array_2
    cmp rbx, ARRAY_2_LEN
    jge copy_array_1
    jmp merge_arrays

copy_array_1:
    mov edx, [rsp + 4 * rax + OFF1]
    mov [rsp + 4 * rcx + OFFO], edx
    inc rcx
    inc rax
    cmp rax, ARRAY_1_LEN
    jb copy_array_1
    jmp print_array
copy_array_2:
    mov edx, [rsp + 4 * rbx + OFF2]
    mov [rsp + 4 * rcx + OFFO], edx
    inc rcx
    inc rbx
    cmp rbx, ARRAY_2_LEN
    jb copy_array_2

print_array:
    PRINTF64 `Array merged:\n\x0`
    mov rcx, 0
print:
    mov eax, [rsp + 4 * rcx + OFFO]
    PRINTF64 `%d \x0`, rax
    inc rcx
    cmp rcx, ARRAY_OUTPUT_LEN
    jb print

    PRINTF64 `\n\x0`
    xor rax, rax

    mov rsp, rbp
    pop rbp
    ret
