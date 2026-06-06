`timescale 1ns/1ps

module jk_flipflop_tb;

reg J, K, CLK;
wire Q;

jk_flipflop uut (
    .J(J),
    .K(K),
    .CLK(CLK),
    .Q(Q)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

// Test cases
initial begin

    $dumpfile("jk_flipflop.vcd");
    $dumpvars(0, jk_flipflop_tb);

    $display("Time\tJ\tK\tCLK\tQ");
    $monitor("%0t\t%b\t%b\t%b\t%b",
              $time, J, K, CLK, Q);

    // No change
    J = 0; K = 0; #10;

    // Reset
    J = 0; K = 1; #10;

    // Set
    J = 1; K = 0; #10;

    // Toggle
    J = 1; K = 1; #10;

    // Toggle again
    J = 1; K = 1; #10;

    $finish;

end

endmodule