//******************************************************************************
//  file:     system_wrapper.v
//
//  author:   JAY CONVERTINO
//
//  date:     2023/11/02
//
//  about:    Brief
//  System wrapper for pl and ps for zed board.
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
 * System wrapper for pl and ps for zed board.
 *
 * Parameters:
 *
 * FPGA_TECHNOLOGY        - Type of FPGA, such as Ultrascale, Arria 10. 1 is for 7 series.
 * FPGA_FAMILY            - Sub type of fpga, such as GX, SX, etc. 4 is for zynq.
 * SPEED_GRADE            - Number that corresponds to the ships recommeneded speed. 10 is for -1.
 * DEV_PACKAGE            - Specify a number that is equal to the manufactures package. 14 is for cl.
 * DELAY_REFCLK_FREQUENCY - Reference clock frequency used for ad_data_in instances
 * ADC_INIT_DELAY         - Initial Delay for the ADC
 * DAC_INIT_DELAY         - Initial Delay for the DAC
 *
 * Ports:
 *
 * ddr_addr               - DDR interface
 * ddr_ba                 - DDR interface
 * ddr_cas_n              - DDR interface
 * ddr_ck_n               - DDR interface
 * ddr_ck_p               - DDR interface
 * ddr_cke                - DDR interface
 * ddr_cs_n               - DDR interface
 * ddr_dm                 - DDR interface
 * ddr_dq                 - DDR interface
 * ddr_dqs_n              - DDR interface
 * ddr_dqs_p              - DDR interface
 * ddr_odt                - DDR interface
 * ddr_ras_n              - DDR interface
 * ddr_reset_n            - DDR interface
 * ddr_we_n               - DDR interface
 * fixed_io_ddr_vrn       - DDR interface
 * fixed_io_ddr_vrp       - DDR interface
 * fixed_io_mio           - ps mio
 * fixed_io_ps_clk        - ps clk
 * fixed_io_ps_porb       - ps por
 * fixed_io_ps_srstb      - ps rst
 * iic_scl_fmc            - fmcomms2-3 i2c
 * iic_sda_fmc            - fmcomms2-3 i2c
 * gpio_bd                - gpio
 * rx_clk_in_p            - fmcomms2-3 rx clk
 * rx_clk_in_n            - fmcomms2-3 rx clk
 * rx_frame_in_p          - fmcomms2-3 rx frame
 * rx_frame_in_n          - fmcomms2-3 rx frame
 * rx_data_in_p           - fmcomms2-3 rx data
 * rx_data_in_n           - fmcomms2-3 rx data
 * tx_clk_out_p           - fmcomms2-3 tx clk
 * tx_clk_out_n           - fmcomms2-3 tx clk
 * tx_frame_out_p         - fmcomms2-3 tx frame
 * tx_frame_out_n         - fmcomms2-3 tx frame
 * tx_data_out_p          - fmcomms2-3 tx data
 * tx_data_out_n          - fmcomms2-3 tx data
 * txnrx                  - fmcomms2-3 txnrx
 * enable                 - fmcomms2-3 enable
 * gpio_muxout_tx         - fmcomms2-3 gpio
 * gpio_muxout_rx         - fmcomms2-3 gpio
 * gpio_resetb            - fmcomms2-3 gpio
 * gpio_sync              - fmcomms2-3 gpio
 * gpio_en_agc            - fmcomms2-3 gpio
 * gpio_ctl               - fmcomms2-3 gpio
 * gpio_status            - fmcomms2-3 gpio
 * spi_csn                - spi chip select
 * spi_clk                - spi clk
 * spi_mosi               - spi master out
 * spi_miso               - spi master in
 * spi_udc_csn_tx         - spi udc chip select tx
 * spi_udc_csn_rx         - spi udc chip select rx
 * spi_udc_sclk           - spi udc clock
 * spi_udc_data           - spi udc data
 */
module system_wrapper (
    inout       [14:0]      ddr_addr,
    inout       [ 2:0]      ddr_ba,
    inout                   ddr_cas_n,
    inout                   ddr_ck_n,
    inout                   ddr_ck_p,
    inout                   ddr_cke,
    inout                   ddr_cs_n,
    inout       [ 3:0]      ddr_dm,
    inout       [31:0]      ddr_dq,
    inout       [ 3:0]      ddr_dqs_n,
    inout       [ 3:0]      ddr_dqs_p,
    inout                   ddr_odt,
    inout                   ddr_ras_n,
    inout                   ddr_reset_n,
    inout                   ddr_we_n,
    inout                   fixed_io_ddr_vrn,
    inout                   fixed_io_ddr_vrp,
    inout       [53:0]      fixed_io_mio,
    inout                   fixed_io_ps_clk,
    inout                   fixed_io_ps_porb,
    inout                   fixed_io_ps_srstb,
    inout                   iic_scl_fmc,
    inout                   iic_sda_fmc,
    inout       [31:0]      gpio_bd,
    input                   otg_vbusoc,
    output                  spi_csn,
    output                  spi_clk,
    output                  spi_mosi,
    input                   spi_miso,
    output                  spi_udc_csn_tx,
    output                  spi_udc_csn_rx,
    output                  spi_udc_sclk,
    output                  spi_udc_data
  );

  // internal signals

  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;

  // instantiations... copy pasta

  ad_iobuf #(.DATA_WIDTH(32)) i_iobuf_gpio (
    .dio_t (gpio_t[31:0]),
    .dio_i (gpio_o[31:0]),
    .dio_o (gpio_i[31:0]),
    .dio_p (gpio_bd));

              
  assign gpio_i[63:32] = gpio_o[63:32];


  // Group: Instantianted Modules

  // Module: inst_system_ps_wrapper
  //
  // Module instance of inst_system_ps_wrapper for the built in CPU.
  system_ps_wrapper inst_system_ps_wrapper
    (
      .GPIO_I(gpio_i),
      .GPIO_O(gpio_o),
      .GPIO_T(gpio_t),
      .SPI0_SCLK_I(1'b0),
      .SPI0_SCLK_O(spi_clk),
      .SPI0_MOSI_I(1'b0),
      .SPI0_MOSI_O(spi_mosi),
      .SPI0_MISO_I(spi_miso),
      .SPI0_SS_I(1'b1),
      .SPI0_SS_O(spi_csn),
      .SPI1_SCLK_I(1'b0),
      .SPI1_SCLK_O(spi_udc_sclk),
      .SPI1_MOSI_I(spi_udc_data),
      .SPI1_MOSI_O(spi_udc_data),
      .SPI1_MISO_I(1'b0),
      .SPI1_SS_I(1'b1),
      .SPI1_SS_O(spi_udc_csn_tx),
      .SPI1_SS1_O(spi_udc_csn_rx),
      .SPI1_SS2_O(),
      .USB0_vbus_pwrfault(~otg_vbusoc),
      .M_AXI_araddr(),
      .M_AXI_arprot(),
      .M_AXI_arready(1'b0),
      .M_AXI_arvalid(),
      .M_AXI_awaddr(),
      .M_AXI_awprot(),
      .M_AXI_awready(1'b0),
      .M_AXI_awvalid(),
      .M_AXI_bready(),
      .M_AXI_bresp(0),
      .M_AXI_bvalid(1'b0),
      .M_AXI_rdata(0),
      .M_AXI_rready(),
      .M_AXI_rresp(1'b0),
      .M_AXI_rvalid(1'b0),
      .M_AXI_wdata(),
      .M_AXI_wready(1'b0),
      .M_AXI_wstrb(),
      .M_AXI_wvalid(),
      .S_AXI_HP0_arready(),
      .S_AXI_HP0_awready(),
      .S_AXI_HP0_bvalid(),
      .S_AXI_HP0_rlast(),
      .S_AXI_HP0_rvalid(),
      .S_AXI_HP0_wready(),
      .S_AXI_HP0_bresp(),
      .S_AXI_HP0_rresp(),
      .S_AXI_HP0_bid(),
      .S_AXI_HP0_rid(),
      .S_AXI_HP0_rdata(),
      .S_AXI_HP0_ACLK(s_axi_clk),
      .S_AXI_HP0_arvalid(1'b0),
      .S_AXI_HP0_awvalid(1'b0),
      .S_AXI_HP0_bready(1'b0),
      .S_AXI_HP0_rready(1'b0),
      .S_AXI_HP0_wlast(1'b0),
      .S_AXI_HP0_wvalid(1'b0),
      .S_AXI_HP0_arburst(2'b01),
      .S_AXI_HP0_arlock(0),
      .S_AXI_HP0_arsize(3'b011),
      .S_AXI_HP0_awburst(0),
      .S_AXI_HP0_awlock(0),
      .S_AXI_HP0_awsize(0),
      .S_AXI_HP0_arprot(0),
      .S_AXI_HP0_awprot(0),
      .S_AXI_HP0_araddr(0),
      .S_AXI_HP0_awaddr(0),
      .S_AXI_HP0_arcache(4'b0011),
      .S_AXI_HP0_arlen(0),
      .S_AXI_HP0_arqos(0),
      .S_AXI_HP0_awcache(0),
      .S_AXI_HP0_awlen(0),
      .S_AXI_HP0_awqos(0),
      .S_AXI_HP0_arid(0),
      .S_AXI_HP0_awid(0),
      .S_AXI_HP0_wid(0),
      .S_AXI_HP0_wdata(0),
      .S_AXI_HP0_wstrb(0),
      .S_AXI_HP1_arready(),
      .S_AXI_HP1_awready(),
      .S_AXI_HP1_bvalid(),
      .S_AXI_HP1_rlast(1'b0),
      .S_AXI_HP1_rvalid(1'b0),
      .S_AXI_HP1_wready(),
      .S_AXI_HP1_bresp(0),
      .S_AXI_HP1_rresp(0),
      .S_AXI_HP1_bid(),
      .S_AXI_HP1_rid(),
      .S_AXI_HP1_rdata(),
      .S_AXI_HP1_ACLK(s_axi_clk),
      .S_AXI_HP1_arvalid(1'b0),
      .S_AXI_HP1_awvalid(1'b0),
      .S_AXI_HP1_bready(1'b0),
      .S_AXI_HP1_rready(),
      .S_AXI_HP1_wlast(1'b0),
      .S_AXI_HP1_wvalid(1'b0),
      .S_AXI_HP1_arburst(0),
      .S_AXI_HP1_arlock(0),
      .S_AXI_HP1_arsize(0),
      .S_AXI_HP1_awburst(2'b01),
      .S_AXI_HP1_awlock(0),
      .S_AXI_HP1_awsize(3'b011),
      .S_AXI_HP1_arprot(0),
      .S_AXI_HP1_awprot(0),
      .S_AXI_HP1_araddr(0),
      .S_AXI_HP1_awaddr(0),
      .S_AXI_HP1_arcache(0),
      .S_AXI_HP1_arlen(0),
      .S_AXI_HP1_arqos(0),
      .S_AXI_HP1_awcache(4'b0011),
      .S_AXI_HP1_awlen(0),
      .S_AXI_HP1_awqos(0),
      .S_AXI_HP1_arid(0),
      .S_AXI_HP1_awid(0),
      .S_AXI_HP1_wid(0),
      .S_AXI_HP1_wdata(0),
      .S_AXI_HP1_wstrb(~0),
      .IRQ_F2P({16{1'b0}}),
      .FCLK_CLK0(s_axi_clk),
      .FCLK_CLK1(s_delay_clk),
      .FIXED_IO_mio(fixed_io_mio),
      .DDR_cas_n(ddr_cas_n),
      .DDR_cke(ddr_cke),
      .DDR_ck_n(ddr_ck_n),
      .DDR_ck_p(ddr_ck_p),
      .DDR_cs_n(ddr_cs_n),
      .DDR_reset_n(ddr_reset_n),
      .DDR_odt(ddr_odt),
      .DDR_ras_n(ddr_ras_n),
      .DDR_we_n(ddr_we_n),
      .DDR_ba(ddr_ba),
      .DDR_addr(ddr_addr),
      .FIXED_IO_ddr_vrn(fixed_io_ddr_vrn),
      .FIXED_IO_ddr_vrp(fixed_io_ddr_vrp),
      .DDR_dm(ddr_dm),
      .DDR_dq(ddr_dq),
      .DDR_dqs_n(ddr_dqs_n),
      .DDR_dqs_p(ddr_dqs_p),
      .FIXED_IO_ps_srstb(fixed_io_ps_srstb),
      .FIXED_IO_ps_clk(fixed_io_ps_clk),
      .FIXED_IO_ps_porb(fixed_io_ps_porb),
      .peripheral_aresetn(s_axi_aresetn)
    );

endmodule
