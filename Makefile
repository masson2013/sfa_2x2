SRCS = sfa_2x2.v sfa_2x2_tb.v sfa_bif.v sfa_control.v sfa_inSwitch.v sfa_outSwitch.v sfa_Switch.v axis_2to1_mux.v sfa_vadd.v sfa_bram.v
VC = iverilog
VVP = vvp

all: design vvp

design: $(SRCS)
	$(VC) -o design $(SRCS)

vvp:
	$(VVP) design

clean:
	$(RM) design
	$(RM) *.vcd
