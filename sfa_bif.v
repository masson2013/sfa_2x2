`timescale 1 ns / 1 ps

module sfa_bif(

  output wire             bram_clk      ,
  output wire             bram_rst      ,
  output wire             bram_en       ,
  output wire  [ 3 : 0]   bram_we       ,
  output wire  [31 : 0]   bram_addr     ,
  output wire  [31 : 0]   bram_din      ,
  input  wire  [31 : 0]   bram_dout     ,

  output wire             sBIR_tready   ,
  input  wire             sBIR_tvalid   ,
  input  wire  [31 : 0]   sBIR_tdata    ,

  input  wire             mBIF_tready   ,
  output wire             mBIF_tvalid   ,
  output wire  [31 : 0]   mBIF_tdata    ,

  input  wire             BIF_EN        ,
  input  wire  [15 : 0]   INDEX         ,
  input  wire  [15 : 0]   SIZE          ,
  input  wire  [15 : 0]   STRIDE        ,
  input  wire             MODE          ,

  input  wire             ACLK          ,
  input  wire             ARESETN

);

         reg   [31 : 0]   rbram_addr    ;
         reg   [31 : 0]   rbram_din     ;
         reg   [31 : 0]   rbram_dout    ;

         reg   [15 : 0]   rINDEX        ;
         reg   [15 : 0]   rSIZE         ;
         reg   [15 : 0]   rSTRIDE       ;
         reg   [15 : 0]   rMODE         ;
         reg   [15 : 0]   i             ;
         reg   [ 4 : 0]   state         ;

localparam Fetch           = 5'b10000; // 16
localparam BRAM_READ       = 5'b01000; // 8
localparam AXIs_SEND       = 5'b00100; // 4
localparam BRAM_WRITE      = 5'b00010; // 2
localparam AXIs_Receive    = 5'b00001; // 1

assign bram_clk            = ACLK       ;
assign bram_rst            = ~ARESETN   ;
assign bram_addr           = rbram_addr ;
assign bram_din            = rbram_din  ;
assign mBIF_tdata          = rbram_dout ;

assign mBIF_tvalid         = (state == AXIs_SEND) ;
assign sBIR_tready         = (state == AXIs_Receive);
assign bram_we             = (state == BRAM_WRITE) ? 4'b1111 : 4'b0000;
assign bram_en             = (state == Fetch || state == BRAM_READ || state == AXIs_SEND || state == BRAM_WRITE);

always @(posedge ACLK)
begin
  if(!ARESETN) begin
    i          <= 16'b0  ;
    rbram_addr <= 32'b0  ;
    rbram_din  <= 32'b0  ;
    state      <= Fetch  ;
  end
  else begin
    case (state)
      Fetch: begin
        if (BIF_EN) begin
          i           <= INDEX;
          rbram_addr  <= INDEX;
          if (!MODE) begin
            state       <= BRAM_READ;
          end
          else begin
            state       <= AXIs_Receive;
          end
        end
        else begin
          state         <= Fetch;
        end
      end

      BRAM_READ: begin
        if (i < INDEX + SIZE * 4) begin
            rbram_dout <= bram_dout;
            i          <= i + STRIDE * 4;
            state      <= AXIs_SEND;
        end
        else begin
          state      <= Fetch;
        end
      end

      AXIs_SEND: begin
        if (mBIF_tready == 1) begin
          rbram_addr <= i;
          state <= BRAM_READ;
        end
        else begin
          state <= AXIs_SEND;
        end
      end

      AXIs_Receive: begin
        if (i < INDEX + SIZE * 4) begin
          rbram_addr <= i;
          if (sBIR_tvalid == 1) begin
            rbram_din <= sBIR_tdata;
            i         <= i + STRIDE * 4;
            state     <= BRAM_WRITE;
          end
          else begin
            state <= AXIs_Receive;
          end
        end
        else begin
          state <= Fetch;
        end
      end

      BRAM_WRITE: begin
        state <= AXIs_Receive;
      end
    endcase
  end
end

endmodule
