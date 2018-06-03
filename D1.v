module D1
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
	
	nor (LW[0], w[3], w[2]);
	nand (LW[1], in[0], in[0]);
	nor (LW[2], w[0], in[0]);
	nor (LW[3], w[1], in[1]);
	
	assign out = w[0];
	
endmodule