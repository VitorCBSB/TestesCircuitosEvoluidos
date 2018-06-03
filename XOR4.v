module XOR4
	( input [2:0] in
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
	
	nor (LW[0], in[2], w[3]);
	xnor (LW[1], in[0], in[1]);
	nor (LW[2], w[5], w[4]);
	nor (LW[3], w[2], w[0]);
	nand (LW[4], in[2], w[1]);
	nor (LW[5], w[0], in[2]);
	
	assign out = w[3];
	
endmodule