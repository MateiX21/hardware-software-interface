; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .bss
    array3: resw 10

section .data
    array1: db 27, 35, 46, 14, 17, 29, 37, 104, 135, 124
    array2: db 15, 38, 44, 20, 17, 33, 78, 143, 132, 16

section .text
extern printf
global main

main:
    push rbp
    mov rbp, rsp
    mov rax,array1
    mov rbx,array2
    mov rcx,array3
    mov r8,0 ;it

  
    for:
    movzx r9,byte[rax+r8]
    movzx r10,byte[rbx+r8]
    imul r9,r10
    mov word [rcx+r8*2],r9w
    inc r8
    cmp r8,10
    jl for 

    mov rbx,0

     PRINTF64 `The array that results from the product of the corresponding elements in array1 and array2 is:\n\x0`

     for2:
     xor rax,rax
     movsx rax,word[array3+rbx*2]
     PRINTF64 `%u ` ,rax

     inc rbx
     cmp rbx,10
     jl for2

    ; TODO: Traversing array1 and array2 and putting the result in array3
  
    ; TODO: Traversing array3 and displaying its elements
    PRINTF64 `\n\x0`
    leave
    ret
