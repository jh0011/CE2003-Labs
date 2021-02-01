`timescale 1ns/1ps
module lab1_FSM(input fifty, dollar, cancel, rst, clk,
                output reg insert_coin, money_return, dispense,
                output reg [1:0] st);

    parameter INIT=2'b00, S50c=2'b01, VEND=2'b10, RETURN=2'b11;
    reg[1:0] nst;

    always@(posedge clk)
    begin  
        if (rst)
        begin
            st <= INIT;
        end
        
        else
        begin
            st <= nst;
        end     
    end

    always@*
    begin
        nst = st;
        insert_coin = 1'b0;
        money_return = 1'b0;
        dispense = 1'b0;
        case (st)
            INIT:
            begin
                if(fifty)
                begin
                    nst = S50c;
                end
                if (dollar)
                begin
                    nst = VEND;
                end
            end

            S50c:
            begin
            insert_coin = 1'b1;
                if(fifty)
                begin
                    nst = VEND;
                end
                if(dollar)
                begin
                    nst = RETURN;
                end
                if(cancel)
                begin
                    nst = RETURN;
                end
            end

            VEND:
            begin
                dispense = 1'b1;
            end

            RETURN:
            begin
                money_return = 1'b1;
                nst = INIT;
            end
        endcase
    end
endmodule