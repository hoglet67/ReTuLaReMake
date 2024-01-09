//    ---------------------------- Atmel ATF15xx Timing Simulation Library-----------------------------------
//   |Version:                     1.0.3                                                                     |
//   |Last revision date:          01/23/2007                                                                |
//   |Revised by:                  skoutsomitsos                                                             |
//   |                                                                                                       |
//   |Changelog:         1.0.1    -12/19/2006 by skoutsomitsos| New functional models for DFFEARS/TFFEARS    |
//   |                            -12/19/2006 by skoutsomitsos| Corrected timescale and timing values        |                                                          |
//   |                                                          decimals to 1ps                              |
//   |                   1.0.2    -01/12/2007 by ewan         | Set initial state of DFFEARS/TFFEARS to 0    |
//   |                   1.0.3    -01/23/2007 by ewan         | Modified the defined initial state of DFF/TFF|
//    ------------------------------------------------------------------------------------------------------


`timescale 1ns / 1ps

/////////////////////////////////////////////////

module BUF (Q,A);
        output Q;
        input  A;

        buf I1 (Q, A);

 specify
		specparam allZeros = 0:0:0;
                (A +=> Q) = ( allZeros,allZeros);
        endspecify
endmodule // ibuf

/////////////////////////////////////////////////


module INV (QN, A);
	input 	A;
	output 	QN;

not fig1115 ( QN, A );

specify //Path definitions
	(A => QN ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A$QN	= 0.000:0.000:0.000;
	specparam rise$A$QN	= 0.000:0.000:0.000;
	specparam load$A	= 1.0;
endspecify
endmodule


////////////////////////////////////////////////

module AND1 (Q, A1);
	input 	A1;
	output 	Q;

buf fig1000 ( Q, A1 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
endspecify
endmodule

////////////////////////////////////////////////
module AND2 (Q, A1, A2);
	input 	A1;
	input 	A2;
	output 	Q;

and fig1000 ( Q, A1, A2 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
endspecify
endmodule


//////////////////////////////////////////////////

module AND3 (Q, A1, A2, A3);
	input 	A1;
	input 	A2;
	input 	A3;
	output 	Q;

and fig1211 ( Q, A1, A2, A3);

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND4 (Q, A1, A2, A3, A4);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////

module AND5 (Q, A1, A2, A3, A4, A5);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND6 (Q, A1, A2, A3, A4, A5, A6);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5, A6 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////

module AND7 (Q, A1, A2, A3, A4, A5, A6, A7 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5, A6, A7 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND8 (Q, A1, A2, A3, A4, A5, A6, A7, A8);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input  	A7;
	input   A8;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5, A6, A7, A8 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////


module AND9 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5, A6, A7, A8, A9);

specify //Path definitions
	(A1=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8=> Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND10 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND11 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////

module AND12 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND13 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND14 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND15 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND16 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND17 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND18 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
endspecify
endmodule

////////////////////////////////////////////////

module AND19 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND20 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
endspecify
endmodule
///////////////////////////////////////////////

module AND21 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND22 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND23 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////


module AND24 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////


module AND25 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND26 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////

module AND27 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
endspecify
endmodule


//////////////////////////////////////////////

module AND28 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND29 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////


module AND30 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////

module AND31 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////


module AND32 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////

module AND33 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;

endspecify
endmodule

////////////////////////////////////////////////


module AND34 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////

module AND35 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;
	input   A35;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A35 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam fall$A35$Q	= 0.000:0.000:0.000;
	specparam rise$A35$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;
	specparam load$A35	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////

module AND36 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;
	input   A35;
	input   A36;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A35 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A36 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam fall$A35$Q	= 0.000:0.000:0.000;
	specparam rise$A35$Q	= 0.000:0.000:0.000;
	specparam fall$A36$Q	= 0.000:0.000:0.000;
	specparam rise$A36$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;
	specparam load$A35	= 1.0;
	specparam load$A36	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////

module AND37 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;
	input   A35;
	input   A36;
	input   A37;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A35 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A36 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A37 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam fall$A35$Q	= 0.000:0.000:0.000;
	specparam rise$A35$Q	= 0.000:0.000:0.000;
	specparam fall$A36$Q	= 0.000:0.000:0.000;
	specparam rise$A36$Q	= 0.000:0.000:0.000;
	specparam fall$A37$Q	= 0.000:0.000:0.000;
	specparam rise$A37$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;
	specparam load$A35	= 1.0;
	specparam load$A36	= 1.0;
	specparam load$A37	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////

module AND38 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;
	input   A35;
	input   A36;
	input   A37;
	input   A38;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A35 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A36 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A37 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A38 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);



	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam fall$A35$Q	= 0.000:0.000:0.000;
	specparam rise$A35$Q	= 0.000:0.000:0.000;
	specparam fall$A36$Q	= 0.000:0.000:0.000;
	specparam rise$A36$Q	= 0.000:0.000:0.000;
	specparam fall$A37$Q	= 0.000:0.000:0.000;
	specparam rise$A37$Q	= 0.000:0.000:0.000;
	specparam fall$A38$Q	= 0.000:0.000:0.000;
	specparam rise$A38$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;
	specparam load$A35	= 1.0;
	specparam load$A36	= 1.0;
	specparam load$A37	= 1.0;
	specparam load$A38	= 1.0;


endspecify
endmodule

///////////////////////////////////////////////


module AND39 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38, A39 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;
	input   A35;
	input   A36;
	input   A37;
	input   A38;
	input   A39;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38, A39 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A35 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A36 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A37 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A38 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A39 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam fall$A35$Q	= 0.000:0.000:0.000;
	specparam rise$A35$Q	= 0.000:0.000:0.000;
	specparam fall$A36$Q	= 0.000:0.000:0.000;
	specparam rise$A36$Q	= 0.000:0.000:0.000;
	specparam fall$A37$Q	= 0.000:0.000:0.000;
	specparam rise$A37$Q	= 0.000:0.000:0.000;
	specparam fall$A38$Q	= 0.000:0.000:0.000;
	specparam rise$A38$Q	= 0.000:0.000:0.000;
	specparam fall$A39$Q	= 0.000:0.000:0.000;
	specparam rise$A39$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;
	specparam load$A35	= 1.0;
	specparam load$A36	= 1.0;
	specparam load$A37	= 1.0;
	specparam load$A38	= 1.0;
	specparam load$A39	= 1.0;

endspecify
endmodule

//////////////////////////////////////////////


module AND40 (Q, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38, A39, A40 );
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	input   A7;
	input   A8;
	input   A9;
	input   A10;
	input   A11;
	input   A12;
	input   A13;
	input   A14;
	input   A15;
	input   A16;
	input   A17;
	input   A18;
	input   A19;
	input   A20;
	input   A21;
	input   A22;
	input   A23;
	input   A24;
	input   A25;
	input   A26;
	input   A27;
	input   A28;
	input   A29;
	input   A30;
	input   A31;
	input   A32;
	input   A33;
	input   A34;
	input   A35;
	input   A36;
	input   A37;
	input   A38;
	input   A39;
	input   A40;

	output 	Q;

and fig1230 ( Q, A1, A2, A3, AD, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, A32, A33, A34, A35, A36, A37, A38, A39, A40 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A7 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A8 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A9 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A10 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A11 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A12 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A13 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A14 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A15 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A16 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A17 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A18 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A19 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A20 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A21 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A22 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A23 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A24 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A25 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A26 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A27 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A28 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A29 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A30 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A31 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A32 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A33 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A34 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A35 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A36 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A37 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A38 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A39 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A40 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);


	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam fall$A6$Q	= 0.000:0.000:0.000;
	specparam rise$A6$Q	= 0.000:0.000:0.000;
	specparam fall$A7$Q	= 0.000:0.000:0.000;
	specparam rise$A7$Q	= 0.000:0.000:0.000;
	specparam fall$A8$Q	= 0.000:0.000:0.000;
	specparam rise$A8$Q	= 0.000:0.000:0.000;
	specparam fall$A9$Q	= 0.000:0.000:0.000;
	specparam rise$A9$Q	= 0.000:0.000:0.000;
	specparam fall$A10$Q	= 0.000:0.000:0.000;
	specparam rise$A10$Q	= 0.000:0.000:0.000;
	specparam fall$A11$Q	= 0.000:0.000:0.000;
	specparam rise$A11$Q	= 0.000:0.000:0.000;
	specparam fall$A12$Q	= 0.000:0.000:0.000;
	specparam rise$A12$Q	= 0.000:0.000:0.000;
	specparam fall$A13$Q	= 0.000:0.000:0.000;
	specparam rise$A13$Q	= 0.000:0.000:0.000;
	specparam fall$A14$Q	= 0.000:0.000:0.000;
	specparam rise$A14$Q	= 0.000:0.000:0.000;
	specparam fall$A15$Q	= 0.000:0.000:0.000;
	specparam rise$A15$Q	= 0.000:0.000:0.000;
	specparam fall$A16$Q	= 0.000:0.000:0.000;
	specparam rise$A16$Q	= 0.000:0.000:0.000;
	specparam fall$A17$Q	= 0.000:0.000:0.000;
	specparam rise$A17$Q	= 0.000:0.000:0.000;
	specparam fall$A18$Q	= 0.000:0.000:0.000;
	specparam rise$A18$Q	= 0.000:0.000:0.000;
	specparam fall$A19$Q	= 0.000:0.000:0.000;
	specparam rise$A19$Q	= 0.000:0.000:0.000;
	specparam fall$A20$Q	= 0.000:0.000:0.000;
	specparam rise$A20$Q	= 0.000:0.000:0.000;
	specparam fall$A21$Q	= 0.000:0.000:0.000;
	specparam rise$A21$Q	= 0.000:0.000:0.000;
	specparam fall$A22$Q	= 0.000:0.000:0.000;
	specparam rise$A22$Q	= 0.000:0.000:0.000;
	specparam fall$A23$Q	= 0.000:0.000:0.000;
	specparam rise$A23$Q	= 0.000:0.000:0.000;
	specparam fall$A24$Q	= 0.000:0.000:0.000;
	specparam rise$A24$Q	= 0.000:0.000:0.000;
	specparam fall$A25$Q	= 0.000:0.000:0.000;
	specparam rise$A25$Q	= 0.000:0.000:0.000;
	specparam fall$A26$Q	= 0.000:0.000:0.000;
	specparam rise$A26$Q	= 0.000:0.000:0.000;
	specparam fall$A27$Q	= 0.000:0.000:0.000;
	specparam rise$A27$Q	= 0.000:0.000:0.000;
	specparam fall$A28$Q	= 0.000:0.000:0.000;
	specparam rise$A28$Q	= 0.000:0.000:0.000;
	specparam fall$A29$Q	= 0.000:0.000:0.000;
	specparam rise$A29$Q	= 0.000:0.000:0.000;
	specparam fall$A30$Q	= 0.000:0.000:0.000;
	specparam rise$A30$Q	= 0.000:0.000:0.000;
	specparam fall$A31$Q	= 0.000:0.000:0.000;
	specparam rise$A31$Q	= 0.000:0.000:0.000;
	specparam fall$A32$Q	= 0.000:0.000:0.000;
	specparam rise$A32$Q	= 0.000:0.000:0.000;
	specparam fall$A33$Q	= 0.000:0.000:0.000;
	specparam rise$A33$Q	= 0.000:0.000:0.000;
	specparam fall$A34$Q	= 0.000:0.000:0.000;
	specparam rise$A34$Q	= 0.000:0.000:0.000;
	specparam fall$A35$Q	= 0.000:0.000:0.000;
	specparam rise$A35$Q	= 0.000:0.000:0.000;
	specparam fall$A36$Q	= 0.000:0.000:0.000;
	specparam rise$A36$Q	= 0.000:0.000:0.000;
	specparam fall$A37$Q	= 0.000:0.000:0.000;
	specparam rise$A37$Q	= 0.000:0.000:0.000;
	specparam fall$A38$Q	= 0.000:0.000:0.000;
	specparam rise$A38$Q	= 0.000:0.000:0.000;
	specparam fall$A39$Q	= 0.000:0.000:0.000;
	specparam rise$A39$Q	= 0.000:0.000:0.000;
	specparam fall$A40$Q	= 0.000:0.000:0.000;
	specparam rise$A40$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6	= 1.0;
	specparam load$A7	= 1.0;
	specparam load$A8	= 1.0;
	specparam load$A9	= 1.0;
	specparam load$A10	= 1.0;
	specparam load$A11	= 1.0;
	specparam load$A12	= 1.0;
	specparam load$A13	= 1.0;
	specparam load$A14	= 1.0;
	specparam load$A15	= 1.0;
	specparam load$A16	= 1.0;
	specparam load$A17	= 1.0;
	specparam load$A18	= 1.0;
	specparam load$A19	= 1.0;
	specparam load$A20	= 1.0;
	specparam load$A21	= 1.0;
	specparam load$A22	= 1.0;
	specparam load$A23	= 1.0;
	specparam load$A24	= 1.0;
	specparam load$A25	= 1.0;
	specparam load$A26	= 1.0;
	specparam load$A27	= 1.0;
	specparam load$A28	= 1.0;
	specparam load$A29	= 1.0;
	specparam load$A30	= 1.0;
	specparam load$A31	= 1.0;
	specparam load$A32	= 1.0;
	specparam load$A33	= 1.0;
	specparam load$A34	= 1.0;
	specparam load$A35	= 1.0;
	specparam load$A36	= 1.0;
	specparam load$A37	= 1.0;
	specparam load$A38	= 1.0;
	specparam load$A39	= 1.0;
	specparam load$A40	= 1.0;

endspecify
endmodule

///////////////////////////////////////////////
module OR1 (Q,A1);
        output Q;
        input  A1;

        buf I1 (Q, A1);

 specify
		specparam allZeros = 0:0:0;
                (A1 +=> Q) = ( allZeros,allZeros);
        endspecify
endmodule // ibuf

//////////////////////////////////////////////////

module OR2 (Q, A1, A2);
	input 	A1;
	input 	A2;
	output 	Q;

or fig1006 ( Q, A2, A1 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////////

module OR3 (Q, A1, A2, A3);
	input 	A1;
	input 	A2;
	input 	A3;
	output 	Q;

or fig1125 ( Q, A3, eap1423 );
or fig1126 ( eap1423, A2, A1 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////////

module OR4 (Q, A1, A2, A3, A4);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	output 	Q;

or fig1116 ( Q, A4, eap1409 );
or fig1117 ( eap1409, A3, eap1411 );
or fig1118 ( eap1411, A2, A1 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////////

module OR5 (Q, A1, A2, A3, A4, A5);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	output 	Q;

or fig1116 ( Q, eap1413, A5);
or fig1118 ( eap1411, A2, A1 );
or fig1119 ( eap1412, A3, A4);
or fig1120 ( eap1413, eap1411, eap1412);

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam fall$A3$Q	= 0.000:0.000:0.000;
	specparam rise$A3$Q	= 0.000:0.000:0.000;
	specparam fall$A4$Q	= 0.000:0.000:0.000;
	specparam rise$A4$Q	= 0.000:0.000:0.000;
	specparam fall$A5$Q	= 0.000:0.000:0.000;
	specparam rise$A5$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////////

module OR6 (Q, A1, A2, A3, A4, A5, A6);
	input 	A1;
	input 	A2;
	input 	A3;
	input 	A4;
	input   A5;
	input   A6;
	output 	Q;

or fig1116 ( Q, eap1413, eap1414 );
or fig1118 ( eap1411, A2, A1 );
or fig1119 ( eap1412, A3, A4);
or fig1120 ( eap1413, eap1411, eap1412);
or fig1121 ( eap1414, A5, A6);

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A3 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A4 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A5 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A6 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1Q	= 0.000:0.000:0.000;
	specparam rise$A1Q	= 0.000:0.000:0.000;
	specparam fall$A2Q	= 0.000:0.000:0.000;
	specparam rise$A2Q	= 0.000:0.000:0.000;
	specparam fall$A3Q	= 0.000:0.000:0.000;
	specparam rise$A3Q	= 0.000:0.000:0.000;
	specparam fall$A4Q	= 0.000:0.000:0.000;
	specparam rise$A4Q	= 0.000:0.000:0.000;
	specparam fall$A5Q	= 0.000:0.000:0.000;
	specparam rise$A5Q	= 0.000:0.000:0.000;
	specparam fall$A6Q	= 0.000:0.000:0.000;
	specparam rise$A6Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
	specparam load$A3	= 1.0;
	specparam load$A4	= 1.0;
	specparam load$A5	= 1.0;
	specparam load$A6 	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////////

module XOR2 (Q, A1, A2);
	input 	A1;
	input 	A2;
	output 	Q;

xor fig1156 ( Q, A1, A2 );

specify //Path definitions
	(A1 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(A2 => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$A1$Q	= 0.000:0.000:0.000;
	specparam rise$A1$Q	= 0.000:0.000:0.000;
	specparam fall$A2$Q	= 0.000:0.000:0.000;
	specparam rise$A2$Q	= 0.000:0.000:0.000;
	specparam load$A1	= 1.0;
	specparam load$A2	= 1.0;
endspecify
endmodule

//////////////////////////////////////////////////

module DFFEARS (Q, D, CE, CLK, AS, AR);
	input 	D;
	input 	CE;
	input 	CLK;
	input 	AS;
	input 	AR;
	output 	Q;
	//output 	QN;
  reg violation_notifier;


  ff ff1 (Q, CLK, D, AR, AS, CE, violation_notifier);

specify //Path definitions
	specparam Setup_CLK_D = 0:0:0;
	specparam Hold_D_CLK = 0:0:0;
	specparam Setup_CLK_CE = 0:0:0;
	specparam Hold_CE_CLK = 0:0:0;
	specparam Rec_AS_CLK = 0:0:0;
	specparam Rec_AR_CLK = 0:0:0;

	if( AS )
	(posedge CLK => (Q+:D)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	if( AS )
	(posedge CLK => (Q+:CE)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge AS => (Q+:1'b1)) = (0.000:0.000:0.000,0.000:0.000:0.000);

	if( AR )
	(posedge CLK => (Q+:D)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge AR => (Q+:1'b0)) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$D$Q	= 0.000:0.000:0.000;
	specparam rise$D$Q	= 0.000:0.000:0.000;
	specparam fall$CE$Q	= 0.000:0.000:0.000;
	specparam rise$CE$Q	= 0.000:0.000:0.000;
	specparam fall$CLK$Q	= 0.000:0.000:0.000;
	specparam rise$CLK$Q	= 0.000:0.000:0.000;
	specparam fall$AS$Q	= 0.000:0.000:0.000;
	specparam rise$AS$Q	= 0.000:0.000:0.000;
	specparam fall$AR$Q	= 0.000:0.000:0.000;
	specparam rise$AR$Q	= 0.000:0.000:0.000;
	specparam load$D	= 1.0;
	specparam load$CE	= 1.0;
	specparam load$CLK	= 1.0;
	specparam load$AS	= 1.0;
	specparam load$AR	= 1.0;

	// Timing checks
	$setuphold( posedge CLK, D, Setup_CLK_D, Hold_D_CLK, violation_notifier);
	$setuphold( posedge CLK, CE, Setup_CLK_CE, Hold_CE_CLK, violation_notifier);
	$recovery( posedge AS, posedge CLK, Rec_AS_CLK, violation_notifier); // AS-to-CLK time:if violated, similar to a setup violation
	$recovery( posedge AR, posedge CLK, Rec_AR_CLK, violation_notifier); // AR-to-CLK time:if violated, similar to a setup violation
endspecify                                         // insert notifier
endmodule

primitive ff(q, clk, d, reset, set, enable, notifier);

input   clk, d, reset, set, enable, notifier;
output  q;
reg     q;

// initial q = 1'b0;

table

    // clk   d   reset   set   enable   notifier   q   q+;
      (01)   0     0      0       1         ?    : ? : 0; //normal 0
      (01)   1     0      0       1         ?    : ? : 1; //normal 1
      (01)   x     0      0       1         ?    : ? : x; //normal x
      (??)   ?     0      0       0         ?    : 1 : 1; //q retain on CE low
      (??)   ?     0      0       0         ?    : 0 : 0; //q retain on CE low
      (x?)   x     0      0       x         ?    : x : 0; // initial state

        ?    ?     1      0       ?         ?    : ? : 0; //normal AR
        ?    ?     0      1       ?         ?    : ? : 1; //normal AS
        ?    ?     1      1       ?         ?    : ? : 0; //AS and AR asserted at the same time(AR prevails)

        ?    ?     x      0       ?         ?    : ? : -; //AR undefined
        ?    ?     0      x       ?         ?    : ? : -; //AS undefined
        ?    ?     1      x       ?         ?    : ? : 0; //AS undefined, AR asserted
        ?    ?     0      0       x         ?    : ? : -; //CE undefined
        ?   (??)   0      0       ?         ?    : ? : -; //D transitions out of clk edges
        ?    ?    (??)    0       ?         ?    : ? : -; //AR transitions
        ?    ?     0     (??)     ?         ?    : ? : -; //AS transitions
        ?    ?     ?      ?      (??)       ?    : ? : -; //CE transitions
      (1?)   ?     0      0       ?         ?    : ? : -; //Q retain after clk negedge




        ?   ?     ?      ?       ?         *     : ? : x; //'x' broadcast on timing violations
endtable

endprimitive

//////////////////////////////////////////////////


module TFFEARS (Q,  T, CE, CLK, AS, AR);
	input 	T;
	input 	CE;
	input 	CLK;
	input 	AS;
	input 	AR;
	output 	Q;
	//output 	QN;
	//reg Q;
	reg violation_notifier;

  tff tff1 (Q, CLK, T, AR, AS, CE, violation_notifier);

specify //Path definitions
	specparam Setup_CLK_T = 0:0:0;
	specparam Hold_T_CLK = 0:0:0;
	specparam Setup_CLK_CE = 0:0:0;
	specparam Hold_CE_CLK = 0:0:0;
	specparam Rec_AS_CLK = 0:0:0;
	specparam Rec_AR_CLK = 0:0:0;

	if( AS )
	(posedge CLK => (Q+:T)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	if( AS )
	(posedge CLK => (Q+:CE)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge AS => (Q+:1'b1)) = (0.000:0.000:0.000,0.000:0.000:0.000);

	if( AR )
	(posedge CLK => (Q+:T)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge AR => (Q+:1'b0)) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$T$Q	= 0.000:0.000:0.000;
	specparam rise$T$Q	= 0.000:0.000:0.000;
	specparam fall$CE$Q	= 0.000:0.000:0.000;
	specparam rise$CE$Q	= 0.000:0.000:0.000;
	specparam fall$CLK$Q	= 0.000:0.000:0.000;
	specparam rise$CLK$Q	= 0.000:0.000:0.000;
	specparam fall$AS$Q	= 0.000:0.000:0.000;
	specparam rise$AS$Q	= 0.000:0.000:0.000;
	specparam fall$AR$Q	= 0.000:0.000:0.000;
	specparam rise$AR$Q	= 0.000:0.000:0.000;
	specparam load$T	= 1.0;
	specparam load$CE	= 1.0;
	specparam load$CLK	= 1.0;
	specparam load$AS	= 1.0;
	specparam load$AR	= 1.0;

	// Timing checks
	$setuphold( posedge CLK, T, Setup_CLK_T, Hold_T_CLK, violation_notifier);
	$setuphold( posedge CLK, CE, Setup_CLK_CE, Hold_CE_CLK, violation_notifier);
	$recovery( posedge AS, posedge CLK, Rec_AS_CLK, violation_notifier);
	$recovery( posedge AR, posedge CLK, Rec_AR_CLK, violation_notifier);
endspecify
endmodule

primitive tff(q, clk, t, reset, set, enable, notifier);

input   clk, t, reset, set, enable, notifier;
output  q;
reg     q;

// initial q = 1'b0;

table

    // clk   t   reset   set   enable   notifier   q   q+;
      (01)   0     0      0       1         ?    : 0 : 0; //no toggle
      (01)   0     0      0       1         ?    : 1 : 1; //no toggle
      (01)   1     0      0       1         ?    : 1 : 0; //toggle
      (01)   1     0      0       1         ?    : 0 : 1; //toggle
      (01)   x     0      0       1         ?    : 0 : 0; //x on T, no toggle
      (01)   x     0      0       1         ?    : 1 : 1; //x on T, no toggle
      (??)   ?     0      0       0         ?    : 1 : 1; //q retain on CE low
      (??)   ?     0      0       0         ?    : 0 : 0; //q retain on CE low
      (x?)   x     0      0       x         ?    : x : 0; //initial state
      (x?)   x     0      0       1         ?    : x : 0; //initial state
      (x?)   x     0      0       0         ?    : x : 0; //initial state

        ?    ?     1      0       ?         ?    : ? : 0; //normal AS
        ?    ?     0      1       ?         ?    : ? : 1; //normal AR
        ?    ?     1      1       ?         ?    : ? : 0; //AS and AR asserted at the same time(AR prevails)

        ?    ?     x      0       ?         ?    : ? : -; //AR undefined
        ?    ?     0      x       ?         ?    : ? : -; //AS undefined
        ?    ?     1      x       ?         ?    : ? : 0; //AS undefined, AR asserted
        ?    ?     0      0       x         ?    : ? : -; //CE undefined
        ?   (??)   0      0       ?         ?    : ? : -; //T transitions out of clk edges
        ?    ?    (??)    0       ?         ?    : ? : -; //AR transitions
        ?    ?     0     (??)     ?         ?    : ? : -; //AS transitions
        ?    ?     ?      ?      (??)       ?    : ? : -; //CE transitions
      (1?)   ?     0      0       ?         ?    : ? : -; //Q retain after clk negedge

        ?    ?     ?      ?       ?         *    : ? : x; //'x' broadcast on timing violations
endtable

endprimitive

//////////////////////////////////////////////////

module LATCH (Q, D, EN, AR, AS, CE);
	input 	D;
	input 	EN;
	input   AR;
        input   AS;
        input   CE;
	output 	Q;
	reg Q;


always @ (EN or D)
	begin
		if (EN==1)
	          begin
			Q <= D;
		  end

	end
//not fig1235 (QN, Q);



specify //Path definitions

	specparam Setup_AS_Q = 0:0:0;
	specparam Hold_Q_AS = 0:0:0;
	specparam Setup_AR_Q = 0:0:0;
	specparam Hold_Q_AR = 0:0:0;
	specparam Setup_EN_D = 0:0:0;
	specparam Hold_D_EN = 0:0:0;
	specparam Setup_EN_CE = 0:0:0;
	specparam Hold_CE_EN = 0:0:0;
	specparam Setup_EN_AS = 0:0:0;
	specparam Hold_AS_EN = 0:0:0;
	specparam Setup_EN_AR = 0:0:0;
	specparam Hold_AR_EN = 0:0:0;
	specparam Rec_AS_EN = 0:0:0;
	specparam Rec_AR_EN = 0:0:0;

	if(EN)
	(D => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge EN => (Q+:D) ) = (0.000:0.000:0.000,0.000:0.000:0.000);

	if( AS )
	(posedge EN => (Q+:D)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	if( AS )
	(posedge EN => (Q+:CE)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge AS => (Q+:1'b1)) = (0.000:0.000:0.000,0.000:0.000:0.000);

	if( AR )
	(posedge EN => (Q+:D)) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(posedge AR => (Q+:1'b0)) = (0.000:0.000:0.000,0.000:0.000:0.000);

	//Delay Calc Parameter declarations
	specparam fall$D$Q	= 0.000:0.000:0.000;
	specparam rise$D$Q	= 0.000:0.000:0.000;
	specparam fall$EN$Q	= 0.000:0.000:0.000;
	specparam rise$EN$Q	= 0.000:0.000:0.000;
	specparam fall$AR$Q	= 0.000:0.000:0.000;
	specparam rise$AR$Q	= 0.000:0.000:0.000;
	specparam fall$AS$Q	= 0.000:0.000:0.000;
	specparam rise$AS$Q	= 0.000:0.000:0.000;
	specparam fall$CE$Q	= 0.000:0.000:0.000;
	specparam rise$CE$Q	= 0.000:0.000:0.000;
	specparam load$D	= 1.0;
	specparam load$EN	= 1.0;
	specparam load$AR	= 1.0;
	specparam load$AS	= 1.0;
	specparam load$CE	= 1.0;

	// Timing checks
	$setuphold( posedge EN, D, Setup_EN_D, Hold_D_EN);
	$setuphold( posedge EN, CE, Setup_EN_CE, Hold_CE_EN);
	$recovery( negedge AS, posedge EN, Rec_AS_EN);
	$recovery( negedge AR, posedge EN, Rec_AR_EN);
endspecify

endmodule

//////////////////////////////////////////////////

module TRI (Q, A, EN);
	input 	A;
	input   EN;
	output 	Q;

bufif1 fig1280 ( Q, A, EN);


specify //Path definitions
	specparam t0Z = 0.000:0.000:0.000;
	specparam tZ1 = 0.000:0.000:0.000;
	specparam t1Z = 0.000:0.000:0.000;
	specparam tZ0 = 0.000:0.000:0.000;

	(A => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000);
	(EN => Q ) = (0.000:0.000:0.000,0.000:0.000:0.000,t0Z,tZ1,t1Z,tZ0);

	//Delay Calc Parameter declarations
	specparam fall$A$Q	= 0.000:0.000:0.000;
	specparam rise$A$Q	= 0.000:0.000:0.000;
	specparam fall$EN$Q	= 0.000:0.000:0.000;
	specparam rise$EN$Q	= 0.000:0.000:0.000;
	specparam load$A	= 1.0;
	specparam load$EN	= 1.0;
endspecify
endmodule

///////////////////////////////////////////////////

module BIBUF (Q,PAD,A,EN);
        output Q;
        input  A;
        input  EN;
        inout  PAD;
	reg Q;
	reg PAD_NEXT;
	wire PAD;

        //bufif1 ITR1 (PAD, A, EN);
        //buf I1 (Q, PAD);

always @ (EN or A or PAD) begin
	if (EN==1)
		begin
		Q = A;
		PAD_NEXT = A;
		end
	else
		Q = PAD;
end

assign PAD = PAD_NEXT;

 specify

 		specparam allZeros = 0:0:0;


                (PAD +=> Q) = ( allZeros,allZeros );
                (A  => PAD) = ( allZeros,allZeros );
                (EN  => PAD) =( allZeros,allZeros,allZeros,allZeros,
				allZeros,allZeros );
        endspecify
endmodule
