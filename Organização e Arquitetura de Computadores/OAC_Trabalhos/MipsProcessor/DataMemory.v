`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:45 01/13/2018 
// Design Name: 
// Module Name:    DataMemory 
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

// SIMULA OM DISCO RIGIDO

module DataMemory(
    memWrite,
	 Address,
	 write_data,
	 memRead,
	 read_data
	 );
	 
	 input wire 		memWrite;
	 input wire[31:0] Address;
	 input wire[31:0] write_data;
	 input wire			memRead;
	 output reg[31:0]	read_data;
	 
	 
	 reg [31:0] data_memory [20:0];
	 
	 
	 /*
	 // cast para int, 
	integer endereco;
		always@(Address)
			begin
				endereco = Address;
			end*/


	initial begin

        // coloca alguns valores aleatorios, na simulaçao do disco

		  data_memory[0] = 32'b00000000000000000000000000000010;
        data_memory[1] = 32'b00000000000000000000000000000000;
        data_memory[2] = 32'b00000000000000000000000000001000;
        data_memory[3] = 32'b00000000000000000000000000000110;
        data_memory[4] = 32'b00000000000000000000000000000000;
        data_memory[5] = 32'b00000000000000000000000000000000;
        data_memory[6] = 32'b00000000000000000000000000000000;
        data_memory[7] = 32'b00000000000000000000000000000011;
        data_memory[8] = 32'b00000000000000000000000000000000;
        data_memory[9] = 32'b00000000000000000000000000000000;
        data_memory[10] = 32'b00000000000000000000000000000000;
	end
	
	
	always @( memWrite or memRead or Address)
		begin
			if ( memRead == 1'b1)
				begin
					read_data <= data_memory[Address];
				end
			
			if (memWrite == 1'b1)
				begin
					data_memory[Address] <= write_data;
				end
		end
endmodule
