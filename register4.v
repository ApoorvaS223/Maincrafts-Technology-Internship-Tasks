module register4(
    input CLK,
    input [3:0] D,
    output reg [3:0] Q
);

always @(posedge CLK)
begin
    Q <= D;
end

endmodule