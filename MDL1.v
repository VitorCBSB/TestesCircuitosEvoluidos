module MDL1
	( input [3:0] in
	, output out
	);
	
	parameter NUM_GATES = 7;
	
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
	
	and (LW[0], w[4], in[3]);
	nor (LW[1], in[3], w[2]);
	xnor (LW[2], w[1], w[0]);
	xnor (LW[3], in[1], in[0]);
	xnor (LW[4], in[1], w[5]);
	nor (LW[5], in[2], w[3]);
	nor (LW[6], w[0], w[0]);
	
	assign out = w[2];
	
endmodule