module TPL1
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
	
	and (LW[0], in[2], in[3]);
	nor (LW[1], in[1], w[4]);
	nor (LW[2], w[7], w[3]);
	nor (LW[3], w[5], w[6]);
	nor (LW[4], w[2], w[0]);
	nor (LW[5], in[3], w[4]);
	or (LW[6], in[1], w[0]);
	nor (LW[7], w[1], in[0]);
	
	assign out = w[2];
	
endmodule