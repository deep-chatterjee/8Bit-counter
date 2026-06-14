RTL_DIR   = ../../rtl
SIM_DIR   = ../../sim
SIM_OUT   = sim_output

.PHONY: all sim wave synth clean

all: sim

sim:
	@mkdir -p $(SIM_OUT)
	iverilog -o $(SIM_OUT)/sim.vvp $(RTL_DIR)/counter_8bit.v $(SIM_DIR)/tb_counter_8bit.v
	vvp $(SIM_OUT)/sim.vvp
	@mv waves.vcd $(SIM_OUT)/

wave:
	gtkwave $(SIM_OUT)/waves.vcd &

synth:
	yosys -p "read_verilog $(RTL_DIR)/counter_8bit.v; synth; abc -g simple; write_verilog $(SIM_OUT)/counter_netlist.v; stat"

clean:
	rm -rf $(SIM_OUT)
