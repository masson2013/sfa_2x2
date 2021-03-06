`timescale 1 ns / 1 ps
module sfa_outSwitch (
  input   wire  [ 0 : 1]   CONF      ,

  output  wire              si_tready ,
  input   wire             si_tvalid ,
  input   wire  [31 : 0]   si_tdata  ,

  input   wire             mn_tready ,
  output  wire              mn_tvalid ,
  output  wire    [31 : 0]  mn_tdata  ,

  input   wire             me_tready ,
  output  wire              me_tvalid ,
  output  wire    [31 : 0]  me_tdata  ,

  input   wire             ms_tready ,
  output  wire              ms_tvalid ,
  output  wire    [31 : 0]  ms_tdata  ,

  input   wire             mw_tready ,
  output  wire              mw_tvalid ,
  output  wire    [31 : 0]  mw_tdata
);
  assign si_tready = CONF[1] ? (CONF[0] ? (mw_tready) : (ms_tready)) : (CONF[0] ? (me_tready) : (mn_tready));

  assign mn_tvalid = (CONF == 2'h00) ? si_tvalid : 1'b0;
  assign me_tvalid = (CONF == 2'h01) ? si_tvalid : 1'b0;
  assign ms_tvalid = (CONF == 2'h10) ? si_tvalid : 1'b0;
  assign mw_tvalid = (CONF == 2'h11) ? si_tvalid : 1'b0;

  assign mn_tdata = (CONF == 2'h00) ? si_tdata : 32'b0;
  assign me_tdata = (CONF == 2'h01) ? si_tdata : 32'b0;
  assign ms_tdata = (CONF == 2'h10) ? si_tdata : 32'b0;
  assign mw_tdata = (CONF == 2'h11) ? si_tdata : 32'b0;
endmodule
/*
module sfa_outSwitch (
  input   wire  [ 0 : 1]   CONF      ,

  output  reg              si_tready ,
  input   wire             si_tvalid ,
  input   wire  [31 : 0]   si_tdata  ,

  input   wire             mn_tready ,
  output  reg              mn_tvalid ,
  output  reg    [31 : 0]  mn_tdata  ,

  input   wire             me_tready ,
  output  reg              me_tvalid ,
  output  reg    [31 : 0]  me_tdata  ,

  input   wire             ms_tready ,
  output  reg              ms_tvalid ,
  output  reg    [31 : 0]  ms_tdata  ,

  input   wire             mw_tready ,
  output  reg              mw_tvalid ,
  output  reg    [31 : 0]  mw_tdata
);

always @(CONF or mn_tready or me_tready or ms_tready or mw_tready)
begin
  case (CONF)
    2'b00: begin
      si_tready = mn_tready ;
    end

    2'b01: begin
      si_tready = me_tready ;
    end

    2'b10: begin
      si_tready = ms_tready ;
    end

    2'b11: begin
      si_tready = mw_tready ;
    end

    default: begin
      si_tready = 1'b0      ;
    end
  endcase
end

always @ (CONF or si_tdata or si_tvalid)
begin
  case (CONF)
    2'b00: begin
      mn_tvalid = si_tvalid ;
      mn_tdata  = si_tdata  ;
      me_tvalid =  1'b0     ;
      me_tdata  = 32'bz     ;
      ms_tvalid =  1'b0     ;
      ms_tdata  = 32'bz     ;
      mw_tvalid =  1'b0     ;
      mw_tdata  = 32'bz     ;
    end

    2'b01: begin
      mn_tvalid =  1'b0     ;
      mn_tdata  = 32'bz     ;
      me_tvalid = si_tvalid ;
      me_tdata  = si_tdata  ;
      ms_tvalid =  1'b0     ;
      ms_tdata  = 32'bz     ;
      mw_tvalid =  1'b0     ;
      mw_tdata  = 32'bz     ;
    end

    2'b10: begin
      mn_tvalid =  1'b0     ;
      mn_tdata  = 32'bz     ;
      me_tvalid =  1'b0     ;
      me_tdata  = 32'bz     ;
      ms_tvalid = si_tvalid ;
      ms_tdata  = si_tdata  ;
      mw_tvalid =  1'b0     ;
      mw_tdata  = 32'bz     ;
    end

    2'b11: begin
      mn_tvalid =  1'b0     ;
      mn_tdata  = 32'bz     ;
      me_tvalid =  1'b0     ;
      me_tdata  = 32'bz     ;
      ms_tvalid =  1'b0     ;
      ms_tdata  = 32'bz     ;
      mw_tvalid = si_tvalid ;
      mw_tdata  = si_tdata  ;
    end

    default: begin
      mn_tvalid = 32'b0     ;
      mn_tdata  = 32'bz     ;
      me_tvalid =  1'b0     ;
      me_tdata  = 32'bz     ;
      ms_tvalid =  1'b0     ;
      ms_tdata  = 32'bz     ;
      mw_tvalid =  1'b0     ;
      mw_tdata  = 32'bz     ;
    end
  endcase
end
endmodule
*/
