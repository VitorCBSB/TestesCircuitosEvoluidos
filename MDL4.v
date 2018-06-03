module MDL4
	( input [3:0] in
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
	
	xnor (LW[0], w[5], w[2]);
	nor (LW[1], w[3], in[1]);
	and (LW[2], w[4], w[6]);
	nand (LW[3], in[2], w[5]);
	nor (LW[4], w[1], w[0]);
	and (LW[5], in[3], w[7]);
	nor (LW[6], in[3], w[1]);
	or (LW[7], in[2], in[0]);
	
	assign out = w[4];
	
endmodule