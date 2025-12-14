
create_clock -period "10.000 ns"  -name sys_clk_100mhz      [get_ports {sys_clk}]

derive_pll_clocks
derive_clock_uncertainty

#unused output
set_false_path -from * -to [get_ports {spi_csn}]

# input async false paths
set_false_path -from [get_ports {sys_resetn}] -to *
set_false_path -from [get_ports {gpio*}] -to *

#taken from blade rf :)
create_generated_clock -name spi_clk_reg -source [get_ports {sys_clk}] -divide_by 10 [get_registers {inst_system_ps_wrapper|sys_spi|sys_spi|SCLK_reg}]
create_generated_clock -name spi_clk_10mhz -source [get_registers -no_duplicates {inst_system_ps_wrapper|sys_spi|sys_spi|SCLK_reg}] [get_ports {spi_clk}]

set_max_skew -from [get_clocks {spi_clk_10mhz}] -to [get_ports {spi_clk}] 0.2

set_output_delay -max 1.000 -clock {spi_clk_10mhz} [get_ports {spi_mosi}]
set_output_delay -min 0.000 -clock {spi_clk_10mhz} [get_ports {spi_mosi}]
set_output_delay -max 1.000 -clock {spi_clk_10mhz} [get_ports {spi_csn}]
set_output_delay -min 0.000 -clock {spi_clk_10mhz} [get_ports {spi_csn}]

set_input_delay -max 2.000 -clock {spi_clk_10mhz} [get_ports {spi_miso}]
set_input_delay -min 3.000 -clock {spi_clk_10mhz} [get_ports {spi_miso}]

set_false_path -from [get_registers *altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out*]


