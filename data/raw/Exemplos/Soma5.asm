; Programa para somar 10 números e armazenar o resultado
;
	lod	0		; Limpa o Acumulador
	sto	[Soma]		; Limpa totalizador 
Loop	lod	[Soma]		; Carrega totalizador
Index	add	[Num]		; Soma próxima parcela ("Num" será incrementado a cada Loop)
	sto	[Soma]		; Guarda novo total
	lod	[Index]		; Carrega "index"
	add	1		; incremeta "index"
	sto	[Index]		; Salva novo "index"
	lod	[N]		; Carrega contador de loop (parcelas)
	sub	1		; decrementa
	jeq	Fim		; Testa se zero ---> terminou!
	sto	[N]		; senão salva contador e
	jmp	Loop		; retorna ao início do loop
Fim	hlt			; Para processamento
Num	ddb	3		; Este é o primeiro valor (parcela) a ser totalizado
	ddb	5		; seguido de mais 4 valores
	ddb	4
	ddb	2
	ddb	7
N	ddb	5		; contador de loop (número de parcelas)
Soma	ddb	0		; Totalizador do resultado
