module P2
	( input [1:0] in
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
	
	nand (LW[0], w[3], in[0]);
	xor (LW[1], w[2], w[5]);
	xor (LW[2], in[0], w[0]);
	nor (LW[3], in[0], w[5]);
	xnor (LW[4], w[4], w[0]);
	xnor (LW[5], w[7], in[1]);
	xor (LW[6], in[1], w[4]);
	xnor (LW[7], w[4], in[0]);
	
	assign out = w[1];
	
endmodule