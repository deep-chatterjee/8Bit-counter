from vcdvcd import VCDVCD
vcd = VCDVCD('sim_output/waves.vcd')
for s in vcd.signals:
    print(s)
