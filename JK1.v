module JK1
	( input [1:0] in
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
	
	and (LW[0], in[0], in[1]);
	or (LW[1], w[2], w[2]);
	nor (LW[2], w[4], in[1]);
	xnor (LW[3], in[0], w[5]);
	nor (LW[4], in[0], w[1]);
	and (LW[5], w[3], w[0]);
	nor (LW[6], w[1], w[5]);
	
	assign out = w[6];
	
endmodule