module XOR1
	( input [2:0] in
	, output out
	);
	
	parameter NUM_GATES = 5;
	
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
	
	xor (LW[0], w[2], w[3]);
	nor (LW[1], w[0], w[4]);
	xor (LW[2], in[1], in[0]);
	xor (LW[3], w[4], w[2]);
	nor (LW[4], in[2], w[1]);
	
	assign out = w[3];
	
endmodule