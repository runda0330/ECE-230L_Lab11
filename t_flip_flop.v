// T flip flop constructed from the D flip flop
module t_flip_flop(input clk, input rst, input T, output Q);
    wire next_q;
    assign next_q = Q ^ T;
    d_flip_flop storage(.clk(clk), .rst(rst), .clear(1'b0), .D(next_q), .Q(Q));
endmodule
