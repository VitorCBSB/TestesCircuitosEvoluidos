module FFD2
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
	
	xor (LW[0], w[5], w[3]);
	nor (LW[1], in[0], in[0]);
	and (LW[2], w[5], w[4]);
	and (LW[3], w[4], w[0]);
	or (LW[4], w[0], in[1]);
	and (LW[5], w[1], in[0]);
	
	assign out = w[0];
	
endmodule