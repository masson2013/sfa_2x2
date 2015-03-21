`timescale 1 ns / 1 ps

module axis_2to1_mux (
  input   wire            CONF      ,

  output  wire            sA_tready ,
  input   wire            sA_tvalid ,
  input   wire  [31 : 0]  sA_tdata  ,

  output  wire            sB_tready ,
  input   wire            sB_tvalid ,
  input   wire  [31 : 0]  sB_tdata  ,

  input   wire            mi_tready ,
  output  wire            mi_tvalid , // why reg? change to wire
  output  wire   [31 : 0] mi_tdata    // why reg? change to wire
);

assign mi_tdata  = (CONF == 0) ? sA_tdata  : sB_tdata  ;
assign mi_tvalid = (CONF == 0) ? sA_tvalid : sB_tvalid ;

assign sA_tready = (CONF == 0) ? mi_tready : 1'bz      ;
assign sB_tready = (CONF == 1) ? mi_tready : 1'bz      ;

endmodule
