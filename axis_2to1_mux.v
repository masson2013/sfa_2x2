`timescale 1 ns / 1 ps

module axis_2to1_mux (
  input   wire            CONF      ,

  output  reg             sA_tready ,
  input   wire            sA_tvalid ,
  input   wire  [31 : 0]  sA_tdata  ,

  output  reg             sB_tready ,
  input   wire            sB_tvalid ,
  input   wire  [31 : 0]  sB_tdata  ,

  input   wire            mi_tready ,
  output  reg             mi_tvalid ,
  output  reg    [31 : 0] mi_tdata
);

always @(CONF or sA_tvalid or sA_tdata  or sB_tvalid or sB_tdata  or mi_tready)
begin
  case (CONF)
    1'b0: begin
      sA_tready = mi_tready ;
      sB_tready = 1'b0      ;
      mi_tvalid = sA_tvalid ;
      mi_tdata  = sA_tdata  ;
    end

    1'b1: begin
      sA_tready = 1'b0      ;
      sB_tready = mi_tready ;
      mi_tvalid = sB_tvalid ;
      mi_tdata  = sB_tdata  ;
    end
  endcase
end
endmodule
