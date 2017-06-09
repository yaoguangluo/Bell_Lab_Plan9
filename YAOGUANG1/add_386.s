    TEXT    ·Add+0(SB),$0
    MOVL a+0(FP), BX
	MOVL b+4(FP), BP
    ADDL BP, BX
	MOVL BX, RET+8(FP)
    RET   
    NOP
