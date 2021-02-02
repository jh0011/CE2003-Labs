`timescale 1ns/1ps
module Lab2_top(input clk, rst, write_en, save_data, show_reg, 
                input [7:0] d_in,
                output [7:0] d_out);
    reg [7:0] reg_d;
    wire[7:0] mem_d;

    //INSTANTIATION
    Lab2_mem inst1 (
        .a(d_in[5:0]),      // input wire [5 : 0] a
        .d(reg_d),      // input wire [7 : 0] d
        .clk(clk),  // input wire clk
        .we(write_en),    // input wire we
        .spo(mem_d)  // output wire [7 : 0] spo o
    );

    always@(posedge clk)
    begin
        if (rst)
        begin
            reg_d <= 1'b0;
        end
        else
        begin
            if (save_data)
            begin   
                reg_d <= d_in;
            end
        end
    end

    assign d_out = show_reg ? mem_d : reg_d;

endmodule