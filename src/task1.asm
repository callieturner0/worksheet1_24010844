%include "asm_io.inc"

segment .data
    integer1 dd 15
    integer2 dd 6

segment .bss
    result resd 1

segment .text
    global asm_main

asm_main:
    enter 0, 0
    pusha

    ; Load the first integer into EAX
    mov eax, [integer1]

    ; Add the second integer to EAX
    add eax, [integer2]

    ; Store the result in memory
    mov [result], eax

    ; Print the result
    mov eax, [result]
    call print_int
    call print_nl

    popa

    mov eax, 0
    leave
    ret