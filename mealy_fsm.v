module mealy_fsm(
    input CLK,
    input RESET,
    input X,
    output reg Y
);

reg [1:0] state, next_state;

// State Encoding
parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

// State Register
always @(posedge CLK or posedge RESET)
begin
    if (RESET)
        state <= S0;
    else
        state <= next_state;
end

// Next-State Logic and Output Logic
always @(*)
begin
    Y = 0;    // Default output

    case(state)

        S0: begin
            if(X)
                next_state = S1;
            else
                next_state = S0;
        end

        S1: begin
            if(X)
                next_state = S1;
            else
                next_state = S2;
        end

        S2: begin
            if(X) begin
                next_state = S1;
                Y = 1;          // Sequence 101 detected
            end
            else
                next_state = S0;
        end

        default: begin
            next_state = S0;
            Y = 0;
        end

    endcase
end

endmodule