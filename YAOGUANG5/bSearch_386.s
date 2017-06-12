TEXT	runtime·BSearch(SB),NOSPLIT,$0
BOOT:
	JMP   start
	JMP   finish
start:
    MOVL	arr+0(FP),CX
	MOVL    slen+12(FP),SI  
	MOVL    blen+16(FP),DI
    MOVL    DI, AX
	XORL	DX, DX
	MOVL	$2, BX
	IDIVL	BX
	JMP		comp

comp:
	LEAL	(AX * 4), BX
	ADDL    (CX),BX
	MOVL	num+20(FP), DX
	CMPL	DX, BX
	JE		found
	JMP     left
	JMP     right
	JMP		not_found
	
left:
    CMPL	AX, SI
    JE		not_found
	MOVL    SI, slen+12(FP)
	MOVL    AX, blen+16(FP)
	CALL    runtime.BSearch(SB)
	
	
right:    
    CMPL	AX, DI
    JE		not_found
	MOVL    AX, slen+12(FP)
	MOVL    DI, blen+16(FP)
	CALL 	runtime.BSearch(SB)  
	RET
	
not_found:
	MOVL	AX, RET+24(FP)
    RET
	
finish:
    MOVL    $3,RET+24(FP)	
	RET
	NOP
found:
	MOVL	BX, RET+24(FP)
	RET
	NOP
	