module traffic_light(
    input CLK,
    input RESET,
    output reg RED,
    output reg YELLOW,
    output reg GREEN
);

reg [1:0] state;

// State Encoding
parameter RED_STATE    = 2'b00,
          GREEN_STATE  = 2'b01,
          YELLOW_STATE = 2'b10;

// State Transition
always @(posedge CLK or posedge RESET)
begin
    if (RESET)
        state <= RED_STATE;
    else begin
        case(state)
            RED_STATE:    state <= GREEN_STATE;
            GREEN_STATE:  state <= YELLOW_STATE;
            YELLOW_STATE: state <= RED_STATE;
            default:      state <= RED_STATE;
        endcase
    end
end

// Output Logic
always @(*)
begin
    RED    = 0;
    YELLOW = 0;
    GREEN  = 0;

    case(state)
        RED_STATE:    RED    = 1;
        GREEN_STATE:  GREEN  = 1;
        YELLOW_STATE: YELLOW = 1;
    endcase
end

endmodule