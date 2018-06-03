module JK4
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
	
	nor (LW[0], w[6], in[0]);
	and (LW[1], w[3], in[1]);
	or (LW[2], w[0], w[1]);
	and (LW[3], w[2], w[5]);
	or (LW[4], w[6], w[0]);
	or (LW[5], w[6], in[0]);
	nor (LW[6], w[0], in[1]);
	nor (LW[7], w[3], w[6]);
	
	assign out = w[7];
	
endmodule