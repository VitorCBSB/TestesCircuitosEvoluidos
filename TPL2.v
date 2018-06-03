module TPL2
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
	
	nand (LW[0], w[7], in[2]);
	nor (LW[1], w[2], w[3]);
	and (LW[2], w[6], w[0]);
	nor (LW[3], w[7], in[0]);
	nor (LW[4], in[3], w[1]);
	nor (LW[5], in[3], w[4]);
	nor (LW[6], in[1], w[5]);
	nor (LW[7], w[4], in[1]);
	
	assign out = w[1];
	
endmodule