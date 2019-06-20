.data

.global_start

//.equ <nome> <valor hex>
//Este bloco armazena os valores, em hexadecimal, correspondentes ao que deve ser printado no display 

.equ L, 0x4C
.equ E, 0x45
.equ D, 0x44
.equ Um, 0x31
.equ Dois, 0x32
.equ Tres, 0x33
.equ Quatro, 0x34
.equ Cinco, 0x35
.equ space, 0xA0

movia r3, 1

.text

//r1 guarda valores temporários a serem passados para a instrução customizada do lcd
//r2 guarda recebe os resultados da intrução customizada do lcd
//r3 contêm o valor 1 (um) 

//custom <id da instrução> <result> <dataA> <dataB>


//Nesta label a instrução customizada é chamada com os parâmetros dos registradores r0 e r1
//Nesse caso r0 indica ao lcd que está sendo enviado um comando e r1 é o comando a ser executado

init_lcd:

	movia r1, 0x30
	custom 0 r2, r0, r1
	custom 0 r2, r0, r1

	movia r1, 0x39
	custom 0 r2, r0, r1

	movia r1, 0x14
	custom 0 r2, r0, r1

	movia r1, 0x56
	custom 0 r2, r0, r1

	movia r1, 0x6D
	custom 0 r2, r0, r1

	movia r1, 0x70
	custom 0 r2, r0, r1

	movia r1, 0x0C
	custom 0 r2, r0, r1

	movia r1, 0x06
	custom 0 r2, r0, r1

	movia r1, 0x01
	custom 0 r2, r0, r1
	

//Nesta label a instrução customizada está sendo chamada novamente: 
//r3 indica que está sendo enviado um dado e r1 é o dado a ser escrito no display
	
menu_lcd:
	
	movia r1, L
	custom 0 r2, r3, r1
	
	movia r1, E
	custom 0 r2, r3, r1
	
	movia r1, D
	custom 0 r2, r3, r1
	
	movia r1, space
	custom 0 r2, r3, r1
	
	br led1
	
led1:
	movia r4, Um
	custom 0 r2, r3, r4 
	
	
led2:
	movia r4, Dois
	custom 0 r2, r3, r4 
	
led3:
	movia r4, Tres
	custom 0 r2, r3, r4 
	
led4:
	movia r4, Quatro
	custom 0 r2, r3, r4 

led5:
	movia r4, Cinco
	custom 0 r2, r3, r4 