module D2
	( input [1:0] in
	, output out
	);
	
	parameter NUM_GATES = 4;
	
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
	
	nor (LW[0], w[3], in[1]);
	and (LW[1], w[0], in[0]);
	nor (LW[2], w[1], w[3]);
	nor (LW[3], in[0], w[2]);
	
	assign out = w[2];
	
endmodule