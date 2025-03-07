module binary_to_7seg ( 
    input logic [3:0] data_in,     // Input binary data
    output logic [6:0] data_out    // Output 7-segment data
);
    // Look-Up Table (LUT) to convert binary digits to 7-segment output
    // Input - 4 bits, output - 7 bits
    logic [15:0][6:0] lut_7seg;

    // Define 7-segment representations for binary digits
    // Output format: gfedcba
    assign lut_7seg[0] = 7'b0111111;    // 0
    assign lut_7seg[1] = 7'b0000110;    // 1
    assign lut_7seg[2] = 7'b1011011;    // 2
    assign lut_7seg[3] = 7'b1001111;    // 3
    assign lut_7seg[4] = 7'b1100110;    // 4
    assign lut_7seg[5] = 7'b1101101;    // 5
    assign lut_7seg[6] = 7'b1111101;    // 6
    assign lut_7seg[7] = 7'b0000111;    // 7
    assign lut_7seg[8] = 7'b1111111;    // 8
    assign lut_7seg[9] = 7'b1101111;    // 9
    assign lut_7seg[15:10] = 7'b0;      // Unused
    
    // Output the 7-segment representation for the input binary digit
    assign data_out = ~lut_7seg[data_in];
endmodule
