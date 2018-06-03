module MDL3
	( input [3:0] in
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
	
	and (LW[0], w[3], w[1]);
	or (LW[1], w[6], w[2]);
	nand (LW[2], in[3], w[4]);
	or (LW[3], in[3], w[0]);
	nand (LW[4], in[1], in[2]);
	xnor (LW[5], in[2], in[0]);
	nor (LW[6], w[5], in[2]);
	
	assign out = w[0];
	
endmodule