`timescale 1 ns / 1 ps

module sfa_2x2_tb();

wire             switch00_sCMD_tready   ;
reg              switch00_sCMD_tvalid   ;
reg   [31 : 0]   switch00_sCMD_tdata    ;
reg              switch00_mRet_tready   ;
wire             switch00_mRet_tvalid   ;
wire  [31 : 0]   switch00_mRet_tdata    ;

wire             switch01_sCMD_tready   ;
reg              switch01_sCMD_tvalid   ;
reg   [31 : 0]   switch01_sCMD_tdata    ;
reg              switch01_mRet_tready   ;
wire             switch01_mRet_tvalid   ;
wire  [31 : 0]   switch01_mRet_tdata    ;

wire             switch10_sCMD_tready   ;
reg              switch10_sCMD_tvalid   ;
reg   [31 : 0]   switch10_sCMD_tdata    ;
reg              switch10_mRet_tready   ;
wire             switch10_mRet_tvalid   ;
wire  [31 : 0]   switch10_mRet_tdata    ;

wire             switch11_sCMD_tready   ;
reg              switch11_sCMD_tvalid   ;
reg   [31 : 0]   switch11_sCMD_tdata    ;
reg              switch11_mRet_tready   ;
wire             switch11_mRet_tvalid   ;
wire  [31 : 0]   switch11_mRet_tdata    ;

reg              ACLK                   ;
reg              ARESETN                ;

wire             bif00_bram_clk         ;
wire             bif00_bram_rst         ;
wire             bif00_bram_en          ;
wire  [ 3 : 0]   bif00_bram_we          ;
wire  [31 : 0]   bif00_bram_addr        ;
wire  [31 : 0]   bif00_bram_din         ;
wire  [31 : 0]   bif00_bram_dout        ;

wire             bif01_bram_clk         ;
wire             bif01_bram_rst         ;
wire             bif01_bram_en          ;
wire  [ 3 : 0]   bif01_bram_we          ;
wire  [31 : 0]   bif01_bram_addr        ;
wire  [31 : 0]   bif01_bram_din         ;
wire  [31 : 0]   bif01_bram_dout        ;

wire             bif02_bram_clk         ;
wire             bif02_bram_rst         ;
wire             bif02_bram_en          ;
wire  [ 3 : 0]   bif02_bram_we          ;
wire  [31 : 0]   bif02_bram_addr        ;
wire  [31 : 0]   bif02_bram_din         ;
wire  [31 : 0]   bif02_bram_dout        ;

wire             bif03_bram_clk         ;
wire             bif03_bram_rst         ;
wire             bif03_bram_en          ;
wire  [ 3 : 0]   bif03_bram_we          ;
wire  [31 : 0]   bif03_bram_addr        ;
wire  [31 : 0]   bif03_bram_din         ;
wire  [31 : 0]   bif03_bram_dout        ;

wire             bif04_bram_clk         ;
wire             bif04_bram_rst         ;
wire             bif04_bram_en          ;
wire  [ 3 : 0]   bif04_bram_we          ;
wire  [31 : 0]   bif04_bram_addr        ;
wire  [31 : 0]   bif04_bram_din         ;
wire  [31 : 0]   bif04_bram_dout        ;

wire             bif05_bram_clk         ;
wire             bif05_bram_rst         ;
wire             bif05_bram_en          ;
wire  [ 3 : 0]   bif05_bram_we          ;
wire  [31 : 0]   bif05_bram_addr        ;
wire  [31 : 0]   bif05_bram_din         ;
wire  [31 : 0]   bif05_bram_dout        ;

wire             bif06_bram_clk         ;
wire             bif06_bram_rst         ;
wire             bif06_bram_en          ;
wire  [ 3 : 0]   bif06_bram_we          ;
wire  [31 : 0]   bif06_bram_addr        ;
wire  [31 : 0]   bif06_bram_din         ;
wire  [31 : 0]   bif06_bram_dout        ;

wire             bif07_bram_clk         ;
wire             bif07_bram_rst         ;
wire             bif07_bram_en          ;
wire  [ 3 : 0]   bif07_bram_we          ;
wire  [31 : 0]   bif07_bram_addr        ;
wire  [31 : 0]   bif07_bram_din         ;
wire  [31 : 0]   bif07_bram_dout        ;

wire  [15 : 0]   switch00_PR_SIZE       ;
wire             switch00_mIn1_tready   ;
wire             switch00_mIn1_tvalid   ;
wire  [31 : 0]   switch00_mIn1_tdata    ;
wire             switch00_mIn2_tready   ;
wire             switch00_mIn2_tvalid   ;
wire  [31 : 0]   switch00_mIn2_tdata    ;
wire             switch00_sOut_tready   ;
wire             switch00_sOut_tvalid   ;
wire  [31 : 0]   switch00_sOut_tdata    ;
wire             switch00_sPRRet_tready ;
wire             switch00_sPRRet_tvalid ;
wire  [31 : 0]   switch00_sPRRet_tdata  ;
wire             switch00_mPRCMD_tready ;
wire             switch00_mPRCMD_tvalid ;
wire  [31 : 0]   switch00_mPRCMD_tdata  ;

wire  [15 : 0]   switch01_PR_SIZE       ;
wire             switch01_mIn1_tready   ;
wire             switch01_mIn1_tvalid   ;
wire  [31 : 0]   switch01_mIn1_tdata    ;
wire             switch01_mIn2_tready   ;
wire             switch01_mIn2_tvalid   ;
wire  [31 : 0]   switch01_mIn2_tdata    ;
wire             switch01_sOut_tready   ;
wire             switch01_sOut_tvalid   ;
wire  [31 : 0]   switch01_sOut_tdata    ;
wire             switch01_sPRRet_tready ;
wire             switch01_sPRRet_tvalid ;
wire  [31 : 0]   switch01_sPRRet_tdata  ;
wire             switch01_mPRCMD_tready ;
wire             switch01_mPRCMD_tvalid ;
wire  [31 : 0]   switch01_mPRCMD_tdata  ;

wire  [15 : 0]   switch10_PR_SIZE       ;
wire             switch10_mIn1_tready   ;
wire             switch10_mIn1_tvalid   ;
wire  [31 : 0]   switch10_mIn1_tdata    ;
wire             switch10_mIn2_tready   ;
wire             switch10_mIn2_tvalid   ;
wire  [31 : 0]   switch10_mIn2_tdata    ;
wire             switch10_sOut_tready   ;
wire             switch10_sOut_tvalid   ;
wire  [31 : 0]   switch10_sOut_tdata    ;
wire             switch10_sPRRet_tready ;
wire             switch10_sPRRet_tvalid ;
wire  [31 : 0]   switch10_sPRRet_tdata  ;
wire             switch10_mPRCMD_tready ;
wire             switch10_mPRCMD_tvalid ;
wire  [31 : 0]   switch10_mPRCMD_tdata  ;

wire  [15 : 0]   switch11_PR_SIZE       ;
wire             switch11_mIn1_tready   ;
wire             switch11_mIn1_tvalid   ;
wire  [31 : 0]   switch11_mIn1_tdata    ;
wire             switch11_mIn2_tready   ;
wire             switch11_mIn2_tvalid   ;
wire  [31 : 0]   switch11_mIn2_tdata    ;
wire             switch11_sOut_tready   ;
wire             switch11_sOut_tvalid   ;
wire  [31 : 0]   switch11_sOut_tdata    ;
wire             switch11_sPRRet_tready ;
wire             switch11_sPRRet_tvalid ;
wire  [31 : 0]   switch11_sPRRet_tdata  ;
wire             switch11_mPRCMD_tready ;
wire             switch11_mPRCMD_tvalid ;
wire  [31 : 0]   switch11_mPRCMD_tdata  ;


initial begin
  $dumpfile("design.vcd");
  $dumpvars(0,sfa_2x2_tb);
  #5000 $finish;
end

initial begin
  ACLK               = 0        ;
  forever #5 ACLK    = ~ACLK    ;
end

initial begin
  ARESETN           = 0        ;
  #100 ARESETN      = 1        ;
end

initial begin
        switch00_mRet_tready = 1;
        switch01_mRet_tready = 1;
        switch00_sCMD_tvalid = 0;
        switch01_sCMD_tvalid = 0;
end

initial begin
  // Set PR SIZE
  #150  switch00_sCMD_tdata  = 32'h00100010;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set INDEX BC1
  #20   switch00_sCMD_tdata  = 32'h00110000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set SIZE BC1
  #20   switch00_sCMD_tdata  = 32'h00120010;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set STRIDE BC1
  #20   switch00_sCMD_tdata  = 32'h00130001;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set MODE BC1
  #20   switch00_sCMD_tdata  = 32'h00140000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set INDEX BC2
  #20   switch00_sCMD_tdata  = 32'h00210000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set SIZE BC2
  #20   switch00_sCMD_tdata  = 32'h00220010;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set STRIDE BC2
  #20   switch00_sCMD_tdata  = 32'h00230001;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set MODE BC2
  #20   switch00_sCMD_tdata  = 32'h00240000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // Set PR SIZE
  #150  switch01_sCMD_tdata  = 32'h00100000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set INDEX BC1
  #20   switch01_sCMD_tdata  = 32'h00110000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set SIZE BC1
  #20   switch01_sCMD_tdata  = 32'h00120010;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set STRIDE BC1
  #20   switch01_sCMD_tdata  = 32'h00130001;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set MODE BC1
  #20   switch01_sCMD_tdata  = 32'h00140001;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set INDEX BC2
  #20   switch01_sCMD_tdata  = 32'h00210000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set SIZE BC2
  #20   switch01_sCMD_tdata  = 32'h00220000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set STRIDE BC2
  #20   switch01_sCMD_tdata  = 32'h00230000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set MODE BC2
  #20   switch01_sCMD_tdata  = 32'h00240000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // Set Switch 00
  #20   switch00_sCMD_tdata  = 32'h00010C05;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set Switch 01
  #20   switch01_sCMD_tdata  = 32'h00013000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // START 00
  #20   switch00_sCMD_tdata  = 32'h00030000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // START 01
  #10   switch01_sCMD_tdata  = 32'h00030000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // DONE
  #20   switch00_sCMD_tdata  = 32'h00080000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
end
/////////////////////////////////////////////
// Second Round
/////////////////////////////////////////////
initial begin
  // // Set PR SIZE
  // #150  switch00_sCMD_tdata  = 32'h00100010;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set INDEX BC1
  // #20   switch00_sCMD_tdata  = 32'h00110000;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set SIZE BC1
  // #20   switch00_sCMD_tdata  = 32'h00120010;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set STRIDE BC1
  // #20   switch00_sCMD_tdata  = 32'h00130001;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set MODE BC1
  // #20   switch00_sCMD_tdata  = 32'h00140000;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set INDEX BC2
  // #20   switch00_sCMD_tdata  = 32'h00210000;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set SIZE BC2
  // #20   switch00_sCMD_tdata  = 32'h00220010;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set STRIDE BC2
  // #20   switch00_sCMD_tdata  = 32'h00230001;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // // Set MODE BC2
  // #20   switch00_sCMD_tdata  = 32'h00240000;
  //       switch00_sCMD_tvalid = 1;
  // #10   switch00_sCMD_tvalid = 0;
  // //////////////////////////////////////////
  // // Set PR SIZE
  // #150  switch01_sCMD_tdata  = 32'h00100000;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set INDEX BC1
  // #20   switch01_sCMD_tdata  = 32'h00110000;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set SIZE BC1
  // #20   switch01_sCMD_tdata  = 32'h00120010;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set STRIDE BC1
  // #20   switch01_sCMD_tdata  = 32'h00130001;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set MODE BC1
  // #20   switch01_sCMD_tdata  = 32'h00140001;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set INDEX BC2
  // #20   switch01_sCMD_tdata  = 32'h00210000;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set SIZE BC2
  // #20   switch01_sCMD_tdata  = 32'h00220000;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set STRIDE BC2
  // #20   switch01_sCMD_tdata  = 32'h00230000;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  // // Set MODE BC2
  // #20   switch01_sCMD_tdata  = 32'h00240000;
  //       switch01_sCMD_tvalid = 1;
  // #10   switch01_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // Set Switch 00
  #2000 switch00_sCMD_tdata  = 32'h00010C05;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set Switch 01
  #20   switch01_sCMD_tdata  = 32'h00013000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // START 00
  #20   switch00_sCMD_tdata  = 32'h00030000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // START 01
  #10   switch01_sCMD_tdata  = 32'h00030000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // DONE
  #20   switch00_sCMD_tdata  = 32'h00080000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
end
/////////////////////////////////////////////
// Third Round
/////////////////////////////////////////////
initial begin
  // Set PR SIZE
  #2600 switch00_sCMD_tdata  = 32'h00100010;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set INDEX BC1
  #20   switch00_sCMD_tdata  = 32'h00110000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set SIZE BC1
  #20   switch00_sCMD_tdata  = 32'h00120010;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set STRIDE BC1
  #20   switch00_sCMD_tdata  = 32'h00130001;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set MODE BC1
  #20   switch00_sCMD_tdata  = 32'h00140000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set INDEX BC2
  #20   switch00_sCMD_tdata  = 32'h00210000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set SIZE BC2
  #20   switch00_sCMD_tdata  = 32'h00220010;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set STRIDE BC2
  #20   switch00_sCMD_tdata  = 32'h00230001;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set MODE BC2
  #20   switch00_sCMD_tdata  = 32'h00240000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // Set PR SIZE
  #150  switch01_sCMD_tdata  = 32'h00100000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set INDEX BC1
  #20   switch01_sCMD_tdata  = 32'h00110000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set SIZE BC1
  #20   switch01_sCMD_tdata  = 32'h00120010;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set STRIDE BC1
  #20   switch01_sCMD_tdata  = 32'h00130001;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set MODE BC1
  #20   switch01_sCMD_tdata  = 32'h00140001;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set INDEX BC2
  #20   switch01_sCMD_tdata  = 32'h00210000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set SIZE BC2
  #20   switch01_sCMD_tdata  = 32'h00220000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set STRIDE BC2
  #20   switch01_sCMD_tdata  = 32'h00230000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // Set MODE BC2
  #20   switch01_sCMD_tdata  = 32'h00240000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // Set Switch 00
  #20   switch00_sCMD_tdata  = 32'h00010C05;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // Set Switch 01
  #20   switch01_sCMD_tdata  = 32'h00013000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  //////////////////////////////////////////
  // START 00
  #20   switch00_sCMD_tdata  = 32'h00030000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
  // START 01
  #10   switch01_sCMD_tdata  = 32'h00030000;
        switch01_sCMD_tvalid = 1;
  #10   switch01_sCMD_tvalid = 0;
  // DONE
  #20   switch00_sCMD_tdata  = 32'h00080000;
        switch00_sCMD_tvalid = 1;
  #10   switch00_sCMD_tvalid = 0;
end



sfa_vadd acc_vadd_00(
  .PR_SIZE      (switch00_PR_SIZE       ),

  .sCMD_tready  (switch00_mPRCMD_tready ),
  .sCMD_tvalid  (switch00_mPRCMD_tvalid ),
  .sCMD_tdata   (switch00_mPRCMD_tdata  ),

  .mRet_tready  (switch00_sPRRet_tready ),
  .mRet_tvalid  (switch00_sPRRet_tvalid ),
  .mRet_tdata   (switch00_sPRRet_tdata  ),

  .sIn1_tready  (switch00_mIn1_tready   ),
  .sIn1_tvalid  (switch00_mIn1_tvalid   ),
  .sIn1_tdata   (switch00_mIn1_tdata    ),

  .sIn2_tready  (switch00_mIn2_tready   ),
  .sIn2_tvalid  (switch00_mIn2_tvalid   ),
  .sIn2_tdata   (switch00_mIn2_tdata    ),

  .mOut_tready  (switch00_sOut_tready   ),
  .mOut_tvalid  (switch00_sOut_tvalid   ),
  .mOut_tdata   (switch00_sOut_tdata    ),

  .ACLK         (ACLK                   ),
  .ARESETN      (ARESETN                )
);

sfa_vadd acc_vadd_01(
  .PR_SIZE      (switch01_PR_SIZE       ),

  .sCMD_tready  (switch01_mPRCMD_tready ),
  .sCMD_tvalid  (switch01_mPRCMD_tvalid ),
  .sCMD_tdata   (switch01_mPRCMD_tdata  ),

  .mRet_tready  (switch01_sPRRet_tready ),
  .mRet_tvalid  (switch01_sPRRet_tvalid ),
  .mRet_tdata   (switch01_sPRRet_tdata  ),

  .sIn1_tready  (switch01_mIn1_tready   ),
  .sIn1_tvalid  (switch01_mIn1_tvalid   ),
  .sIn1_tdata   (switch01_mIn1_tdata    ),

  .sIn2_tready  (switch01_mIn2_tready   ),
  .sIn2_tvalid  (switch01_mIn2_tvalid   ),
  .sIn2_tdata   (switch01_mIn2_tdata    ),

  .mOut_tready  (switch01_sOut_tready   ),
  .mOut_tvalid  (switch01_sOut_tvalid   ),
  .mOut_tdata   (switch01_sOut_tdata    ),

  .ACLK         (ACLK                   ),
  .ARESETN      (ARESETN                )
);

sfa_vadd acc_vadd_10(
  .PR_SIZE      (switch10_PR_SIZE       ),

  .sCMD_tready  (switch10_mPRCMD_tready ),
  .sCMD_tvalid  (switch10_mPRCMD_tvalid ),
  .sCMD_tdata   (switch10_mPRCMD_tdata  ),

  .mRet_tready  (switch10_sPRRet_tready ),
  .mRet_tvalid  (switch10_sPRRet_tvalid ),
  .mRet_tdata   (switch10_sPRRet_tdata  ),

  .sIn1_tready  (switch10_mIn1_tready   ),
  .sIn1_tvalid  (switch10_mIn1_tvalid   ),
  .sIn1_tdata   (switch10_mIn1_tdata    ),

  .sIn2_tready  (switch10_mIn2_tready   ),
  .sIn2_tvalid  (switch10_mIn2_tvalid   ),
  .sIn2_tdata   (switch10_mIn2_tdata    ),

  .mOut_tready  (switch10_sOut_tready   ),
  .mOut_tvalid  (switch10_sOut_tvalid   ),
  .mOut_tdata   (switch10_sOut_tdata    ),

  .ACLK         (ACLK                   ),
  .ARESETN      (ARESETN                )
);

sfa_vadd acc_vadd_11(
  .PR_SIZE      (switch11_PR_SIZE       ),

  .sCMD_tready  (switch11_mPRCMD_tready ),
  .sCMD_tvalid  (switch11_mPRCMD_tvalid ),
  .sCMD_tdata   (switch11_mPRCMD_tdata  ),

  .mRet_tready  (switch11_sPRRet_tready ),
  .mRet_tvalid  (switch11_sPRRet_tvalid ),
  .mRet_tdata   (switch11_sPRRet_tdata  ),

  .sIn1_tready  (switch11_mIn1_tready   ),
  .sIn1_tvalid  (switch11_mIn1_tvalid   ),
  .sIn1_tdata   (switch11_mIn1_tdata    ),

  .sIn2_tready  (switch11_mIn2_tready   ),
  .sIn2_tvalid  (switch11_mIn2_tvalid   ),
  .sIn2_tdata   (switch11_mIn2_tdata    ),

  .mOut_tready  (switch11_sOut_tready   ),
  .mOut_tvalid  (switch11_sOut_tvalid   ),
  .mOut_tdata   (switch11_sOut_tdata    ),

  .ACLK         (ACLK                   ),
  .ARESETN      (ARESETN                )
);


sfa_bram #( 0) BRAM00(
  .bram_en    (bif00_bram_en  ),
  .bram_we    (bif00_bram_we  ),
  .bram_addr  (bif00_bram_addr),
  .bram_din   (bif00_bram_din ),
  .bram_dout  (bif00_bram_dout),
  .bram_clk   (bif00_bram_clk ),
  .bram_rst   (bif00_bram_rst )
);

sfa_bram #(10) BRAM01(
  .bram_en    (bif01_bram_en  ),
  .bram_we    (bif01_bram_we  ),
  .bram_addr  (bif01_bram_addr),
  .bram_din   (bif01_bram_din ),
  .bram_dout  (bif01_bram_dout),
  .bram_clk   (bif01_bram_clk ),
  .bram_rst   (bif01_bram_rst )
);

sfa_bram #(20) BRAM02(
  .bram_en    (bif02_bram_en  ),
  .bram_we    (bif02_bram_we  ),
  .bram_addr  (bif02_bram_addr),
  .bram_din   (bif02_bram_din ),
  .bram_dout  (bif02_bram_dout),
  .bram_clk   (bif02_bram_clk ),
  .bram_rst   (bif02_bram_rst )
);

sfa_bram #(30) BRAM03(
  .bram_en    (bif03_bram_en  ),
  .bram_we    (bif03_bram_we  ),
  .bram_addr  (bif03_bram_addr),
  .bram_din   (bif03_bram_din ),
  .bram_dout  (bif03_bram_dout),
  .bram_clk   (bif03_bram_clk ),
  .bram_rst   (bif03_bram_rst )
);

sfa_bram #(40) BRAM04(
  .bram_en    (bif04_bram_en  ),
  .bram_we    (bif04_bram_we  ),
  .bram_addr  (bif04_bram_addr),
  .bram_din   (bif04_bram_din ),
  .bram_dout  (bif04_bram_dout),
  .bram_clk   (bif04_bram_clk ),
  .bram_rst   (bif04_bram_rst )
);

sfa_bram #(50) BRAM05(
  .bram_en    (bif05_bram_en  ),
  .bram_we    (bif05_bram_we  ),
  .bram_addr  (bif05_bram_addr),
  .bram_din   (bif05_bram_din ),
  .bram_dout  (bif05_bram_dout),
  .bram_clk   (bif05_bram_clk ),
  .bram_rst   (bif05_bram_rst )
);

sfa_bram #(60) BRAM06(
  .bram_en    (bif06_bram_en  ),
  .bram_we    (bif06_bram_we  ),
  .bram_addr  (bif06_bram_addr),
  .bram_din   (bif06_bram_din ),
  .bram_dout  (bif06_bram_dout),
  .bram_clk   (bif06_bram_clk ),
  .bram_rst   (bif06_bram_rst )
);

sfa_bram #(70) BRAM07(
  .bram_en    (bif07_bram_en  ),
  .bram_we    (bif07_bram_we  ),
  .bram_addr  (bif07_bram_addr),
  .bram_din   (bif07_bram_din ),
  .bram_dout  (bif07_bram_dout),
  .bram_clk   (bif07_bram_clk ),
  .bram_rst   (bif07_bram_rst )
);


sfa_2x2 dut(
  .bif00_bram_clk         (bif00_bram_clk         ),
  .bif00_bram_rst         (bif00_bram_rst         ),
  .bif00_bram_en          (bif00_bram_en          ),
  .bif00_bram_we          (bif00_bram_we          ),
  .bif00_bram_addr        (bif00_bram_addr        ),
  .bif00_bram_din         (bif00_bram_din         ),
  .bif00_bram_dout        (bif00_bram_dout        ),

  .bif01_bram_clk         (bif01_bram_clk         ),
  .bif01_bram_rst         (bif01_bram_rst         ),
  .bif01_bram_en          (bif01_bram_en          ),
  .bif01_bram_we          (bif01_bram_we          ),
  .bif01_bram_addr        (bif01_bram_addr        ),
  .bif01_bram_din         (bif01_bram_din         ),
  .bif01_bram_dout        (bif01_bram_dout        ),

  .bif02_bram_clk         (bif02_bram_clk         ),
  .bif02_bram_rst         (bif02_bram_rst         ),
  .bif02_bram_en          (bif02_bram_en          ),
  .bif02_bram_we          (bif02_bram_we          ),
  .bif02_bram_addr        (bif02_bram_addr        ),
  .bif02_bram_din         (bif02_bram_din         ),
  .bif02_bram_dout        (bif02_bram_dout        ),

  .bif03_bram_clk         (bif03_bram_clk         ),
  .bif03_bram_rst         (bif03_bram_rst         ),
  .bif03_bram_en          (bif03_bram_en          ),
  .bif03_bram_we          (bif03_bram_we          ),
  .bif03_bram_addr        (bif03_bram_addr        ),
  .bif03_bram_din         (bif03_bram_din         ),
  .bif03_bram_dout        (bif03_bram_dout        ),

  .bif04_bram_clk         (bif04_bram_clk         ),
  .bif04_bram_rst         (bif04_bram_rst         ),
  .bif04_bram_en          (bif04_bram_en          ),
  .bif04_bram_we          (bif04_bram_we          ),
  .bif04_bram_addr        (bif04_bram_addr        ),
  .bif04_bram_din         (bif04_bram_din         ),
  .bif04_bram_dout        (bif04_bram_dout        ),

  .bif05_bram_clk         (bif05_bram_clk         ),
  .bif05_bram_rst         (bif05_bram_rst         ),
  .bif05_bram_en          (bif05_bram_en          ),
  .bif05_bram_we          (bif05_bram_we          ),
  .bif05_bram_addr        (bif05_bram_addr        ),
  .bif05_bram_din         (bif05_bram_din         ),
  .bif05_bram_dout        (bif05_bram_dout        ),

  .bif06_bram_clk         (bif06_bram_clk         ),
  .bif06_bram_rst         (bif06_bram_rst         ),
  .bif06_bram_en          (bif06_bram_en          ),
  .bif06_bram_we          (bif06_bram_we          ),
  .bif06_bram_addr        (bif06_bram_addr        ),
  .bif06_bram_din         (bif06_bram_din         ),
  .bif06_bram_dout        (bif06_bram_dout        ),

  .bif07_bram_clk         (bif07_bram_clk         ),
  .bif07_bram_rst         (bif07_bram_rst         ),
  .bif07_bram_en          (bif07_bram_en          ),
  .bif07_bram_we          (bif07_bram_we          ),
  .bif07_bram_addr        (bif07_bram_addr        ),
  .bif07_bram_din         (bif07_bram_din         ),
  .bif07_bram_dout        (bif07_bram_dout        ),

  .switch00_PR_SIZE       (switch00_PR_SIZE       ),
  .switch00_mIn1_tready   (switch00_mIn1_tready   ),
  .switch00_mIn1_tvalid   (switch00_mIn1_tvalid   ),
  .switch00_mIn1_tdata    (switch00_mIn1_tdata    ),
  .switch00_mIn2_tready   (switch00_mIn2_tready   ),
  .switch00_mIn2_tvalid   (switch00_mIn2_tvalid   ),
  .switch00_mIn2_tdata    (switch00_mIn2_tdata    ),
  .switch00_sOut_tready   (switch00_sOut_tready   ),
  .switch00_sOut_tvalid   (switch00_sOut_tvalid   ),
  .switch00_sOut_tdata    (switch00_sOut_tdata    ),
  .switch00_sCMD_tready   (switch00_sCMD_tready   ),
  .switch00_sCMD_tvalid   (switch00_sCMD_tvalid   ),
  .switch00_sCMD_tdata    (switch00_sCMD_tdata    ),
  .switch00_mRet_tready   (switch00_mRet_tready   ),
  .switch00_mRet_tvalid   (switch00_mRet_tvalid   ),
  .switch00_mRet_tdata    (switch00_mRet_tdata    ),
  .switch00_sPRRet_tready (switch00_sPRRet_tready ),
  .switch00_sPRRet_tvalid (switch00_sPRRet_tvalid ),
  .switch00_sPRRet_tdata  (switch00_sPRRet_tdata  ),
  .switch00_mPRCMD_tready (switch00_mPRCMD_tready ),
  .switch00_mPRCMD_tvalid (switch00_mPRCMD_tvalid ),
  .switch00_mPRCMD_tdata  (switch00_mPRCMD_tdata  ),

  .switch01_PR_SIZE       (switch01_PR_SIZE       ),
  .switch01_mIn1_tready   (switch01_mIn1_tready   ),
  .switch01_mIn1_tvalid   (switch01_mIn1_tvalid   ),
  .switch01_mIn1_tdata    (switch01_mIn1_tdata    ),
  .switch01_mIn2_tready   (switch01_mIn2_tready   ),
  .switch01_mIn2_tvalid   (switch01_mIn2_tvalid   ),
  .switch01_mIn2_tdata    (switch01_mIn2_tdata    ),
  .switch01_sOut_tready   (switch01_sOut_tready   ),
  .switch01_sOut_tvalid   (switch01_sOut_tvalid   ),
  .switch01_sOut_tdata    (switch01_sOut_tdata    ),
  .switch01_sCMD_tready   (switch01_sCMD_tready   ),
  .switch01_sCMD_tvalid   (switch01_sCMD_tvalid   ),
  .switch01_sCMD_tdata    (switch01_sCMD_tdata    ),
  .switch01_mRet_tready   (switch01_mRet_tready   ),
  .switch01_mRet_tvalid   (switch01_mRet_tvalid   ),
  .switch01_mRet_tdata    (switch01_mRet_tdata    ),
  .switch01_sPRRet_tready (switch01_sPRRet_tready ),
  .switch01_sPRRet_tvalid (switch01_sPRRet_tvalid ),
  .switch01_sPRRet_tdata  (switch01_sPRRet_tdata  ),
  .switch01_mPRCMD_tready (switch01_mPRCMD_tready ),
  .switch01_mPRCMD_tvalid (switch01_mPRCMD_tvalid ),
  .switch01_mPRCMD_tdata  (switch01_mPRCMD_tdata  ),

  .switch10_PR_SIZE       (switch10_PR_SIZE       ),
  .switch10_mIn1_tready   (switch10_mIn1_tready   ),
  .switch10_mIn1_tvalid   (switch10_mIn1_tvalid   ),
  .switch10_mIn1_tdata    (switch10_mIn1_tdata    ),
  .switch10_mIn2_tready   (switch10_mIn2_tready   ),
  .switch10_mIn2_tvalid   (switch10_mIn2_tvalid   ),
  .switch10_mIn2_tdata    (switch10_mIn2_tdata    ),
  .switch10_sOut_tready   (switch10_sOut_tready   ),
  .switch10_sOut_tvalid   (switch10_sOut_tvalid   ),
  .switch10_sOut_tdata    (switch10_sOut_tdata    ),
  .switch10_sCMD_tready   (switch10_sCMD_tready   ),
  .switch10_sCMD_tvalid   (switch10_sCMD_tvalid   ),
  .switch10_sCMD_tdata    (switch10_sCMD_tdata    ),
  .switch10_mRet_tready   (switch10_mRet_tready   ),
  .switch10_mRet_tvalid   (switch10_mRet_tvalid   ),
  .switch10_mRet_tdata    (switch10_mRet_tdata    ),
  .switch10_sPRRet_tready (switch10_sPRRet_tready ),
  .switch10_sPRRet_tvalid (switch10_sPRRet_tvalid ),
  .switch10_sPRRet_tdata  (switch10_sPRRet_tdata  ),
  .switch10_mPRCMD_tready (switch10_mPRCMD_tready ),
  .switch10_mPRCMD_tvalid (switch10_mPRCMD_tvalid ),
  .switch10_mPRCMD_tdata  (switch10_mPRCMD_tdata  ),

  .switch11_PR_SIZE       (switch11_PR_SIZE       ),
  .switch11_mIn1_tready   (switch11_mIn1_tready   ),
  .switch11_mIn1_tvalid   (switch11_mIn1_tvalid   ),
  .switch11_mIn1_tdata    (switch11_mIn1_tdata    ),
  .switch11_mIn2_tready   (switch11_mIn2_tready   ),
  .switch11_mIn2_tvalid   (switch11_mIn2_tvalid   ),
  .switch11_mIn2_tdata    (switch11_mIn2_tdata    ),
  .switch11_sOut_tready   (switch11_sOut_tready   ),
  .switch11_sOut_tvalid   (switch11_sOut_tvalid   ),
  .switch11_sOut_tdata    (switch11_sOut_tdata    ),
  .switch11_sCMD_tready   (switch11_sCMD_tready   ),
  .switch11_sCMD_tvalid   (switch11_sCMD_tvalid   ),
  .switch11_sCMD_tdata    (switch11_sCMD_tdata    ),
  .switch11_mRet_tready   (switch11_mRet_tready   ),
  .switch11_mRet_tvalid   (switch11_mRet_tvalid   ),
  .switch11_mRet_tdata    (switch11_mRet_tdata    ),
  .switch11_sPRRet_tready (switch11_sPRRet_tready ),
  .switch11_sPRRet_tvalid (switch11_sPRRet_tvalid ),
  .switch11_sPRRet_tdata  (switch11_sPRRet_tdata  ),
  .switch11_mPRCMD_tready (switch11_mPRCMD_tready ),
  .switch11_mPRCMD_tvalid (switch11_mPRCMD_tvalid ),
  .switch11_mPRCMD_tdata  (switch11_mPRCMD_tdata  ),

  .ACLK                   (ACLK                   ),
  .ARESETN                (ARESETN                )
);


endmodule
