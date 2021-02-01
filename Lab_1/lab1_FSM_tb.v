`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2021 11:20:26
// Design Name: 
// Module Name: lab1_FSM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab1_FSM_tb();
    reg fifty_tb, dollar_tb, cancel_tb, rst_tb, clk;
    wire [1:0] st;
    
    lab1_FSM DUT (.fifty(fifty_tb), .dollar(dollar_tb), .cancel(cancel_tb),
        .rst(rst_tb), .clk(clk), .st(st));
    
    initial
    begin
        fifty_tb = 1'b0;
        dollar_tb = 1'b0;
        cancel_tb = 1'b0;
        rst_tb = 1'b0;
        clk = 1'b0;

        #100;

        #10 rst_tb = 1'b1; //in INIT
		#10 fifty_tb = 1'b1; //TO 50c
		#10 fifty_tb = 1'b0; 
		#10 fifty_tb = 1'b1; // TO VEND
		#10 fifty_tb = 1'b0;
		#10 rst_tb = 1'b1;
		#10 rst_tb = 1'b0; //Reset
		#10 rst_tb = 1'b1;
		#10 dollar_tb = 1'b1; //To VEND
		#10 dollar_tb = 1'b0;
		#10 rst_tb = 1'b1;
		#10 rst_tb = 1'b0; //Reset 
		#10 rst_tb = 1'b1; 
		#10 fifty_tb = 1'b1; //to 50C
		#10 fifty_tb = 1'b0;
		#10 dollar_tb = 1'b1; //to RETURN
		#10 dollar_tb = 1'b0; //To INIT
		#10 rst_tb = 1'b1; 
		#10 fifty_tb = 1'b1; //to 50c
		#10 fifty_tb = 1'b0;
		#10 cancel_tb = 1'b1; //to RETURN
		#10 cancel_tb = 1'b0; //to INIT
		#10 rst_tb = 1'b1;
        $finish();
    end

    always #5 clk = ~clk;
    
endmodule
