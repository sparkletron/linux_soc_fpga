

set_property  -dict {PACKAGE_PIN  F18  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn]         ; ## D26  FMC_LPC_LA26_P
set_property  -dict {PACKAGE_PIN  E18  IOSTANDARD LVCMOS25} [get_ports spi_clk]                          ; ## D27  FMC_LPC_LA26_N
set_property  -dict {PACKAGE_PIN  C17  IOSTANDARD LVCMOS25} [get_ports spi_mosi]                         ; ## C26  FMC_LPC_LA27_P
set_property  -dict {PACKAGE_PIN  C18  IOSTANDARD LVCMOS25} [get_ports spi_miso]                         ; ## C27  FMC_LPC_LA27_N

# clocks

create_clock -name rx_clk       -period  4 [get_ports rx_clk_in_p]

# spi pmod J63

set_property  -dict {PACKAGE_PIN  E15  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_udc_csn_tx]  ; ## PMOD1_0_LS
set_property  -dict {PACKAGE_PIN  V8   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_udc_csn_rx]  ; ## PL_PJTAG_TDI
set_property  -dict {PACKAGE_PIN  W5   IOSTANDARD LVCMOS25} [get_ports spi_udc_sclk]                     ; ## PMOD1_3_LS
set_property  -dict {PACKAGE_PIN  D15  IOSTANDARD LVCMOS25} [get_ports spi_udc_data]                     ; ## PMOD1_1_LS

# gpio (pmods)

set_property  -dict {PACKAGE_PIN  P17   IOSTANDARD LVCMOS25} [get_ports gpio_bd[8]]   ; ## PMOD2_3_LS
set_property  -dict {PACKAGE_PIN  P18   IOSTANDARD LVCMOS25} [get_ports gpio_bd[9]]   ; ## PMOD2_2_LS
set_property  -dict {PACKAGE_PIN  W10   IOSTANDARD LVCMOS25} [get_ports gpio_bd[10]]  ; ## PMOD2_1_LS
set_property  -dict {PACKAGE_PIN  V7    IOSTANDARD LVCMOS25} [get_ports gpio_bd[11]]  ; ## PMOD2_0_LS

