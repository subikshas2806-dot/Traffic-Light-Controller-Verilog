

    

`timescale 1ns/1ps

module traffic_light_tb;

    reg clk;
    reg reset;

    wire red;
    wire yellow;
    wire green;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Generate clock
    always #5 clk = ~clk;

   initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);

        clk = 0;
        reset = 1;

        #12 reset = 0;

        #10;
        $display("Red=%b Yellow=%b Green=%b", red, yellow, green);

        #10;
        $display("Red=%b Yellow=%b Green=%b", red, yellow, green);

        #10;
        $display("Red=%b Yellow=%b Green=%b", red, yellow, green);

        #10;
        $finish;
    end

endmodule