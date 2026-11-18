// center button is clock upper button resets all counters
module top(input btnC, input btnU, output [6:0] led);
    ripple_counter ripple(.clk(btnC), .rst(btnU), .state(led[2:0]));
    modulo_counter modulo(.clk(btnC), .rst(btnU), .state(led[5:3]), .out(led[6]));
endmodule
