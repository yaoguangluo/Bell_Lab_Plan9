    #include "print.h"
	TEXT    ·Doprint+0(SB),$0
    MOVL a+0(FP), BX
    CALL runtime.print(BX)
    RET   
    NOP
