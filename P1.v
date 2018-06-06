module P1
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
	
	xnor (LW[0], w[0], w[2]);
	xor (LW[1], w[4], w[2]);
	xor (LW[2], w[1], w[4]);
	and (LW[3], in[0], w[5]);
	nand (LW[4], w[6], w[3]);
	nor (LW[5], w[3], in[0]);
	xnor (LW[6], in[1], w[1]);
	
	assign out = w[6];
	
endmodule