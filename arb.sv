module arb(arb_if intf);
  // Declare internal signals
  logic [1:0] grant;   // 2-bit grant signal
  logic [1:0] request; // 2-bit request signal
  
  always_ff @(posedge intf.clk) begin
    // Reset logic
    if (intf.reset) begin
      grant <= 2'b00; // Reset grant to '00'
    end
    else begin
      // Arbitration logic
      if (intf.request != 2'b00) begin
        // Grant the bus to the block requesting it
        grant <= intf.request;
      end
    end
  end

  // Assign output
  assign intf.grant = grant;
endmodule

