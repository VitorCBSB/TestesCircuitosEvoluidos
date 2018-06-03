module top
	( input [9:0] SW
	, input [3:0] KEY
	, output [9:0] LEDR
	, output [6:0] HEX0
	, output [6:0] HEX1
	);
	
	wire [31:0] outs;
	wire [4:0] outputSel = SW[9:5];
	
	assign LEDR[0] = outs[outputSel];
	
	SRL1 sr (SW, outs[0]);
	D1 d1 (SW, outs[1]);
	D2 d2 (SW, outs[2]);
	D3 d3 (SW, outs[3]);
	D4 d4 (SW, outs[4]);
	XOR1 x1 (SW, outs[5]);
	XOR2 x2 (SW, outs[6]);
	XOR3 x3 (SW, outs[7]);
	XOR4 x4 (SW, outs[8]);
	JK1 jk1 (SW, outs[9]);
	JK2 jk2 (SW, outs[10]);
	JK3 jk3 (SW, outs[11]);
	JK4 jk4 (SW, outs[12]);
	TPL1 tpl1 (SW, outs[13]);
	TPL2 tpl2 (SW, outs[14]);
	TPL3 tpl3 (SW, outs[15]);
	TPL4 tpl4 (SW, outs[16]);
	MDL1 mdl1 (SW, outs[17]);
	MDL2 mdl2 (SW, outs[18]);
	MDL3 mdl3 (SW, outs[19]);
	MDL4 mdl4 (SW, outs[20]);
	BL1 bl1 (SW, outs[21]);
	BL2 bl2 (SW, outs[22]);
	BL3 bl3 (SW, outs[23]);
	BL4 bl4 (SW, outs[24]);
	FFD1 ffd1 (SW, outs[25]);
	FFD2 ffd2 (SW, outs[26]);
	FFD3 ffd3 (SW, outs[27]);
	FFD4 ffd4 (SW, outs[28]);
	
	wire [3:0] ones;
	wire [3:0] tens;
	
binaryToBCD btbcd
	( .A(outputSel)
	, .ONES(ones)
	, .TENS(tens)
	);
	
Decoder7 decOnes
	( .In(ones)
	, .Out(HEX0)
	);
	
Decoder7 decTens
	( .In(tens)
	, .Out(HEX1)
	);

endmodule