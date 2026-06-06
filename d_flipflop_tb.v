`timescale 1ns/1ps

module d_flipflop_tb;

reg D;
reg CLK;

wire Q;

d_flipflop uut (
    .D(D),
    .CLK(CLK),
    .Q(Q)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

// Test inputs
initial begin

    $dumpfile("d_flipflop.vcd");
    $dumpvars(0, d_flipflop_tb);

    $display("Time\tCLK\tD\tQ");
    $monitor("%0t\t%b\t%b\t%b", $time, CLK, D, Q);

    D = 0; #10;
    D = 1; #10;
    D = 0; #10;
    D = 1; #10;

    #10 $finish;

end

endmodule