/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 400    @ max size is 100.
a:
	.word 1
	.word 10
	.word 6
	.word 3
	.word 20
	.word 40
	.word 9
    .word 11

/* ========================= */
/*       TEXT section        */
/* ========================= */
    .section .text
    .global main
    .type main,%function

.array:
    .word a
main:
    MOV ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4
    
    /* prepare input array */
    LDR r9, .array
    MOV r10, #8

    /* put array size into r9 */
    STR r9, [sp, #-4]!
    /* put array address into r10 */
    STR r10, [sp, #-4]!

    bl NumSort
    
    /* --- end of your function --- */
    LDMEA fp, {fp, sp, pc}
    .end