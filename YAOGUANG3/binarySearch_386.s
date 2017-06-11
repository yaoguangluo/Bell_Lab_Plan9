TEXT	·BinarySearch+0(SB),$0
start:
	MOVL	arr+0(FP) , AX
	MOVL    arr+4(FP) , BX
	MOVL	num+12(FP), CX
	CMPL    BX,$0
	JNE     LOOP1
	JE      ERROR
	RET
    NOP 
ERROR:
    MOVL	$0, RET+16(FP)
	RET
    NOP 	

LOOP: 
    LEAL    +4(AX),AX
	DECL    BX
	JMP LOOP1
LOOP1:	
	CMPL    BX,$0
	JE      ERROR
	JNE     continue
	RET
	NOP
continue:
	CMPL    (AX),CX
	JNE     LOOP
	JE      FOUND
    RET
    NOP 
FOUND:	
    MOVL    (AX),AX
	MOVL	AX, RET+16(FP)
	RET
    NOP
