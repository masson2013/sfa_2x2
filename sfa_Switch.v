`timescale 1 ns / 1 ps

module sfa_Switch(
  // inSwitch
  output  wire            sn_tready     ,
  input   wire            sn_tvalid     ,
  input   wire  [31 : 0]  sn_tdata      ,

  output  wire            se_tready     ,
  input   wire            se_tvalid     ,
  input   wire  [31 : 0]  se_tdata      ,

  output  wire            ss_tready     ,
  input   wire            ss_tvalid     ,
  input   wire  [31 : 0]  ss_tdata      ,

  output  wire            sw_tready     ,
  input   wire            sw_tvalid     ,
  input   wire  [31 : 0]  sw_tdata      ,

  // OutSwitch
  input   wire            mn_tready     ,
  output  wire            mn_tvalid     ,
  output  wire  [31 : 0]  mn_tdata      ,

  input   wire            me_tready     ,
  output  wire            me_tvalid     ,
  output  wire  [31 : 0]  me_tdata      ,

  input   wire            ms_tready     ,
  output  wire            ms_tvalid     ,
  output  wire  [31 : 0]  ms_tdata      ,

  input   wire            mw_tready     ,
  output  wire            mw_tvalid     ,
  output  wire  [31 : 0]  mw_tdata      ,

  // PR Intrface
  output  wire  [15 : 0]  PR_SIZE       ,

  input   wire            mIn1_tready   ,
  output  wire            mIn1_tvalid   ,
  output  wire  [31 : 0]  mIn1_tdata    ,

  input   wire            mIn2_tready   ,
  output  wire            mIn2_tvalid   ,
  output  wire  [31 : 0]  mIn2_tdata    ,

  output  wire            sOut_tready   ,
  input   wire            sOut_tvalid   ,
  input   wire  [31 : 0]  sOut_tdata    ,

  // Control
  output  wire            sCMD_tready   ,
  input   wire            sCMD_tvalid   ,
  input   wire  [31 : 0]  sCMD_tdata    ,

  input   wire            mRet_tready   ,
  output  wire            mRet_tvalid   ,
  output  wire  [31 : 0]  mRet_tdata    ,

  output  wire            sPRRet_tready ,
  input   wire            sPRRet_tvalid ,
  input   wire  [31 : 0]  sPRRet_tdata  ,

  input   wire            mPRCMD_tready ,
  output  wire            mPRCMD_tvalid ,
  output  wire  [31 : 0]  mPRCMD_tdata  ,

  // BIF
  output  wire            BC1_EN        ,
  output  wire  [15 : 0]  BC1_INDEX     ,
  output  wire  [15 : 0]  BC1_SIZE      ,
  output  wire  [15 : 0]  BC1_STRIDE    ,
  output  wire            BC1_MODE      ,

  output  wire            BC2_EN        ,
  output  wire  [15 : 0]  BC2_INDEX     ,
  output  wire  [15 : 0]  BC2_SIZE      ,
  output  wire  [15 : 0]  BC2_STRIDE    ,
  output  wire            BC2_MODE      ,

  input   wire            ACLK          ,
  input   wire            ARESETN
);
/////////////////////////////////////////
          wire  [ 1 : 0]  IN1CONF       ;
          wire  [ 1 : 0]  IN2CONF       ;
          wire            MUXCONF       ;
          wire  [ 1 : 0]  OUTCONF       ;
/////////////////////////////////////////
          wire            mi_tready_tmp ;
/////////////////////////////////////////
          wire            In1_mi_tready ;
          wire            In1_mi_tvalid ;
          wire  [31 : 0]  In1_mi_tdata  ;
/////////////////////////////////////////
          wire            In2_mi_tready ;
          wire            In2_mi_tvalid ;
          wire  [31 : 0]  In2_mi_tdata  ;
/////////////////////////////////////////
          wire            mux_mi_tready ;
          wire            mux_mi_tvalid ;
          wire   [31 : 0] mux_mi_tdata  ;
/////////////////////////////////////////

assign    mIn1_tvalid   = In1_mi_tvalid ;
assign    mIn1_tdata    = In1_mi_tdata  ;

assign    mIn2_tvalid   = In2_mi_tvalid ;
assign    mIn2_tdata    = In2_mi_tdata  ;

assign    mi_tready_tmp = MUXCONF ? mIn1_tready : In1_mi_tready;
assign    In2_mi_tready = mIn2_tready;

sfa_control u_Control(
  .sCMD_tready    (sCMD_tready    ) ,
  .sCMD_tvalid    (sCMD_tvalid    ) ,
  .sCMD_tdata     (sCMD_tdata     ) ,
  .mRet_tready    (mRet_tready    ) ,
  .mRet_tvalid    (mRet_tvalid    ) ,
  .mRet_tdata     (mRet_tdata     ) ,
  .sPRRet_tready  (sPRRet_tready  ) ,
  .sPRRet_tvalid  (sPRRet_tvalid  ) ,
  .sPRRet_tdata   (sPRRet_tdata   ) ,
  .mPRCMD_tready  (mPRCMD_tready  ) ,
  .mPRCMD_tvalid  (mPRCMD_tvalid  ) ,
  .mPRCMD_tdata   (mPRCMD_tdata   ) ,
  .BC1_EN         (BC1_EN         ) ,
  .BC1_INDEX      (BC1_INDEX      ) ,
  .BC1_SIZE       (BC1_SIZE       ) ,
  .BC1_STRIDE     (BC1_STRIDE     ) ,
  .BC1_MODE       (BC1_MODE       ) ,
  .BC2_EN         (BC2_EN         ) ,
  .BC2_INDEX      (BC2_INDEX      ) ,
  .BC2_SIZE       (BC2_SIZE       ) ,
  .BC2_STRIDE     (BC2_STRIDE     ) ,
  .BC2_MODE       (BC2_MODE       ) ,
  .PR_SIZE        (PR_SIZE        ) ,
  .IN1CONF        (IN1CONF        ) ,
  .IN2CONF        (IN2CONF        ) ,
  .MUXCONF        (MUXCONF        ) ,
  .OUTCONF        (OUTCONF        ) ,
  .ACLK           (ACLK           ) ,
  .ARESETN        (ARESETN        )
);

assign sn_tready = In2_sn_tready | In1_sn_tready;
assign se_tready = In2_se_tready | In1_se_tready;
assign ss_tready = In2_ss_tready | In1_ss_tready;
assign sw_tready = In2_sw_tready | In1_sw_tready;

sfa_inSwitch u_inSwitch_In1(
  .CONF           (IN1CONF        ) ,
  .sn_tready      (In1_sn_tready  ) ,
  .sn_tvalid      (sn_tvalid      ) ,
  .sn_tdata       (sn_tdata       ) ,
  .se_tready      (In1_se_tready  ) ,
  .se_tvalid      (se_tvalid      ) ,
  .se_tdata       (se_tdata       ) ,
  .ss_tready      (In1_ss_tready  ) ,
  .ss_tvalid      (ss_tvalid      ) ,
  .ss_tdata       (ss_tdata       ) ,
  .sw_tready      (In1_sw_tready  ) ,
  .sw_tvalid      (sw_tvalid      ) ,
  .sw_tdata       (sw_tdata       ) ,
  .mi_tready      (mi_tready_tmp  ) ,
  .mi_tvalid      (In1_mi_tvalid  ) ,
  .mi_tdata       (In1_mi_tdata   )
);

sfa_inSwitch u_inSwitch_In2(
  .CONF           (IN2CONF        ) ,
  .sn_tready      (In2_sn_tready  ) ,
  .sn_tvalid      (sn_tvalid      ) ,
  .sn_tdata       (sn_tdata       ) ,
  .se_tready      (In2_se_tready  ) ,
  .se_tvalid      (se_tvalid      ) ,
  .se_tdata       (se_tdata       ) ,
  .ss_tready      (In2_ss_tready  ) ,
  .ss_tvalid      (ss_tvalid      ) ,
  .ss_tdata       (ss_tdata       ) ,
  .sw_tready      (In2_sw_tready  ) ,
  .sw_tvalid      (sw_tvalid      ) ,
  .sw_tdata       (sw_tdata       ) ,
  .mi_tready      (In2_mi_tready  ) ,
  .mi_tvalid      (In2_mi_tvalid  ) ,
  .mi_tdata       (In2_mi_tdata   )
);

axis_2to1_mux u_MUX(
  .CONF            (MUXCONF       ) ,
  .sA_tready       (In1_mi_tready ) ,
  .sA_tvalid       (In1_mi_tvalid ) ,
  .sA_tdata        (In1_mi_tdata  ) ,
  .sB_tready       (sOut_tready   ) ,
  .sB_tvalid       (sOut_tvalid   ) ,
  .sB_tdata        (sOut_tdata    ) ,
  .mi_tready       (mux_mi_tready ) ,
  .mi_tvalid       (mux_mi_tvalid ) ,
  .mi_tdata        (mux_mi_tdata  )
);

sfa_outSwitch u_outSwitch(
  .CONF            (OUTCONF       ) ,
  .si_tready       (mux_mi_tready ) ,
  .si_tvalid       (mux_mi_tvalid ) ,
  .si_tdata        (mux_mi_tdata  ) ,
  .mn_tready       (mn_tready     ) ,
  .mn_tvalid       (mn_tvalid     ) ,
  .mn_tdata        (mn_tdata      ) ,
  .me_tready       (me_tready     ) ,
  .me_tvalid       (me_tvalid     ) ,
  .me_tdata        (me_tdata      ) ,
  .ms_tready       (ms_tready     ) ,
  .ms_tvalid       (ms_tvalid     ) ,
  .ms_tdata        (ms_tdata      ) ,
  .mw_tready       (mw_tready     ) ,
  .mw_tvalid       (mw_tvalid     ) ,
  .mw_tdata        (mw_tdata      )
);

endmodule
