module logic_gates(
    input A,
    input B,
    output AND_OUT,
    output OR_OUT,
    output NOT_OUT,
    output NAND_OUT,
    output NOR_OUT,
    output XOR_OUT,
    output XNOR_OUT
);

assign AND_OUT  = A & B;
assign OR_OUT   = A | B;
assign NOT_OUT  = ~A;
assign NAND_OUT = ~(A & B);
assign NOR_OUT  = ~(A | B);
assign XOR_OUT  = A ^ B;
assign XNOR_OUT = ~(A ^ B);

endmodule