set_global_assignment -name TOP_LEVEL_ENTITY system_wrapper

set_global_assignment -name ROUTER_CLOCKING_TOPOLOGY_ANALYSIS ON
set_global_assignment -name OPTIMIZATION_MODE "HIGH PERFORMANCE EFFORT"
set_global_assignment -name PHYSICAL_SYNTHESIS ON
set_global_assignment -name ROUTER_LCELL_INSERTION_AND_LOGIC_DUPLICATION ON
set_global_assignment -name ROUTER_TIMING_OPTIMIZATION_LEVEL MAXIMUM
set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER 4.0
set_global_assignment -name OPTIMIZE_POWER_DURING_FITTING OFF

# lane interface

# Note: This projects requires a hardware rework to function correctly.
# The rework connects FMC header pins directly to the FPGA so that they can be
# accessed by the fabric.
#
# Changes required:
#  R610: DNI -> R0
#  R611: DNI -> R0
#  R612: R0 -> DNI
#  R613: R0 -> DNI
#  R620: DNI -> R0
#  R632: DNI -> R0
#  R621: R0 -> DNI
#  R633: R0 -> DNI


# constraints

set_location_assignment PIN_F2   -to    spi_csn                          ; ## D26  FMCA_HPC_LA26_P
set_location_assignment PIN_G2   -to    spi_clk                          ; ## D27  FMCA_HPC_LA26_N
set_location_assignment PIN_G1   -to    spi_mosi                         ; ## C26  FMCA_HPC_LA27_P
set_location_assignment PIN_H2   -to    spi_miso                         ; ## C27  FMCA_HPC_LA27_N

set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to spi_csn
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_csn
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_mosi
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_miso

#clock fixes
# set_parameter -name GLOBAL_CLOCK 0 -to i_system_bd|axi_ad9361|axi_ad9361|i_dev_if|i_clk
# set_instance_assignment -name FAST_INPUT_REGISTER ON -to i_system_bd|axi_ad9361|axi_ad9361|i_dev_if|g_rx_data[*].i_rx_data
# set_instance_assignment -name FAST_INPUT_REGISTER ON -to i_system_bd|axi_ad9361|axi_ad9361|i_dev_if|i_rx_frame
