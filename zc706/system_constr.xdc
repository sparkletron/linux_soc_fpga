
set_property  -dict {PACKAGE_PIN  AJ30  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn]         ; ## D26  FMC_LPC_LA26_P
set_property  -dict {PACKAGE_PIN  AK30  IOSTANDARD LVCMOS25} [get_ports spi_clk]                          ; ## D27  FMC_LPC_LA26_N
set_property  -dict {PACKAGE_PIN  AJ28  IOSTANDARD LVCMOS25} [get_ports spi_mosi]                         ; ## C26  FMC_LPC_LA27_P
set_property  -dict {PACKAGE_PIN  AJ29  IOSTANDARD LVCMOS25} [get_ports spi_miso]                         ; ## C27  FMC_LPC_LA27_N

# spi pmod J58

set_property  -dict {PACKAGE_PIN  AJ21  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_udc_csn_tx]  ; ## PMOD1_0_LS
set_property  -dict {PACKAGE_PIN  Y20   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_udc_csn_rx]  ; ## PMOD1_4_LS
set_property  -dict {PACKAGE_PIN  AB16  IOSTANDARD LVCMOS25} [get_ports spi_udc_sclk]                     ; ## PMOD1_3_LS
set_property  -dict {PACKAGE_PIN  AK21  IOSTANDARD LVCMOS25} [get_ports spi_udc_data]                     ; ## PMOD1_1_LS

