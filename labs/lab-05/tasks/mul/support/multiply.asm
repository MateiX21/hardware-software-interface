; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

; https://en.wikibooks.org/wiki/X86_Assembly/Arithmetic

section .data
    num1 db 43
    num2 db 39
    num1_w dw 1349
    num2_w dw 9949
    num1_d dd 134932
    num2_d dd 994912
    num1_q dq 9223372036854775800
    num2_q dq 12345678

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp

    ; Multiplication for db
    mov al, byte [num1]
    mov bl, byte [num2]
    mul bl

    ; Print result in hexa
    PRINTF64 `Result is: 0x%hx\n\x0`, rax
    xor rdx,rdx
    mov ax,word[num1_w]
    mov bx,word[num2_w]
    mul bx
    shl edx,16
    mov dx,ax
    PRINTF64 `Result is: 0x%x\n\x0`, rdx
    ; TODO: Implement multiplication for dw, dd and dq data types.

    xor rdx,rdx
    mov eax,dword[num1_d]
    mov ebx,dword[num2_d]
    mul ebx
    shl rdx,32
    or rdx,rax
    PRINTF64 `Result is: 0x%llx\n\x0`, rdx

    xor rdx,rdx
    mov rax,qword[num1_q]
    mov rbx,qword[num2_q]
    mul rbx
    PRINTF64 `Results is: 0x%llx%llx\n\x0`,rdx,rax
    leave
    ret
