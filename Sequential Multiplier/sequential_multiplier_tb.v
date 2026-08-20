`timescale 1ns/1ps

module sequential_multiplier_tb;

    reg clk;
    reg reset;
    reg start;

    reg [3:0] multiplicand;
    reg [3:0] multiplier;

    wire [7:0] product;
    wire busy;
    wire done;

    sequential_multiplier uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .busy(busy),
        .done(done)
    );

    // Clock generation
    always #5 clk = ~clk;

    task multiply;
        input [3:0] a;
        input [3:0] b;

        begin

            @(negedge clk);

            multiplicand = a;
            multiplier = b;
            start = 1'b1;

            @(negedge clk);
            start = 1'b0;

            wait(done);

            $display(
                "Time=%0t | A=%d | B=%d | Product=%d | Binary=%b",
                $time,
                a,
                b,
                product,
                product
            );

            @(negedge clk);

        end
    endtask

    initial begin

        clk = 1'b0;
        reset = 1'b1;
        start = 1'b0;

        multiplicand = 4'b0000;
        multiplier = 4'b0000;

        #12;

        reset = 1'b0;

        $display("================================================");
        $display("        4-BIT SEQUENTIAL MULTIPLIER");
        $display("================================================");

        multiply(4'd3, 4'd5);
        multiply(4'd7, 4'd6);
        multiply(4'd9, 4'd4);
        multiply(4'd12, 4'd3);
        multiply(4'd15, 4'd15);

        $display("================================================");

        $finish;

    end

endmodule
