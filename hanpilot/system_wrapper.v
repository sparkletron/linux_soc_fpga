//******************************************************************************
//  file:     system_wrapper.v
//
//  author:   JAY CONVERTINO
//
//  date:     2023/11/02
//
//  about:    Brief
//  System wrapper for pl and ps for hanpilot board.
//
//  license: License MIT
//  Copyright 2023 Jay Convertino
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//******************************************************************************

`timescale 1ns/100ps

/*
 * Module: system_wrapper
 *
 * System wrapper for pl and ps for hanpilot board.
 *
 * Parameters:
 *
 * FPGA_TECHNOLOGY        - Type of FPGA, such as Ultrascale, Arria 10. 103 is for Arria 10.
 * FPGA_FAMILY            - Sub type of fpga, such as GX, SX, etc. 1 is for SX
 * SPEED_GRADE            - Number that corresponds to the ships recommeneded speed. 2 is for 2.
 * DEV_PACKAGE            - Specify a number that is equal to the manufactures package. 3 is for FBGA.
 * DELAY_REFCLK_FREQUENCY - Reference clock frequency used for ad_data_in instances
 * ADC_INIT_DELAY         - Initial Delay for the ADC
 * DAC_INIT_DELAY         - Initial Delay for the DAC
 *
 * Ports:
 *
 * sys_clk          - Input clock for all clocks
 * sys_resetn       - Input reset for all resets
 * hps_ddr_ref_clk  - DDR port
 * hps_ddr_clk_p    - DDR port
 * hps_ddr_clk_n    - DDR port
 * hps_ddr_a        - DDR port
 * hps_ddr_ba       - DDR port
 * hps_ddr_bg       - DDR port
 * hps_ddr_cke      - DDR port
 * hps_ddr_cs_n     - DDR port
 * hps_ddr_odt      - DDR port
 * hps_ddr_reset_n  - DDR port
 * hps_ddr_act_n    - DDR port
 * hps_ddr_par      - DDR port
 * hps_ddr_alert_n  - DDR port
 * hps_ddr_dqs_p    - DDR port
 * hps_ddr_dqs_n    - DDR port
 * hps_ddr_dq       - DDR port
 * hps_ddr_dbi_n    - DDR port
 * hps_ddr_rzq      - DDR port
 * hps_eth_rxclk    - Ethernet Device
 * hps_eth_rxctl    - Ethernet Device
 * hps_eth_rxd      - Ethernet Device
 * hps_eth_txclk    - Ethernet Device
 * hps_eth_txctl    - Ethernet Device
 * hps_eth_txd      - Ethernet Device
 * hps_eth_mdc      - Ethernet Device
 * hps_eth_mdio     - Ethernet Device
 * hps_sdio_clk     - SD card interface
 * hps_sdio_cmd     - SD card interface
 * hps_sdio_d       - SD card interface
 * hps_usb_clk      - USB interface
 * hps_usb_dir      - USB interface
 * hps_usb_nxt      - USB interface
 * hps_usb_stp      - USB interface
 * hps_usb_d        - USB interface
 * hps_uart_rx      - UART interface
 * hps_uart_tx      - UART interface
 * hps_i2c_sda      - i2c interface
 * hps_i2c_scl      - i2c interface
 * hps_gpio         - GPIO interface
 * hps_led          - LED output, heartbeat
 * hps_key          - Used for reset
 * gpio_bd_i        - fmcomms2-3 gpio
 * gpio_bd_o        - fmcomms2-3 gpio
 * fmc_i2c_sda      - fmcomms2-3 i2c
 * fmc_i2c_scl      - fmcomms2-3 i2c
 * rx_clk_in        - fmcomms2-3 receive clock in
 * rx_frame_in_p    - fmcomms2-3 receive frame
 * rx_frame_in_n    - fmcomms2-3 receive frame
 * rx_data_in_p     - fmcomms2-3 receive lvds data
 * rx_data_in_n     - fmcomms2-3 receive lvds data
 * tx_clk_out_p     - fmcomms2-3 transmit clock
 * tx_clk_out_n     - fmcomms2-3 transmit clock
 * tx_frame_out_p   - fmcomms2-3 transmit frame
 * tx_frame_out_n   - fmcomms2-3 transmit frame
 * tx_data_out_p    - fmcomms2-3 transmit lvds data
 * tx_data_out_n    - fmcomms2-3 transmit lvds data
 * enable           - fmcomms2-3 enable
 * txnrx            - fmcomms2-3 txnrx select
 * gpio_resetb      - fmcomms2-3 gpio reset
 * gpio_sync        - fmcomms2-3 gpio sync
 * gpio_en_agc      - fmcomms2-3 gpio enable agc
 * gpio_ctl         - fmcomms2-3 control
 * gpio_status      - fmcomms2-3 status
 * spi_csn          - fmcomms2-3 spi select
 * spi_clk          - fmcomms2-3 spi clk
 * spi_mosi         - fmcomms2-3 spi output
 * spi_miso         - fmcomms2-3 spi input
 */
module system_wrapper (
    input             sys_clk,
    input             sys_resetn,
    input             hps_ddr_ref_clk,
    output  [  0:0]   hps_ddr_clk_p,
    output  [  0:0]   hps_ddr_clk_n,
    output  [ 16:0]   hps_ddr_a,
    output  [  1:0]   hps_ddr_ba,
    output  [  0:0]   hps_ddr_bg,
    output  [  0:0]   hps_ddr_cke,
    output  [  0:0]   hps_ddr_cs_n,
    output  [  0:0]   hps_ddr_odt,
    output  [  0:0]   hps_ddr_reset_n,
    output  [  0:0]   hps_ddr_act_n,
    output  [  0:0]   hps_ddr_par,
    input   [  0:0]   hps_ddr_alert_n,
    inout   [  3:0]   hps_ddr_dqs_p,
    inout   [  3:0]   hps_ddr_dqs_n,
    inout   [ 31:0]   hps_ddr_dq,
    inout   [  3:0]   hps_ddr_dbi_n,
    input             hps_ddr_rzq,
    input   [  0:0]   hps_eth_rxclk,
    input   [  0:0]   hps_eth_rxctl,
    input   [  3:0]   hps_eth_rxd,
    output  [  0:0]   hps_eth_txclk,
    output  [  0:0]   hps_eth_txctl,
    output  [  3:0]   hps_eth_txd,
    output  [  0:0]   hps_eth_mdc,
    inout   [  0:0]   hps_eth_mdio,
    output  [  0:0]   hps_sdio_clk,
    inout   [  0:0]   hps_sdio_cmd,
    inout   [  3:0]   hps_sdio_d,
    input   [  0:0]   hps_usb_clk,
    input   [  0:0]   hps_usb_dir,
    input   [  0:0]   hps_usb_nxt,
    output  [  0:0]   hps_usb_stp,
    inout   [  7:0]   hps_usb_d,
    input   [  0:0]   hps_uart_rx,
    output  [  0:0]   hps_uart_tx,
    inout   [  0:0]   hps_i2c_sda,
    inout   [  0:0]   hps_i2c_scl,
    inout   [  3:0]   hps_gpio,
    inout             hps_led,
    inout             hps_key,
    input   [  3:0]   gpio_bd_i,
    output  [ 17:0]   gpio_bd_o,
    inout             fpga_i2c_sda,
    inout             fpga_i2c_scl,
    inout             mpu_int,
    inout             fmc_i2c_sda,
    inout             fmc_i2c_scl,
    output            spi_csn,
    output            spi_clk,
    output            spi_mosi,
    input             spi_miso
  );

  // internal signals

  // instantiations... copy pasta
  wire              sys_hps_resetn;
  wire              sys_resetn_s;
  wire    [ 63:0]   gpio_i;
  wire    [ 63:0]   gpio_o;
  wire              fpga_i2c_scl_in;
  wire              fpga_i2c_sda_in;
  wire              fpga_i2c_scl_oe;
  wire              fpga_i2c_sda_oe;
  wire              fmc_i2c_scl_in;
  wire              fmc_i2c_sda_in;
  wire              fmc_i2c_scl_oe;
  wire              fmc_i2c_sda_oe;

  assign gpio_i[63:40] = gpio_o[63:40];

  // board stuff

  assign gpio_i[31:12] = gpio_o[31:12];
  assign gpio_i[11: 6] = 0;
  assign gpio_i[ 5: 2] = gpio_bd_i;
  assign gpio_i[ 1: 0] = gpio_o[1:0];

  assign gpio_bd_o[1:0] = gpio_o[1:0];
  assign gpio_bd_o[17:2] = gpio_o[29:14];

  // Intel application note UG-01085
  assign fpga_i2c_scl = fpga_i2c_scl_oe ? 1'b0 : 1'bz;
  assign fpga_i2c_sda = fpga_i2c_sda_oe ? 1'b0 : 1'bz;
  assign fpga_i2c_scl_in = fpga_i2c_scl;
  assign fpga_i2c_sda_in = fpga_i2c_sda;

  // Intel application note UG-01085
  assign fmc_i2c_scl = fmc_i2c_scl_oe ? 1'b0 : 1'bz;
  assign fmc_i2c_sda = fmc_i2c_sda_oe ? 1'b0 : 1'bz;
  assign fmc_i2c_scl_in = fmc_i2c_scl;
  assign fmc_i2c_sda_in = fmc_i2c_sda;

  // peripheral reset

  assign sys_resetn_s = sys_resetn & sys_hps_resetn;

  // Group: Instantianted Modules

  // Module: inst_system_ps_wrapper
  //
  // Module instance of inst_system_ps_wrapper for the built in CPU.
  system_ps_wrapper inst_system_ps_wrapper (
    .s_axi_clk_clk(),
    .s_axi_aresetn_reset_n(),
    .m_axi_awaddr(0),
    .m_axi_awprot(0),
    .m_axi_awvalid(0),
    .m_axi_awready(),
    .m_axi_wdata(0),
    .m_axi_wstrb(0),
    .m_axi_wvalid(0),
    .m_axi_wready(),
    .m_axi_bresp(),
    .m_axi_bvalid(),
    .m_axi_bready(1'b0),
    .m_axi_araddr(0),
    .m_axi_arprot(0),
    .m_axi_arvalid(0),
    .m_axi_arready(),
    .m_axi_rdata(),
    .m_axi_rresp(),
    .m_axi_rvalid(),
    .m_axi_rready(1'b0),
    .sys_delay_clk_clk(),
    .sys_clk_clk(sys_clk),
    .sys_gpio_bd_in_port(gpio_i[31:0]),
    .sys_gpio_bd_out_port(gpio_o[31:0]),
    .sys_gpio_in_export(gpio_i[63:32]),
    .sys_gpio_out_export(gpio_o[63:32]),
    .sys_hps_rstn_reset_n (sys_resetn),
    .sys_rstn_reset_n (sys_resetn_s),
    .sys_hps_io_hps_io_phery_emac0_TX_CLK (hps_eth_txclk),
    .sys_hps_io_hps_io_phery_emac0_TXD0 (hps_eth_txd[0]),
    .sys_hps_io_hps_io_phery_emac0_TXD1 (hps_eth_txd[1]),
    .sys_hps_io_hps_io_phery_emac0_TXD2 (hps_eth_txd[2]),
    .sys_hps_io_hps_io_phery_emac0_TXD3 (hps_eth_txd[3]),
    .sys_hps_io_hps_io_phery_emac0_RX_CTL (hps_eth_rxctl),
    .sys_hps_io_hps_io_phery_emac0_TX_CTL (hps_eth_txctl),
    .sys_hps_io_hps_io_phery_emac0_RX_CLK (hps_eth_rxclk),
    .sys_hps_io_hps_io_phery_emac0_RXD0 (hps_eth_rxd[0]),
    .sys_hps_io_hps_io_phery_emac0_RXD1 (hps_eth_rxd[1]),
    .sys_hps_io_hps_io_phery_emac0_RXD2 (hps_eth_rxd[2]),
    .sys_hps_io_hps_io_phery_emac0_RXD3 (hps_eth_rxd[3]),
    .sys_hps_io_hps_io_phery_emac0_MDIO (hps_eth_mdio),
    .sys_hps_io_hps_io_phery_emac0_MDC (hps_eth_mdc),
    .sys_hps_io_hps_io_phery_sdmmc_CMD (hps_sdio_cmd),
    .sys_hps_io_hps_io_phery_sdmmc_D0 (hps_sdio_d[0]),
    .sys_hps_io_hps_io_phery_sdmmc_D1 (hps_sdio_d[1]),
    .sys_hps_io_hps_io_phery_sdmmc_D2 (hps_sdio_d[2]),
    .sys_hps_io_hps_io_phery_sdmmc_D3 (hps_sdio_d[3]),
    .sys_hps_io_hps_io_phery_sdmmc_CCLK (hps_sdio_clk),
    .sys_hps_io_hps_io_phery_usb0_DATA0 (hps_usb_d[0]),
    .sys_hps_io_hps_io_phery_usb0_DATA1 (hps_usb_d[1]),
    .sys_hps_io_hps_io_phery_usb0_DATA2 (hps_usb_d[2]),
    .sys_hps_io_hps_io_phery_usb0_DATA3 (hps_usb_d[3]),
    .sys_hps_io_hps_io_phery_usb0_DATA4 (hps_usb_d[4]),
    .sys_hps_io_hps_io_phery_usb0_DATA5 (hps_usb_d[5]),
    .sys_hps_io_hps_io_phery_usb0_DATA6 (hps_usb_d[6]),
    .sys_hps_io_hps_io_phery_usb0_DATA7 (hps_usb_d[7]),
    .sys_hps_io_hps_io_phery_usb0_CLK (hps_usb_clk),
    .sys_hps_io_hps_io_phery_usb0_STP (hps_usb_stp),
    .sys_hps_io_hps_io_phery_usb0_DIR (hps_usb_dir),
    .sys_hps_io_hps_io_phery_usb0_NXT (hps_usb_nxt),
    .sys_hps_io_hps_io_phery_uart1_RX (hps_uart_rx),
    .sys_hps_io_hps_io_phery_uart1_TX (hps_uart_tx),
    .sys_hps_io_hps_io_phery_i2c0_SDA (hps_i2c_sda),
    .sys_hps_io_hps_io_phery_i2c0_SCL (hps_i2c_scl),
    .sys_hps_io_hps_io_gpio_gpio1_io1 (hps_led),
    .sys_hps_io_hps_io_gpio_gpio1_io4 (hps_key),
    .sys_hps_io_hps_io_gpio_gpio1_io15(mpu_int),
    .sys_hps_io_hps_io_gpio_gpio2_io8 (hps_gpio[0]),
    .sys_hps_io_hps_io_gpio_gpio2_io9 (hps_gpio[1]),
    .sys_hps_io_hps_io_gpio_gpio2_io10 (hps_gpio[2]),
    .sys_hps_io_hps_io_gpio_gpio2_io11 (hps_gpio[3]),
    .sys_hps_out_rstn_reset_n (sys_hps_resetn),
    .sys_hps_fpga_irq1_irq ({32{1'b0}}),
    .sys_hps_dma_data_awid(0),
    .sys_hps_dma_data_awaddr(0),
    .sys_hps_dma_data_awlen(0),
    .sys_hps_dma_data_awsize(0),
    .sys_hps_dma_data_awburst(0),
    .sys_hps_dma_data_awlock(0),
    .sys_hps_dma_data_awcache(0),
    .sys_hps_dma_data_awprot(0),
    .sys_hps_dma_data_awvalid(1'b0),
    .sys_hps_dma_data_awready(),
    .sys_hps_dma_data_wid(0),
    .sys_hps_dma_data_wdata(0),
    .sys_hps_dma_data_wstrb(0),
    .sys_hps_dma_data_wlast(1'b0),
    .sys_hps_dma_data_wvalid(1'b0),
    .sys_hps_dma_data_wready(0),
    .sys_hps_dma_data_bid(),
    .sys_hps_dma_data_bresp(),
    .sys_hps_dma_data_bvalid(),
    .sys_hps_dma_data_bready(1'b0),
    .sys_hps_dma_data_arid(0),
    .sys_hps_dma_data_araddr(0),
    .sys_hps_dma_data_arlen(0),
    .sys_hps_dma_data_arsize(0),
    .sys_hps_dma_data_arburst(0),
    .sys_hps_dma_data_arlock(0),
    .sys_hps_dma_data_arcache(0),
    .sys_hps_dma_data_arprot(0),
    .sys_hps_dma_data_arvalid(1'b0),
    .sys_hps_dma_data_arready(),
    .sys_hps_dma_data_rid(),
    .sys_hps_dma_data_rdata(),
    .sys_hps_dma_data_rresp(),
    .sys_hps_dma_data_rlast(),
    .sys_hps_dma_data_rvalid(),
    .sys_hps_dma_data_rready(1'b0),
    .sys_hps_ddr_mem_ck(hps_ddr_clk_p),
    .sys_hps_ddr_mem_ck_n(hps_ddr_clk_n),
    .sys_hps_ddr_mem_a(hps_ddr_a),
    .sys_hps_ddr_mem_act_n(hps_ddr_act_n),
    .sys_hps_ddr_mem_ba(hps_ddr_ba),
    .sys_hps_ddr_mem_bg(hps_ddr_bg),
    .sys_hps_ddr_mem_cke(hps_ddr_cke),
    .sys_hps_ddr_mem_cs_n(hps_ddr_cs_n),
    .sys_hps_ddr_mem_odt(hps_ddr_odt),
    .sys_hps_ddr_mem_reset_n(hps_ddr_reset_n),
    .sys_hps_ddr_mem_par(hps_ddr_par),
    .sys_hps_ddr_mem_alert_n(hps_ddr_alert_n),
    .sys_hps_ddr_mem_dqs(hps_ddr_dqs_p),
    .sys_hps_ddr_mem_dqs_n(hps_ddr_dqs_n),
    .sys_hps_ddr_mem_dq(hps_ddr_dq),
    .sys_hps_ddr_mem_dbi_n(hps_ddr_dbi_n),
    .sys_hps_ddr_oct_oct_rzqin(hps_ddr_rzq),
    .sys_hps_ddr_ref_clk_clk(hps_ddr_ref_clk),
    .sys_hps_ddr_rstn_reset_n(sys_resetn),
    .sys_spi_MISO(spi_miso),
    .sys_spi_MOSI(spi_mosi),
    .sys_spi_SCLK(spi_clk),
    .sys_spi_SS_n(spi_csn),
    .sys_i2c_sda_in(fpga_i2c_sda_in),
    .sys_i2c_scl_in(fpga_i2c_scl_in),
    .sys_i2c_sda_oe(fpga_i2c_sda_oe),
    .sys_i2c_scl_oe(fpga_i2c_scl_oe),
    .fmc_i2c_sda_in(fmc_i2c_sda_in),
    .fmc_i2c_scl_in(fmc_i2c_scl_in),
    .fmc_i2c_sda_oe(fmc_i2c_sda_oe),
    .fmc_i2c_scl_oe(fmc_i2c_scl_oe),
    .irq_irq({4{1'b0}})
  );


endmodule
