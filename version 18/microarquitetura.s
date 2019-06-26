.data
	led1: .asciz "LED1"
	led2: .asciz "LED2"
	led3: .asciz "LED3"
	led4: .asciz "LED4"
	led5: .asciz "LED5"
.text

.global main

main:
	addi r1, r0, 1     #Coloca 1 no registrador r1
	addi r2, r0, 2     #Colocaca 2 no reg r2
	movia r3, 0x850    #Coloca o endereço dos dipswitches no reg r3 
	movia r5, 0x810    #Coloca o endereço das LEDs no reg r5
	
label1:
	stbio r0, 0(r5)    #Põe 0 em todas na saída dos LEDs (apaga todas)
			           #print menu led1
	ldbuio r4 , 0(r3)  #Lê o valor dos switchs e armazena em r4
	beq r4, r1, label2 #Se o valor de r4 for igual a 1 significa que deve exibir a próxima opção do menu
			           #Se não for igual a 1, supostamente deve se acender o LED 1
	bne r4, r2, label1 #Se o valor de r4 não for igual a dois o valor inserido no switch é inválido, então volta ao início do loop
			           #Se o valor de r4 for igual a 2 significa que deve acender o LED 1
	stbio r1, 0(r5)    #Põe 1 na saída do LED (acende a primeiro LED)
	br label1 	       #Ao concluir a operação, a execução volta para o início

label2:
			           #print menu led2
	ldbuio r4 , 0(r3) 
	beq r4, r1, label3
	
	bne r4, r2, label2 
	stbio r2, 0(r5)
	br label1

label3:
			           #print menu led1
	ldbuio r4 , 0(r3)
	beq r4, r1, label4
	
	bne r4, r2, label3 
	addi r6, r0, 4
	stbio r6, 0(r5)
	br label1

label4:
			            #print menu led1
	ldbuio r4 , 0(r3)
	beq r4, r1, label5
	
	bne r4, r2, label4 
	addi r6, r0, 8
	stbio r6, 0(r5)
	br label1

label5:
			            #print menu led1
	ldbuio r4 , 0(r3)
	beq r4, r1, label1
	
	bne r4, r2, label5 
	addi r6, r0, 15
	stbio r6, 0(r5)
	br label1
	
	
	
