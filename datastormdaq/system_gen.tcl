set_global_assignment -name TOP_LEVEL_ENTITY system_wrapper

set_global_assignment -name ROUTER_CLOCKING_TOPOLOGY_ANALYSIS ON
set_global_assignment -name OPTIMIZATION_MODE "HIGH PERFORMANCE EFFORT"
set_global_assignment -name PHYSICAL_SYNTHESIS ON
set_global_assignment -name ROUTER_LCELL_INSERTION_AND_LOGIC_DUPLICATION ON
set_global_assignment -name ROUTER_TIMING_OPTIMIZATION_LEVEL MAXIMUM
set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER 4.0
set_global_assignment -name OPTIMIZE_POWER_DURING_FITTING OFF

# constraints
# ad9361

set_location_assignment PIN_C13   -to  rx_clk_in                ; ## G06  FMCA_HPC_LA00_CC_P
# set_location_assignment PIN_B12   -to  "rx_clk_in(n)"           ; ## G07  FMCA_HPC_LA00_CC_N
set_location_assignment PIN_F15   -to  rx_frame_in            ; ## D08  FMCA_HPC_LA01_CC_P
# set_location_assignment PIN_F14   -to  rx_frame_in_n            ; ## D09  FMCA_HPC_LA01_CC_N
set_location_assignment PIN_A11   -to  rx_data_in[0]          ; ## H07  FMCA_HPC_LA02_P
set_location_assignment PIN_A10   -to  rx_data_in[1]          ; ## H08  FMCA_HPC_LA02_N
set_location_assignment PIN_K12   -to  rx_data_in[2]          ; ## G09  FMCA_HPC_LA03_P
set_location_assignment PIN_J12   -to  rx_data_in[3]          ; ## G10  FMCA_HPC_LA03_N
set_location_assignment PIN_B13   -to  rx_data_in[4]          ; ## H10  FMCA_HPC_LA04_P
set_location_assignment PIN_A13   -to  rx_data_in[5]          ; ## H11  FMCA_HPC_LA04_N
set_location_assignment PIN_H13   -to  rx_data_in[6]          ; ## D11  FMCA_HPC_LA05_P
set_location_assignment PIN_H12   -to  rx_data_in[7]          ; ## D12  FMCA_HPC_LA05_N
set_location_assignment PIN_C12   -to  rx_data_in[8]          ; ## C10  FMCA_HPC_LA06_P
set_location_assignment PIN_B11   -to  rx_data_in[9]          ; ## C11  FMCA_HPC_LA06_N
set_location_assignment PIN_F11   -to  rx_data_in[10]         ; ## H13  FMCA_HPC_LA07_P
set_location_assignment PIN_E11   -to  rx_data_in[11]         ; ## H14  FMCA_HPC_LA07_N

set_location_assignment PIN_C10   -to  tx_clk_out               ; ## G12  FMCA_HPC_LA08_P
# set_location_assignment PIN_C9    -to  "tx_clk_out(n)"          ; ## G13  FMCA_HPC_LA08_N
set_location_assignment PIN_E9    -to  tx_frame_out           ; ## D14  FMCA_HPC_LA09_P
# set_location_assignment PIN_D9    -to  tx_frame_out_n           ; ## D15  FMCA_HPC_LA09_N
set_location_assignment PIN_F9    -to  tx_data_out[0]         ; ## H16  FMCA_HPC_LA11_P
set_location_assignment PIN_F8    -to  tx_data_out[1]         ; ## H17  FMCA_HPC_LA11_N
set_location_assignment PIN_A9    -to  tx_data_out[2]         ; ## G15  FMCA_HPC_LA12_P
set_location_assignment PIN_A8    -to  tx_data_out[3]         ; ## G16  FMCA_HPC_LA12_N
set_location_assignment PIN_B6    -to  tx_data_out[4]         ; ## D17  FMCA_HPC_LA13_P
set_location_assignment PIN_B5    -to  tx_data_out[5]         ; ## D18  FMCA_HPC_LA13_N
set_location_assignment PIN_E8    -to  tx_data_out[6]         ; ## C14  FMCA_HPC_LA10_P
set_location_assignment PIN_D7    -to  tx_data_out[7]         ; ## C15  FMCA_HPC_LA10_N
set_location_assignment PIN_C8    -to  tx_data_out[8]         ; ## C18  FMCA_HPC_LA14_P
set_location_assignment PIN_B8    -to  tx_data_out[9]         ; ## C19  FMCA_HPC_LA14_N
set_location_assignment PIN_H14   -to  tx_data_out[10]         ; ## H19  FMCA_HPC_LA15_P
set_location_assignment PIN_G13   -to  tx_data_out[11]         ; ## H20  FMCA_HPC_LA15_N


set_instance_assignment -name IO_STANDARD "2.5 V"                -to rx_clk_in
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL  -to rx_clk_in
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_frame_in
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_frame_in_p
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_frame_in_p
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[0]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[1]
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_data_in_p[0]
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_data_in_p[0]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[2]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[3]
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_data_in_p[1]
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_data_in_p[1]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[4]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[6]
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_data_in_p[2]
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_data_in_p[2]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[6]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[7]
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_data_in_p[3]
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_data_in_p[3]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[8]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[9]
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_data_in_p[4]
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_data_in_p[4]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[10]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to rx_data_in[11]
# set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to rx_data_in_p[5]
# set_instance_assignment -name INPUT_DELAY_CHAIN 30           -to rx_data_in_p[5]

set_instance_assignment -name IO_STANDARD "2.5 V"              -to tx_clk_out
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_clk_out
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_frame_out
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_frame_out_p
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[0]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[1]
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_data_out_p[0]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[2]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[3]
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_data_out_p[1]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[4]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[5]
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_data_out_p[2]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[6]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[7]
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_data_out_p[3]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[8]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[9]
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_data_out_p[4]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[10]
set_instance_assignment -name IO_STANDARD "2.5 V"             -to tx_data_out[11]
# set_instance_assignment -name OUTPUT_DELAY_CHAIN 2           -to tx_data_out_p[5]

set_location_assignment PIN_A6   -to   gpio_status[0]                   ; ## G21  FMCA_HPC_LA20_P
set_location_assignment PIN_A5   -to   gpio_status[1]                   ; ## G22  FMCA_HPC_LA20_N
set_location_assignment PIN_D11  -to   gpio_status[2]                   ; ## H25  FMCA_HPC_LA21_P
set_location_assignment PIN_D10  -to   gpio_status[3]                   ; ## H26  FMCA_HPC_LA21_N
set_location_assignment PIN_D5   -to   gpio_status[4]                   ; ## G24  FMCA_HPC_LA22_P
set_location_assignment PIN_C4   -to   gpio_status[5]                   ; ## G25  FMCA_HPC_LA22_N
set_location_assignment PIN_G12  -to   gpio_status[6]                   ; ## D23  FMCA_HPC_LA23_P
set_location_assignment PIN_G11  -to   gpio_status[7]                   ; ## D24  FMCA_HPC_LA23_N
set_location_assignment PIN_C3   -to   gpio_ctl[0]                      ; ## H28  FMCA_HPC_LA24_P
set_location_assignment PIN_B3   -to   gpio_ctl[1]                      ; ## H29  FMCA_HPC_LA24_N
set_location_assignment PIN_H8   -to   gpio_ctl[2]                      ; ## G27  FMCA_HPC_LA25_P
set_location_assignment PIN_G8   -to   gpio_ctl[3]                      ; ## G28  FMCA_HPC_LA25_N
set_location_assignment PIN_E12  -to   gpio_en_agc                      ; ## H22  FMCA_HPC_LA19_P
set_location_assignment PIN_D12  -to   gpio_sync                        ; ## H23  FMCA_HPC_LA19_N
set_location_assignment PIN_B2   -to   gpio_resetb                      ; ## H31  FMCA_HPC_LA28_P
set_location_assignment PIN_C7   -to   enable                           ; ## G18  FMCA_HPC_LA16_P
set_location_assignment PIN_B7   -to   txnrx                            ; ## G19  FMCA_HPC_LA16_N

set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[4]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[5]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[6]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_status[7]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_ctl[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_ctl[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_ctl[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_ctl[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_en_agc
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_sync
set_instance_assignment -name IO_STANDARD "2.5 V" -to gpio_resetb
set_instance_assignment -name IO_STANDARD "2.5 V" -to enable
set_instance_assignment -name IO_STANDARD "2.5 V" -to txnrx

set_location_assignment PIN_A4   -to    spi_csn                          ; ## D26  FMCA_HPC_LA26_P
set_location_assignment PIN_A3   -to    spi_clk                          ; ## D27  FMCA_HPC_LA26_N
set_location_assignment PIN_G10  -to    spi_mosi                         ; ## C26  FMCA_HPC_LA27_P
set_location_assignment PIN_F10  -to    spi_miso                         ; ## C27  FMCA_HPC_LA27_N

set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to spi_csn
set_instance_assignment -name IO_STANDARD "2.5 V" -to spi_csn
set_instance_assignment -name IO_STANDARD "2.5 V" -to spi_clk
set_instance_assignment -name IO_STANDARD "2.5 V" -to spi_mosi
set_instance_assignment -name IO_STANDARD "2.5 V" -to spi_miso

#clock fixes
# set_parameter -name GLOBAL_CLOCK 0 -to i_system_bd|axi_ad9361|axi_ad9361|i_dev_if|i_clk
# set_instance_assignment -name FAST_INPUT_REGISTER ON -to i_system_bd|axi_ad9361|axi_ad9361|i_dev_if|g_rx_data[*].i_rx_data
# set_instance_assignment -name FAST_INPUT_REGISTER ON -to i_system_bd|axi_ad9361|axi_ad9361|i_dev_if|i_rx_frame
