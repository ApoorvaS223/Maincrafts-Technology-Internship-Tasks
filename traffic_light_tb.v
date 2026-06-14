`timescale 1ns/1ps

module traffic_light_tb;

reg CLK, RESET;
wire RED, YELLOW, GREEN;

traffic_light uut(
    .CLK(CLK),
    .RESET(RESET),
    .RED(RED),
    .YELLOW(YELLOW),
    .GREEN(GREEN)
);

// Clock Generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

// Test Stimulus
initial begin

    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);

    $display("Time\tRESET\tRED\tYELLOW\tGREEN");
    $monitor("%0t\t%b\t%b\t%b\t%b",
             $time, RESET, RED, YELLOW, GREEN);

    // Apply Reset
    RESET = 1;
    #10;

    RESET = 0;

    // Let the controller cycle
    #60;

    $finish;

end

endmodule