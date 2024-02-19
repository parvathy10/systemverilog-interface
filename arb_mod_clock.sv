interface arb_if(input bit clk);

    logic [1:0] grant, request; // Internal signals
    logic reset; // Reset signal

    // Clocking block definition
    clocking cb @(posedge clk);
        default input #1ns output #2ns;
        input grant;
        output request;
    endclocking

    // Modport definition for testbench
    modport test(output request, reset, input grant, clk);

    // Modport definition for DUT
    modport arb(input request, reset, clk, output grant);

    // Modport definition for monitor
    modport monitor(input request, grant, reset, clk);

endinterface


