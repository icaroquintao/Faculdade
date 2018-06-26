`timescale 1ns / 1ps

module porta_AND(
	branch, 
	zero, 
	zero_bne,
	resultado);

	input wire branch;
	input wire zero;
	input wire zero_bne;
	output reg resultado;
/*
always @ (branch or zero)
	begin*/
	always @(branch or zero or zero_bne) begin
	
		if (zero == 1)begin
			assign resultado = (branch & zero);end
		
		if (zero == 0) begin 
			assign resultado = 0; end
		
		if (zero_bne == 1) begin
			assign resultado = (branch & zero_bne);end
			
		if (zero_bne == 0) begin
			assign resultado = 0; end		
	end
	//end

endmodule


