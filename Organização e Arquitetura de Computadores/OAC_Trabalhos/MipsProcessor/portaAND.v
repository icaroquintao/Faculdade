`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:48:41 01/26/2018 
// Design Name: 
// Module Name:    portaAND 
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
module portaAND(
	branch,
	branch_ne,
	zero, 
	zero_bne,
	resultado);

	input wire branch;
	input wire branch_ne;
	input wire zero;
	input wire zero_bne;
	output reg resultado;

	always @(branch or zero or zero_bne)
		begin
		
		// 
		
			// bne
			if (branch_ne == 1)begin
				if (zero_bne == 1) begin
						resultado <=zero_bne & branch_ne;	
				end
				else if (zero_bne == 0)begin
						resultado <=0;	
				end
		
			end
			
			if (branch_ne == 0) begin
			
					if (zero == 0) begin
						resultado <=0;	
					end
			
					if (zero == 1)begin
						resultado <=branch & zero;	
					end
			end
		
		end
	
endmodule
