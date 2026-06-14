`timescale 1ns/1ps

module moore_fsm_tb;

reg CLK, RESET, X;
wire Y;

moore_fsm uut(
    .CLK(CLK),
    .RESET(RESET),
    .X(X),
    .Y(Y)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

initial begin

    // VCD generation
    $dumpfile("moore_fsm.vcd");
    $dumpvars(0, moore_fsm_tb);

    // Terminal output
    $display("Time\tRESET\tX\tY");
    $monitor("%0t\t%b\t%b\t%b",
              $time, RESET, X, Y);

    // Reset the FSM
    RESET = 1;
    X = 0;
    #10;

    RESET = 0;

    // Input sequence: 101101
    X = 1; #10;
    X = 0; #10;
    X = 1; #10;   // Sequence 101 detected

    X = 1; #10;
    X = 0; #10;
    X = 1; #10;   // Sequence 101 detected again

    #10;
    $finish;

end

endmodule