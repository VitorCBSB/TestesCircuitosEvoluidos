module BL4
	( input [4:0] in
	, output out
	);
	
	parameter NUM_GATES = 8;
	
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
	
	nor (LW[0], w[6], w[1]);
	xnor (LW[1], w[4], w[7]);
	xor (LW[2], w[6], w[3]);
	or (LW[3], in[1], in[3]);
	nand (LW[4], w[7], w[7]);
	nand (LW[5], in[2], in[4]);
	nor (LW[6], w[0], in[0]);
	xor (LW[7], w[5], w[2]);
	
	assign out = w[7];
	
endmodule