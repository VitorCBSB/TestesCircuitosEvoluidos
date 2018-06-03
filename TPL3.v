module TPL3
	( input [3:0] in
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
	
	and (LW[0], in[3], in[2]);
	nor (LW[1], w[5], w[2]);
	nand (LW[2], w[3], w[6]);
	or (LW[3], w[4], w[0]);
	xor (LW[4], w[1], w[7]);
	xor (LW[5], in[1], in[3]);
	or (LW[6], w[3], w[3]);
	and (LW[7], in[1], in[0]);
	
	assign out = w[3];
	
endmodule