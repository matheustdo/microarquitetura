.data

.global _start

# .equ <nome> <valor hex>
# Este bloco armazena os valores, em hexadecimal, correspondentes ao que deve ser printado no display 

.equ L, 0x4C
.equ E, 0x45
.equ D, 0x44
.equ Um, 0x31
.equ Dois, 0x32
.equ Tres, 0x33
.equ Quatro, 0x34
.equ Cinco, 0x35

.equ Y, 0x59
.equ O, 0x4F
.equ U, 0x55
.equ C, 0x43
.equ H, 0x48
.equ S, 0x53

.equ clear, 0x01 # comando para limpar o display
.equ space, 0x20

.text


# r2 guarda recebe os resultados da intrução customizada do lcd
# r3 guarda valores temporários 
# r4 guarda os números das leds a serem alterados no display (de acordo com a rolagem do menu) [
# r5 guarda o endereço de memória dos  botões
# r6 guarda o endereço de memória das colunas da matriz de leds
# r7 guarda valores temporários
# r8 guarda endereços de instruções temporariamente
# r10 usado como contador para criar delay
# r13 o endereço de memória das linhas da matriz de leds
# r14 contêm o valor 1 (um)

# Codificação dos Botões:
# 1 - volta ao menu -  0001 (1)
# 2 - seleciona -      0010 (2)
# 3 - rola pra baixo - 0100 (4)
# 4 - rola pra cima -  1000 (8)

# Codificação das Leds
# LED1 - 00001 (1)
# LED2 - 00010 (2)
# LED3 - 00100 (4)
# LED4 - 01000 (8)
# LED5 - 10000 (16)

# custom <id da instrução> <result> <dataA> <dataB>

# Nesta label a instrução customizada é chamada com os parâmetros dos registradores r0 e r3
# Nesse caso r0 indica ao lcd que está sendo enviado um comando e r3 equivale ao comando a ser executado

_start:

	addi r14, r0, 1 # coloca o valor 1 no registrador para ser usado posteriormente

	movia r5, 0x3030 # endereço de memórios dos botões
	movia r6, 0x3020 # endereço de memória das colunas
	movia r13, 0x2010 # endereço de memória das linhas

	movia r3, 0x30
	custom 0, r2, r0, r3
	custom 0, r2, r0, r3

	movia r3, 0x39
	custom 0, r2, r0, r3

	movia r3, 0x14
	custom 0, r2, r0, r3

	movia r3, 0x56
	custom 0, r2, r0, r3

	movia r3, 0x6D
	custom 0, r2, r0, r3

	movia r3, 0x70
	custom 0, r2, r0, r3

	movia r3, 0x0C
	custom 0, r2, r0, r3

	movia r3, 0x06
	custom 0, r2, r0, r3

	movia r3, 0x01
	custom 0, r2, r0, r3
	
	br led1
	

# Nesta label a instrução customizada está sendo chamada novamente: 
# r14 indica que está sendo enviado um dado e r3 é o dado a ser escrito no display

	
menu_lcd:

	movi r7, 31
	stbio r7, 0(r6) # Apaga todas as colunas

	movi r7, 255
	stbio r7, 0(r13) # Apaga todas as linhas

	movia r3, clear # Limpa o display
	custom 0, r2, r0, r3
	
	movia r3, L
	custom 0, r2, r14, r3

	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, D
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	custom 0, r2, r14, r4
	
	ret
	
led1:
	movia r4, Um
	
	call menu_lcd # atualiza o display
	
	nextpc r8 # pega o endereço da próxima instrução (para execução de um loop para observação dos botões)

	addi r10, r0, 0
	movia r7, 400000

	call delay #chama label delay 
	
	ldbuio r3, 0(r5) # carrega a situação dos botões

	addi r7, r0, 2
	beq r3, r7, frase_selection1 # se o valor dos botões for igual a 2 desvia para a label frase_selection1

	addi r7, r0, 4
	beq r3, r7, led2 # se o valor dos botões for igual a 4 desvia para a label led2 (rola pra baixo)
	
	addi r7, r0, 8
	beq r3, r7, led5 # se o valor dos botões for igual a 8 desvia para a label led5 (rola pra cima)
	
	callr r8 # desvia a execução para o endereço armazenado no registrador, neste caso 'addi r10, r0, 0'

delay: # esta label executa um contador para criar um delay na execução

	addi r10, r10, 1
	ble r10, r7, delay

	ret


led2:
	movia r4, Dois
	
	call menu_lcd
	
	nextpc r8

	addi r10, r0, 0
	movia r7, 400000

	call delay

	ldbuio r3, 0(r5) 
	
	addi r7, r0, 2
	beq r3, r7, frase_selection2
	
	addi r7, r0, 4
	beq r3, r7, led3 
	
	addi r7, r0, 8
	beq r3, r7, led1 
	
	callr r8
	
led3:
	movia r4, Tres
	
	call menu_lcd 
	
	nextpc r8

	addi r10, r0, 0
	movia r7, 400000

	call delay

	ldbuio r3, 0(r5) 

	addi r7, r0, 2
	beq r3, r7, frase_selection3
	
	addi r7, r0, 4
	beq r3, r7, led4 
	
	addi r7, r0, 8
	beq r3, r7, led2

	callr r8
	
led4:
	movia r4, Quatro
	
	call menu_lcd 
	
	nextpc r8

	addi r10, r0, 0
	movia r7, 400000

	call delay

	ldbuio r3, 0(r5) 

	addi r7, r0, 2
	beq r3, r7, frase_selection4

	addi r7, r0, 4
	beq r3, r7, led5 
	
	addi r7, r0, 8
	beq r3, r7, led3 
	
	callr r8

led5:
	movia r4, Cinco
	
	call menu_lcd 
	nextpc r8

	addi r10, r0, 0
	movia r7, 400000

	call delay

	ldbuio r3, 0(r5) 

	addi r7, r0, 2
	beq r3, r7, frase_selection5
	
	addi r7, r0, 4
	beq r3, r7, led1 
	
	addi r7, r0, 8
	beq r3, r7, led4 

	callr r8
	
frase_selection1:

	addi r7, r0, 30
	stbio r7, 0(r6) # colunas

	stbio r0, 0(r13) # linhas

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, Y
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, U
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, C
	custom 0, r2, r14, r3
	
	movia r3, H
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, L
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, D
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, Um
	custom 0, r2, r14, r3
	
	nextpc r8 #  guarda o endereço da instrução de leitura dos botões
	
	ldbuio r3, 0(r5) # verifica os botões
	
	beq r3, r14, led1 # nesse caso a única opção de escolha válida é a de voltar (0001), se for pressionado o botão correto a execução volta para a label led1
	
	callr r8 # se for pressionado um botão inválido o loop leva a execução de volta à instrução de leitura dos botões
	

frase_selection2:

	movi r7, 29
	stbio r7, 0(r6) # colunas

	stbio r0, 0(r13) # linhas

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, Y
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, U
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, C
	custom 0, r2, r14, r3
	
	movia r3, H
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, L
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, D
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, Dois
	custom 0, r2, r14, r3
	
	nextpc r8
	
	ldbuio r3, 0(r5)
	
	beq r3, r14, led2
	
	callr r8
	
	
frase_selection3:

	movi r7, 27
	stbio r7, 0(r6) # colunas

	stbio r0, 0(r13) # linhas

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, Y
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, U
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, C
	custom 0, r2, r14, r3
	
	movia r3, H
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, L
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, D
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, Tres
	custom 0, r2, r14, r3
	
	nextpc r8
	
	ldbuio r3, 0(r5)
	
	beq r3, r14, led3
	
	callr r8
	
	
frase_selection4:

	movi r7, 23
	stbio r7, 0(r6) # colunas

	stbio r0, 0(r13) # linhas

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, Y
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, U
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, C
	custom 0, r2, r14, r3
	
	movia r3, H
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, L
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, D
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, Quatro
	custom 0, r2, r14, r3
	
	nextpc r8
	
	ldbuio r3, 0(r5)
	
	beq r3, r14, led4
	
	callr r8
	
	
frase_selection5:

	movi r7, 15
	stbio r7, 0(r6) # colunas

	stbio r0, 0(r13) # linhas

	movia r3, clear
	custom 0, r2, r0, r3
	
	movia r3, Y
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, U
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, C
	custom 0, r2, r14, r3
	
	movia r3, H
	custom 0, r2, r14, r3
	
	movia r3, O
	custom 0, r2, r14, r3
	
	movia r3, S
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, L
	custom 0, r2, r14, r3
	
	movia r3, E
	custom 0, r2, r14, r3
	
	movia r3, D
	custom 0, r2, r14, r3
	
	movia r3, space
	custom 0, r2, r14, r3
	
	movia r3, Cinco
	custom 0, r2, r14, r3
	
	nextpc r8
	
	ldbuio r3, 0(r5)
	
	beq r3, r14, led5
	
	callr r8
	
