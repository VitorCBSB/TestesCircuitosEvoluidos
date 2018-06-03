module XOR3
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
	
	nor (LW[0], w[4], w[2]);
	xnor (LW[1], in[1], in[0]);
	and (LW[2], w[3], w[1]);
	or (LW[3], in[2], w[2]);
	nor (LW[4], w[0], in[2]);
	
	assign out = w[0];
	
endmodule