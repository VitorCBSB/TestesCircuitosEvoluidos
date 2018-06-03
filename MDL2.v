module MDL2
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
	
	and (LW[0], w[1], w[6]);
	xor (LW[1], w[4], w[5]);
	nor (LW[2], in[2], in[0]);
	and (LW[3], in[2], in[3]);
	nand (LW[4], w[2], in[3]);
	and (LW[5], w[7], w[3]);
	or (LW[6], in[3], w[0]);
	nand (LW[7], in[1], w[3]);
	
	assign out = w[0];
	
endmodule