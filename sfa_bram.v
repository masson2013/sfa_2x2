`timescale 1 ns / 1 ps

module sfa_bram #
(
  parameter integer INITIAL_VALUE  = 0
)
(
  input  wire             bram_en       ,
  input  wire  [ 3 : 0]   bram_we       ,
  input  wire  [31 : 0]   bram_addr     ,
  input  wire  [31 : 0]   bram_din      ,
  output reg   [31 : 0]   bram_dout     ,

  input  wire             bram_clk      ,
  input  wire             bram_rst
);

localparam SIZE = 100;

reg [31 : 0] RAM [0 : SIZE - 1];

initial begin: ram_initial
  integer i;
  for (i = 0; i < SIZE - 1; i = i + 1)
  begin
    RAM[i] = INITIAL_VALUE + i / 4;
  end
end

always @(bram_clk) begin
  if (!bram_rst) begin
    if (bram_en) begin
      bram_dout <= RAM[bram_addr];
    end
    else begin
      bram_dout <= 32'bz;
    end
  end
  else begin
    bram_dout <= 32'bz;
  end
end

always @(bram_clk) begin
  if (!bram_rst) begin
    if (bram_en) begin
      if (bram_we == 4'b1111) begin
        RAM[bram_addr] <= bram_din;
      end
    end
  end
end

endmodule
