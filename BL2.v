module BL2
	( input [4:0] in
	, output out
	);
	
	parameter NUM_GATES = 10;
	
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
	
	and (LW[0], w[2], w[2]);
	xnor (LW[1], w[3], w[8]);
	and (LW[2], in[2], in[4]);
	nor (LW[3], in[3], in[1]);
	nor (LW[4], w[9], in[0]);
	or (LW[5], w[0], w[4]);
	xor (LW[6], w[0], w[4]);
	xor (LW[7], w[6], w[3]);
	xnor (LW[8], w[7], w[6]);
	nor (LW[9], w[1], w[4]);
	
	assign out = w[7];
	
endmodule