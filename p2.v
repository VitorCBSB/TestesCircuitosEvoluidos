module P2
	( input [1:0] in
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
	
	nor (LW[0], w[3], w[4]);
	nor (LW[1], w[4], in[0]);
	and (LW[2], w[4], in[1]);
	nor (LW[3], w[2], w[0]);
	and (LW[4], in[0], w[1]);
	xnor (LW[5], w[3], in[1]);
	
	assign out = w[5];
	
endmodule