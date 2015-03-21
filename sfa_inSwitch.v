`timescale 1 ns / 1 ps

module sfa_inSwitch (
  input   wire  [ 1 : 0]  CONF      ,

  output  wire            sn_tready ,
  input   wire            sn_tvalid ,
  input   wire  [31 : 0]  sn_tdata  ,

  output  wire            se_tready ,
  input   wire            se_tvalid ,
  input   wire  [31 : 0]  se_tdata  ,

  output  wire            ss_tready ,
  input   wire            ss_tvalid ,
  input   wire  [31 : 0]  ss_tdata  ,

  output  wire            sw_tready ,
  input   wire            sw_tvalid ,
  input   wire  [31 : 0]  sw_tdata  ,

  input   wire            mi_tready ,
  output  wire            mi_tvalid ,
  output  wire  [31 : 0]  mi_tdata
);

assign mi_tdata  =  (CONF == 0) ? sn_tdata  :
                    (CONF == 1) ? se_tdata  :
                    (CONF == 2) ? ss_tdata  : sw_tdata ;

assign mi_tvalid =  (CONF == 0) ? sn_tvalid :
                    (CONF == 1) ? se_tvalid :
                    (CONF == 2) ? ss_tvalid : sw_tvalid ;

assign sn_tready = mi_tready;
assign se_tready = mi_tready;
assign ss_tready = mi_tready;
assign sw_tready = mi_tready;

endmodule
