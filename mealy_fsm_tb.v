`timescale 1ns/1ps

module mealy_fsm_tb;

reg CLK, RESET, X;
wire Y;

mealy_fsm uut(
    .CLK(CLK),
    .RESET(RESET),
    .X(X),
    .Y(Y)
);

// Clock Generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

// Test Stimulus
initial begin

    $dumpfile("mealy_fsm.vcd");
    $dumpvars(0, mealy_fsm_tb);

    $display("Time\tRESET\tX\tY");
    $monitor("%0t\t%b\t%b\t%b",
              $time, RESET, X, Y);

    RESET = 1;
    X = 0;
    #10;

    RESET = 0;

    // Input sequence: 101101
    X = 1; #10;
    X = 0; #10;
    X = 1; #10;   // Detect 101

    X = 1; #10;
    X = 0; #10;
    X = 1; #10;   // Detect 101 again

    #10;
    $finish;

end

endmodule