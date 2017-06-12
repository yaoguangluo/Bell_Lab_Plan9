TEXT	·Bbsort+0(SB),$0
start:
	MOVL	arr+0(FP) , AX
	MOVL    arr+4(FP) , BX
LOOPI:    	
	JMP    CHECKI
LOOPI1:
    MOVL   BX,CX
	JMP    LOOPJ
LOOPI2:
	DECL   BX
	JMP    LOOPI
LOOPJ:
    JMP    CHECKJ
LOOPJ1:		 
	JMP    COMPIJ
LOOPJ2:
    DECL   CX 	
    JMP    LOOPJ	
	
CHECKI:
    CMPL   BX,$0
	JE     FINISH	
	JNE    LOOPI1
	
CHECKJ:
	CMPL   CX,$0
	JE     LOOPI
	JNE    LOOPJ1 
	
COMPIJ:
    LEAL  (CX * 4), DX
    ADDL  (AX),DX  
	MOVL   CX,SI
	DECL   SI 	
	LEAL  (SI * 4), DI
    ADDL  (AX),DI 
	CMPL  DX,DI
	JL    SWAP
	JGE   LOOPJ2

SWAP:
    MOVL  AX[CX],DX
	MOVL  AX[SI],AX[CX]
	MOVL  DX,AX[SI]
	JMP   LOOPJ
FINISH:
    MOVL	AX,RET+12(FP)
	RET
	NOP
	