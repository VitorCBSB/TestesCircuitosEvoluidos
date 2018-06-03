module FFD4
	( input [1:0] in
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
	
	nand (LW[0], w[3], w[2]);
	and (LW[1], w[3], w[4]);
	or (LW[2], in[1], in[0]);
	nand (LW[3], w[0], in[0]);
	or (LW[4], w[1], in[0]);
	
	assign out = w[1];
	
endmodule