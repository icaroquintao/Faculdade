`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:59 01/13/2018 
// Design Name: 
// Module Name:    InstructionMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstructionMemory(
		read_address, 
		clock,
		instruction
    );
	 
	 input wire[31:0] read_address;
	 input wire clock;
	 output reg[31:0] instruction;


	reg [31:0] memdata [100:0];


	initial
     begin
				//  Formato de todas as instruçoes
				
				
				/*
						TESTE VALORES
					memdata[10] = 32'b00010011100111110000000000000011; //beq		---	beq	$28,$31,C			C = 1
					memdata[10] = 32'b00010010110111110000000000000011; //beq		---	beq	$22,$31,C			C = 1	
					memdata[10] = 32'b00010000111111110000000000000011; //beq		---	beq	$7,$31,C			C = 1	
					memdata[10] = 32'b00010011000111110000000000000011; //beq		---	beq	$24,$31,C			C = 1	
					memdata[10] = 32'b00010011010111110000000000000011; //beq		---	beq	$26,$31,C			C = 1	
					memdata[10] = 32'b00010011011111110000000000000011; //beq		---	beq	$27,$31,C			C = 1	
					memdata[10] = 32'b00010010111111110000000000000011; //beq		---	beq	$23,$31,C			C = 1		
				
				
						32	16	8	4	2	1

22 ->			10110

24 ->			11000

25 ->			11001

12 -> 		01100

14 ->			01110

28			11100		
		
			10110

26			11010

			1	1	0	1	1
				
				
				*/
				
		
				//INSTRUCOES  A SEREM EXECUTADAS
		
		
		
			memdata[0] = 32'b00000001100011101110000000101010; //slt		--- 	slt  $28, $12, $14
			
			memdata[1] = 32'b00000000000000011011000000100000; //add		---	add  $22 , $0, $1
				
			memdata[2] = 32'b10001100110001110000000000000001; //lw		---	lw	  $7,C($6) 			C = 0
		
			memdata[3] = 32'b00000000100001011100000000100101; //or		---	or 	$24,$4,$5
	
			memdata[4] = 32'b10101101000010010000000000000000; //sw		---	sw		$9,C($8)				C = 0
		
			memdata[5] = 32'b00100001010110100000000000001111; //addi	---	addi	$26,$10,C

			memdata[6] = 32'b00101001011110110000000000000011; //slti   ---	slti	$27,$11,C
		
			memdata[0] = 32'b00000000010000111011100000100100; //and		---	and	$23,$2,$3
		
			memdata[8] = 32'b00010001111100000000000000000001; //beq		---	beq	$15,$16,C			C = 1
			
			memdata[9] = 32'b00010101111100000000000000000001;//bne		---	bne	$15,$16,C			C = 1
		
		
		
							//PARA TESTE DOS VALORES SALVOS REGISTRADORES
		
			memdata[10] = 32'b00010010111111110000000000000011; //beq		---	beq	$23,$31,C			C = 1	
		
	
						// PARA TESTE DO SW
		
		
		//memdata[10] = 32'b10001101000001110000000000000000; //lw		---	lw	  $7,C($8) 			C = 0
		//memdata[11] = 32'b00010000111111110000000000000011; //beq		---	beq	$7,$31,C			C = 1	
		
			memdata[12] = 32'b00001000000000000000000001111111; //j		---	j	C						C = 127


     end

	always @(read_address)
		begin
			instruction = memdata[read_address];
      end

endmodule
