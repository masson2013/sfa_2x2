`timescale 1 ns / 1 ps

module sfa_outSwitch (
  input   wire  [ 0 : 1]   CONF      ,

  output  wire             si_tready ,
  input   wire             si_tvalid ,
  input   wire  [31 : 0]   si_tdata  ,

  input   wire             mn_tready ,
  output  wire             mn_tvalid ,
  output  wire   [31 : 0]  mn_tdata  ,

  input   wire             me_tready ,
  output  wire             me_tvalid ,
  output  wire   [31 : 0]  me_tdata  ,

  input   wire             ms_tready ,
  output  wire             ms_tvalid ,
  output  wire   [31 : 0]  ms_tdata  ,

  input   wire             mw_tready ,
  output  wire             mw_tvalid ,
  output  wire   [31 : 0]  mw_tdata
);

reg           r_si_tready  ;
reg           r_mn_tvalid  ;
reg [31 : 0]  r_mn_tdata   ;
reg           r_me_tvalid  ;
reg [31 : 0]  r_me_tdata   ;
reg           r_ms_tvalid  ;
reg [31 : 0]  r_ms_tdata   ;
reg           r_mw_tvalid  ;
reg [31 : 0]  r_mw_tdata   ;

assign si_tready = r_si_tready  ;
assign mn_tvalid = r_mn_tvalid  ;
assign mn_tdata  = r_mn_tdata   ;
assign me_tvalid = r_me_tvalid  ;
assign me_tdata  = r_me_tdata   ;
assign ms_tvalid = r_ms_tvalid  ;
assign ms_tdata  = r_ms_tdata   ;
assign mw_tvalid = r_mw_tvalid  ;
assign mw_tdata  = r_mw_tdata   ;

always @ (CONF or si_tdata or si_tvalid or mn_tready or me_tready or ms_tready or mw_tready)
begin
  case (CONF)
    2'b00: begin
      r_si_tready = mn_tready ;
      r_mn_tvalid = si_tvalid ;
      r_mn_tdata  = si_tdata  ;
      r_me_tvalid =  1'bz     ;
      r_me_tdata  = 32'bz     ;
      r_ms_tvalid =  1'bz     ;
      r_ms_tdata  = 32'bz     ;
      r_mw_tvalid =  1'bz     ;
      r_mw_tdata  = 32'bz     ;
    end

    2'b01: begin
      r_mn_tvalid =  1'bz     ;
      r_mn_tdata  = 32'bz     ;
      r_si_tready = me_tready ;
      r_me_tvalid = si_tvalid ;
      r_me_tdata  = si_tdata  ;
      r_ms_tvalid =  1'bz     ;
      r_ms_tdata  = 32'bz     ;
      r_mw_tvalid =  1'bz     ;
      r_mw_tdata  = 32'bz     ;
    end

    2'b10: begin
      r_mn_tvalid =  1'bz     ;
      r_mn_tdata  = 32'bz     ;
      r_me_tvalid =  1'bz     ;
      r_me_tdata  = 32'bz     ;
      r_si_tready = ms_tready ;
      r_ms_tvalid = si_tvalid ;
      r_ms_tdata  = si_tdata  ;
      r_mw_tvalid =  1'bz     ;
      r_mw_tdata  = 32'bz     ;
    end

    2'b11: begin
      r_mn_tvalid =  1'bz     ;
      r_mn_tdata  = 32'bz     ;
      r_me_tvalid =  1'bz     ;
      r_me_tdata  = 32'bz     ;
      r_ms_tvalid =  1'bz     ;
      r_ms_tdata  = 32'bz     ;
      r_si_tready = mw_tready ;
      r_mw_tvalid = si_tvalid ;
      r_mw_tdata  = si_tdata  ;
    end

    default: begin
      r_si_tready =  1'bz     ;
      r_mn_tvalid = 32'bz     ;
      r_mn_tdata  = 32'bz     ;
      r_me_tvalid =  1'bz     ;
      r_me_tdata  = 32'bz     ;
      r_ms_tvalid =  1'bz     ;
      r_ms_tdata  = 32'bz     ;
      r_mw_tvalid =  1'bz     ;
      r_mw_tdata  = 32'bz     ;
    end
  endcase
end
endmodule
