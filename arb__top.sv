module top;
    // Clock signal declaration and initialization
    bit clk = 1'b0;
    // Clock toggling every 5 time units
    always #5 clk = ~clk;

    // Instantiation of arb_if interface
    arb_if arbif(clk);
    // Instantiation of arb module with the arb_if interface instance
    arb a1(arbif);
    // Instantiation of test module with the arb_if interface instance
    test t1(arbif);
    // Instantiation of monitor module with the arb_if interface instance
    monitor m1(arbif);
endmodule

