module monitor (arb_if arbif);
    // Always block triggered on the positive edge of arbif.clk
    always @(posedge arbif.clk) begin
        // Check if request signal is asserted
        if (arbif.request)
            // Display message indicating that request signal is asserted
            $display("@%0d: request %0b asserted", $time, arbif.request);
        
        // Check if grant signal is asserted
        if (arbif.grant)
            // Display message indicating that grant signal is asserted
            $display("@%0d: grant %0b asserted", $time, arbif.grant);
    end
endmodule

