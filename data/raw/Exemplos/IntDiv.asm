; Programa para DIVISÃO INTEIRA por subtrações sucessivas
; Prof. Joel Guilherme - IESB - fev/2009
;
; Dados;
; A - Dividendo
; D - Divisor (> 0)
; o programa computa
;    Q - Quociente, e
;    R - Resto
; tais que
; A = QxD + R, com (0 <= R < D).
;
	JMP	Start
; Área de dados
A	DDB	23		; Dividendo
D	DDB	7		; Divisor
Q	DDB	0		; Quociente
R	DDB	0		; Resto
SA	DDB	0		; Sinal do dividendo
SD	DDB	0		; Sinal do divisor
AbsA	DDB	0		; Variável temporária para |A| (dividendo)
AbsD	DDB	0		; Variável temporária para |D| (divisor)
;
; Programa
;
Start	LOD	[A]
	STO	[AbsA]
	JGE	ChkD		; se A >= 0 check D
; A < 0
	NOT			; complementa (lógico)
	ADD	1		; complemento de 2 de A, ou seja, ACC = |A|
	STO	[AbsA]		; salva na variavel temporária |A|
	LOD	1
	STO	[SA]		; armazena informação de sinal de A
ChkD	LOD	[D]
	STO	[AbsD]
	JGE	Loop		; se D >= 0 vá para Loop principal
; D < 0
	NOT			; complementa (lógico)
	ADD	1		; complemento de 2 de D, ou seja, ACC = |D|
	STO	[AbsD]		; salva na variavel temporária |D|
;
; Início do Loop principal para subtrair o divisor do dividendo
;
Loop
	LOD	[Q]		; recupera valor atual do quociente ...
	ADD	1		; ... e incrementa ...
	STO	[Q]		; ... guardando novo valor parcial do quociente
	LOD	[AbsA]		; recupera valor atual do dividendo 
	SUB	[AbsD]		; subtrai divisor
	STO	[AbsA]		; guarda novo valor temporário do dividendo
	CMP	[AbsD]
	JGE	Loop		; se >= continua o processo, senão ...
; subtração exauriu o dividendo
	LOD	[AbsA]
	STO	[R]		; resto presumível
; fazer as correções conforme sinais do dividendo e divisor
	LOD	[SA]
	JGT	Test1		; testa qual correção é necessária nos resultados
	LOD	[SD]
	JGT	Test3		; testa qual correção é necessária nos resultados
; A >= 0 e D >= 0 ... Q e R contêm o Quociente e Resto finais
	JMP 	Fim
; A < 0
Test1	LOD	[AbsD]
	SUB	[R]
	STO	[R]
	LOD	[Q]
	ADD	1
	STO	[Q]
	LOD	[SD]
	JEQ	Test2	; A < 0 e D > 0
; A < 0 e D < 0
	JMP	Fim
; A < 0 e D > 0
Test2	LOD	[Q]
	NOT
	ADD	1
	STO	[Q]
	JMP	Fim
; A > 0 e D < 0
Test3	LOD	[Q]
	NOT
	ADD	1
	STO	[Q]
; Processo terminado
Fim	HLT
	HLT
