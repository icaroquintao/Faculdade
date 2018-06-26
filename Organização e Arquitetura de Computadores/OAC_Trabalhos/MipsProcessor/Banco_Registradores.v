`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:59 01/13/2018 
// Design Name: 
// Module Name:    Banco_Registradores 
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
module Banco_Registradores(
		regWrite,
		read_register_1,
		read_register_2,
		write_register,
		write_data,
		read_data_1,
		read_data_2
	);

	input 			regWrite;
	input[4:0]		read_register_1;
	input[4:0]	 	read_register_2;
	input[4:0]	 	write_register;
	input[31:0] 	write_data;
	output[31:0]	read_data_1;
	output[31:0]	read_data_2;

	// OS 32 REGISTRADORES SERAO INICIALIZADOS COM VALORES ALEATORIOS

reg [31:0] registradores [31:0];
initial 
	begin
		  registradores[0] = 32'b00000000000000000000000000000011;		// VALOR ->  1	
        registradores[1] = 32'b00000000000000000000000000000101;		// VALOR ->  1
        registradores[2] = 32'b00000000000000000000000000000011;		//	VALOR ->  3
        registradores[3] = 32'b00000000000000000000000000000010;		// VALOR ->  2
        registradores[4] = 32'b00000000000000000000000000000110;		//	VALOR ->  2
        registradores[5] = 32'b00000000000000000000000000010111;		// VALOR ->  1
        registradores[6] = 32'b00000000000000000000000000000010;		//	VALOR ->  2	
        registradores[7] = 32'b00000000000000000000000000000011;		// VALOR ->  3
        registradores[8] = 32'b00000000000000000000000000000111;		//	VALOR ->  7
        registradores[9] = 32'b00000000000000000000000000000001;		// VALOR ->  0
        registradores[10] = 32'b00000000000000000000000000000010;		//	VALOR ->  2
        registradores[11] = 32'b00000000000000000000000000001000;		// VALOR ->  8
        registradores[12] = 32'b00000000000000000000000000000010;		//	VALOR ->  2
        registradores[13] = 32'b00000000000000000000000000000111;		// VALOR ->  7
        registradores[14] = 32'b00000000000000000000000000001111;		//	VALOR ->  15
        registradores[15] = 32'b00000000000000000000000000000000;		// VALOR ->  0
        registradores[16] = 32'b00000000000000000000000000000000;		//	VALOR ->  1
        registradores[17] = 32'b00000000000000000000000000010000;		//VALOR ->  16
        registradores[18] = 32'b00000000000000000000000010100000;		//VALOR ->  
        registradores[19] = 32'b00000000000000000000000001000000;		//VALOR ->  
        registradores[20] = 32'b00000000000000000000000101000000;		//VALOR ->  
        registradores[21] = 32'b00000000000000000000000000000000;		//VALOR ->  
        registradores[22] = 32'b00000000000000000000000000000000;		//
        registradores[23] = 32'b00000000000000000000000000000000;		//
        registradores[24] = 32'b00000000000000000000000000000000;		//
        registradores[25] = 32'b00000000000000001100100000000000;		//
        registradores[26] = 32'b00000000000000000000001000000000;		//
        registradores[27] = 32'b00000000000000000000000000000000;		//
        registradores[28] = 32'b00000000000000000000000000000000;		//
        registradores[29] = 32'b00000000000000000000000000000000;		//
        registradores[30] = 32'b00000000000000000000000000000000;		//
        registradores[31] = 32'b00000000000000000000000000111111;		//

	end

		// A SAIDA SERA O VALOR CONTIDO NO BANCO DE REGISTRADORES NA POSICAO DO REGISTRADOR DESEJADO
		
	assign read_data_1 = registradores[read_register_1];
	assign read_data_2 = registradores[read_register_2];


	always @ (regWrite or
		read_register_1 or
		read_register_2 or
		write_register  or
		write_data or
		read_data_1 or
		read_data_2)
		
		begin
			if (regWrite == 1'b1)
				begin
					registradores[write_register] <= write_data;
				end
		end
	
endmodule
