`timescale 1 ns / 1 ps

module sfa_vadd (
  input   wire  [15 : 0]  PR_SIZE     ,

  output  wire            sCMD_tready ,
  input   wire            sCMD_tvalid ,
  input   wire  [31 : 0]  sCMD_tdata  ,

  input   wire            mRet_tready ,
  output  wire            mRet_tvalid ,
  output  wire  [31 : 0]  mRet_tdata  ,

  output  wire            sIn1_tready ,
  input   wire            sIn1_tvalid ,
  input   wire  [31 : 0]  sIn1_tdata  ,

  output  wire            sIn2_tready ,
  input   wire            sIn2_tvalid ,
  input   wire  [31 : 0]  sIn2_tdata  ,

  input   wire            mOut_tready ,
  output  wire            mOut_tvalid ,
  output  wire   [31 : 0] mOut_tdata  ,

  input  wire             ACLK        ,
  input  wire             ARESETN

);

  localparam Fetch           = 5'b10000; // 16
  localparam Decode          = 5'b01000; // 8
  localparam Addition        = 5'b00100; // 4
  localparam AXIs_SEND       = 5'b00010; // 2
  localparam Write_Back      = 5'b00001; // 1

  reg [ 4 : 0] state       ;
  reg [31 : 0] instruction ;
  reg [31 : 0] ret         ;
  reg [31 : 0] ValueA      ;
  reg [31 : 0] ValueB      ;
  reg [31 : 0] ValueC      ;

  reg [15 : 0] i           ;

  // reg r_sIn1_tready;
  // reg r_sIn2_tready;

  // assign sIn1_tready = r_sIn1_tready;
  // assign sIn2_tready = r_sIn2_tready;

  assign sCMD_tready   = (state == Fetch)      ;
  assign sIn1_tready   = mOut_tready;
  assign sIn2_tready   = mOut_tready;
  assign mRet_tvalid   = (state == Write_Back) ;
  assign mOut_tdata    = ValueC                ;
  assign mOut_tvalid   = (state == AXIs_SEND)  ;
  assign mRet_tdata    = ret                   ;


  always @(posedge ACLK)
  begin
    if(!ARESETN) begin
      // r_sIn1_tready = 0;
      // r_sIn2_tready = 0;
      state <= Fetch;
    end
    else begin
      case (state)
        Fetch: begin // 16
          if (sCMD_tvalid == 1) begin
            i            <= 16'd0;
            instruction  <= sCMD_tdata;
            state        <= Decode;
          end
          else begin
            state        <= Fetch;
          end
        end


        Decode: begin // 8
          if (instruction == 32'd1) begin
            if (i < PR_SIZE) begin
              // r_sIn1_tready <= 1;
              // r_sIn2_tready <= 1;
              if (sIn1_tvalid == 1 && sIn2_tvalid == 1) begin
                ValueC <= sIn1_tdata + sIn2_tdata;
                i      <= i + 1           ;
                state  <= AXIs_SEND;
              end
              else begin
                state  <= Decode    ;
              end
            end
            else begin
              // r_sIn1_tready <= 0;
              // r_sIn2_tready <= 0;
              ret      <= 32'd10    ;
              state    <= Write_Back;
            end
          end
          else begin
            state      <= Fetch     ;
          end
        end

        // Addition: begin
        //   ValueC <= ValueA + ValueB ;
        //   i      <= i + 1           ;
        //   state  <= AXIs_SEND       ;
        // end

        AXIs_SEND: begin // 2
          if (mOut_tready == 1) begin
            state <= Decode;
          end
          else begin
            state <= AXIs_SEND;
          end
        end

        Write_Back: begin
          if (mRet_tready == 1) begin
            state        <= Fetch;
          end
          else begin
            state        <= Write_Back;
          end
        end
      endcase
    end
  end

endmodule
