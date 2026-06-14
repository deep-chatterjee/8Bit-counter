module counter_8bit (
    input  wire clk,
    input  wire rst_n,
    input  wire en,
    input  wire load,
    input  wire [7:0] load_val,
    output reg  [7:0] count,
    output wire overflow
);

    assign overflow = (count == 8'd255) && en;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 8'd0;
        else if (load)
            count <= load_val;
        else if (en)
            count <= count + 1'b1;
    end

endmodule
