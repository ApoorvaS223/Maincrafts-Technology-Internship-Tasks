`timescale 1ns/1ps

module sequence_detector_tb;

reg CLK, RESET, X;
wire Y;

sequence_detector uut(
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

initial begin

    $dumpfile("sequence_detector.vcd");
    $dumpvars(0, sequence_detector_tb);

    $display("Time\tRESET\tX\tY");
    $monitor("%0t\t%b\t%b\t%b",
             $time, RESET, X, Y);

    // Reset
    RESET = 1;
    X = 0;
    #10;

    RESET = 0;

    // Apply sequence: 11011101
    X = 1; #10;
    X = 1; #10;
    X = 0; #10;
    X = 1; #10;   // Detect 1101

    X = 1; #10;
    X = 1; #10;
    X = 0; #10;
    X = 1; #10;   // Detect 1101 again

    #10;
    $finish;

end

endmodule