; AllOpCodes
; Programa para testar todos os OpCodes disponíveis p/ a CPU-8E
Num1	EQU	171
;
	JMP	Start
Num2	DDB	0AAh		; definimos variavel inicializada como 0xAA = 170
Result	DDB	0		; variavel para resultado
Start	NOP			; Comecamos fazendo NADA!  :-)
	LOD	0ABh		; Carregar ACC com 0xAB = 171 modo imediato-Hex
	LOD	170		; Carregar ACC com 170 = 0xAA modo imediato-Dec
	Lod	Num1		; carrega ACC c/ cte. Num1 = 171 = 0xAB
				; o codigo gerado aqui deve ser o mesmo que 'LOD 0ABh'
	CMP	[Num2]		; compara Num1 com Num2 (eh maior)
	JMP	Acolah		; soh para complicar, testa o JMP sem qualquer motivo
Maior	JMP	Maior2		; agora salta para a frente
Acolah	JGT	Maior		; salta para tras se maior (deve saltar)
Maior2	SUB	[Num2]		; deve dar '1'
	NOT			; complementa ACC (deve dar FE)
	ADD	1		; complemento de 2 (deve dar FF = -1)
	ADD	1		; deve dar '0'
	JEQ	Zero		; salta par Zero
	ADD	0FFh		; nunca vai passar por aqui
Zero	XOR	055h		; XOR deve dar 0x55
	AND	040h		; AND deve dar 0x40
	STO	Result	 	; armazena resultado
Fim	HLT			; TERMINOU
