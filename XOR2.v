module XOR2
	( input [2:0] in
	, output out
	);
	
	parameter NUM_GATES = 6;
	
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
	
	or (LW[0], w[5], w[5]);
	xnor (LW[1], w[2], w[0]);
	nand (LW[2], w[3], w[3]);
	xor (LW[3], in[1], in[0]);
	xnor (LW[4], w[1], w[3]);
	nor (LW[5], in[2], w[4]);
	
	assign out = w[1];
	
endmodule