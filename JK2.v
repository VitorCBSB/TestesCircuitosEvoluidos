module JK2
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
	
	nor (LW[0], w[2], w[5]);
	nor (LW[1], w[3], w[4]);
	nor (LW[2], w[4], w[0]);
	nor (LW[3], w[0], w[5]);
	nor (LW[4], w[5], in[1]);
	nor (LW[5], in[0], w[4]);
	
	assign out = w[1];
	
endmodule