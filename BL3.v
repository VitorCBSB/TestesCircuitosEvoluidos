module BL3
	( input [4:0] in
	, output out
	);
	
	parameter NUM_GATES = 11;
	
	wire [NUM_GATES - 1:0] LW;
	wire [NUM_GATES - 1:0] w;
	
	genvar i;
	generate for (i = 0; i < NUM_GATES; i++)
	begin : L
		LCELL lcell_inst
		   ( .in (LW[i])
			, .out (w[i])
			);
	end
	endgenerate
	
	xnor (LW[0], w[3], w[4]);
	nor (LW[1], w[3], w[9]);
	nor (LW[2], in[2], w[1]);
	nor (LW[3], in[3], in[1]);
	nand (LW[4], in[4], in[2]);
	nor (LW[5], w[8], w[10]);
	nor (LW[6], w[7], in[0]);
	nor (LW[7], w[0], w[6]);
	and (LW[8], w[2], w[1]);
	nor (LW[9], w[7], w[5]);
	or (LW[10], w[9], in[0]);
	
	assign out = w[9];
	
endmodule