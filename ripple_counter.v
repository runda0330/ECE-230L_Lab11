// three cascaded T flip flops output frequencies /2 /4 /8
// falling Q of one stage clocks the next inverted signal
module ripple_counter(input clk, input rst, output [2:0] state);
    wire clock_one, clock_two;
    assign clock_one = ~state[0];
    assign clock_two = ~state[1];
    t_flip_flop zero(.clk(clk),       .rst(rst), .T(1'b1), .Q(state[0]));
    t_flip_flop one (.clk(clock_one), .rst(rst), .T(1'b1), .Q(state[1]));
    t_flip_flop two (.clk(clock_two), .rst(rst), .T(1'b1), .Q(state[2]));
endmodule
