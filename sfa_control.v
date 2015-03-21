`timescale 1ns / 1ps

module sfa_control (
  output wire             sCMD_tready   ,
  input  wire             sCMD_tvalid   ,
  input  wire  [31 : 0]   sCMD_tdata    ,

  input  wire             mRet_tready   ,
  output wire             mRet_tvalid   ,
  output wire  [31 : 0]   mRet_tdata    ,

  output wire             sPRRet_tready ,
  input  wire             sPRRet_tvalid ,
  input  wire  [31 : 0]   sPRRet_tdata  ,

  input  wire             mPRCMD_tready ,
  output wire             mPRCMD_tvalid ,
  output wire  [31 : 0]   mPRCMD_tdata  ,

  output wire             BC1_EN        ,
  output wire  [15 : 0]   BC1_INDEX     ,
  output wire  [15 : 0]   BC1_SIZE      ,
  output wire  [15 : 0]   BC1_STRIDE    ,
  output wire             BC1_MODE      ,

  output wire             BC2_EN        ,
  output wire  [15 : 0]   BC2_INDEX     ,
  output wire  [15 : 0]   BC2_SIZE      ,
  output wire  [15 : 0]   BC2_STRIDE    ,
  output wire             BC2_MODE      ,

  output wire  [15 : 0]   PR_SIZE       ,

  output wire  [ 1 : 0]   IN1CONF       ,
  output wire  [ 1 : 0]   IN2CONF       ,
  output wire             MUXCONF       ,
  output wire  [ 1 : 0]   OUTCONF       ,

  input  wire             ACLK          ,
  input  wire             ARESETN
);


  localparam Fetch           = 6'b100000; // 32
  localparam Decode          = 6'b010000; // 16
  localparam VAMSET          = 6'b001000; // 08
  localparam VAMSTART        = 6'b000100; // 04
  localparam VAMDONE         = 6'b000010; // 02
  localparam Write_Back      = 6'b000001; // 01

  localparam VSET          = 16'h1;
  localparam VSTART        = 16'h3;
  localparam VDONE         = 16'h8;
  localparam VPR_SIZE      = 16'h10;
  localparam VBC1_INDEX    = 16'h11;
  localparam VBC1_SIZE     = 16'h12;
  localparam VBC1_STRIDE   = 16'h13;
  localparam VBC1_MODE     = 16'h14;
  localparam VBC2_INDEX    = 16'h21;
  localparam VBC2_SIZE     = 16'h22;
  localparam VBC2_STRIDE   = 16'h23;
  localparam VBC2_MODE     = 16'h24;

  reg [ 5:0] state       ;
  reg [31:0] instruction ;
  reg [31:0] ret         ;
  reg [31:0] rPRSTART    ;
  reg [31:0] rPRDONE     ;

  assign sCMD_tready   = (state == Fetch);
  assign mRet_tvalid   = (state == Write_Back);
  assign sPRRet_tready = (state == VAMDONE);
  assign mPRCMD_tvalid = (state == VAMSTART);
  assign BC1_EN        = (state == VAMSTART);
  assign BC2_EN        = (state == VAMSTART);

  assign mRet_tdata   = ret;
  assign mPRCMD_tdata = rPRSTART;

  // reg [15:0] OPCODE;
  reg [1:0]  rIN1;
  reg [1:0]  rIN2;
  reg        rMUX;
  reg [1:0]  rOUT;

  reg [15:0] rPR_SIZE    ;
  reg [15:0] rBC1_INDEX  ;
  reg [15:0] rBC1_SIZE   ;
  reg [15:0] rBC1_STRIDE ;
  reg        rBC1_MODE   ;
  reg [15:0] rBC2_INDEX  ;
  reg [15:0] rBC2_SIZE   ;
  reg [15:0] rBC2_STRIDE ;
  reg        rBC2_MODE   ;

  assign IN1CONF    = rIN1;
  assign IN2CONF    = rIN2;
  assign MUXCONF    = rMUX;
  assign OUTCONF    = rOUT;

  assign PR_SIZE    = rPR_SIZE   ;

  assign BC1_INDEX  = rBC1_INDEX ;
  assign BC1_SIZE   = rBC1_SIZE  ;
  assign BC1_STRIDE = rBC1_STRIDE;
  assign BC1_MODE   = rBC1_MODE  ;

  assign BC2_INDEX  = rBC2_INDEX ;
  assign BC2_SIZE   = rBC2_SIZE  ;
  assign BC2_STRIDE = rBC2_STRIDE;
  assign BC2_MODE   = rBC2_MODE  ;

  // assign OPCODE  = instruction[31:16];

  always @(posedge ACLK)
  begin
    if(!ARESETN) begin
      state <= Fetch;
    end
    else begin
      case (state)
        Fetch: begin
          if (sCMD_tvalid == 1) begin
            instruction  <= sCMD_tdata;
            state        <= Decode;
          end
          else begin
            state        <= Fetch;
          end
        end

        Decode: begin
          case (instruction[31:16])
            VSET        : state <= VAMSET;
            VSTART      : begin
              if (MUXCONF) begin
                rPRSTART <= 32'd1;
              end
              else begin
                rPRSTART <= 32'd0;
              end
              state <= VAMSTART;
            end
            VDONE       : state <= VAMDONE;
            VPR_SIZE  : begin
              rPR_SIZE    <= instruction[15:0];
              state       <= Fetch;
            end
            VBC1_INDEX  : begin
              rBC1_INDEX  <= instruction[15:0];
              state       <= Fetch;
            end
            VBC1_SIZE   : begin
              rBC1_SIZE   <= instruction[15:0];
              state       <= Fetch;
            end
            VBC1_STRIDE : begin
              rBC1_STRIDE <= instruction[15:0];
              state       <= Fetch;
            end
            VBC1_MODE : begin
              rBC1_MODE   <= instruction[0];
              state       <= Fetch;
            end
            VBC2_INDEX  : begin
              rBC2_INDEX  <= instruction[15:0];
              state       <= Fetch;
            end
            VBC2_SIZE   : begin
              rBC2_SIZE   <= instruction[15:0];
              state       <= Fetch;
            end
            VBC2_STRIDE : begin
              rBC2_STRIDE <= instruction[15:0];
              state       <= Fetch;
            end
            VBC2_MODE : begin
              rBC2_MODE   <= instruction[0];
              state       <= Fetch;
            end
            default: begin
              state       <= Fetch;
            end
          endcase
        end

        VAMSET: begin
          rIN1  <=  instruction[13:12] ;
          rIN2  <=  instruction[11:10] ;
          rMUX  <=  instruction[2]     ;
          rOUT  <=  instruction[1:0]   ;
          state <=  Fetch;
        end

        VAMSTART: begin
          if (MUXCONF) begin
            if(mPRCMD_tready == 1) begin
              state <= Fetch;
            end
            else begin
              state <= VAMSTART;
            end
          end
          else begin
            state <= Fetch;
          end
        end

        VAMDONE: begin
          if (sPRRet_tvalid == 1) begin
            rPRDONE <= sPRRet_tdata;
            ret     <= 32'd10      ;
            state   <= Write_Back  ;
          end
          else begin
            state <= VAMDONE;
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

