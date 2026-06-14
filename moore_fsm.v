module moore_fsm(
    input CLK,
    input RESET,
    input X,
    output reg Y
);

reg [1:0] state, next_state;

// State encoding
parameter S0 = 2'b00,   // Initial state
          S1 = 2'b01,   // Detected '1'
          S2 = 2'b10,   // Detected '10'
          S3 = 2'b11;   // Detected '101'

// State register
always @(posedge CLK or posedge RESET)
begin
    if (RESET)
        state <= S0;
    else
        state <= next_state;
end

// Next-state logic
always @(*)
begin
    case (state)

        S0: begin
            if (X)
                next_state = S1;
            else
                next_state = S0;
        end

        S1: begin
            if (X)
                next_state = S1;
            else
                next_state = S2;
        end

        S2: begin
            if (X)
                next_state = S3;
            else
                next_state = S0;
        end

        S3: begin
            if (X)
                next_state = S1;
            else
                next_state = S2;
        end

        default:
            next_state = S0;

    endcase
end

// Output logic (Moore FSM)
always @(*)
begin
    case (state)

        S3: Y = 1'b1;   // Sequence 101 detected

        default: Y = 1'b0;

    endcase
end

endmodule