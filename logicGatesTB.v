`timescale 1ns/1ps

module logic_gates_tb;

reg A, B;

wire AND_OUT;
wire OR_OUT;
wire NOT_OUT;
wire NAND_OUT;
wire NOR_OUT;
wire XOR_OUT;
wire XNOR_OUT;

logic_gates uut (
    .A(A),
    .B(B),
    .AND_OUT(AND_OUT),
    .OR_OUT(OR_OUT),
    .NOT_OUT(NOT_OUT),
    .NAND_OUT(NAND_OUT),
    .NOR_OUT(NOR_OUT),
    .XOR_OUT(XOR_OUT),
    .XNOR_OUT(XNOR_OUT)
);

initial begin

    // For GTKWave
    $dumpfile("logic_gates.vcd");
    $dumpvars(0, logic_gates_tb);

    // Header
    $display("A B | AND OR NOT NAND NOR XOR XNOR");

    // Monitor changes
    $monitor("%b %b |  %b   %b   %b    %b    %b   %b    %b",
              A, B,
              AND_OUT,
              OR_OUT,
              NOT_OUT,
              NAND_OUT,
              NOR_OUT,
              XOR_OUT,
              XNOR_OUT);

    // Test cases
    A = 0; B = 0;
    #10;

    A = 0; B = 1;
    #10;

    A = 1; B = 0;
    #10;

    A = 1; B = 1;
    #10;

    $finish;

end

endmodule
