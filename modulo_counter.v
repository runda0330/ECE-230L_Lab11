// modulo-6 state counter with /12 output
module modulo_counter(input clk, input rst, output [2:0] state, output out);
    wire [2:0] next_state;
    wire carry_one, carry_two, unused_carry;
    wire at_count;
    wire next_out;

    // three full adders form state plus 1
    full_adder add_zero(.A(state[0]), .B(1'b0), .Cin(1'b1), .Sum(next_state[0]), .Cout(carry_one));
    full_adder add_one (.A(state[1]), .B(1'b0), .Cin(carry_one), .Sum(next_state[1]), .Cout(carry_two));
    full_adder add_two (.A(state[2]), .B(1'b0), .Cin(carry_two), .Sum(next_state[2]), .Cout(unused_carry));

    // clear state on next clock edge and toggle out
    assign at_count = state[2] & ~state[1] & state[0];
    assign next_out = out ^ at_count;
    d_flip_flop bit_zero(.clk(clk), .rst(rst), .clear(at_count), .D(next_state[0]), .Q(state[0]));
    d_flip_flop bit_one (.clk(clk), .rst(rst), .clear(at_count), .D(next_state[1]), .Q(state[1]));
    d_flip_flop bit_two (.clk(clk), .rst(rst), .clear(at_count), .D(next_state[2]), .Q(state[2]));
    d_flip_flop output_ff(.clk(clk), .rst(rst), .clear(1'b0), .D(next_out), .Q(out));
endmodule
