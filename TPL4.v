module TPL4
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
	
	and (LW[0], w[1], w[7]);
	nor (LW[1], in[3], w[6]);
	nor (LW[2], in[3], in[3]);
	xnor (LW[3], w[7], w[6]);
	nor (LW[4], in[2], w[2]);
	or (LW[5], in[1], w[0]);
	and (LW[6], in[1], in[0]);
	or (LW[7], w[4], w[5]);
	
	assign out = w[3];
	
endmodule