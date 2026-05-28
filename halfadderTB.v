`timescale 1ns/1ps

module half_adder_tb;

reg A, B;

wire SUM, CARRY;

half_adder uut (
    .A(A),
    .B(B),
    .SUM(SUM),
    .CARRY(CARRY)
);

initial begin

    // Generate VCD file
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    // Display heading
    $display("A B | SUM CARRY");

    // Monitor outputs
    $monitor("%b %b |  %b     %b",
              A, B,
              SUM, CARRY);

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