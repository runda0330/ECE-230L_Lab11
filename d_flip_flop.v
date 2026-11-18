module d_flip_flop(input clk, input rst, input clear, input D, output reg Q);
    initial Q = 1'b0;// starts with value of 0
    always @(posedge clk or posedge rst) begin
        if (rst) Q <= 1'b0;
        else if (clear) Q <= 1'b0;// clears on next clock pulse
        else Q <= D;
    end
endmodule
