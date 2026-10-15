%include "asm_io.inc"

segment .data
    num1 dd 10
    num2 dd 20

segment .text
    global asm_main

asm_main:
    enter 0, 0

    mov eax, [num1]
    add eax, [num2]

    call print_int
    call print_nl

    mov eax, 0
    leave
    ret

