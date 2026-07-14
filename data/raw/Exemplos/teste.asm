; Programa de teste para o Assembler da CPU-8E
; Mudando-se o valor de 'N' obtemos os seguintes resultados em ACC:
; N < 7 --> ACC = FFh
; N = 7 --> ACC = 00h
; N > 7 --> ACC = 01h
;
Sete	EQU	7
;
Start	LOD [N]		; ACC = [N] = 5
	CMP Sete	; ACC : Sete
	JEQ Eq		; se ACC = Sete
	JGT Gt		; se ACC > Sete
	JMP Lt		; caso contrario, ACC < Sete
Eq	LOD 0		; ACC = 0 (0)
	JMP End		; --> END
Lt	LOD [Minus1]	; ACC < 0 (-1)
	JMP End		; --> END
Gt	LOD [Plus1]	; ACC > 0 (+1)
End	HLT		; END
	DDB 01		; NOP
N	DDB 05		; cte. '5'
Minus1	DDB 0FFh	; Cte. '-1'
Plus1	DDB 01		; Cte. '+1'
