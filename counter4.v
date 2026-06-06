module counter4(
    input CLK,
    output reg [1:0] Q
);

initial
    Q = 2'b00;

always @(posedge CLK)
begin
    if (Q == 2'b11)
        Q <= 2'b00;
    else
        Q <= Q + 1;
end

endmodule