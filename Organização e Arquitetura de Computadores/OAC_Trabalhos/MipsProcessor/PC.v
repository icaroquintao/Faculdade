`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:28 01/13/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(
	clock,
	new_pc,
	out
    );

	input wire clock;
	input wire[31:0] new_pc;
	
	output wire[31:0] out;
	
	// para o  valor inicial
	reg [31:0] pc;
	
	initial 
		begin 
			pc = 0;
		end	
		
		
	always @ (posedge clock)
		begin
			pc = new_pc;
		end
	assign out = pc;

endmodule
