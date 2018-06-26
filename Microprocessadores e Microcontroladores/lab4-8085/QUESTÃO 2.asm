# ORG 2000 H
# BEGIN 2000 H
	   MVI A,AA
	   LXI B,2050
	   STAX B
	   INX B

	   MVI A,23
	   STAX B
	   INX B

	   MVI A,BC
	   STAX B
	   INX B

	   MVI A,05
	   STAX B
	   INX B

	   MVI A,12
	   STAX B
	   INX B

	   MVI A,43
	   STAX B
                           LXI B, 2050
	
	   MOV A,C
	   MVI D,20
	   MVI E,70

SOMAREGISTRADOR:	   MOV H,B
	   MOV L,C
	   INR L
	   MOV A,C
	   CMP L
	   JZ FIM
	   LDAX B
	   JNZ COMPARA

COMPARA2:	   MOV H,B
	   MOV L,C
	   DCR L
	   LDAX B
	   CMP M
	   JPO COMPARA2
	   JPE ORDEM

COMPARA:	   CMP M
	   JNC TROCA
	   INR L
	   JPO COMPARA
	   JPE ORDEM

TROCA:	   MOV B,H
	   MOV C,L
	   INR L
	   JNZ COMPARA

ORDEM:	   LDAX B
	   STAX D
	   INR E
	   MVI A,AA
	   STAX B
	   MOV B,D
	   MVI A,75
	   SUB E
	   ADI 50
	   MOV C,A
	   JNZ COMPARA

FIM:	   HLT
