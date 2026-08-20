`timescale 1ns/1ps

module sequential_multiplier (
    input        clk,
    input        reset,
    input        start,
    input  [3:0]  multiplicand,
    input  [3:0]  multiplier,
    output reg [7:0] product,
    output reg       busy,
    output reg       done
);

    reg [3:0] A;
    reg [3:0] B;
    reg [7:0] P;
    reg [2:0] count;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            A       <= 4'b0000;
            B       <= 4'b0000;
            P       <= 8'b00000000;
            count   <= 3'b000;
            product <= 8'b00000000;
            busy    <= 1'b0;
            done    <= 1'b0;
        end

        else begin

            done <= 1'b0;

            // Start multiplication
            if (start && !busy) begin

                A     <= multiplicand;
                B     <= multiplier;
                P     <= 8'b00000000;
                count <= 3'b000;

                busy <= 1'b1;

            end

            // Multiplication process
            else if (busy) begin

                // Add multiplicand when multiplier LSB is 1
                if (B[0])
                    P <= P + {4'b0000, A};

                // Shift multiplicand left
                A <= A << 1;

                // Shift multiplier right
                B <= B >> 1;

                count <= count + 1'b1;

                // Complete after 4 iterations
                if (count == 3) begin

                    if (B[0])
                        product <= P + {4'b0000, A};
                    else
                        product <= P;

                    busy <= 1'b0;
                    done <= 1'b1;

                end

            end

        end

    end

endmodule
`timescale 1ns/1ps

module sequential_multiplier (
    input        clk,
    input        reset,
    input        start,
    input  [3:0]  multiplicand,
    input  [3:0]  multiplier,
    output reg [7:0] product,
    output reg       busy,
    output reg       done
);

    reg [3:0] A;
    reg [3:0] B;
    reg [7:0] P;
    reg [2:0] count;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            A       <= 4'b0000;
            B       <= 4'b0000;
            P       <= 8'b00000000;
            count   <= 3'b000;
            product <= 8'b00000000;
            busy    <= 1'b0;
            done    <= 1'b0;
        end

        else begin

            done <= 1'b0;

            // Start multiplication
            if (start && !busy) begin

                A     <= multiplicand;
                B     <= multiplier;
                P     <= 8'b00000000;
                count <= 3'b000;

                busy <= 1'b1;

            end

            // Multiplication process
            else if (busy) begin

                // Add multiplicand when multiplier LSB is 1
                if (B[0])
                    P <= P + {4'b0000, A};

                // Shift multiplicand left
                A <= A << 1;

                // Shift multiplier right
                B <= B >> 1;

                count <= count + 1'b1;

                // Complete after 4 iterations
                if (count == 3) begin

                    if (B[0])
                        product <= P + {4'b0000, A};
                    else
                        product <= P;

                    busy <= 1'b0;
                    done <= 1'b1;

                end

            end

        end

    end

endmodule
