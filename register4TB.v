`timescale 1ns/1ps

module register4_tb;

reg CLK;
reg [3:0] D;
wire [3:0] Q;

register4 uut (
    .CLK(CLK),
    .D(D),
    .Q(Q)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

// Test stimulus
initial begin

    $dumpfile("register4.vcd");
    $dumpvars(0, register4_tb);

    $display("Time\tCLK\tD\tQ");
    $monitor("%0t\t%b\t%b\t%b",
             $time, CLK, D, Q);

    D = 4'b0000; #10;
    D = 4'b1010; #10;
    D = 4'b1100; #10;
    D = 4'b1111; #10;
    D = 4'b0011; #10;

    $finish;

end

endmodule