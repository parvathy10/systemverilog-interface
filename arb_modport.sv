interface arb_if (
    input bit clk // Clock input
);
    logic [1:0] request, grant; // Internal signals
    bit reset; // Reset signal

    // Modport defines the direction of signals for DUT
    modport arb (
        input request, reset, clk, // Inputs to DUT
        output grant // Output from DUT
    ); // Signals for DUT

    // Modport defines the direction of signals for testbench
    modport arb_tb (
        input grant, clk, // Inputs to testbench
        output request, reset // Outputs from testbench
    ); // Signals for testbench

    // Modport defines the direction of signals for monitor
    modport arb_monitor (
        input request, reset, clk, // Inputs to monitor
        input grant // Input from monitor
    ); // Signals for monitor
endinterface

