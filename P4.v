module P4
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
	
	nor (LW[0], w[3], w[4]);
	nand (LW[1], w[2], w[3]);
	nor (LW[2], w[0], w[7]);
	nand (LW[3], in[0], w[4]);
	nor (LW[4], in[0], w[1]);
	xnor (LW[5], w[3], w[6]);
	and (LW[6], w[3], w[5]);
	xor (LW[7], in[1], w[6]);
	
	assign out = w[2];
	
endmodule