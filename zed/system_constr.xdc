
set_property  -dict {PACKAGE_PIN  F18  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn]         ; ## D26  FMC_LPC_LA26_P
set_property  -dict {PACKAGE_PIN  E18  IOSTANDARD LVCMOS25} [get_ports spi_clk]                          ; ## D27  FMC_LPC_LA26_N
set_property  -dict {PACKAGE_PIN  E21  IOSTANDARD LVCMOS25} [get_ports spi_mosi]                         ; ## C26  FMC_LPC_LA27_P
set_property  -dict {PACKAGE_PIN  D21  IOSTANDARD LVCMOS25} [get_ports spi_miso]                         ; ## C27  FMC_LPC_LA27_N

# spi pmod JA1

set_property  -dict {PACKAGE_PIN  Y11    IOSTANDARD LVCMOS33}     [get_ports spi_udc_csn_tx]             ; ## JA1
set_property  -dict {PACKAGE_PIN  AB11   IOSTANDARD LVCMOS33}     [get_ports spi_udc_csn_rx]             ; ## JA7
set_property  -dict {PACKAGE_PIN  AA9    IOSTANDARD LVCMOS33}     [get_ports spi_udc_sclk]               ; ## JA4
set_property  -dict {PACKAGE_PIN  AA11   IOSTANDARD LVCMOS33}     [get_ports spi_udc_data]               ; ## JA2

