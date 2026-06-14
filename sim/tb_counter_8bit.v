`timescale 1ns/1ps

module tb;
    reg clk = 0, rst_n = 0, en = 0, load = 0;
    reg [7:0] load_val = 0;
    wire [7:0] count;
    wire overflow;

    counter_8bit dut (.*);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, tb.dut);

        #20 rst_n = 1;

        #10 en = 1;
        #40 en = 0;

        #10 load_val = 8'd250; load = 1;
        #10 load = 0; en = 1;
        #120;

        $finish;
    end
endmodule
