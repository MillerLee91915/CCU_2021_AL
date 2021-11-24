/* ========================= */
/*       DATA section        */
/* ========================= */
        .data
        .align 4
b:
    .space 400

/* ========================= */
/*       TEXT section        */
/* ========================= */
    .section .text
    .global NumSort
    .type NumSort,%function
.array:
    .word b
/* ========================= */
/*    Seleciotn  section     */
/* ========================= */
NumSort:
    /* function start */
    MOV ip, sp
    STMFD sp!, {r0-r10, fp, ip, lr, pc}
    SUB fp, ip, #4
    /* --- begin your function --- */
    /* Get array size from r9 */
    LDR r9, [ip], #4
    /* Get array address from r10 */
    LDR r10, [ip], #4
	
    LDR r8, .array
    MOV r2, #0
	MOV r4, #0
	MOV r5, #0
LOOP:
    /* copy arrA to arrB*/ 
    CMP r5, r9
    BGE EXIT0
    LDR r7,[r10,r2,LSL#2]
    ADD r2, #1
    STR r7,[r8,r4,LSL#2]
    ADD r4, #1
    ADD r5, r5, #1
    B LOOP
    
EXIT0:
    /* r0 contains the address of array */
    MOV r0, r8
    /* r1 contains the first element    */
    MOV r1, #0 
    /* r2 contains the number of element */
    MOV r2, r9

    MOV r3,r1                                              @ start index i
    SUB r7,r2,#1                                           @ compute n - 1
LOOP1:                                                      @ start loop
    MOV r4,r3
    ADD r5,r3,#1                                           @ init index 2
LOOP2: 
    LDR r1,[r0,r4,LSL #2]                                  @ load value A[mini]
    LDR r6,[r0,r5,LSL #2]                                  @ load value A[j]
    CMP r6,r1                                              @ compare value
    MOVLT r4,r5                                            @ j -> mini
    ADD r5,#1                                              @ increment index j
    CMP r5,r2                                              @ end ?
    BLT LOOP2                                              @ no -> loop
    CMP r4,r3                                              @ mini <> j ?
    BEQ LOOP3                                              @ no
    LDR r1,[r0,r4,LSL #2]                                  @ yes store A[mini] to B[i]
    LDR r6,[r0,r3,LSL #2]
    STR r1,[r0,r3,LSL #2]
    STR r6,[r0,r4,LSL #2]
LOOP3:
    ADD r3,#1                                              @ increment i
    CMP r3,r7                                              @ end ?
    BLT LOOP1                                              @ no -> loop 
 
EXIT:

    /* put result array’s address into r10 */ 
    MOV r10, r8  
    /* --- end of your function --- */
    nop
    /* function exit */
    LDMFD sp!, {r0-r10, fp, ip, pc}
.end