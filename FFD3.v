module FFD3
	( input [1:0] in
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
	
	or (LW[0], w[4], w[3]);
	nor (LW[1], w[1], w[5]);
	and (LW[2], w[0], w[3]);
	xor (LW[3], w[5], in[0]);
	and (LW[4], in[0], in[1]);
	xor (LW[5], w[2], in[0]);
	
	assign out = w[2];
	
endmodule