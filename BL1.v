module BL1
	( input [4:0] in
	, output out
	);
	
	parameter NUM_GATES = 9;
	
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
	
	nor (LW[0], w[2], w[4]);
	and (LW[1], in[4], w[7]);
	xor (LW[2], w[5], w[4]);
	xnor (LW[3], w[1], w[8]);
	nor (LW[4], in[0], w[0]);
	xor (LW[5], w[3], w[3]);
	nor (LW[6], in[1], in[3]);
	and (LW[7], in[2], in[2]);
	xnor (LW[8], w[4], w[6]);
	
	assign out = w[3];
	
endmodule