`timescale 1 ns / 1 ps

module sfa_2x2(

  output wire             bif00_bram_clk         ,
  output wire             bif00_bram_rst         ,
  output wire             bif00_bram_en          ,
  output wire  [ 3 : 0]   bif00_bram_we          ,
  output wire  [31 : 0]   bif00_bram_addr        ,
  output wire  [31 : 0]   bif00_bram_din         ,
  input  wire  [31 : 0]   bif00_bram_dout        ,

  output wire             bif01_bram_clk         ,
  output wire             bif01_bram_rst         ,
  output wire             bif01_bram_en          ,
  output wire  [ 3 : 0]   bif01_bram_we          ,
  output wire  [31 : 0]   bif01_bram_addr        ,
  output wire  [31 : 0]   bif01_bram_din         ,
  input  wire  [31 : 0]   bif01_bram_dout        ,

  output wire             bif02_bram_clk         ,
  output wire             bif02_bram_rst         ,
  output wire             bif02_bram_en          ,
  output wire  [ 3 : 0]   bif02_bram_we          ,
  output wire  [31 : 0]   bif02_bram_addr        ,
  output wire  [31 : 0]   bif02_bram_din         ,
  input  wire  [31 : 0]   bif02_bram_dout        ,

  output wire             bif03_bram_clk         ,
  output wire             bif03_bram_rst         ,
  output wire             bif03_bram_en          ,
  output wire  [ 3 : 0]   bif03_bram_we          ,
  output wire  [31 : 0]   bif03_bram_addr        ,
  output wire  [31 : 0]   bif03_bram_din         ,
  input  wire  [31 : 0]   bif03_bram_dout        ,

  output wire             bif04_bram_clk         ,
  output wire             bif04_bram_rst         ,
  output wire             bif04_bram_en          ,
  output wire  [ 3 : 0]   bif04_bram_we          ,
  output wire  [31 : 0]   bif04_bram_addr        ,
  output wire  [31 : 0]   bif04_bram_din         ,
  input  wire  [31 : 0]   bif04_bram_dout        ,

  output wire             bif05_bram_clk         ,
  output wire             bif05_bram_rst         ,
  output wire             bif05_bram_en          ,
  output wire  [ 3 : 0]   bif05_bram_we          ,
  output wire  [31 : 0]   bif05_bram_addr        ,
  output wire  [31 : 0]   bif05_bram_din         ,
  input  wire  [31 : 0]   bif05_bram_dout        ,

  output wire             bif06_bram_clk         ,
  output wire             bif06_bram_rst         ,
  output wire             bif06_bram_en          ,
  output wire  [ 3 : 0]   bif06_bram_we          ,
  output wire  [31 : 0]   bif06_bram_addr        ,
  output wire  [31 : 0]   bif06_bram_din         ,
  input  wire  [31 : 0]   bif06_bram_dout        ,

  output wire             bif07_bram_clk         ,
  output wire             bif07_bram_rst         ,
  output wire             bif07_bram_en          ,
  output wire  [ 3 : 0]   bif07_bram_we          ,
  output wire  [31 : 0]   bif07_bram_addr        ,
  output wire  [31 : 0]   bif07_bram_din         ,
  input  wire  [31 : 0]   bif07_bram_dout        ,

  output wire  [15 : 0]   switch00_PR_SIZE       ,
  input  wire             switch00_mIn1_tready   ,
  output wire             switch00_mIn1_tvalid   ,
  output wire  [31 : 0]   switch00_mIn1_tdata    ,
  input  wire             switch00_mIn2_tready   ,
  output wire             switch00_mIn2_tvalid   ,
  output wire  [31 : 0]   switch00_mIn2_tdata    ,
  output wire             switch00_sOut_tready   ,
  input  wire             switch00_sOut_tvalid   ,
  input  wire  [31 : 0]   switch00_sOut_tdata    ,
  output wire             switch00_sCMD_tready   ,
  input  wire             switch00_sCMD_tvalid   ,
  input  wire  [31 : 0]   switch00_sCMD_tdata    ,
  input  wire             switch00_mRet_tready   ,
  output wire             switch00_mRet_tvalid   ,
  output wire  [31 : 0]   switch00_mRet_tdata    ,
  output wire             switch00_sPRRet_tready ,
  input  wire             switch00_sPRRet_tvalid ,
  input  wire  [31 : 0]   switch00_sPRRet_tdata  ,
  input  wire             switch00_mPRCMD_tready ,
  output wire             switch00_mPRCMD_tvalid ,
  output wire  [31 : 0]   switch00_mPRCMD_tdata  ,

  output wire  [15 : 0]   switch01_PR_SIZE       ,
  input  wire             switch01_mIn1_tready   ,
  output wire             switch01_mIn1_tvalid   ,
  output wire  [31 : 0]   switch01_mIn1_tdata    ,
  input  wire             switch01_mIn2_tready   ,
  output wire             switch01_mIn2_tvalid   ,
  output wire  [31 : 0]   switch01_mIn2_tdata    ,
  output wire             switch01_sOut_tready   ,
  input  wire             switch01_sOut_tvalid   ,
  input  wire  [31 : 0]   switch01_sOut_tdata    ,
  output wire             switch01_sCMD_tready   ,
  input  wire             switch01_sCMD_tvalid   ,
  input  wire  [31 : 0]   switch01_sCMD_tdata    ,
  input  wire             switch01_mRet_tready   ,
  output wire             switch01_mRet_tvalid   ,
  output wire  [31 : 0]   switch01_mRet_tdata    ,
  output wire             switch01_sPRRet_tready ,
  input  wire             switch01_sPRRet_tvalid ,
  input  wire  [31 : 0]   switch01_sPRRet_tdata  ,
  input  wire             switch01_mPRCMD_tready ,
  output wire             switch01_mPRCMD_tvalid ,
  output wire  [31 : 0]   switch01_mPRCMD_tdata  ,

  output wire  [15 : 0]   switch10_PR_SIZE       ,
  input  wire             switch10_mIn1_tready   ,
  output wire             switch10_mIn1_tvalid   ,
  output wire  [31 : 0]   switch10_mIn1_tdata    ,
  input  wire             switch10_mIn2_tready   ,
  output wire             switch10_mIn2_tvalid   ,
  output wire  [31 : 0]   switch10_mIn2_tdata    ,
  output wire             switch10_sOut_tready   ,
  input  wire             switch10_sOut_tvalid   ,
  input  wire  [31 : 0]   switch10_sOut_tdata    ,
  output wire             switch10_sCMD_tready   ,
  input  wire             switch10_sCMD_tvalid   ,
  input  wire  [31 : 0]   switch10_sCMD_tdata    ,
  input  wire             switch10_mRet_tready   ,
  output wire             switch10_mRet_tvalid   ,
  output wire  [31 : 0]   switch10_mRet_tdata    ,
  output wire             switch10_sPRRet_tready ,
  input  wire             switch10_sPRRet_tvalid ,
  input  wire  [31 : 0]   switch10_sPRRet_tdata  ,
  input  wire             switch10_mPRCMD_tready ,
  output wire             switch10_mPRCMD_tvalid ,
  output wire  [31 : 0]   switch10_mPRCMD_tdata  ,

  output wire  [15 : 0]   switch11_PR_SIZE       ,
  input  wire             switch11_mIn1_tready   ,
  output wire             switch11_mIn1_tvalid   ,
  output wire  [31 : 0]   switch11_mIn1_tdata    ,
  input  wire             switch11_mIn2_tready   ,
  output wire             switch11_mIn2_tvalid   ,
  output wire  [31 : 0]   switch11_mIn2_tdata    ,
  output wire             switch11_sOut_tready   ,
  input  wire             switch11_sOut_tvalid   ,
  input  wire  [31 : 0]   switch11_sOut_tdata    ,
  output wire             switch11_sCMD_tready   ,
  input  wire             switch11_sCMD_tvalid   ,
  input  wire  [31 : 0]   switch11_sCMD_tdata    ,
  input  wire             switch11_mRet_tready   ,
  output wire             switch11_mRet_tvalid   ,
  output wire  [31 : 0]   switch11_mRet_tdata    ,
  output wire             switch11_sPRRet_tready ,
  input  wire             switch11_sPRRet_tvalid ,
  input  wire  [31 : 0]   switch11_sPRRet_tdata  ,
  input  wire             switch11_mPRCMD_tready ,
  output wire             switch11_mPRCMD_tvalid ,
  output wire  [31 : 0]   switch11_mPRCMD_tdata  ,

  input  wire             ACLK                   ,
  input  wire             ARESETN
);

// Switch00 //
wire            switch00_sn_tready     ;
wire            switch00_sn_tvalid     ;
wire  [31 : 0]  switch00_sn_tdata      ;
wire            switch00_se_tready     ;
wire            switch00_se_tvalid     ;
wire  [31 : 0]  switch00_se_tdata      ;
wire            switch00_ss_tready     ;
wire            switch00_ss_tvalid     ;
wire  [31 : 0]  switch00_ss_tdata      ;
wire            switch00_sw_tready     ;
wire            switch00_sw_tvalid     ;
wire  [31 : 0]  switch00_sw_tdata      ;
wire            switch00_mn_tready     ;
wire            switch00_mn_tvalid     ;
wire  [31 : 0]  switch00_mn_tdata      ;
wire            switch00_me_tready     ;
wire            switch00_me_tvalid     ;
wire  [31 : 0]  switch00_me_tdata      ;
wire            switch00_ms_tready     ;
wire            switch00_ms_tvalid     ;
wire  [31 : 0]  switch00_ms_tdata      ;
wire            switch00_mw_tready     ;
wire            switch00_mw_tvalid     ;
wire  [31 : 0]  switch00_mw_tdata      ;
wire            switch00_BC1_EN        ;
wire  [15 : 0]  switch00_BC1_INDEX     ;
wire  [15 : 0]  switch00_BC1_SIZE      ;
wire  [15 : 0]  switch00_BC1_STRIDE    ;
wire            switch00_BC2_EN        ;
wire  [15 : 0]  switch00_BC2_INDEX     ;
wire  [15 : 0]  switch00_BC2_SIZE      ;
wire  [15 : 0]  switch00_BC2_STRIDE    ;

// Switch01 //
wire            switch01_sn_tready     ;
wire            switch01_sn_tvalid     ;
wire  [31 : 0]  switch01_sn_tdata      ;
wire            switch01_se_tready     ;
wire            switch01_se_tvalid     ;
wire  [31 : 0]  switch01_se_tdata      ;
wire            switch01_ss_tready     ;
wire            switch01_ss_tvalid     ;
wire  [31 : 0]  switch01_ss_tdata      ;
wire            switch01_sw_tready     ;
wire            switch01_sw_tvalid     ;
wire  [31 : 0]  switch01_sw_tdata      ;
wire            switch01_mn_tready     ;
wire            switch01_mn_tvalid     ;
wire  [31 : 0]  switch01_mn_tdata      ;
wire            switch01_me_tready     ;
wire            switch01_me_tvalid     ;
wire  [31 : 0]  switch01_me_tdata      ;
wire            switch01_ms_tready     ;
wire            switch01_ms_tvalid     ;
wire  [31 : 0]  switch01_ms_tdata      ;
wire            switch01_mw_tready     ;
wire            switch01_mw_tvalid     ;
wire  [31 : 0]  switch01_mw_tdata      ;
wire            switch01_BC1_EN        ;
wire  [15 : 0]  switch01_BC1_INDEX     ;
wire  [15 : 0]  switch01_BC1_SIZE      ;
wire  [15 : 0]  switch01_BC1_STRIDE    ;
wire            switch01_BC2_EN        ;
wire  [15 : 0]  switch01_BC2_INDEX     ;
wire  [15 : 0]  switch01_BC2_SIZE      ;
wire  [15 : 0]  switch01_BC2_STRIDE    ;

// Switch10 //
wire            switch10_sn_tready     ;
wire            switch10_sn_tvalid     ;
wire  [31 : 0]  switch10_sn_tdata      ;
wire            switch10_se_tready     ;
wire            switch10_se_tvalid     ;
wire  [31 : 0]  switch10_se_tdata      ;
wire            switch10_ss_tready     ;
wire            switch10_ss_tvalid     ;
wire  [31 : 0]  switch10_ss_tdata      ;
wire            switch10_sw_tready     ;
wire            switch10_sw_tvalid     ;
wire  [31 : 0]  switch10_sw_tdata      ;
wire            switch10_mn_tready     ;
wire            switch10_mn_tvalid     ;
wire  [31 : 0]  switch10_mn_tdata      ;
wire            switch10_me_tready     ;
wire            switch10_me_tvalid     ;
wire  [31 : 0]  switch10_me_tdata      ;
wire            switch10_ms_tready     ;
wire            switch10_ms_tvalid     ;
wire  [31 : 0]  switch10_ms_tdata      ;
wire            switch10_mw_tready     ;
wire            switch10_mw_tvalid     ;
wire  [31 : 0]  switch10_mw_tdata      ;
wire            switch10_BC1_EN        ;
wire  [15 : 0]  switch10_BC1_INDEX     ;
wire  [15 : 0]  switch10_BC1_SIZE      ;
wire  [15 : 0]  switch10_BC1_STRIDE    ;
wire            switch10_BC2_EN        ;
wire  [15 : 0]  switch10_BC2_INDEX     ;
wire  [15 : 0]  switch10_BC2_SIZE      ;
wire  [15 : 0]  switch10_BC2_STRIDE    ;

// Switch11 //
wire            switch11_sn_tready     ;
wire            switch11_sn_tvalid     ;
wire  [31 : 0]  switch11_sn_tdata      ;
wire            switch11_se_tready     ;
wire            switch11_se_tvalid     ;
wire  [31 : 0]  switch11_se_tdata      ;
wire            switch11_ss_tready     ;
wire            switch11_ss_tvalid     ;
wire  [31 : 0]  switch11_ss_tdata      ;
wire            switch11_sw_tready     ;
wire            switch11_sw_tvalid     ;
wire  [31 : 0]  switch11_sw_tdata      ;
wire            switch11_mn_tready     ;
wire            switch11_mn_tvalid     ;
wire  [31 : 0]  switch11_mn_tdata      ;
wire            switch11_me_tready     ;
wire            switch11_me_tvalid     ;
wire  [31 : 0]  switch11_me_tdata      ;
wire            switch11_ms_tready     ;
wire            switch11_ms_tvalid     ;
wire  [31 : 0]  switch11_ms_tdata      ;
wire            switch11_mw_tready     ;
wire            switch11_mw_tvalid     ;
wire  [31 : 0]  switch11_mw_tdata      ;
wire            switch11_BC1_EN        ;
wire  [15 : 0]  switch11_BC1_INDEX     ;
wire  [15 : 0]  switch11_BC1_SIZE      ;
wire  [15 : 0]  switch11_BC1_STRIDE    ;
wire            switch11_BC2_EN        ;
wire  [15 : 0]  switch11_BC2_INDEX     ;
wire  [15 : 0]  switch11_BC2_SIZE      ;
wire  [15 : 0]  switch11_BC2_STRIDE    ;

////////////////////////////////////////////////////////////////////////////////
sfa_bif u_bif00(
  .bram_clk       (bif00_bram_clk          ),
  .bram_rst       (bif00_bram_rst          ),
  .bram_en        (bif00_bram_en           ),
  .bram_we        (bif00_bram_we           ),
  .bram_addr      (bif00_bram_addr         ),
  .bram_din       (bif00_bram_din          ),
  .bram_dout      (bif00_bram_dout         ),
  .sBIR_tready    (switch00_mn_tready      ),
  .sBIR_tvalid    (switch00_mn_tvalid      ),
  .sBIR_tdata     (switch00_mn_tdata       ),
  .mBIF_tready    (switch00_sn_tready      ),
  .mBIF_tvalid    (switch00_sn_tvalid      ),
  .mBIF_tdata     (switch00_sn_tdata       ),
  .BIF_EN         (switch00_BC1_EN         ),
  .INDEX          (switch00_BC1_INDEX      ),
  .SIZE           (switch00_BC1_SIZE       ),
  .STRIDE         (switch00_BC1_STRIDE     ),
  .MODE           (switch00_BC1_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_bif u_bif07(
  .bram_clk       (bif07_bram_clk          ),
  .bram_rst       (bif07_bram_rst          ),
  .bram_en        (bif07_bram_en           ),
  .bram_we        (bif07_bram_we           ),
  .bram_addr      (bif07_bram_addr         ),
  .bram_din       (bif07_bram_din          ),
  .bram_dout      (bif07_bram_dout         ),
  .sBIR_tready    (switch00_mw_tready      ),
  .sBIR_tvalid    (switch00_mw_tvalid      ),
  .sBIR_tdata     (switch00_mw_tdata       ),
  .mBIF_tready    (switch00_sw_tready      ),
  .mBIF_tvalid    (switch00_sw_tvalid      ),
  .mBIF_tdata     (switch00_sw_tdata       ),
  .BIF_EN         (switch00_BC2_EN         ),
  .INDEX          (switch00_BC2_INDEX      ),
  .SIZE           (switch00_BC2_SIZE       ),
  .STRIDE         (switch00_BC2_STRIDE     ),
  .MODE           (switch00_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_Switch u_Switch00(
  .sn_tready      (switch00_sn_tready      ),
  .sn_tvalid      (switch00_sn_tvalid      ),
  .sn_tdata       (switch00_sn_tdata       ),
  .se_tready      (switch01_mw_tready      ),
  .se_tvalid      (switch01_mw_tvalid      ),
  .se_tdata       (switch01_mw_tdata       ),
  .ss_tready      (switch10_ms_tready      ),
  .ss_tvalid      (switch10_ms_tvalid      ),
  .ss_tdata       (switch10_ms_tdata       ),
  .sw_tready      (switch00_sw_tready      ),
  .sw_tvalid      (switch00_sw_tvalid      ),
  .sw_tdata       (switch00_sw_tdata       ),
  .mn_tready      (switch00_mn_tready      ),
  .mn_tvalid      (switch00_mn_tvalid      ),
  .mn_tdata       (switch00_mn_tdata       ),
  .me_tready      (switch00_me_tready      ),
  .me_tvalid      (switch00_me_tvalid      ),
  .me_tdata       (switch00_me_tdata       ),
  .ms_tready      (switch00_ms_tready      ),
  .ms_tvalid      (switch00_ms_tvalid      ),
  .ms_tdata       (switch00_ms_tdata       ),
  .mw_tready      (switch00_mw_tready      ),
  .mw_tvalid      (switch00_mw_tvalid      ),
  .mw_tdata       (switch00_mw_tdata       ),
  .PR_SIZE        (switch00_PR_SIZE        ),
  .mIn1_tready    (switch00_mIn1_tready    ),
  .mIn1_tvalid    (switch00_mIn1_tvalid    ),
  .mIn1_tdata     (switch00_mIn1_tdata     ),
  .mIn2_tready    (switch00_mIn2_tready    ),
  .mIn2_tvalid    (switch00_mIn2_tvalid    ),
  .mIn2_tdata     (switch00_mIn2_tdata     ),
  .sOut_tready    (switch00_sOut_tready    ),
  .sOut_tvalid    (switch00_sOut_tvalid    ),
  .sOut_tdata     (switch00_sOut_tdata     ),
  .sCMD_tready    (switch00_sCMD_tready    ),
  .sCMD_tvalid    (switch00_sCMD_tvalid    ),
  .sCMD_tdata     (switch00_sCMD_tdata     ),
  .mRet_tready    (switch00_mRet_tready    ),
  .mRet_tvalid    (switch00_mRet_tvalid    ),
  .mRet_tdata     (switch00_mRet_tdata     ),
  .sPRRet_tready  (switch00_sPRRet_tready  ),
  .sPRRet_tvalid  (switch00_sPRRet_tvalid  ),
  .sPRRet_tdata   (switch00_sPRRet_tdata   ),
  .mPRCMD_tready  (switch00_mPRCMD_tready  ),
  .mPRCMD_tvalid  (switch00_mPRCMD_tvalid  ),
  .mPRCMD_tdata   (switch00_mPRCMD_tdata   ),
  .BC1_EN         (switch00_BC1_EN         ),
  .BC1_INDEX      (switch00_BC1_INDEX      ),
  .BC1_SIZE       (switch00_BC1_SIZE       ),
  .BC1_STRIDE     (switch00_BC1_STRIDE     ),
  .BC1_MODE       (switch00_BC1_MODE       ),
  .BC2_EN         (switch00_BC2_EN         ),
  .BC2_INDEX      (switch00_BC2_INDEX      ),
  .BC2_SIZE       (switch00_BC2_SIZE       ),
  .BC2_STRIDE     (switch00_BC2_STRIDE     ),
  .BC2_MODE       (switch00_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

////////////////////////////////////////////////////////////////////////////////
sfa_bif u_bif01(
  .bram_clk       (bif01_bram_clk          ),
  .bram_rst       (bif01_bram_rst          ),
  .bram_en        (bif01_bram_en           ),
  .bram_we        (bif01_bram_we           ),
  .bram_addr      (bif01_bram_addr         ),
  .bram_din       (bif01_bram_din          ),
  .bram_dout      (bif01_bram_dout         ),
  .sBIR_tready    (switch01_mn_tready      ),
  .sBIR_tvalid    (switch01_mn_tvalid      ),
  .sBIR_tdata     (switch01_mn_tdata       ),
  .mBIF_tready    (switch01_sn_tready      ),
  .mBIF_tvalid    (switch01_sn_tvalid      ),
  .mBIF_tdata     (switch01_sn_tdata       ),
  .BIF_EN         (switch01_BC1_EN         ),
  .INDEX          (switch01_BC1_INDEX      ),
  .SIZE           (switch01_BC1_SIZE       ),
  .STRIDE         (switch01_BC1_STRIDE     ),
  .MODE           (switch01_BC1_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_bif u_bif02(
  .bram_clk       (bif02_bram_clk          ),
  .bram_rst       (bif02_bram_rst          ),
  .bram_en        (bif02_bram_en           ),
  .bram_we        (bif02_bram_we           ),
  .bram_addr      (bif02_bram_addr         ),
  .bram_din       (bif02_bram_din          ),
  .bram_dout      (bif02_bram_dout         ),
  .sBIR_tready    (switch01_me_tready      ),
  .sBIR_tvalid    (switch01_me_tvalid      ),
  .sBIR_tdata     (switch01_me_tdata       ),
  .mBIF_tready    (switch01_se_tready      ),
  .mBIF_tvalid    (switch01_se_tvalid      ),
  .mBIF_tdata     (switch01_se_tdata       ),
  .BIF_EN         (switch01_BC2_EN         ),
  .INDEX          (switch01_BC2_INDEX      ),
  .SIZE           (switch01_BC2_SIZE       ),
  .STRIDE         (switch01_BC2_STRIDE     ),
  .MODE           (switch01_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_Switch u_Switch01(
  .sn_tready      (switch01_sn_tready      ),
  .sn_tvalid      (switch01_sn_tvalid      ),
  .sn_tdata       (switch01_sn_tdata       ),
  .se_tready      (switch01_se_tready      ),
  .se_tvalid      (switch01_se_tvalid      ),
  .se_tdata       (switch01_se_tdata       ),
  .ss_tready      (switch11_mn_tready      ),
  .ss_tvalid      (switch11_mn_tvalid      ),
  .ss_tdata       (switch11_mn_tdata       ),
  .sw_tready      (switch00_me_tready      ),
  .sw_tvalid      (switch00_me_tvalid      ),
  .sw_tdata       (switch00_me_tdata       ),
  .mn_tready      (switch01_mn_tready      ),
  .mn_tvalid      (switch01_mn_tvalid      ),
  .mn_tdata       (switch01_mn_tdata       ),
  .me_tready      (switch01_me_tready      ),
  .me_tvalid      (switch01_me_tvalid      ),
  .me_tdata       (switch01_me_tdata       ),
  .ms_tready      (switch01_ms_tready      ),
  .ms_tvalid      (switch01_ms_tvalid      ),
  .ms_tdata       (switch01_ms_tdata       ),
  .mw_tready      (switch01_mw_tready      ),
  .mw_tvalid      (switch01_mw_tvalid      ),
  .mw_tdata       (switch01_mw_tdata       ),
  .PR_SIZE        (switch01_PR_SIZE        ),
  .mIn1_tready    (switch01_mIn1_tready    ),
  .mIn1_tvalid    (switch01_mIn1_tvalid    ),
  .mIn1_tdata     (switch01_mIn1_tdata     ),
  .mIn2_tready    (switch01_mIn2_tready    ),
  .mIn2_tvalid    (switch01_mIn2_tvalid    ),
  .mIn2_tdata     (switch01_mIn2_tdata     ),
  .sOut_tready    (switch01_sOut_tready    ),
  .sOut_tvalid    (switch01_sOut_tvalid    ),
  .sOut_tdata     (switch01_sOut_tdata     ),
  .sCMD_tready    (switch01_sCMD_tready    ),
  .sCMD_tvalid    (switch01_sCMD_tvalid    ),
  .sCMD_tdata     (switch01_sCMD_tdata     ),
  .mRet_tready    (switch01_mRet_tready    ),
  .mRet_tvalid    (switch01_mRet_tvalid    ),
  .mRet_tdata     (switch01_mRet_tdata     ),
  .sPRRet_tready  (switch01_sPRRet_tready  ),
  .sPRRet_tvalid  (switch01_sPRRet_tvalid  ),
  .sPRRet_tdata   (switch01_sPRRet_tdata   ),
  .mPRCMD_tready  (switch01_mPRCMD_tready  ),
  .mPRCMD_tvalid  (switch01_mPRCMD_tvalid  ),
  .mPRCMD_tdata   (switch01_mPRCMD_tdata   ),
  .BC1_EN         (switch01_BC1_EN         ),
  .BC1_INDEX      (switch01_BC1_INDEX      ),
  .BC1_SIZE       (switch01_BC1_SIZE       ),
  .BC1_STRIDE     (switch01_BC1_STRIDE     ),
  .BC1_MODE       (switch01_BC1_MODE       ),
  .BC2_EN         (switch01_BC2_EN         ),
  .BC2_INDEX      (switch01_BC2_INDEX      ),
  .BC2_SIZE       (switch01_BC2_SIZE       ),
  .BC2_STRIDE     (switch01_BC2_STRIDE     ),
  .BC2_MODE       (switch01_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);


////////////////////////////////////////////////////////////////////////////////
sfa_bif u_bif05(
  .bram_clk       (bif05_bram_clk          ),
  .bram_rst       (bif05_bram_rst          ),
  .bram_en        (bif05_bram_en           ),
  .bram_we        (bif05_bram_we           ),
  .bram_addr      (bif05_bram_addr         ),
  .bram_din       (bif05_bram_din          ),
  .bram_dout      (bif05_bram_dout         ),
  .sBIR_tready    (switch10_ms_tready      ),
  .sBIR_tvalid    (switch10_ms_tvalid      ),
  .sBIR_tdata     (switch10_ms_tdata       ),
  .mBIF_tready    (switch10_ss_tready      ),
  .mBIF_tvalid    (switch10_ss_tvalid      ),
  .mBIF_tdata     (switch10_ss_tdata       ),
  .BIF_EN         (switch10_BC1_EN         ),
  .INDEX          (switch10_BC1_INDEX      ),
  .SIZE           (switch10_BC1_SIZE       ),
  .STRIDE         (switch10_BC1_STRIDE     ),
  .MODE           (switch10_BC1_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_bif u_bif06(
  .bram_clk       (bif06_bram_clk          ),
  .bram_rst       (bif06_bram_rst          ),
  .bram_en        (bif06_bram_en           ),
  .bram_we        (bif06_bram_we           ),
  .bram_addr      (bif06_bram_addr         ),
  .bram_din       (bif06_bram_din          ),
  .bram_dout      (bif06_bram_dout         ),
  .sBIR_tready    (switch10_mw_tready      ),
  .sBIR_tvalid    (switch10_mw_tvalid      ),
  .sBIR_tdata     (switch10_mw_tdata       ),
  .mBIF_tready    (switch10_sw_tready      ),
  .mBIF_tvalid    (switch10_sw_tvalid      ),
  .mBIF_tdata     (switch10_sw_tdata       ),
  .BIF_EN         (switch10_BC2_EN         ),
  .INDEX          (switch10_BC2_INDEX      ),
  .SIZE           (switch10_BC2_SIZE       ),
  .STRIDE         (switch10_BC2_STRIDE     ),
  .MODE           (switch10_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_Switch u_Switch10(
  .sn_tready      (switch00_mn_tready      ),
  .sn_tvalid      (switch00_mn_tvalid      ),
  .sn_tdata       (switch00_mn_tdata       ),
  .se_tready      (switch11_mw_tready      ),
  .se_tvalid      (switch11_mw_tvalid      ),
  .se_tdata       (switch11_mw_tdata       ),
  .ss_tready      (switch10_ss_tready      ),
  .ss_tvalid      (switch10_ss_tvalid      ),
  .ss_tdata       (switch10_ss_tdata       ),
  .sw_tready      (switch10_sw_tready      ),
  .sw_tvalid      (switch10_sw_tvalid      ),
  .sw_tdata       (switch10_sw_tdata       ),
  .mn_tready      (switch10_mn_tready      ),
  .mn_tvalid      (switch10_mn_tvalid      ),
  .mn_tdata       (switch10_mn_tdata       ),
  .me_tready      (switch10_me_tready      ),
  .me_tvalid      (switch10_me_tvalid      ),
  .me_tdata       (switch10_me_tdata       ),
  .ms_tready      (switch10_ms_tready      ),
  .ms_tvalid      (switch10_ms_tvalid      ),
  .ms_tdata       (switch10_ms_tdata       ),
  .mw_tready      (switch10_mw_tready      ),
  .mw_tvalid      (switch10_mw_tvalid      ),
  .mw_tdata       (switch10_mw_tdata       ),
  .PR_SIZE        (switch10_PR_SIZE        ),
  .mIn1_tready    (switch10_mIn1_tready    ),
  .mIn1_tvalid    (switch10_mIn1_tvalid    ),
  .mIn1_tdata     (switch10_mIn1_tdata     ),
  .mIn2_tready    (switch10_mIn2_tready    ),
  .mIn2_tvalid    (switch10_mIn2_tvalid    ),
  .mIn2_tdata     (switch10_mIn2_tdata     ),
  .sOut_tready    (switch10_sOut_tready    ),
  .sOut_tvalid    (switch10_sOut_tvalid    ),
  .sOut_tdata     (switch10_sOut_tdata     ),
  .sCMD_tready    (switch10_sCMD_tready    ),
  .sCMD_tvalid    (switch10_sCMD_tvalid    ),
  .sCMD_tdata     (switch10_sCMD_tdata     ),
  .mRet_tready    (switch10_mRet_tready    ),
  .mRet_tvalid    (switch10_mRet_tvalid    ),
  .mRet_tdata     (switch10_mRet_tdata     ),
  .sPRRet_tready  (switch10_sPRRet_tready  ),
  .sPRRet_tvalid  (switch10_sPRRet_tvalid  ),
  .sPRRet_tdata   (switch10_sPRRet_tdata   ),
  .mPRCMD_tready  (switch10_mPRCMD_tready  ),
  .mPRCMD_tvalid  (switch10_mPRCMD_tvalid  ),
  .mPRCMD_tdata   (switch10_mPRCMD_tdata   ),
  .BC1_EN         (switch10_BC1_EN         ),
  .BC1_INDEX      (switch10_BC1_INDEX      ),
  .BC1_SIZE       (switch10_BC1_SIZE       ),
  .BC1_STRIDE     (switch10_BC1_STRIDE     ),
  .BC1_MODE       (switch10_BC1_MODE       ),
  .BC2_EN         (switch10_BC2_EN         ),
  .BC2_INDEX      (switch10_BC2_INDEX      ),
  .BC2_SIZE       (switch10_BC2_SIZE       ),
  .BC2_STRIDE     (switch10_BC2_STRIDE     ),
  .BC2_MODE       (switch10_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

////////////////////////////////////////////////////////////////////////////////
sfa_bif u_bif03(
  .bram_clk       (bif03_bram_clk          ),
  .bram_rst       (bif03_bram_rst          ),
  .bram_en        (bif03_bram_en           ),
  .bram_we        (bif03_bram_we           ),
  .bram_addr      (bif03_bram_addr         ),
  .bram_din       (bif03_bram_din          ),
  .bram_dout      (bif03_bram_dout         ),
  .sBIR_tready    (switch11_me_tready      ),
  .sBIR_tvalid    (switch11_me_tvalid      ),
  .sBIR_tdata     (switch11_me_tdata       ),
  .mBIF_tready    (switch11_se_tready      ),
  .mBIF_tvalid    (switch11_se_tvalid      ),
  .mBIF_tdata     (switch11_se_tdata       ),
  .BIF_EN         (switch11_BC1_EN         ),
  .INDEX          (switch11_BC1_INDEX      ),
  .SIZE           (switch11_BC1_SIZE       ),
  .STRIDE         (switch11_BC1_STRIDE     ),
  .MODE           (switch11_BC1_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_bif u_bif04(
  .bram_clk       (bif04_bram_clk          ),
  .bram_rst       (bif04_bram_rst          ),
  .bram_en        (bif04_bram_en           ),
  .bram_we        (bif04_bram_we           ),
  .bram_addr      (bif04_bram_addr         ),
  .bram_din       (bif04_bram_din          ),
  .bram_dout      (bif04_bram_dout         ),
  .sBIR_tready    (switch11_ms_tready      ),
  .sBIR_tvalid    (switch11_ms_tvalid      ),
  .sBIR_tdata     (switch11_ms_tdata       ),
  .mBIF_tready    (switch11_ss_tready      ),
  .mBIF_tvalid    (switch11_ss_tvalid      ),
  .mBIF_tdata     (switch11_ss_tdata       ),
  .BIF_EN         (switch11_BC2_EN         ),
  .INDEX          (switch11_BC2_INDEX      ),
  .SIZE           (switch11_BC2_SIZE       ),
  .STRIDE         (switch11_BC2_STRIDE     ),
  .MODE           (switch11_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);

sfa_Switch u_Switch11(
  .sn_tready      (switch01_ms_tready      ),
  .sn_tvalid      (switch01_ms_tvalid      ),
  .sn_tdata       (switch01_ms_tdata       ),
  .se_tready      (switch11_se_tready      ),
  .se_tvalid      (switch11_se_tvalid      ),
  .se_tdata       (switch11_se_tdata       ),
  .ss_tready      (switch11_ss_tready      ),
  .ss_tvalid      (switch11_ss_tvalid      ),
  .ss_tdata       (switch11_ss_tdata       ),
  .sw_tready      (switch10_me_tready      ),
  .sw_tvalid      (switch10_me_tvalid      ),
  .sw_tdata       (switch10_me_tdata       ),
  .mn_tready      (switch11_mn_tready      ),
  .mn_tvalid      (switch11_mn_tvalid      ),
  .mn_tdata       (switch11_mn_tdata       ),
  .me_tready      (switch11_me_tready      ),
  .me_tvalid      (switch11_me_tvalid      ),
  .me_tdata       (switch11_me_tdata       ),
  .ms_tready      (switch11_ms_tready      ),
  .ms_tvalid      (switch11_ms_tvalid      ),
  .ms_tdata       (switch11_ms_tdata       ),
  .mw_tready      (switch11_mw_tready      ),
  .mw_tvalid      (switch11_mw_tvalid      ),
  .mw_tdata       (switch11_mw_tdata       ),
  .PR_SIZE        (switch11_PR_SIZE        ),
  .mIn1_tready    (switch11_mIn1_tready    ),
  .mIn1_tvalid    (switch11_mIn1_tvalid    ),
  .mIn1_tdata     (switch11_mIn1_tdata     ),
  .mIn2_tready    (switch11_mIn2_tready    ),
  .mIn2_tvalid    (switch11_mIn2_tvalid    ),
  .mIn2_tdata     (switch11_mIn2_tdata     ),
  .sOut_tready    (switch11_sOut_tready    ),
  .sOut_tvalid    (switch11_sOut_tvalid    ),
  .sOut_tdata     (switch11_sOut_tdata     ),
  .sCMD_tready    (switch11_sCMD_tready    ),
  .sCMD_tvalid    (switch11_sCMD_tvalid    ),
  .sCMD_tdata     (switch11_sCMD_tdata     ),
  .mRet_tready    (switch11_mRet_tready    ),
  .mRet_tvalid    (switch11_mRet_tvalid    ),
  .mRet_tdata     (switch11_mRet_tdata     ),
  .sPRRet_tready  (switch11_sPRRet_tready  ),
  .sPRRet_tvalid  (switch11_sPRRet_tvalid  ),
  .sPRRet_tdata   (switch11_sPRRet_tdata   ),
  .mPRCMD_tready  (switch11_mPRCMD_tready  ),
  .mPRCMD_tvalid  (switch11_mPRCMD_tvalid  ),
  .mPRCMD_tdata   (switch11_mPRCMD_tdata   ),
  .BC1_EN         (switch11_BC1_EN         ),
  .BC1_INDEX      (switch11_BC1_INDEX      ),
  .BC1_SIZE       (switch11_BC1_SIZE       ),
  .BC1_STRIDE     (switch11_BC1_STRIDE     ),
  .BC1_MODE       (switch11_BC1_MODE       ),
  .BC2_EN         (switch11_BC2_EN         ),
  .BC2_INDEX      (switch11_BC2_INDEX      ),
  .BC2_SIZE       (switch11_BC2_SIZE       ),
  .BC2_STRIDE     (switch11_BC2_STRIDE     ),
  .BC2_MODE       (switch11_BC2_MODE       ),
  .ACLK           (ACLK                    ),
  .ARESETN        (ARESETN                 )
);







endmodule
