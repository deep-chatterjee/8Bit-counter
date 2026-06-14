from vcdvcd import VCDVCD
import matplotlib.pyplot as plt

vcd = VCDVCD('sim_output/waves.vcd')

# Plot count
times = [t for t, _ in vcd['tb.dut.count[7:0]'].tv]
values = [int(v, 2) for _, v in vcd['tb.dut.count[7:0]'].tv]

# Plot overflow on same graph
ovf_times = [t for t, _ in vcd['tb.dut.overflow'].tv]
ovf_values = [int(v) * 50 for _, v in vcd['tb.dut.overflow'].tv]  # scale up to see it

plt.figure(figsize=(14, 5))
plt.step(times, values, where='post', label='count', linewidth=2)
plt.step(ovf_times, ovf_values, where='post', label='overflow (scaled)', color='red')
plt.xlabel('Time (ps)')
plt.ylabel('Count')
plt.title('8-bit Counter Waveform')
plt.legend()
plt.grid(True)
plt.savefig('sim_output/waves.png')
plt.show()
print("Saved to sim_output/waves.png")
