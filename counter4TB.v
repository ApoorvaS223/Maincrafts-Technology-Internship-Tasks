`timescale 1ns/1ps

module counter4_tb;

reg CLK;
wire [1:0] Q;

counter4 uut (
    .CLK(CLK),
    .Q(Q)
);

initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

initial begin

    $dumpfile("counter4.vcd");
    $dumpvars(0, counter4_tb);

    $display("Time\tCLK\tQ");
    $monitor("%0t\t%b\t%02b", $time, CLK, Q);

    #50;
    $finish;

end

endmodule