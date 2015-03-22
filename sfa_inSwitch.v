`timescale 1 ns / 1 ps

module sfa_inSwitch (
  input   wire  [ 1 : 0]  CONF      ,

  output  reg             sn_tready ,
  input   wire            sn_tvalid ,
  input   wire  [31 : 0]  sn_tdata  ,

  output  reg             se_tready ,
  input   wire            se_tvalid ,
  input   wire  [31 : 0]  se_tdata  ,

  output  reg             ss_tready ,
  input   wire            ss_tvalid ,
  input   wire  [31 : 0]  ss_tdata  ,

  output  reg             sw_tready ,
  input   wire            sw_tvalid ,
  input   wire  [31 : 0]  sw_tdata  ,

  input   wire            mi_tready ,
  output  reg             mi_tvalid ,
  output  reg   [31 : 0]  mi_tdata
);

// assign mi_tdata  =  (CONF == 0) ? sn_tdata  :
//                     (CONF == 1) ? se_tdata  :
//                     (CONF == 2) ? ss_tdata  : sw_tdata ;

// assign mi_tvalid =  (CONF == 0) ? sn_tvalid :
//                     (CONF == 1) ? se_tvalid :
//                     (CONF == 2) ? ss_tvalid : sw_tvalid ;

// assign sn_tready = mi_tready;
// assign se_tready = mi_tready;
// assign ss_tready = mi_tready;
// assign sw_tready = mi_tready;


always @(CONF or sn_tvalid or sn_tdata  or se_tvalid or se_tdata  or ss_tvalid or ss_tdata  or sw_tvalid or sw_tdata  or mi_tready)
begin

  case (CONF)
    2'b00: begin
      mi_tvalid = sn_tvalid ;
      mi_tdata  = sn_tdata  ;
      sn_tready = mi_tready ;
      se_tready = 1'b0      ;
      ss_tready = 1'b0      ;
      sw_tready = 1'b0      ;
    end

    2'b01: begin
      mi_tvalid = se_tvalid ;
      mi_tdata  = se_tdata  ;
      sn_tready = 1'b0      ;
      se_tready = mi_tready ;
      ss_tready = 1'b0      ;
      sw_tready = 1'b0      ;
    end

    2'b10: begin
      mi_tvalid = ss_tvalid ;
      mi_tdata  = ss_tdata  ;
      sn_tready = 1'b0      ;
      se_tready = 1'b0      ;
      ss_tready = mi_tready ;
      sw_tready = 1'b0      ;
    end

    2'b11: begin
      mi_tvalid = sw_tvalid ;
      mi_tdata  = sw_tdata  ;
      sn_tready = 1'b0      ;
      se_tready = 1'b0      ;
      ss_tready = 1'b0      ;
      sw_tready = mi_tready ;
    end
  endcase
end

endmodule
