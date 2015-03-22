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

  input  wire  [15 : 0]   INDEX         ,
  input  wire  [15 : 0]   SIZE          ,
  input  wire  [15 : 0]   STRIDE        ,
  input  wire             MODE          ,
  input  wire             BIF_EN        ,

  input  wire             ACLK          ,
  input  wire             ARESETN

);

         reg   [31 : 0]   rbram_addr    ;
         reg   [31 : 0]   rbram_din     ;
         // reg   [31 : 0]   rbram_dout    ;

         // reg   [15 : 0]   rINDEX        ;
         // reg   [15 : 0]   rSIZE         ;
         // reg   [15 : 0]   rSTRIDE       ;
         // reg   [15 : 0]   rMODE         ;
         reg   [15 : 0]   i             ;
         reg   [ 5 : 0]   state         ;

//localparam Code_Start      = 6'b100000; // 32
localparam Fetch           = 6'b010000; // 16
localparam BRAM_READ       = 6'b001000; // 8
localparam AXIs_SEND       = 6'b000100; // 4
localparam BRAM_WRITE      = 6'b000010; // 2
localparam AXIs_Receive    = 6'b000001; // 1

assign bram_clk            = ACLK       ;
assign bram_rst            = ~ARESETN   ;
assign bram_addr           = rbram_addr ;
assign bram_din            = rbram_din  ;
assign mBIF_tdata          = bram_dout  ;

assign mBIF_tvalid         = (state == AXIs_SEND) ;
assign sBIR_tready         = (state == AXIs_Receive);
assign bram_we             = (state == BRAM_WRITE) ? 4'b1111 : 4'b0000;
assign bram_en             = (state == Fetch || state == BRAM_READ || state == AXIs_SEND || state == BRAM_WRITE);


always @(posedge ACLK)
begin
  if(!ARESETN) begin
    i          <= 16'bz  ;
    rbram_addr <= 32'bz  ;
    rbram_din  <= 32'bz  ;
    state      <= Fetch  ;
  end
  else begin
    case (state)
      Fetch: begin
      i <= INDEX;
      rbram_addr  <= INDEX;
        if (BIF_EN) begin
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

      BRAM_READ: begin // 8
        if (i < INDEX + SIZE * 4) begin
            // rbram_dout <= bram_dout;
            i          <= i + STRIDE * 4;
            // if (i == INDEX) begin
            //   state <= Code_Start;
            // end
            // else begin
              state      <= AXIs_SEND;
            // end
        end
        else begin
          state      <= Fetch;
        end
      end

      // Code_Start: begin // 32
      //   rbram_addr <= i;
      //   state <= BRAM_READ;
      // end

      AXIs_SEND: begin // 4
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
