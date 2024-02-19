module test(
    arb_if arbif
);
    initial begin
        // Assert reset for 5 time units
        arbif.reset = 1'b1;
        #5;
        arbif.reset = 1'b0;

        // Wait for the next positive edge of the clock
        @(posedge arbif.clk);

        // Send request after the clock edge
        arbif.request <= 2'b11;
        $display("@%0d: Sent req=11", $time);

        // Wait for 4 clock cycles
        repeat (4) @(posedge arbif.clk);

        // Check if grant is not equal to 2'b00
        if (arbif.grant !== 2'b00)
            $display("@%0d: grant block no. = %0d", $time, arbif.grant);
    end
endmodule

