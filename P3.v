module P3
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
	
	xnor (LW[0], w[0], w[5]);
	nor (LW[1], in[0], w[5]);
	xnor (LW[2], w[1], w[3]);
	xor (LW[3], in[1], w[0]);
	and (LW[4], w[0], w[0]);
	nand (LW[5], w[6], in[0]);
	nor (LW[6], w[3], in[0]);
	
	assign out = w[2];
	
endmodule