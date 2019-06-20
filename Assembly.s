.data

.global_start

#.equ <nome> <valor hex>
#Este bloco armazena os valores, em hexadecimal, correspondentes ao que deve ser printado no display 

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


.equ clear, 0x01
.equ home, 0x02


.equ space, 0xA0

addi r1, r0, 1

movia r5, 0x2020 #buttons
movia r6, 0x2030 #leds


.text

#r1 contêm o valor 1 (um)
#r2 guarda recebe os resultados da intrução customizada do lcd
#r3 guarda valores temporários 
#r4 guarda os números das leds a serem alterados no display (de acordo com a rolagem do menu) [
#r5 guarda o endereço de memória dos  botões
#r6 guarda o endereço de memória das leds

#custom <id da instrução> <result> <dataA> <dataB>


#Nesta label a instrução customizada é chamada com os parâmetros dos registradores r0 e r1
#Nesse caso r0 indica ao lcd que está sendo enviado um comando e r1 é o comando a ser executado

init_lcd:

	movia r3, 0x30
	custom 0 r2, r0, r3
	custom 0 r2, r0, r3

	movia r3, 0x39
	custom 0 r2, r0, r3

	movia r3, 0x14
	custom 0 r2, r0, r3

	movia r3, 0x56
	custom 0 r2, r0, r3

	movia r3, 0x6D
	custom 0 r2, r0, r3

	movia r3, 0x70
	custom 0 r2, r0, r3

	movia r3, 0x0C
	custom 0 r2, r0, r3

	movia r3, 0x06
	custom 0 r2, r0, r3

	movia r3, 0x01
	custom 0 r2, r0, r3
	

#Nesta label a instrução customizada está sendo chamada novamente: 
#r3 indica que está sendo enviado um dado e r1 é o dado a ser escrito no display
	
menu_lcd:

	stbio r0, 0(r6)

	movia r3, clear
	custom 0 r2, r0, r3

	movia r3, home
	custom 0 r2, r0, r3
	
	movia r3, L
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, D
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	br led1
	
led1:
	movia r4, Um
	custom 0 r2, r1, r4 
	
	
	stbio r1, 0(r6) #Acende LED1
	call frase_selection1 
	
	
led2:
	movia r4, Dois
	custom 0 r2, r1, r4 
	
	movi r3, 2
	stbio r3, 0(r6)
	frase_selection2
	
led3:
	movia r4, Tres
	custom 0 r2, r1, r4 
	
	movi r3, 4
	stbio r3, 0(r6)
	frase_selection3
	
led4:
	movia r4, Quatro
	custom 0 r2, r1, r4 
	
	movi r3, 8
	stbio r3, 0(r6)
	frase_selection4

led5:
	movia r4, Cinco
	custom 0 r2, r1, r4 
	
	movi r3, 16
	stbio r3, 0(r6)
	frase_selection5
	
frase_selection1:

	movia r3, clear
	custom 0 r2, r0, r3
	
	movia r3, home
	custom 0 r2, r0, r3
	
	movia r3, Y
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, U
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, C
	custom 0 r2, r1, r3
	
	movia r3, H
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, S
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, L
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, D
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, Um
	custom 0 r2, r1, r3
	
	

frase_selection2:

	movia r3, clear
	custom 0 r2, r0, r3
	
	movia r3, home
	custom 0 r2, r0, r3
	
	movia r3, Y
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, U
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, C
	custom 0 r2, r1, r3
	
	movia r3, H
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, S
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, L
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, D
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, Dois
	custom 0 r2, r1, r3
	
frase_selection3:

	movia r3, clear
	custom 0 r2, r0, r3
	
	movia r3, home
	custom 0 r2, r0, r3
	
	movia r3, Y
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, U
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, C
	custom 0 r2, r1, r3
	
	movia r3, H
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, S
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, L
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, D
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, Tres
	custom 0 r2, r1, r3
	
frase_selection4:

	movia r3, clear
	custom 0 r2, r0, r3
	
	movia r3, home
	custom 0 r2, r0, r3
	
	movia r3, Y
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, U
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, C
	custom 0 r2, r1, r3
	
	movia r3, H
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, S
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, L
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, D
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, Quatro
	custom 0 r2, r1, r3
	
frase_selection5:

	movia r3, clear
	custom 0 r2, r0, r3
	
	movia r3, home
	custom 0 r2, r0, r3
	
	movia r3, Y
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, U
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, C
	custom 0 r2, r1, r3
	
	movia r3, H
	custom 0 r2, r1, r3
	
	movia r3, O
	custom 0 r2, r1, r3
	
	movia r3, S
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, L
	custom 0 r2, r1, r3
	
	movia r3, E
	custom 0 r2, r1, r3
	
	movia r3, D
	custom 0 r2, r1, r3
	
	movia r3, space
	custom 0 r2, r1, r3
	
	movia r3, Cinco
	custom 0 r2, r1, r3
