TEXT	·MiddleSame+0(SB),$0
start:
	MOVL	num+0(FP) , AX
	MOVL    $8, BX
	JMP     LOOP1
	XORL     CX

LOOP1:
    SRLV    AX,$1
	JNC     NOCARRY
	JC      HASCARRY
LOOP2:
	DECL    BX
	CMPL    BX ,$0 	   	
	JNE     LOOP1
	JE      COMPARE
	
NOCARRY:
    SLLV     CX,$1
	ADDL    $0,CX
	JMP     LOOP2
	
HASCARRY:	 	
	SLLV     CX,$1
	ADDL    $1,CX
	JMP     LOOP2
	
COMPARE:
    CMPL    AX,CX
	JNE     NOTSAME
	JE      SAME

NOTSAME:
    MOVL	$0,RET+4(FP)
	RET
	NOP

SAME:	
	MOVL	$1,RET+4(FP)
	RET
	NOP	
