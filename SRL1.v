module SRL1
	( input [1:0] in
	, output out
	);
	
	parameter NUM_GATES = 2;
	
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
	
	nor (LW[0], in[0], w[1]);
	nor (LW[1], in[1], w[0]);
	
	assign out = w[1];
	
endmodule