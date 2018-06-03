module D3
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
	
	nor (LW[0], in[0], in[1]);
	or (LW[1], w[0], in[1]);
	or (LW[2], w[3], in[0]);
	and (LW[3], w[1], w[2]);
	
	assign out = w[3];
	
endmodule