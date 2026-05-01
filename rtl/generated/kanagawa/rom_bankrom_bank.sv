
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/rom_bank --frequency=250 --register-ratio=8 --max-register-ratio=16 /home/mana/workspace/OpenTaalas/rtl/kanagawa/rom_bank.k

`default_nettype wire
module rom_bankDebugView_read_blockEntry
(
    input wire clk,
    input wire[15:0]  _block_addr,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_blockEntry time: %0t block_addr: %p", $time, _block_addr);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rom_bankDebugView_read_blockExit
(
    input wire clk,
    input wire[879:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_blockExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rom_bankDebugView_write_blockEntry
(
    input wire clk,
    input wire[15:0]  _block_addr,
    input wire[879:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_blockEntry time: %0t block_addr: %p value: %p", $time, _block_addr, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module rom_bank_write_block_BasicBlock_0(	// rom_bank.k:34:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire [879:0] memory_write_data_out_4_0,
  output wire [9:0]   memory_write_addr_out_4_0,
  output wire         memory_wren_4_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [895:0] data_in_3,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// rom_bank.k:34:9
  logic [879:0] memory_write_data_out_4_0_0;	// rom_bank.k:34:9
  logic [9:0]   memory_write_addr_out_4_0_0;	// rom_bank.k:34:9
  logic         memory_wren_4_0_0;	// rom_bank.k:34:9
  logic         fifo_wren_0_0;	// rom_bank.k:34:9
  logic         input_rdy_0_0;	// rom_bank.k:34:9
  logic [7:0]   control_state_out_0;	// rom_bank.k:34:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rom_bank.k:34:9
  wire          _GEN_0 = _GEN & input_valid_0;	// rom_bank.k:34:9
  always_comb begin	// rom_bank.k:34:9
    input_rdy_0_0 = _GEN;	// rom_bank.k:34:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rom_bank.k:34:9
  end // always_comb
  always_comb begin	// rom_bank.k:34:9
    memory_wren_4_0_0 = _GEN_0;	// rom_bank.k:34:9, :36:13
    memory_write_addr_out_4_0_0 = data_in_3[9:0];	// rom_bank.k:36:13
    memory_write_data_out_4_0_0 = data_in_3[895:16];	// rom_bank.k:36:13
  end // always_comb
  reg   [15:0]  p0_block_addr;	// rom_bank.k:34:9
  reg   [879:0] p0_value;	// rom_bank.k:34:9
  reg           p0_stage1_enable = 1'h0;	// rom_bank.k:34:9
  reg           p0_stage2_enable = 1'h0;	// rom_bank.k:34:9
  always @(posedge clk) begin	// rom_bank.k:34:9
    p0_block_addr <= data_in_3[15:0];	// rom_bank.k:34:9
    p0_value <= data_in_3[895:16];	// rom_bank.k:34:9
    if (rst) begin	// rom_bank.k:34:9
      p0_stage1_enable <= 1'h0;	// rom_bank.k:34:9
      p0_stage2_enable <= 1'h0;	// rom_bank.k:34:9
    end
    else begin	// rom_bank.k:34:9
      p0_stage1_enable <= _GEN_0;	// rom_bank.k:34:9
      p0_stage2_enable <= p0_stage1_enable;	// rom_bank.k:34:9
    end
  end // always @(posedge)
  always_comb	// rom_bank.k:34:9
    fifo_wren_0_0 = p0_stage2_enable;	// rom_bank.k:34:9, :38:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rom_bank.k:34:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rom_bank.k:34:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rom_bankDebugView_write_blockEntry rom_bankDebugView_write_blockEntry_instance (	// rom_bank.k:38:9
    .clk         (clk),	// rom_bank.k:38:9
    ._block_addr (p0_stage1_enable ? p0_block_addr : 'x),	// rom_bank.k:34:9, :38:9
    ._value      (p0_stage1_enable ? p0_value : 'x),	// rom_bank.k:34:9, :38:9
    .valid       (p0_stage1_enable),	// rom_bank.k:34:9
    .valid_out   (/* unused */)
  );	// rom_bank.k:38:9
  assign done_out = p0_stage2_enable;	// rom_bank.k:34:9
  assign memory_write_data_out_4_0 = memory_write_data_out_4_0_0;	// rom_bank.k:34:9
  assign memory_write_addr_out_4_0 = memory_write_addr_out_4_0_0;	// rom_bank.k:34:9
  assign memory_wren_4_0 = memory_wren_4_0_0;	// rom_bank.k:34:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rom_bank.k:34:9
  assign input_rdy_0 = input_rdy_0_0;	// rom_bank.k:34:9
  assign control_state_out = control_state_out_0;	// rom_bank.k:34:9
endmodule

module rom_bank_read_block_BasicBlock_0(	// rom_bank.k:23:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire [879:0] memory_read_data_in_4_0,
  output wire [9:0]   memory_read_addr_out_4_0,
  output wire         memory_rden_out_4_0,
  output wire [879:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [15:0]  data_in_2,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  wire  [879:0] memory_read_data_in_4_0_0 = memory_read_data_in_4_0;	// rom_bank.k:23:9
  logic         done_out_0;	// rom_bank.k:23:9
  logic [9:0]   memory_read_addr_out_4_0_0;	// rom_bank.k:23:9
  logic         memory_rden_out_4_0_0;	// rom_bank.k:23:9
  logic [879:0] fifo_data_out_0_0;	// rom_bank.k:23:9
  logic         fifo_wren_0_0;	// rom_bank.k:23:9
  logic         input_rdy_0_0;	// rom_bank.k:23:9
  logic [7:0]   control_state_out_0;	// rom_bank.k:23:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rom_bank.k:23:9
  wire          _GEN_0 = _GEN & input_valid_0;	// rom_bank.k:23:9
  always_comb begin	// rom_bank.k:23:9
    input_rdy_0_0 = _GEN;	// rom_bank.k:23:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rom_bank.k:23:9
  end // always_comb
  always_comb begin	// rom_bank.k:23:9
    memory_read_addr_out_4_0_0 = data_in_2[9:0];	// rom_bank.k:26:22
    memory_rden_out_4_0_0 = _GEN_0;	// rom_bank.k:23:9, :26:22
  end // always_comb
  reg   [15:0]  p0_data_in_2;	// rom_bank.k:23:9
  reg           p0_stage1_enable = 1'h0;	// rom_bank.k:23:9
  reg           p0_stage2_enable = 1'h0;	// rom_bank.k:23:9
  reg   [879:0] p0_memory_read_data_in_4_0;	// rom_bank.k:23:9
  reg           p0_stage3_enable = 1'h0;	// rom_bank.k:23:9
  always @(posedge clk) begin	// rom_bank.k:23:9
    p0_data_in_2 <= data_in_2;	// rom_bank.k:23:9
    if (rst) begin	// rom_bank.k:23:9
      p0_stage1_enable <= 1'h0;	// rom_bank.k:23:9
      p0_stage2_enable <= 1'h0;	// rom_bank.k:23:9
    end
    else begin	// rom_bank.k:23:9
      p0_stage1_enable <= _GEN_0;	// rom_bank.k:23:9
      p0_stage2_enable <= p0_stage1_enable;	// rom_bank.k:23:9
    end
    p0_memory_read_data_in_4_0 <= memory_read_data_in_4_0_0;	// rom_bank.k:23:9
    if (rst)	// rom_bank.k:23:9
      p0_stage3_enable <= 1'h0;	// rom_bank.k:23:9
    else	// rom_bank.k:23:9
      p0_stage3_enable <= p0_stage2_enable;	// rom_bank.k:23:9
  end // always @(posedge)
  always_comb begin	// rom_bank.k:23:9
    fifo_wren_0_0 = p0_stage3_enable;	// rom_bank.k:21:5, :23:9
    fifo_data_out_0_0 = p0_memory_read_data_in_4_0;	// rom_bank.k:21:5, :23:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rom_bank.k:23:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rom_bank.k:23:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rom_bankDebugView_read_blockEntry rom_bankDebugView_read_blockEntry_instance (	// rom_bank.k:21:5
    .clk         (clk),	// rom_bank.k:21:5
    ._block_addr (p0_stage1_enable ? p0_data_in_2 : 'x),	// rom_bank.k:21:5, :23:9
    .valid       (p0_stage1_enable),	// rom_bank.k:23:9
    .valid_out   (/* unused */)
  );	// rom_bank.k:21:5
  rom_bankDebugView_read_blockExit rom_bankDebugView_read_blockExit_instance (	// rom_bank.k:21:5
    .clk          (clk),	// rom_bank.k:21:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_4_0_0 : 'x),	// rom_bank.k:21:5, :23:9
    .valid        (p0_stage2_enable),	// rom_bank.k:23:9
    .valid_out    (/* unused */)
  );	// rom_bank.k:21:5
  assign done_out = p0_stage3_enable;	// rom_bank.k:23:9
  assign memory_read_addr_out_4_0 = memory_read_addr_out_4_0_0;	// rom_bank.k:23:9
  assign memory_rden_out_4_0 = memory_rden_out_4_0_0;	// rom_bank.k:23:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rom_bank.k:23:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rom_bank.k:23:9
  assign input_rdy_0 = input_rdy_0_0;	// rom_bank.k:23:9
  assign control_state_out = control_state_out_0;	// rom_bank.k:23:9
endmodule

module rom_bank__blocks__mem_container(	// rom_bank.k:17:5
  input  wire         clk,
  input  wire         rst,
  input  wire         rden_in_0,
  input  wire [9:0]   read_addr_in_0,
  input  wire         wren_in_0,
  input  wire [9:0]   write_addr_in_0,
  input  wire [879:0] write_data_in_0,
  output wire [879:0] read_data_out_0,
  output wire         init_completed
);

  wire [1:0][879:0] ___blocks_0_data_out;	// rom_bank.k:17:5
  KanagawaSyncRam #(
    .DATA_WIDTH(880),
    .ADDR_WIDTH(10),
    .DEPTH(1024),
    .MAX_DEPTH(512),
    .USE_LUTRAM(0),
    .USE_BRAM(1),
    .USE_OUTPUT_REG(1),
    .WRITE_DELAY(0),
    .USE_HARDENED_BYPASS(0),
    .TRUE_DUAL_PORT(0),
    .SUPPORTS_RW_COLLISIONS(0),
    .ECC(0),
    .INITIAL_DATA_FILE("UNUSED"),
    .DEVICE_FAMILY("mock")
  ) __blocks_0 (	// rom_bank.k:17:5
    .clk            (clk),	// rom_bank.k:17:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// rom_bank.k:17:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// rom_bank.k:17:5
    .data_in        ({{880'h0}, {write_data_in_0}}),	// rom_bank.k:17:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// rom_bank.k:17:5
    .data_out       (___blocks_0_data_out)
  );	// rom_bank.k:17:5
  assign read_data_out_0 = ___blocks_0_data_out[1'h1];	// rom_bank.k:17:5
  assign init_completed = 1'h1;	// rom_bank.k:17:5
endmodule

module rom_bank(
  input  wire         clk,
  input  wire         rst,
  input  wire         read_block_valid_in,
  input  wire [15:0]  read_block_block_addr_in,
  input  wire         read_block_rden_in,
  input  wire         write_block_valid_in,
  input  wire [15:0]  write_block_block_addr_in,
  input  wire [879:0] write_block_value_in,
  input  wire         write_block_rden_in,
  input  wire [2:0]   stall_rate_in,
  input  wire         stall_rate_valid_in,
  output wire         rst_and_startup_done_out,
  output wire         read_block_rdy_out,
  output wire         read_block_empty_out,
  output wire [879:0] read_block_result_out,
  output wire         write_block_rdy_out,
  output wire         write_block_empty_out,
  output wire         stall_rate_supported_out
);

  wire [879:0] _write_block_BasicBlock_0Impl_memory_write_data_out_4_0;	// rom_bank.k:34:9
  wire [9:0]   _write_block_BasicBlock_0Impl_memory_write_addr_out_4_0;	// rom_bank.k:34:9
  wire         _write_block_BasicBlock_0Impl_memory_wren_4_0;	// rom_bank.k:34:9
  wire         _write_block_BasicBlock_0Impl_fifo_wren_0;	// rom_bank.k:34:9
  wire         _write_block_BasicBlock_0Impl_input_rdy_0;	// rom_bank.k:34:9
  wire [9:0]   _read_block_BasicBlock_0Impl_memory_read_addr_out_4_0;	// rom_bank.k:23:9
  wire         _read_block_BasicBlock_0Impl_memory_rden_out_4_0;	// rom_bank.k:23:9
  wire [879:0] _read_block_BasicBlock_0Impl_fifo_data_out_0;	// rom_bank.k:23:9
  wire         _read_block_BasicBlock_0Impl_fifo_wren_0;	// rom_bank.k:23:9
  wire         _read_block_BasicBlock_0Impl_input_rdy_0;	// rom_bank.k:23:9
  wire         _fifo_1_write_block_Return_overflow_out;
  wire         _fifo_1_write_block_Return_underflow_out;
  wire         _fifo_1_write_block_Return_empty;
  wire         _fifo_1_write_block_Return_full;
  wire         _fifo_0_read_block_Return_overflow_out;
  wire         _fifo_0_read_block_Return_underflow_out;
  wire         _fifo_0_read_block_Return_empty;
  wire         _fifo_0_read_block_Return_full;
  wire [879:0] _fifo_0_read_block_Return_q;
  wire         _has_startup_completed_delayed_1_delay_chain_data_out;
  wire         _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [879:0] __blocks_read_data_out_0;	// rom_bank.k:17:5
  wire         __blocks_init_completed;	// rom_bank.k:17:5
  wire         _reset_control_rst_and_startup_done_out;
  wire [3:0]   _reset_control_rst_delayed_out;
  wire         _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  write_block_empty_out_net;
  logic  write_block_rdy_out_net;
  logic  read_block_empty_out_net;
  logic [879:0] read_block_result_out_net;
  logic  read_block_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [3:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire         _GEN = has_startup_completed_raw & __blocks_init_completed;	// rom_bank.k:17:5
  logic has_others_completed;
  assign has_others_completed = _GEN;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;

  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [879:0] data_in;
      logic [879:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_2;
  assign passthrough_data_2.underflow = 1'b0;
  assign passthrough_data_2.rdy_ext = passthrough_data_2.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [895:0] data;
      logic underflow;
  } passthrough_data_3;
  assign passthrough_data_3.underflow = 1'b0;
  assign passthrough_data_3.rdy_ext = passthrough_data_3.rdy_int & !(!has_startup_completed_delayed_1);
  assign read_block_rdy_out_net = passthrough_data_2.rdy_ext;
  assign passthrough_data_2.valid = read_block_rdy_out & read_block_valid_in;
  assign passthrough_data_2.data = { read_block_block_addr_in };
  assign fifo_data_0.rden = read_block_rden_in;
  assign read_block_result_out_net = fifo_data_0.data_out;
  assign read_block_empty_out_net = fifo_data_0.empty;
  assign write_block_rdy_out_net = passthrough_data_3.rdy_ext;
  assign passthrough_data_3.valid = write_block_rdy_out & write_block_valid_in;
  assign passthrough_data_3.data = { write_block_value_in, write_block_block_addr_in };
  assign fifo_data_1.rden = write_block_rden_in;
  assign write_block_empty_out_net = fifo_data_1.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_read_block_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_read_block_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_read_block_Return_empty;
    fifo_data_0.almost_full = _fifo_0_read_block_Return_full;
    fifo_data_0.data_out = _fifo_0_read_block_Return_q;
    fifo_data_1.overflow = _fifo_1_write_block_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_write_block_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_write_block_Return_empty;
    fifo_data_1.almost_full = _fifo_1_write_block_Return_full;
    fifo_data_0.data_in = _read_block_BasicBlock_0Impl_fifo_data_out_0;	// rom_bank.k:23:9
    fifo_data_0.wren = _read_block_BasicBlock_0Impl_fifo_wren_0;	// rom_bank.k:23:9
    passthrough_data_2.rdy_int = _read_block_BasicBlock_0Impl_input_rdy_0;	// rom_bank.k:23:9
    fifo_data_1.wren = _write_block_BasicBlock_0Impl_fifo_wren_0;	// rom_bank.k:34:9
    passthrough_data_3.rdy_int = _write_block_BasicBlock_0Impl_input_rdy_0;	// rom_bank.k:34:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(4),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(18),
    .ADDTIONAL_LATENCY(1),
    .INIT_VAL(1)
  ) reset_control (
    .clk                                    (clk),
    .rst_in                                 (combined_reset),
    .has_others_completed_in                (_GEN),
    .rst_and_startup_done_out               (_reset_control_rst_and_startup_done_out),
    .rst_delayed_out                        (_reset_control_rst_delayed_out),
    .reset_sequence_finished_this_cycle_out
      (_reset_control_reset_sequence_finished_this_cycle_out)
  );
  rom_bank__blocks__mem_container _blocks (	// rom_bank.k:17:5
    .clk             (clk),	// rom_bank.k:17:5
    .rst             (1'b0),	// rom_bank.k:17:5
    .rden_in_0       (_read_block_BasicBlock_0Impl_memory_rden_out_4_0),	// rom_bank.k:23:9
    .read_addr_in_0  (_read_block_BasicBlock_0Impl_memory_read_addr_out_4_0),	// rom_bank.k:23:9
    .wren_in_0       (_write_block_BasicBlock_0Impl_memory_wren_4_0),	// rom_bank.k:34:9
    .write_addr_in_0 (_write_block_BasicBlock_0Impl_memory_write_addr_out_4_0),	// rom_bank.k:34:9
    .write_data_in_0 (_write_block_BasicBlock_0Impl_memory_write_data_out_4_0),	// rom_bank.k:34:9
    .read_data_out_0 (__blocks_read_data_out_0),
    .init_completed  (__blocks_init_completed)
  );	// rom_bank.k:17:5
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_0_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_0_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_1_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_1_delay_chain_data_out)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(880),
    .PORT_WIDTH(880),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_read_block_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_read_block_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_read_block_Return_overflow_out),
    .underflow_out (_fifo_0_read_block_Return_underflow_out),
    .empty         (_fifo_0_read_block_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_read_block_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_read_block_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_write_block_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_1_write_block_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_write_block_Return_overflow_out),
    .underflow_out (_fifo_1_write_block_Return_underflow_out),
    .empty         (_fifo_1_write_block_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_write_block_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  rom_bank_read_block_BasicBlock_0 read_block_BasicBlock_0Impl (	// rom_bank.k:23:9
    .clk                       (clk),	// rom_bank.k:23:9
    .rst                       (reg_rst_delayed[2]),	// rom_bank.k:23:9
    .done_out                  (/* unused */),
    .memory_read_data_in_4_0   (__blocks_read_data_out_0),	// rom_bank.k:17:5
    .memory_read_addr_out_4_0  (_read_block_BasicBlock_0Impl_memory_read_addr_out_4_0),
    .memory_rden_out_4_0       (_read_block_BasicBlock_0Impl_memory_rden_out_4_0),
    .fifo_data_out_0           (_read_block_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_block_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// rom_bank.k:23:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// rom_bank.k:23:9
    .data_in_2                 (passthrough_data_2.data),	// rom_bank.k:23:9
    .input_fifo_underflow_0    (passthrough_data_2.underflow),	// rom_bank.k:23:9
    .input_rdy_0               (_read_block_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_2.valid),	// rom_bank.k:23:9
    .control_state_out         (/* unused */)
  );	// rom_bank.k:23:9
  rom_bank_write_block_BasicBlock_0 write_block_BasicBlock_0Impl (	// rom_bank.k:34:9
    .clk                       (clk),	// rom_bank.k:34:9
    .rst                       (reg_rst_delayed[3]),	// rom_bank.k:34:9
    .done_out                  (/* unused */),
    .memory_write_data_out_4_0 (_write_block_BasicBlock_0Impl_memory_write_data_out_4_0),
    .memory_write_addr_out_4_0 (_write_block_BasicBlock_0Impl_memory_write_addr_out_4_0),
    .memory_wren_4_0           (_write_block_BasicBlock_0Impl_memory_wren_4_0),
    .fifo_wren_0               (_write_block_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// rom_bank.k:34:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// rom_bank.k:34:9
    .data_in_3                 (passthrough_data_3.data),	// rom_bank.k:34:9
    .input_fifo_underflow_0    (passthrough_data_3.underflow),	// rom_bank.k:34:9
    .input_rdy_0               (_write_block_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_3.valid),	// rom_bank.k:34:9
    .control_state_out         (/* unused */)
  );	// rom_bank.k:34:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign read_block_rdy_out = read_block_rdy_out_net;
  assign read_block_empty_out = read_block_empty_out_net;
  assign read_block_result_out = read_block_result_out_net;
  assign write_block_rdy_out = write_block_rdy_out_net;
  assign write_block_empty_out = write_block_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module rom_bank_EsiWrapper(
     input  wire                                                                clk,
     input  wire                                                                rst,
     input  wire [2:0]                                                          stall_rate_in,
     input  wire                                                                stall_rate_valid_in,
     input  wire struct packed {logic [15:0] block_addr; }                      read_block_arg,
     input  wire                                                                read_block_arg_valid,
     input  wire struct packed {logic [15:0] block_addr; logic [879:0] value; } write_block_arg,
     input  wire                                                                write_block_arg_valid,
     input  wire                                                                read_block_result_rden,
     input  wire                                                                write_block_result_rden,
     output wire                                                                read_block_arg_ready,
     output wire                                                                write_block_arg_ready,
     output wire [879:0]                                                        read_block_result,
     output wire                                                                read_block_result_empty,
  // output wire /*Zero Width*/                                                 write_block_result,
     output wire                                                                write_block_result_empty,
     output wire                                                                rst_and_startup_done_out,
     output wire                                                                stall_rate_supported_out
);

  wire [879:0] _EsiWrapped_read_block_result_out;
  rom_bank EsiWrapped (
    .clk                       (clk),
    .rst                       (rst),
    .read_block_valid_in       (read_block_arg_valid),
    .read_block_block_addr_in  (read_block_arg.block_addr),
    .read_block_rden_in        (read_block_result_rden),
    .write_block_valid_in      (write_block_arg_valid),
    .write_block_block_addr_in (write_block_arg.block_addr),
    .write_block_value_in      (write_block_arg.value),
    .write_block_rden_in       (write_block_result_rden),
    .stall_rate_in             (stall_rate_in),
    .stall_rate_valid_in       (stall_rate_valid_in),
    .rst_and_startup_done_out  (rst_and_startup_done_out),
    .read_block_rdy_out        (read_block_arg_ready),
    .read_block_empty_out      (read_block_result_empty),
    .read_block_result_out     (_EsiWrapped_read_block_result_out),
    .write_block_rdy_out       (write_block_arg_ready),
    .write_block_empty_out     (write_block_result_empty),
    .stall_rate_supported_out  (stall_rate_supported_out)
  );
  assign read_block_result = _EsiWrapped_read_block_result_out;
  // Zero width: assign write_block_result = /*Zero width*/;
endmodule

