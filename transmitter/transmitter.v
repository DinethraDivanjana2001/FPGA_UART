module transmitter #(
    parameter CLOCKS_PER_PULSE = 16
)
(
    input logic [7:0] data_in,      // Input data to be transmitted
    input logic data_en,             // Data enable signal
    input logic clk,                 // System clock
    input logic rstn,                // Active low reset signal
    output logic tx,                 // Transmitted data output
    output logic tx_busy             // Transmission status output
);
    enum {TX_IDLE, TX_START, TX_DATA, TX_END} state; // Define transmission states
    
    logic [7:0] tx_data = 8'b0;       // Data to be transmitted
    logic [2:0] bit_counter = 3'b0;    // Bit counter to keep track of transmitted bits
