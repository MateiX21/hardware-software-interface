; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

extern printf

section .bss
	; the structure for a student
	struc student_t
		name:   resb	10	; char[10] - student name
		id_course:	resq	1	; integer - the id of the course where a student is assigned
		check:	resd	1	; "bool" - check if the student is assigned to any course
	endstruc

    ; the structure for a course
	struc course_t
		id:	resq	1	; id = index in courses (the list of courses)
		name_course:   resb	15	; char[10] - the name of the course
	endstruc

section .data
    unassigned:		db "Student unassigned :(", 0
    fmt_student:	db "%s ---- %s", 10, 0
	v_students_count:    dq 5
    v_courses_count:    dq 3

    students:
		istruc student_t
			at name,	db "Vlad", 0
			at id_course,		dq 0
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "Andrew", 0
			at id_course,		dq 1
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "Kim", 0
			at id_course,		dq 1
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "George", 0
			at id_course,		dq 2
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "Kate", 0
			at id_course,		dq 0
			at check,	dd 0
		iend

    courses:
		istruc course_t
			at id,	dq 0
			at name_course,	db "Assembly", 0
		iend

		istruc course_t
			at id,	dq 1
			at name_course,	db "Linear Algebra", 0
		iend

		istruc course_t
			at id,   dq 2
			at name_course,	db "Physics", 0
		iend

section .text
global main

main:
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	PRINTF64 `The students list is:\n\x0`

	mov rbx, students
	mov r12, [v_students_count]
.loop:
	test r12, r12
	jz .done

	cmp dword [rbx + check], 0
	je .unassigned

	mov rax, [rbx + id_course]
	imul rax, rax, course_t_size
	lea rdx, [courses + name_course + rax]
	jmp .print
.unassigned:
	mov rdx, unassigned
.print:
	mov rsi, rbx
	mov rdi, fmt_student
	xor eax, eax
	call printf

	add rbx, student_t_size
	dec r12
	jmp .loop
.done:
	pop r12
	pop rbx
    leave
    ret
