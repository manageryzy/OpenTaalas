
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=third-party/kanagawa/library --base-library=third-party/kanagawa/library/mini-base.k --output=rtl/generated/kanagawa/mac_array_ rtl/kanagawa/mac_array.k

`default_nettype wire
module mac_arrayDebugView_mac_stepEntry
(
    input wire clk,
    input wire[1:0]  _pe_id,
    input wire[3:0]  _magnitude,
    input wire _sign_bit,
    input wire[7:0]  _activation,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("mac_stepEntry time: %0t pe_id: %p magnitude: %p sign_bit: %p activation: %p", $time, _pe_id, _magnitude, _sign_bit, _activation);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_mac_stepExit
(
    input wire clk,
    input wire[23:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("mac_stepExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_accumEntry
(
    input wire clk,
    input wire[1:0]  _pe_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_accumEntry time: %0t pe_id: %p", $time, _pe_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_accumExit
(
    input wire clk,
    input wire[23:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_accumExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_rom_blockEntry
(
    input wire clk,
    input wire[15:0]  _block_addr,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_rom_blockEntry time: %0t block_addr: %p", $time, _block_addr);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_rom_blockExit
(
    input wire clk,
    input wire[879:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_rom_blockExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_write_rom_blockEntry
(
    input wire clk,
    input wire[15:0]  _block_addr,
    input wire[879:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_rom_blockEntry time: %0t block_addr: %p value: %p", $time, _block_addr, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_gridEntry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_gridEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_gridExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_gridExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_write_gridEntry
(
    input wire clk,
    input wire[8:0]  _index,
    input wire[31:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_gridEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_set_fp32_accumEntry
(
    input wire clk,
    input wire[1:0]  _pe_id,
    input wire[31:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_fp32_accumEntry time: %0t pe_id: %p value: %p", $time, _pe_id, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_fp32_accumEntry
(
    input wire clk,
    input wire[1:0]  _pe_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_fp32_accumEntry time: %0t pe_id: %p", $time, _pe_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_read_fp32_accumExit
(
    input wire clk,
    input wire[31:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_fp32_accumExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_clear_peEntry
(
    input wire clk,
    input wire[1:0]  _pe_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("clear_peEntry time: %0t pe_id: %p", $time, _pe_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module mac_arrayDebugView_clear_fp32Entry
(
    input wire clk,
    input wire[1:0]  _pe_id,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("clear_fp32Entry time: %0t pe_id: %p", $time, _pe_id);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module mac_array_clear_all_BasicBlock_0(	// mac_array.k:82:9
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__accum_element_0_21_2_valid,
  output wire       global_out__accum_element_1_22_2_valid,
  output wire       global_out__accum_element_2_23_2_valid,
  output wire       global_out__accum_element_3_24_2_valid,
  output wire       global_out__fp32_accum_element_0_25_2_valid,
  output wire       global_out__fp32_accum_element_1_26_2_valid,
  output wire       global_out__fp32_accum_element_2_27_2_valid,
  output wire       global_out__fp32_accum_element_3_28_2_valid,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// mac_array.k:82:9
  logic       global_out__accum_element_0_21_2_valid_0;	// mac_array.k:82:9
  logic       global_out__accum_element_1_22_2_valid_0;	// mac_array.k:82:9
  logic       global_out__accum_element_2_23_2_valid_0;	// mac_array.k:82:9
  logic       global_out__accum_element_3_24_2_valid_0;	// mac_array.k:82:9
  logic       global_out__fp32_accum_element_0_25_2_valid_0;	// mac_array.k:82:9
  logic       global_out__fp32_accum_element_1_26_2_valid_0;	// mac_array.k:82:9
  logic       global_out__fp32_accum_element_2_27_2_valid_0;	// mac_array.k:82:9
  logic       global_out__fp32_accum_element_3_28_2_valid_0;	// mac_array.k:82:9
  logic       fifo_wren_0_0;	// mac_array.k:82:9
  logic       input_rdy_0_0;	// mac_array.k:82:9
  logic [7:0] control_state_out_0;	// mac_array.k:82:9
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:82:9
  always_comb begin	// mac_array.k:82:9
    input_rdy_0_0 = _GEN;	// mac_array.k:82:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:82:9
  end // always_comb
  reg         p0_stage1_enable = 1'h0;	// mac_array.k:82:9
  always_comb begin	// mac_array.k:82:9
    global_out__accum_element_0_21_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__accum_element_1_22_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__accum_element_2_23_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__accum_element_3_24_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__fp32_accum_element_0_25_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__fp32_accum_element_1_26_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__fp32_accum_element_2_27_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
    global_out__fp32_accum_element_3_28_2_valid_0 = p0_stage1_enable;	// mac_array.k:82:9
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// mac_array.k:82:9
  always @(posedge clk) begin	// mac_array.k:82:9
    if (rst) begin	// mac_array.k:82:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:82:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:82:9
    end
    else begin	// mac_array.k:82:9
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:82:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:82:9
    end
  end // always @(posedge)
  always_comb	// mac_array.k:82:9
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:82:9, :87:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:82:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:82:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  assign done_out = p0_stage2_enable;	// mac_array.k:82:9
  assign global_out__accum_element_0_21_2_valid =
    global_out__accum_element_0_21_2_valid_0;	// mac_array.k:82:9
  assign global_out__accum_element_1_22_2_valid =
    global_out__accum_element_1_22_2_valid_0;	// mac_array.k:82:9
  assign global_out__accum_element_2_23_2_valid =
    global_out__accum_element_2_23_2_valid_0;	// mac_array.k:82:9
  assign global_out__accum_element_3_24_2_valid =
    global_out__accum_element_3_24_2_valid_0;	// mac_array.k:82:9
  assign global_out__fp32_accum_element_0_25_2_valid =
    global_out__fp32_accum_element_0_25_2_valid_0;	// mac_array.k:82:9
  assign global_out__fp32_accum_element_1_26_2_valid =
    global_out__fp32_accum_element_1_26_2_valid_0;	// mac_array.k:82:9
  assign global_out__fp32_accum_element_2_27_2_valid =
    global_out__fp32_accum_element_2_27_2_valid_0;	// mac_array.k:82:9
  assign global_out__fp32_accum_element_3_28_2_valid =
    global_out__fp32_accum_element_3_28_2_valid_0;	// mac_array.k:82:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:82:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:82:9
  assign control_state_out = control_state_out_0;	// mac_array.k:82:9
endmodule

module mac_array_clear_fp32_BasicBlock_0(	// mac_array.k:79:38
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__fp32_accum_element_0_25_1_valid,
  output wire       global_out__fp32_accum_element_1_26_1_valid,
  output wire       global_out__fp32_accum_element_2_27_1_valid,
  output wire       global_out__fp32_accum_element_3_28_1_valid,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [1:0] data_in_20,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// mac_array.k:79:38
  logic       global_out__fp32_accum_element_0_25_1_valid_0;	// mac_array.k:79:38
  logic       global_out__fp32_accum_element_1_26_1_valid_0;	// mac_array.k:79:38
  logic       global_out__fp32_accum_element_2_27_1_valid_0;	// mac_array.k:79:38
  logic       global_out__fp32_accum_element_3_28_1_valid_0;	// mac_array.k:79:38
  logic       fifo_wren_0_0;	// mac_array.k:79:38
  logic       input_rdy_0_0;	// mac_array.k:79:38
  logic [7:0] control_state_out_0;	// mac_array.k:79:38
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:79:38
  always_comb begin	// mac_array.k:79:38
    input_rdy_0_0 = _GEN;	// mac_array.k:79:38
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:79:38
  end // always_comb
  reg   [1:0] p0_data_in_20;	// mac_array.k:79:38
  reg         p0_stage1_enable = 1'h0;	// mac_array.k:79:38
  always_comb begin	// mac_array.k:79:38
    global_out__fp32_accum_element_2_27_1_valid_0 =
      p0_stage1_enable & p0_data_in_20 == 2'h2;	// mac_array.k:79:{38,47}
    global_out__fp32_accum_element_3_28_1_valid_0 = p0_stage1_enable & (&p0_data_in_20);	// mac_array.k:79:{38,47}
  end // always_comb
  always_comb begin	// mac_array.k:79:38
    global_out__fp32_accum_element_0_25_1_valid_0 =
      p0_stage1_enable & p0_data_in_20 == 2'h0;	// mac_array.k:79:{38,47}
    global_out__fp32_accum_element_1_26_1_valid_0 =
      p0_stage1_enable & p0_data_in_20 == 2'h1;	// mac_array.k:79:{38,47}
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// mac_array.k:79:38
  always @(posedge clk) begin	// mac_array.k:79:38
    p0_data_in_20 <= data_in_20;	// mac_array.k:79:38
    if (rst) begin	// mac_array.k:79:38
      p0_stage1_enable <= 1'h0;	// mac_array.k:79:38
      p0_stage2_enable <= 1'h0;	// mac_array.k:79:38
    end
    else begin	// mac_array.k:79:38
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:79:38
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:79:38
    end
  end // always @(posedge)
  always_comb	// mac_array.k:79:38
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:79:38
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:79:38
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:79:38
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_clear_fp32Entry mac_arrayDebugView_clear_fp32Entry_instance (	// mac_array.k:79:38
    .clk       (clk),	// mac_array.k:79:38
    ._pe_id    (p0_stage1_enable ? p0_data_in_20 : 'x),	// mac_array.k:79:38
    .valid     (p0_stage1_enable),	// mac_array.k:79:38
    .valid_out (/* unused */)
  );	// mac_array.k:79:38
  assign done_out = p0_stage2_enable;	// mac_array.k:79:38
  assign global_out__fp32_accum_element_0_25_1_valid =
    global_out__fp32_accum_element_0_25_1_valid_0;	// mac_array.k:79:38
  assign global_out__fp32_accum_element_1_26_1_valid =
    global_out__fp32_accum_element_1_26_1_valid_0;	// mac_array.k:79:38
  assign global_out__fp32_accum_element_2_27_1_valid =
    global_out__fp32_accum_element_2_27_1_valid_0;	// mac_array.k:79:38
  assign global_out__fp32_accum_element_3_28_1_valid =
    global_out__fp32_accum_element_3_28_1_valid_0;	// mac_array.k:79:38
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:79:38
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:79:38
  assign control_state_out = control_state_out_0;	// mac_array.k:79:38
endmodule

module mac_array_clear_pe_BasicBlock_0(	// mac_array.k:78:36
  input  wire       clk,
  input  wire       rst,
  output wire       done_out,
  output wire       global_out__accum_element_0_21_1_valid,
  output wire       global_out__accum_element_1_22_1_valid,
  output wire       global_out__accum_element_2_23_1_valid,
  output wire       global_out__accum_element_3_24_1_valid,
  output wire       fifo_wren_0,
  input  wire       fifo_almost_full_in_raw_0,
  input  wire       fifo_overflow_in_0,
  input  wire [1:0] data_in_19,
  input  wire       input_fifo_underflow_0,
  output wire       input_rdy_0,
  input  wire       input_valid_0,
  output wire [7:0] control_state_out
);

  wire        _fifo_overflow_ffc_0_data_out;
  wire        _fifo_almostfull_ffc_0_data_out;
  logic       done_out_0;	// mac_array.k:78:36
  logic       global_out__accum_element_0_21_1_valid_0;	// mac_array.k:78:36
  logic       global_out__accum_element_1_22_1_valid_0;	// mac_array.k:78:36
  logic       global_out__accum_element_2_23_1_valid_0;	// mac_array.k:78:36
  logic       global_out__accum_element_3_24_1_valid_0;	// mac_array.k:78:36
  logic       fifo_wren_0_0;	// mac_array.k:78:36
  logic       input_rdy_0_0;	// mac_array.k:78:36
  logic [7:0] control_state_out_0;	// mac_array.k:78:36
  wire        _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:78:36
  always_comb begin	// mac_array.k:78:36
    input_rdy_0_0 = _GEN;	// mac_array.k:78:36
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:78:36
  end // always_comb
  reg   [1:0] p0_data_in_19;	// mac_array.k:78:36
  reg         p0_stage1_enable = 1'h0;	// mac_array.k:78:36
  always_comb begin	// mac_array.k:78:36
    global_out__accum_element_2_23_1_valid_0 = p0_stage1_enable & p0_data_in_19 == 2'h2;	// mac_array.k:78:{36,45}
    global_out__accum_element_3_24_1_valid_0 = p0_stage1_enable & (&p0_data_in_19);	// mac_array.k:78:{36,45}
  end // always_comb
  always_comb begin	// mac_array.k:78:36
    global_out__accum_element_0_21_1_valid_0 = p0_stage1_enable & p0_data_in_19 == 2'h0;	// mac_array.k:78:{36,45}
    global_out__accum_element_1_22_1_valid_0 = p0_stage1_enable & p0_data_in_19 == 2'h1;	// mac_array.k:78:{36,45}
  end // always_comb
  reg         p0_stage2_enable = 1'h0;	// mac_array.k:78:36
  always @(posedge clk) begin	// mac_array.k:78:36
    p0_data_in_19 <= data_in_19;	// mac_array.k:78:36
    if (rst) begin	// mac_array.k:78:36
      p0_stage1_enable <= 1'h0;	// mac_array.k:78:36
      p0_stage2_enable <= 1'h0;	// mac_array.k:78:36
    end
    else begin	// mac_array.k:78:36
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:78:36
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:78:36
    end
  end // always @(posedge)
  always_comb	// mac_array.k:78:36
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:78:36
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:78:36
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:78:36
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_clear_peEntry mac_arrayDebugView_clear_peEntry_instance (	// mac_array.k:78:36
    .clk       (clk),	// mac_array.k:78:36
    ._pe_id    (p0_stage1_enable ? p0_data_in_19 : 'x),	// mac_array.k:78:36
    .valid     (p0_stage1_enable),	// mac_array.k:78:36
    .valid_out (/* unused */)
  );	// mac_array.k:78:36
  assign done_out = p0_stage2_enable;	// mac_array.k:78:36
  assign global_out__accum_element_0_21_1_valid =
    global_out__accum_element_0_21_1_valid_0;	// mac_array.k:78:36
  assign global_out__accum_element_1_22_1_valid =
    global_out__accum_element_1_22_1_valid_0;	// mac_array.k:78:36
  assign global_out__accum_element_2_23_1_valid =
    global_out__accum_element_2_23_1_valid_0;	// mac_array.k:78:36
  assign global_out__accum_element_3_24_1_valid =
    global_out__accum_element_3_24_1_valid_0;	// mac_array.k:78:36
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:78:36
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:78:36
  assign control_state_out = control_state_out_0;	// mac_array.k:78:36
endmodule

module mac_array_read_fp32_accum_BasicBlock_0(	// mac_array.k:75:45
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] global_in__fp32_accum_element_0_25,
  input  wire [31:0] global_in__fp32_accum_element_1_26,
  input  wire [31:0] global_in__fp32_accum_element_2_27,
  input  wire [31:0] global_in__fp32_accum_element_3_28,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [1:0]  data_in_18,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] global_in__fp32_accum_element_0_25_0 = global_in__fp32_accum_element_0_25;	// mac_array.k:75:45
  wire  [31:0] global_in__fp32_accum_element_1_26_0 = global_in__fp32_accum_element_1_26;	// mac_array.k:75:45
  wire  [31:0] global_in__fp32_accum_element_2_27_0 = global_in__fp32_accum_element_2_27;	// mac_array.k:75:45
  wire  [31:0] global_in__fp32_accum_element_3_28_0 = global_in__fp32_accum_element_3_28;	// mac_array.k:75:45
  logic        done_out_0;	// mac_array.k:75:45
  logic [31:0] fifo_data_out_0_0;	// mac_array.k:75:45
  logic        fifo_wren_0_0;	// mac_array.k:75:45
  logic        input_rdy_0_0;	// mac_array.k:75:45
  logic [7:0]  control_state_out_0;	// mac_array.k:75:45
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:75:45
  always_comb begin	// mac_array.k:75:45
    input_rdy_0_0 = _GEN;	// mac_array.k:75:45
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:75:45
  end // always_comb
  reg   [1:0]  p0_data_in_18;	// mac_array.k:75:45
  reg          p0_stage1_enable = 1'h0;	// mac_array.k:75:45
  wire  [31:0] _fp32_accum =
    p0_data_in_18[1]
      ? (p0_data_in_18[0]
           ? global_in__fp32_accum_element_3_28_0
           : global_in__fp32_accum_element_2_27_0)
      : p0_data_in_18[0]
          ? global_in__fp32_accum_element_1_26_0
          : global_in__fp32_accum_element_0_25_0;	// mac_array.k:75:{45,52}
  reg   [31:0] p0__fp32_accum;	// mac_array.k:75:45
  reg          p0_stage2_enable = 1'h0;	// mac_array.k:75:45
  always @(posedge clk) begin	// mac_array.k:75:45
    p0_data_in_18 <= data_in_18;	// mac_array.k:75:45
    if (rst)	// mac_array.k:75:45
      p0_stage1_enable <= 1'h0;	// mac_array.k:75:45
    else	// mac_array.k:75:45
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:75:45
    p0__fp32_accum <= _fp32_accum;	// mac_array.k:75:{45,52}
    if (rst)	// mac_array.k:75:45
      p0_stage2_enable <= 1'h0;	// mac_array.k:75:45
    else	// mac_array.k:75:45
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:75:45
  end // always @(posedge)
  always_comb begin	// mac_array.k:75:45
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:75:{5,45}
    fifo_data_out_0_0 = p0__fp32_accum;	// mac_array.k:75:{5,45}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:75:45
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:75:45
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_read_fp32_accumEntry mac_arrayDebugView_read_fp32_accumEntry_instance (	// mac_array.k:75:5
    .clk       (clk),	// mac_array.k:75:5
    ._pe_id    (p0_stage1_enable ? p0_data_in_18 : 'x),	// mac_array.k:75:{5,45}
    .valid     (p0_stage1_enable),	// mac_array.k:75:45
    .valid_out (/* unused */)
  );	// mac_array.k:75:5
  mac_arrayDebugView_read_fp32_accumExit mac_arrayDebugView_read_fp32_accumExit_instance (	// mac_array.k:75:5
    .clk          (clk),	// mac_array.k:75:5
    ._ReturnValue (p0_stage1_enable ? _fp32_accum : 'x),	// mac_array.k:75:{5,45,52}
    .valid        (p0_stage1_enable),	// mac_array.k:75:45
    .valid_out    (/* unused */)
  );	// mac_array.k:75:5
  assign done_out = p0_stage2_enable;	// mac_array.k:75:45
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_array.k:75:45
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:75:45
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:75:45
  assign control_state_out = control_state_out_0;	// mac_array.k:75:45
endmodule

module mac_array_set_fp32_accum_BasicBlock_0(	// mac_array.k:72:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__fp32_accum_element_0_25_0_valid,
  output wire [31:0] global_out__fp32_accum_element_0_25_0,
  output wire        global_out__fp32_accum_element_1_26_0_valid,
  output wire [31:0] global_out__fp32_accum_element_1_26_0,
  output wire        global_out__fp32_accum_element_2_27_0_valid,
  output wire [31:0] global_out__fp32_accum_element_2_27_0,
  output wire        global_out__fp32_accum_element_3_28_0_valid,
  output wire [31:0] global_out__fp32_accum_element_3_28_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [33:0] data_in_17,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// mac_array.k:72:9
  logic        global_out__fp32_accum_element_0_25_0_valid_0;	// mac_array.k:72:9
  logic [31:0] global_out__fp32_accum_element_0_25_0_0;	// mac_array.k:72:9
  logic        global_out__fp32_accum_element_1_26_0_valid_0;	// mac_array.k:72:9
  logic [31:0] global_out__fp32_accum_element_1_26_0_0;	// mac_array.k:72:9
  logic        global_out__fp32_accum_element_2_27_0_valid_0;	// mac_array.k:72:9
  logic [31:0] global_out__fp32_accum_element_2_27_0_0;	// mac_array.k:72:9
  logic        global_out__fp32_accum_element_3_28_0_valid_0;	// mac_array.k:72:9
  logic [31:0] global_out__fp32_accum_element_3_28_0_0;	// mac_array.k:72:9
  logic        fifo_wren_0_0;	// mac_array.k:72:9
  logic        input_rdy_0_0;	// mac_array.k:72:9
  logic [7:0]  control_state_out_0;	// mac_array.k:72:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:72:9
  always_comb begin	// mac_array.k:72:9
    input_rdy_0_0 = _GEN;	// mac_array.k:72:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:72:9
  end // always_comb
  reg   [1:0]  p0_pe_id;	// mac_array.k:72:9
  reg   [31:0] p0_value;	// mac_array.k:72:9
  reg          p0_stage1_enable = 1'h0;	// mac_array.k:72:9
  always_comb begin	// mac_array.k:72:9
    global_out__fp32_accum_element_2_27_0_0 = p0_value;	// mac_array.k:72:9
    global_out__fp32_accum_element_2_27_0_valid_0 = p0_stage1_enable & p0_pe_id == 2'h2;	// mac_array.k:72:{9,18}
    global_out__fp32_accum_element_3_28_0_0 = p0_value;	// mac_array.k:72:9
    global_out__fp32_accum_element_3_28_0_valid_0 = p0_stage1_enable & (&p0_pe_id);	// mac_array.k:72:{9,18}
  end // always_comb
  always_comb begin	// mac_array.k:72:9
    global_out__fp32_accum_element_0_25_0_0 = p0_value;	// mac_array.k:72:9
    global_out__fp32_accum_element_0_25_0_valid_0 = p0_stage1_enable & p0_pe_id == 2'h0;	// mac_array.k:72:{9,18}
    global_out__fp32_accum_element_1_26_0_0 = p0_value;	// mac_array.k:72:9
    global_out__fp32_accum_element_1_26_0_valid_0 = p0_stage1_enable & p0_pe_id == 2'h1;	// mac_array.k:72:{9,18}
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// mac_array.k:72:9
  always @(posedge clk) begin	// mac_array.k:72:9
    p0_pe_id <= data_in_17[1:0];	// mac_array.k:72:9
    p0_value <= data_in_17[33:2];	// mac_array.k:72:9
    if (rst) begin	// mac_array.k:72:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:72:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:72:9
    end
    else begin	// mac_array.k:72:9
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:72:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:72:9
    end
  end // always @(posedge)
  always_comb	// mac_array.k:72:9
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:72:9, :73:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:72:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:72:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_set_fp32_accumEntry mac_arrayDebugView_set_fp32_accumEntry_instance (	// mac_array.k:73:9
    .clk       (clk),	// mac_array.k:73:9
    ._pe_id    (p0_stage1_enable ? p0_pe_id : 'x),	// mac_array.k:72:9, :73:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// mac_array.k:72:9, :73:9
    .valid     (p0_stage1_enable),	// mac_array.k:72:9
    .valid_out (/* unused */)
  );	// mac_array.k:73:9
  assign done_out = p0_stage2_enable;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_0_25_0_valid =
    global_out__fp32_accum_element_0_25_0_valid_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_0_25_0 = global_out__fp32_accum_element_0_25_0_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_1_26_0_valid =
    global_out__fp32_accum_element_1_26_0_valid_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_1_26_0 = global_out__fp32_accum_element_1_26_0_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_2_27_0_valid =
    global_out__fp32_accum_element_2_27_0_valid_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_2_27_0 = global_out__fp32_accum_element_2_27_0_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_3_28_0_valid =
    global_out__fp32_accum_element_3_28_0_valid_0;	// mac_array.k:72:9
  assign global_out__fp32_accum_element_3_28_0 = global_out__fp32_accum_element_3_28_0_0;	// mac_array.k:72:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:72:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:72:9
  assign control_state_out = control_state_out_0;	// mac_array.k:72:9
endmodule

module mac_array_write_grid_BasicBlock_0(	// mac_array.k:66:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [31:0] memory_write_data_out_30_0,
  output wire [8:0]  memory_write_addr_out_30_0,
  output wire        memory_wren_30_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [40:0] data_in_16,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// mac_array.k:66:9
  logic [31:0] memory_write_data_out_30_0_0;	// mac_array.k:66:9
  logic [8:0]  memory_write_addr_out_30_0_0;	// mac_array.k:66:9
  logic        memory_wren_30_0_0;	// mac_array.k:66:9
  logic        fifo_wren_0_0;	// mac_array.k:66:9
  logic        input_rdy_0_0;	// mac_array.k:66:9
  logic [7:0]  control_state_out_0;	// mac_array.k:66:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:66:9
  wire         _GEN_0 = _GEN & input_valid_0;	// mac_array.k:66:9
  always_comb begin	// mac_array.k:66:9
    input_rdy_0_0 = _GEN;	// mac_array.k:66:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:66:9
  end // always_comb
  always_comb begin	// mac_array.k:66:9
    memory_wren_30_0_0 = _GEN_0;	// mac_array.k:66:{9,18}
    memory_write_addr_out_30_0_0 = data_in_16[8:0];	// mac_array.k:66:18
    memory_write_data_out_30_0_0 = data_in_16[40:9];	// mac_array.k:66:18
  end // always_comb
  reg   [8:0]  p0_index;	// mac_array.k:66:9
  reg   [31:0] p0_value;	// mac_array.k:66:9
  reg          p0_stage1_enable = 1'h0;	// mac_array.k:66:9
  reg          p0_stage2_enable = 1'h0;	// mac_array.k:66:9
  always @(posedge clk) begin	// mac_array.k:66:9
    p0_index <= data_in_16[8:0];	// mac_array.k:66:9
    p0_value <= data_in_16[40:9];	// mac_array.k:66:9
    if (rst) begin	// mac_array.k:66:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:66:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:66:9
    end
    else begin	// mac_array.k:66:9
      p0_stage1_enable <= _GEN_0;	// mac_array.k:66:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:66:9
    end
  end // always @(posedge)
  always_comb	// mac_array.k:66:9
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:66:9, :67:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:66:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:66:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_write_gridEntry mac_arrayDebugView_write_gridEntry_instance (	// mac_array.k:67:9
    .clk       (clk),	// mac_array.k:67:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// mac_array.k:66:9, :67:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// mac_array.k:66:9, :67:9
    .valid     (p0_stage1_enable),	// mac_array.k:66:9
    .valid_out (/* unused */)
  );	// mac_array.k:67:9
  assign done_out = p0_stage2_enable;	// mac_array.k:66:9
  assign memory_write_data_out_30_0 = memory_write_data_out_30_0_0;	// mac_array.k:66:9
  assign memory_write_addr_out_30_0 = memory_write_addr_out_30_0_0;	// mac_array.k:66:9
  assign memory_wren_30_0 = memory_wren_30_0_0;	// mac_array.k:66:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:66:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:66:9
  assign control_state_out = control_state_out_0;	// mac_array.k:66:9
endmodule

module mac_array_read_grid_BasicBlock_0(	// mac_array.k:59:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [31:0] memory_read_data_in_30_0,
  output wire [8:0]  memory_read_addr_out_30_0,
  output wire        memory_rden_out_30_0,
  output wire [31:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [8:0]  data_in_15,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [31:0] memory_read_data_in_30_0_0 = memory_read_data_in_30_0;	// mac_array.k:59:9
  logic        done_out_0;	// mac_array.k:59:9
  logic [8:0]  memory_read_addr_out_30_0_0;	// mac_array.k:59:9
  logic        memory_rden_out_30_0_0;	// mac_array.k:59:9
  logic [31:0] fifo_data_out_0_0;	// mac_array.k:59:9
  logic        fifo_wren_0_0;	// mac_array.k:59:9
  logic        input_rdy_0_0;	// mac_array.k:59:9
  logic [7:0]  control_state_out_0;	// mac_array.k:59:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:59:9
  wire         _GEN_0 = _GEN & input_valid_0;	// mac_array.k:59:9
  always_comb begin	// mac_array.k:59:9
    input_rdy_0_0 = _GEN;	// mac_array.k:59:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:59:9
  end // always_comb
  always_comb begin	// mac_array.k:59:9
    memory_read_addr_out_30_0_0 = data_in_15;	// mac_array.k:60:27
    memory_rden_out_30_0_0 = _GEN_0;	// mac_array.k:59:9, :60:27
  end // always_comb
  reg   [8:0]  p0_data_in_15;	// mac_array.k:59:9
  reg          p0_stage1_enable = 1'h0;	// mac_array.k:59:9
  reg          p0_stage2_enable = 1'h0;	// mac_array.k:59:9
  reg   [31:0] p0_memory_read_data_in_30_0;	// mac_array.k:59:9
  reg          p0_stage3_enable = 1'h0;	// mac_array.k:59:9
  always @(posedge clk) begin	// mac_array.k:59:9
    p0_data_in_15 <= data_in_15;	// mac_array.k:59:9
    if (rst) begin	// mac_array.k:59:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:59:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:59:9
    end
    else begin	// mac_array.k:59:9
      p0_stage1_enable <= _GEN_0;	// mac_array.k:59:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:59:9
    end
    p0_memory_read_data_in_30_0 <= memory_read_data_in_30_0_0;	// mac_array.k:59:9
    if (rst)	// mac_array.k:59:9
      p0_stage3_enable <= 1'h0;	// mac_array.k:59:9
    else	// mac_array.k:59:9
      p0_stage3_enable <= p0_stage2_enable;	// mac_array.k:59:9
  end // always @(posedge)
  always_comb begin	// mac_array.k:59:9
    fifo_wren_0_0 = p0_stage3_enable;	// mac_array.k:57:5, :59:9
    fifo_data_out_0_0 = p0_memory_read_data_in_30_0;	// mac_array.k:57:5, :59:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:59:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:59:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_read_gridEntry mac_arrayDebugView_read_gridEntry_instance (	// mac_array.k:57:5
    .clk       (clk),	// mac_array.k:57:5
    ._index    (p0_stage1_enable ? p0_data_in_15 : 'x),	// mac_array.k:57:5, :59:9
    .valid     (p0_stage1_enable),	// mac_array.k:59:9
    .valid_out (/* unused */)
  );	// mac_array.k:57:5
  mac_arrayDebugView_read_gridExit mac_arrayDebugView_read_gridExit_instance (	// mac_array.k:57:5
    .clk          (clk),	// mac_array.k:57:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_30_0_0 : 'x),	// mac_array.k:57:5, :59:9
    .valid        (p0_stage2_enable),	// mac_array.k:59:9
    .valid_out    (/* unused */)
  );	// mac_array.k:57:5
  assign done_out = p0_stage3_enable;	// mac_array.k:59:9
  assign memory_read_addr_out_30_0 = memory_read_addr_out_30_0_0;	// mac_array.k:59:9
  assign memory_rden_out_30_0 = memory_rden_out_30_0_0;	// mac_array.k:59:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_array.k:59:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:59:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:59:9
  assign control_state_out = control_state_out_0;	// mac_array.k:59:9
endmodule

module mac_array_write_rom_block_BasicBlock_0(	// mac_array.k:53:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  output wire [879:0] memory_write_data_out_29_0,
  output wire [9:0]   memory_write_addr_out_29_0,
  output wire         memory_wren_29_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [895:0] data_in_14,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  logic         done_out_0;	// mac_array.k:53:9
  logic [879:0] memory_write_data_out_29_0_0;	// mac_array.k:53:9
  logic [9:0]   memory_write_addr_out_29_0_0;	// mac_array.k:53:9
  logic         memory_wren_29_0_0;	// mac_array.k:53:9
  logic         fifo_wren_0_0;	// mac_array.k:53:9
  logic         input_rdy_0_0;	// mac_array.k:53:9
  logic [7:0]   control_state_out_0;	// mac_array.k:53:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:53:9
  wire          _GEN_0 = _GEN & input_valid_0;	// mac_array.k:53:9
  always_comb begin	// mac_array.k:53:9
    input_rdy_0_0 = _GEN;	// mac_array.k:53:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:53:9
  end // always_comb
  always_comb begin	// mac_array.k:53:9
    memory_wren_29_0_0 = _GEN_0;	// mac_array.k:53:{9,18}
    memory_write_addr_out_29_0_0 = data_in_14[9:0];	// mac_array.k:53:18
    memory_write_data_out_29_0_0 = data_in_14[895:16];	// mac_array.k:53:18
  end // always_comb
  reg   [15:0]  p0_block_addr;	// mac_array.k:53:9
  reg   [879:0] p0_value;	// mac_array.k:53:9
  reg           p0_stage1_enable = 1'h0;	// mac_array.k:53:9
  reg           p0_stage2_enable = 1'h0;	// mac_array.k:53:9
  always @(posedge clk) begin	// mac_array.k:53:9
    p0_block_addr <= data_in_14[15:0];	// mac_array.k:53:9
    p0_value <= data_in_14[895:16];	// mac_array.k:53:9
    if (rst) begin	// mac_array.k:53:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:53:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:53:9
    end
    else begin	// mac_array.k:53:9
      p0_stage1_enable <= _GEN_0;	// mac_array.k:53:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:53:9
    end
  end // always @(posedge)
  always_comb	// mac_array.k:53:9
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:53:9, :54:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:53:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:53:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_write_rom_blockEntry mac_arrayDebugView_write_rom_blockEntry_instance (	// mac_array.k:54:9
    .clk         (clk),	// mac_array.k:54:9
    ._block_addr (p0_stage1_enable ? p0_block_addr : 'x),	// mac_array.k:53:9, :54:9
    ._value      (p0_stage1_enable ? p0_value : 'x),	// mac_array.k:53:9, :54:9
    .valid       (p0_stage1_enable),	// mac_array.k:53:9
    .valid_out   (/* unused */)
  );	// mac_array.k:54:9
  assign done_out = p0_stage2_enable;	// mac_array.k:53:9
  assign memory_write_data_out_29_0 = memory_write_data_out_29_0_0;	// mac_array.k:53:9
  assign memory_write_addr_out_29_0 = memory_write_addr_out_29_0_0;	// mac_array.k:53:9
  assign memory_wren_29_0 = memory_wren_29_0_0;	// mac_array.k:53:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:53:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:53:9
  assign control_state_out = control_state_out_0;	// mac_array.k:53:9
endmodule

module mac_array_read_rom_block_BasicBlock_0(	// mac_array.k:46:9
  input  wire         clk,
  input  wire         rst,
  output wire         done_out,
  input  wire [879:0] memory_read_data_in_29_0,
  output wire [9:0]   memory_read_addr_out_29_0,
  output wire         memory_rden_out_29_0,
  output wire [879:0] fifo_data_out_0,
  output wire         fifo_wren_0,
  input  wire         fifo_almost_full_in_raw_0,
  input  wire         fifo_overflow_in_0,
  input  wire [15:0]  data_in_13,
  input  wire         input_fifo_underflow_0,
  output wire         input_rdy_0,
  input  wire         input_valid_0,
  output wire [7:0]   control_state_out
);

  wire          _fifo_overflow_ffc_0_data_out;
  wire          _fifo_almostfull_ffc_0_data_out;
  wire  [879:0] memory_read_data_in_29_0_0 = memory_read_data_in_29_0;	// mac_array.k:46:9
  logic         done_out_0;	// mac_array.k:46:9
  logic [9:0]   memory_read_addr_out_29_0_0;	// mac_array.k:46:9
  logic         memory_rden_out_29_0_0;	// mac_array.k:46:9
  logic [879:0] fifo_data_out_0_0;	// mac_array.k:46:9
  logic         fifo_wren_0_0;	// mac_array.k:46:9
  logic         input_rdy_0_0;	// mac_array.k:46:9
  logic [7:0]   control_state_out_0;	// mac_array.k:46:9
  wire          _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:46:9
  wire          _GEN_0 = _GEN & input_valid_0;	// mac_array.k:46:9
  always_comb begin	// mac_array.k:46:9
    input_rdy_0_0 = _GEN;	// mac_array.k:46:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:46:9
  end // always_comb
  always_comb begin	// mac_array.k:46:9
    memory_read_addr_out_29_0_0 = data_in_13[9:0];	// mac_array.k:47:27
    memory_rden_out_29_0_0 = _GEN_0;	// mac_array.k:46:9, :47:27
  end // always_comb
  reg   [15:0]  p0_data_in_13;	// mac_array.k:46:9
  reg           p0_stage1_enable = 1'h0;	// mac_array.k:46:9
  reg           p0_stage2_enable = 1'h0;	// mac_array.k:46:9
  reg   [879:0] p0_memory_read_data_in_29_0;	// mac_array.k:46:9
  reg           p0_stage3_enable = 1'h0;	// mac_array.k:46:9
  always @(posedge clk) begin	// mac_array.k:46:9
    p0_data_in_13 <= data_in_13;	// mac_array.k:46:9
    if (rst) begin	// mac_array.k:46:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:46:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:46:9
    end
    else begin	// mac_array.k:46:9
      p0_stage1_enable <= _GEN_0;	// mac_array.k:46:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:46:9
    end
    p0_memory_read_data_in_29_0 <= memory_read_data_in_29_0_0;	// mac_array.k:46:9
    if (rst)	// mac_array.k:46:9
      p0_stage3_enable <= 1'h0;	// mac_array.k:46:9
    else	// mac_array.k:46:9
      p0_stage3_enable <= p0_stage2_enable;	// mac_array.k:46:9
  end // always @(posedge)
  always_comb begin	// mac_array.k:46:9
    fifo_wren_0_0 = p0_stage3_enable;	// mac_array.k:44:5, :46:9
    fifo_data_out_0_0 = p0_memory_read_data_in_29_0;	// mac_array.k:44:5, :46:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:46:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:46:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_read_rom_blockEntry mac_arrayDebugView_read_rom_blockEntry_instance (	// mac_array.k:44:5
    .clk         (clk),	// mac_array.k:44:5
    ._block_addr (p0_stage1_enable ? p0_data_in_13 : 'x),	// mac_array.k:44:5, :46:9
    .valid       (p0_stage1_enable),	// mac_array.k:46:9
    .valid_out   (/* unused */)
  );	// mac_array.k:44:5
  mac_arrayDebugView_read_rom_blockExit mac_arrayDebugView_read_rom_blockExit_instance (	// mac_array.k:44:5
    .clk          (clk),	// mac_array.k:44:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_29_0_0 : 'x),	// mac_array.k:44:5, :46:9
    .valid        (p0_stage2_enable),	// mac_array.k:46:9
    .valid_out    (/* unused */)
  );	// mac_array.k:44:5
  assign done_out = p0_stage3_enable;	// mac_array.k:46:9
  assign memory_read_addr_out_29_0 = memory_read_addr_out_29_0_0;	// mac_array.k:46:9
  assign memory_rden_out_29_0 = memory_rden_out_29_0_0;	// mac_array.k:46:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_array.k:46:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:46:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:46:9
  assign control_state_out = control_state_out_0;	// mac_array.k:46:9
endmodule

module mac_array_read_accum_BasicBlock_0(	// mac_array.k:41:41
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [23:0] global_in__accum_element_0_21,
  input  wire [23:0] global_in__accum_element_1_22,
  input  wire [23:0] global_in__accum_element_2_23,
  input  wire [23:0] global_in__accum_element_3_24,
  output wire [23:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [1:0]  data_in_12,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [23:0] global_in__accum_element_0_21_0 = global_in__accum_element_0_21;	// mac_array.k:41:41
  wire  [23:0] global_in__accum_element_1_22_0 = global_in__accum_element_1_22;	// mac_array.k:41:41
  wire  [23:0] global_in__accum_element_2_23_0 = global_in__accum_element_2_23;	// mac_array.k:41:41
  wire  [23:0] global_in__accum_element_3_24_0 = global_in__accum_element_3_24;	// mac_array.k:41:41
  logic        done_out_0;	// mac_array.k:41:41
  logic [23:0] fifo_data_out_0_0;	// mac_array.k:41:41
  logic        fifo_wren_0_0;	// mac_array.k:41:41
  logic        input_rdy_0_0;	// mac_array.k:41:41
  logic [7:0]  control_state_out_0;	// mac_array.k:41:41
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:41:41
  always_comb begin	// mac_array.k:41:41
    input_rdy_0_0 = _GEN;	// mac_array.k:41:41
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:41:41
  end // always_comb
  reg   [1:0]  p0_data_in_12;	// mac_array.k:41:41
  reg          p0_stage1_enable = 1'h0;	// mac_array.k:41:41
  wire  [23:0] _accum =
    p0_data_in_12[1]
      ? (p0_data_in_12[0]
           ? global_in__accum_element_3_24_0
           : global_in__accum_element_2_23_0)
      : p0_data_in_12[0]
          ? global_in__accum_element_1_22_0
          : global_in__accum_element_0_21_0;	// mac_array.k:41:{41,48}
  reg   [23:0] p0__accum;	// mac_array.k:41:41
  reg          p0_stage2_enable = 1'h0;	// mac_array.k:41:41
  always @(posedge clk) begin	// mac_array.k:41:41
    p0_data_in_12 <= data_in_12;	// mac_array.k:41:41
    if (rst)	// mac_array.k:41:41
      p0_stage1_enable <= 1'h0;	// mac_array.k:41:41
    else	// mac_array.k:41:41
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:41:41
    p0__accum <= _accum;	// mac_array.k:41:{41,48}
    if (rst)	// mac_array.k:41:41
      p0_stage2_enable <= 1'h0;	// mac_array.k:41:41
    else	// mac_array.k:41:41
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:41:41
  end // always @(posedge)
  always_comb begin	// mac_array.k:41:41
    fifo_wren_0_0 = p0_stage2_enable;	// mac_array.k:41:{5,41}
    fifo_data_out_0_0 = p0__accum;	// mac_array.k:41:{5,41}
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:41:41
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:41:41
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_read_accumEntry mac_arrayDebugView_read_accumEntry_instance (	// mac_array.k:41:5
    .clk       (clk),	// mac_array.k:41:5
    ._pe_id    (p0_stage1_enable ? p0_data_in_12 : 'x),	// mac_array.k:41:{5,41}
    .valid     (p0_stage1_enable),	// mac_array.k:41:41
    .valid_out (/* unused */)
  );	// mac_array.k:41:5
  mac_arrayDebugView_read_accumExit mac_arrayDebugView_read_accumExit_instance (	// mac_array.k:41:5
    .clk          (clk),	// mac_array.k:41:5
    ._ReturnValue (p0_stage1_enable ? _accum : 'x),	// mac_array.k:41:{5,41,48}
    .valid        (p0_stage1_enable),	// mac_array.k:41:41
    .valid_out    (/* unused */)
  );	// mac_array.k:41:5
  assign done_out = p0_stage2_enable;	// mac_array.k:41:41
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_array.k:41:41
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:41:41
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:41:41
  assign control_state_out = control_state_out_0;	// mac_array.k:41:41
endmodule

module mac_array_mac_step_BasicBlock_0(	// mac_array.k:24:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [23:0] global_in__accum_element_0_21,
  input  wire [23:0] global_in__accum_element_1_22,
  input  wire [23:0] global_in__accum_element_2_23,
  input  wire [23:0] global_in__accum_element_3_24,
  output wire        global_out__accum_element_0_21_0_valid,
  output wire [23:0] global_out__accum_element_0_21_0,
  output wire        global_out__accum_element_1_22_0_valid,
  output wire [23:0] global_out__accum_element_1_22_0,
  output wire        global_out__accum_element_2_23_0_valid,
  output wire [23:0] global_out__accum_element_2_23_0,
  output wire        global_out__accum_element_3_24_0_valid,
  output wire [23:0] global_out__accum_element_3_24_0,
  output wire [23:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [14:0] data_in_11,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [23:0] global_in__accum_element_0_21_0 = global_in__accum_element_0_21;	// mac_array.k:24:9
  wire  [23:0] global_in__accum_element_1_22_0 = global_in__accum_element_1_22;	// mac_array.k:24:9
  wire  [23:0] global_in__accum_element_2_23_0 = global_in__accum_element_2_23;	// mac_array.k:24:9
  wire  [23:0] global_in__accum_element_3_24_0 = global_in__accum_element_3_24;	// mac_array.k:24:9
  logic        done_out_0;	// mac_array.k:24:9
  logic        global_out__accum_element_0_21_0_valid_0;	// mac_array.k:24:9
  logic [23:0] global_out__accum_element_0_21_0_0;	// mac_array.k:24:9
  logic        global_out__accum_element_1_22_0_valid_0;	// mac_array.k:24:9
  logic [23:0] global_out__accum_element_1_22_0_0;	// mac_array.k:24:9
  logic        global_out__accum_element_2_23_0_valid_0;	// mac_array.k:24:9
  logic [23:0] global_out__accum_element_2_23_0_0;	// mac_array.k:24:9
  logic        global_out__accum_element_3_24_0_valid_0;	// mac_array.k:24:9
  logic [23:0] global_out__accum_element_3_24_0_0;	// mac_array.k:24:9
  logic [23:0] fifo_data_out_0_0;	// mac_array.k:24:9
  logic        fifo_wren_0_0;	// mac_array.k:24:9
  logic        input_rdy_0_0;	// mac_array.k:24:9
  logic [7:0]  control_state_out_0;	// mac_array.k:24:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// mac_array.k:24:9
  always_comb begin	// mac_array.k:24:9
    input_rdy_0_0 = _GEN;	// mac_array.k:24:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// mac_array.k:24:9
  end // always_comb
  reg   [1:0]  p0_pe_id;	// mac_array.k:24:9
  reg   [3:0]  p0_magnitude;	// mac_array.k:24:9
  reg          p0_sign_bit;	// mac_array.k:24:9
  reg   [7:0]  p0_activation;	// mac_array.k:24:9
  reg          p0_stage1_enable = 1'h0;	// mac_array.k:24:9
  wire         ka = p0_activation[7] & p0_magnitude[1];	// mac_array.k:24:9, :27:25, :28:{29,43}, :30:{13,17}
  wire         ka_0 = p0_activation[7] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_1 = p0_activation[6] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_2 = p0_activation[5] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_3 = p0_activation[4] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_4 = p0_activation[3] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_5 = p0_activation[2] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_6 = p0_activation[1] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire         ka_7 = p0_activation[0] & p0_magnitude[1];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}
  wire  [22:0] _ka_plus_a_shl_1_ =
    23'({{15{ka}}, ka_0, ka_1, ka_2, ka_3, ka_4, ka_5, ka_6, ka_7}
        + {{14{p0_activation[7]}}, p0_activation, 1'h0});	// mac_array.k:24:9, :27:25, :30:{13,17}, :31:{42,47}
  wire         _GEN_0 = ka | p0_magnitude[2];	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17}
  wire         _GEN_1 = ka & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17}
  wire         ka_8 = _ka_plus_a_shl_1_[22] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_9 = _ka_plus_a_shl_1_[21] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_10 = _ka_plus_a_shl_1_[20] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_11 = _ka_plus_a_shl_1_[19] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_12 = _ka_plus_a_shl_1_[18] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_13 = _ka_plus_a_shl_1_[17] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_14 = _ka_plus_a_shl_1_[16] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_15 = _ka_plus_a_shl_1_[15] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_16 = _ka_plus_a_shl_1_[14] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_17 = _ka_plus_a_shl_1_[13] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_18 = _ka_plus_a_shl_1_[12] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_19 = _ka_plus_a_shl_1_[11] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_20 = _ka_plus_a_shl_1_[10] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_21 = _ka_plus_a_shl_1_[9] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_22 = _ka_plus_a_shl_1_[8] ? _GEN_0 : _GEN_1;	// mac_array.k:31:{13,17,42}
  wire         ka_23 =
    _ka_plus_a_shl_1_[7] ? ka_0 | p0_magnitude[2] : ka_0 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_24 =
    _ka_plus_a_shl_1_[6] ? ka_1 | p0_magnitude[2] : ka_1 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_25 =
    _ka_plus_a_shl_1_[5] ? ka_2 | p0_magnitude[2] : ka_2 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_26 =
    _ka_plus_a_shl_1_[4] ? ka_3 | p0_magnitude[2] : ka_3 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_27 =
    _ka_plus_a_shl_1_[3] ? ka_4 | p0_magnitude[2] : ka_4 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_28 =
    _ka_plus_a_shl_1_[2] ? ka_5 | p0_magnitude[2] : ka_5 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_29 =
    _ka_plus_a_shl_1_[1] ? ka_6 | p0_magnitude[2] : ka_6 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire         ka_30 =
    _ka_plus_a_shl_1_[0] ? ka_7 | p0_magnitude[2] : ka_7 & ~(p0_magnitude[2]);	// mac_array.k:24:9, :28:{29,43}, :30:{13,17}, :31:{13,17,42}
  wire  [22:0] _ka_plus_a_shl_2_ =
    23'({ka_8,
         ka_9,
         ka_10,
         ka_11,
         ka_12,
         ka_13,
         ka_14,
         ka_15,
         ka_16,
         ka_17,
         ka_18,
         ka_19,
         ka_20,
         ka_21,
         ka_22,
         ka_23,
         ka_24,
         ka_25,
         ka_26,
         ka_27,
         ka_28,
         ka_29,
         ka_30} + {{13{p0_activation[7]}}, p0_activation, 2'h0});	// mac_array.k:24:9, :27:25, :31:{13,17}, :32:{42,47}
  wire  [23:0] _ka_shl_1_plus_a_ =
    24'({_ka_plus_a_shl_2_[22] ? ka_8 | p0_magnitude[3] : ka_8 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[21] ? ka_9 | p0_magnitude[3] : ka_9 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[20] ? ka_10 | p0_magnitude[3] : ka_10 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[19] ? ka_11 | p0_magnitude[3] : ka_11 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[18] ? ka_12 | p0_magnitude[3] : ka_12 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[17] ? ka_13 | p0_magnitude[3] : ka_13 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[16] ? ka_14 | p0_magnitude[3] : ka_14 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[15] ? ka_15 | p0_magnitude[3] : ka_15 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[14] ? ka_16 | p0_magnitude[3] : ka_16 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[13] ? ka_17 | p0_magnitude[3] : ka_17 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[12] ? ka_18 | p0_magnitude[3] : ka_18 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[11] ? ka_19 | p0_magnitude[3] : ka_19 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[10] ? ka_20 | p0_magnitude[3] : ka_20 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[9] ? ka_21 | p0_magnitude[3] : ka_21 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[8] ? ka_22 | p0_magnitude[3] : ka_22 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[7] ? ka_23 | p0_magnitude[3] : ka_23 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[6] ? ka_24 | p0_magnitude[3] : ka_24 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[5] ? ka_25 | p0_magnitude[3] : ka_25 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[4] ? ka_26 | p0_magnitude[3] : ka_26 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[3] ? ka_27 | p0_magnitude[3] : ka_27 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[2] ? ka_28 | p0_magnitude[3] : ka_28 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[1] ? ka_29 | p0_magnitude[3] : ka_29 & ~(p0_magnitude[3]),
         _ka_plus_a_shl_2_[0] ? ka_30 | p0_magnitude[3] : ka_30 & ~(p0_magnitude[3]),
         1'h0} + {{16{p0_activation[7]}}, p0_activation});	// mac_array.k:24:9, :27:25, :28:{29,43}, :31:{13,17}, :32:{13,17,42}, :33:31
  wire  [23:0] _0_minus_product_ = 24'(24'h0 - _ka_shl_1_plus_a_);	// mac_array.k:33:31, :34:44
  wire  [23:0] _accum_pe_id_plus_product_ =
    24'((p0_pe_id[1]
           ? (p0_pe_id[0]
                ? global_in__accum_element_3_24_0
                : global_in__accum_element_2_23_0)
           : p0_pe_id[0]
               ? global_in__accum_element_1_22_0
               : global_in__accum_element_0_21_0)
        + {_0_minus_product_[23]
             ? _ka_shl_1_plus_a_[23] | p0_sign_bit
             : _ka_shl_1_plus_a_[23] & ~p0_sign_bit,
           _0_minus_product_[22]
             ? _ka_shl_1_plus_a_[22] | p0_sign_bit
             : _ka_shl_1_plus_a_[22] & ~p0_sign_bit,
           _0_minus_product_[21]
             ? _ka_shl_1_plus_a_[21] | p0_sign_bit
             : _ka_shl_1_plus_a_[21] & ~p0_sign_bit,
           _0_minus_product_[20]
             ? _ka_shl_1_plus_a_[20] | p0_sign_bit
             : _ka_shl_1_plus_a_[20] & ~p0_sign_bit,
           _0_minus_product_[19]
             ? _ka_shl_1_plus_a_[19] | p0_sign_bit
             : _ka_shl_1_plus_a_[19] & ~p0_sign_bit,
           _0_minus_product_[18]
             ? _ka_shl_1_plus_a_[18] | p0_sign_bit
             : _ka_shl_1_plus_a_[18] & ~p0_sign_bit,
           _0_minus_product_[17]
             ? _ka_shl_1_plus_a_[17] | p0_sign_bit
             : _ka_shl_1_plus_a_[17] & ~p0_sign_bit,
           _0_minus_product_[16]
             ? _ka_shl_1_plus_a_[16] | p0_sign_bit
             : _ka_shl_1_plus_a_[16] & ~p0_sign_bit,
           _0_minus_product_[15]
             ? _ka_shl_1_plus_a_[15] | p0_sign_bit
             : _ka_shl_1_plus_a_[15] & ~p0_sign_bit,
           _0_minus_product_[14]
             ? _ka_shl_1_plus_a_[14] | p0_sign_bit
             : _ka_shl_1_plus_a_[14] & ~p0_sign_bit,
           _0_minus_product_[13]
             ? _ka_shl_1_plus_a_[13] | p0_sign_bit
             : _ka_shl_1_plus_a_[13] & ~p0_sign_bit,
           _0_minus_product_[12]
             ? _ka_shl_1_plus_a_[12] | p0_sign_bit
             : _ka_shl_1_plus_a_[12] & ~p0_sign_bit,
           _0_minus_product_[11]
             ? _ka_shl_1_plus_a_[11] | p0_sign_bit
             : _ka_shl_1_plus_a_[11] & ~p0_sign_bit,
           _0_minus_product_[10]
             ? _ka_shl_1_plus_a_[10] | p0_sign_bit
             : _ka_shl_1_plus_a_[10] & ~p0_sign_bit,
           _0_minus_product_[9]
             ? _ka_shl_1_plus_a_[9] | p0_sign_bit
             : _ka_shl_1_plus_a_[9] & ~p0_sign_bit,
           _0_minus_product_[8]
             ? _ka_shl_1_plus_a_[8] | p0_sign_bit
             : _ka_shl_1_plus_a_[8] & ~p0_sign_bit,
           _0_minus_product_[7]
             ? _ka_shl_1_plus_a_[7] | p0_sign_bit
             : _ka_shl_1_plus_a_[7] & ~p0_sign_bit,
           _0_minus_product_[6]
             ? _ka_shl_1_plus_a_[6] | p0_sign_bit
             : _ka_shl_1_plus_a_[6] & ~p0_sign_bit,
           _0_minus_product_[5]
             ? _ka_shl_1_plus_a_[5] | p0_sign_bit
             : _ka_shl_1_plus_a_[5] & ~p0_sign_bit,
           _0_minus_product_[4]
             ? _ka_shl_1_plus_a_[4] | p0_sign_bit
             : _ka_shl_1_plus_a_[4] & ~p0_sign_bit,
           _0_minus_product_[3]
             ? _ka_shl_1_plus_a_[3] | p0_sign_bit
             : _ka_shl_1_plus_a_[3] & ~p0_sign_bit,
           _0_minus_product_[2]
             ? _ka_shl_1_plus_a_[2] | p0_sign_bit
             : _ka_shl_1_plus_a_[2] & ~p0_sign_bit,
           _0_minus_product_[1]
             ? _ka_shl_1_plus_a_[1] | p0_sign_bit
             : _ka_shl_1_plus_a_[1] & ~p0_sign_bit,
           _0_minus_product_[0]
             ? _ka_shl_1_plus_a_[0] | p0_sign_bit
             : _ka_shl_1_plus_a_[0] & ~p0_sign_bit});	// mac_array.k:24:9, :33:31, :34:{13,17,44}, :35:29
  always_comb begin	// mac_array.k:24:9
    global_out__accum_element_0_21_0_0 = _accum_pe_id_plus_product_;	// mac_array.k:25:9, :35:29
    global_out__accum_element_0_21_0_valid_0 = p0_stage1_enable & p0_pe_id == 2'h0;	// mac_array.k:24:9, :25:9, :35:13
    global_out__accum_element_1_22_0_0 = _accum_pe_id_plus_product_;	// mac_array.k:25:9, :35:29
    global_out__accum_element_1_22_0_valid_0 = p0_stage1_enable & p0_pe_id == 2'h1;	// mac_array.k:24:9, :25:9, :35:13
    global_out__accum_element_2_23_0_0 = _accum_pe_id_plus_product_;	// mac_array.k:25:9, :35:29
    global_out__accum_element_2_23_0_valid_0 = p0_stage1_enable & p0_pe_id == 2'h2;	// mac_array.k:24:9, :25:9, :35:13
    global_out__accum_element_3_24_0_0 = _accum_pe_id_plus_product_;	// mac_array.k:25:9, :35:29
    global_out__accum_element_3_24_0_valid_0 = p0_stage1_enable & (&p0_pe_id);	// mac_array.k:24:9, :25:9, :35:13
  end // always_comb
  reg   [23:0] p0__accum_pe_id_plus_product_;	// mac_array.k:24:9
  reg          p0_stage2_enable = 1'h0;	// mac_array.k:24:9
  reg   [23:0] p0__accum_pe_id_plus_product__0;	// mac_array.k:24:9
  reg          p0_stage3_enable = 1'h0;	// mac_array.k:24:9
  always @(posedge clk) begin	// mac_array.k:24:9
    p0_pe_id <= data_in_11[1:0];	// mac_array.k:24:9
    p0_magnitude <= data_in_11[5:2];	// mac_array.k:24:9
    p0_sign_bit <= data_in_11[6];	// mac_array.k:24:9
    p0_activation <= data_in_11[14:7];	// mac_array.k:24:9
    if (rst)	// mac_array.k:24:9
      p0_stage1_enable <= 1'h0;	// mac_array.k:24:9
    else	// mac_array.k:24:9
      p0_stage1_enable <= _GEN & input_valid_0;	// mac_array.k:24:9
    p0__accum_pe_id_plus_product_ <= _accum_pe_id_plus_product_;	// mac_array.k:24:9, :35:29
    if (rst)	// mac_array.k:24:9
      p0_stage2_enable <= 1'h0;	// mac_array.k:24:9
    else	// mac_array.k:24:9
      p0_stage2_enable <= p0_stage1_enable;	// mac_array.k:24:9
    p0__accum_pe_id_plus_product__0 <= p0__accum_pe_id_plus_product_;	// mac_array.k:24:9
    if (rst)	// mac_array.k:24:9
      p0_stage3_enable <= 1'h0;	// mac_array.k:24:9
    else	// mac_array.k:24:9
      p0_stage3_enable <= p0_stage2_enable;	// mac_array.k:24:9
  end // always @(posedge)
  always_comb begin	// mac_array.k:24:9
    fifo_wren_0_0 = p0_stage3_enable;	// mac_array.k:22:5, :24:9
    fifo_data_out_0_0 = p0__accum_pe_id_plus_product__0;	// mac_array.k:22:5, :24:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// mac_array.k:24:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// mac_array.k:24:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  mac_arrayDebugView_mac_stepEntry mac_arrayDebugView_mac_stepEntry_instance (	// mac_array.k:22:5
    .clk         (clk),	// mac_array.k:22:5
    ._pe_id      (p0_stage1_enable ? p0_pe_id : 'x),	// mac_array.k:22:5, :24:9
    ._magnitude  (p0_stage1_enable ? p0_magnitude : 'x),	// mac_array.k:22:5, :24:9
    ._sign_bit   (p0_stage1_enable ? p0_sign_bit : 'x),	// mac_array.k:22:5, :24:9
    ._activation (p0_stage1_enable ? p0_activation : 'x),	// mac_array.k:22:5, :24:9
    .valid       (p0_stage1_enable),	// mac_array.k:24:9
    .valid_out   (/* unused */)
  );	// mac_array.k:22:5
  mac_arrayDebugView_mac_stepExit mac_arrayDebugView_mac_stepExit_instance (	// mac_array.k:22:5
    .clk          (clk),	// mac_array.k:22:5
    ._ReturnValue (p0_stage2_enable ? p0__accum_pe_id_plus_product_ : 'x),	// mac_array.k:22:5, :24:9
    .valid        (p0_stage2_enable),	// mac_array.k:24:9
    .valid_out    (/* unused */)
  );	// mac_array.k:22:5
  assign done_out = p0_stage3_enable;	// mac_array.k:24:9
  assign global_out__accum_element_0_21_0_valid =
    global_out__accum_element_0_21_0_valid_0;	// mac_array.k:24:9
  assign global_out__accum_element_0_21_0 = global_out__accum_element_0_21_0_0;	// mac_array.k:24:9
  assign global_out__accum_element_1_22_0_valid =
    global_out__accum_element_1_22_0_valid_0;	// mac_array.k:24:9
  assign global_out__accum_element_1_22_0 = global_out__accum_element_1_22_0_0;	// mac_array.k:24:9
  assign global_out__accum_element_2_23_0_valid =
    global_out__accum_element_2_23_0_valid_0;	// mac_array.k:24:9
  assign global_out__accum_element_2_23_0 = global_out__accum_element_2_23_0_0;	// mac_array.k:24:9
  assign global_out__accum_element_3_24_0_valid =
    global_out__accum_element_3_24_0_valid_0;	// mac_array.k:24:9
  assign global_out__accum_element_3_24_0 = global_out__accum_element_3_24_0_0;	// mac_array.k:24:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// mac_array.k:24:9
  assign fifo_wren_0 = fifo_wren_0_0;	// mac_array.k:24:9
  assign input_rdy_0 = input_rdy_0_0;	// mac_array.k:24:9
  assign control_state_out = control_state_out_0;	// mac_array.k:24:9
endmodule

module mac_array_reg_24_w3_v_1_24_0_v_2_24_0(
  input  wire        clk,
  input  wire        input_valid_0,
  input  wire [23:0] input_0,
  input  wire        input_valid_1,
  input  wire        input_valid_2,
  output wire [23:0] value_out
);

  reg [23:0] value;
  always @(posedge clk)
    value <= input_valid_2 | input_valid_1 ? 24'h0 : input_valid_0 ? input_0 : value;
  assign value_out = value;
endmodule

module mac_array_reg_32_w3_v_1_32_0_v_2_32_0(
  input  wire        clk,
  input  wire        input_valid_0,
  input  wire [31:0] input_0,
  input  wire        input_valid_1,
  input  wire        input_valid_2,
  output wire [31:0] value_out
);

  reg [31:0] value;
  always @(posedge clk)
    value <= input_valid_2 | input_valid_1 ? 32'h0 : input_valid_0 ? input_0 : value;
  assign value_out = value;
endmodule

module mac_array__rom__mem_container(	// mac_array.k:15:5
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

  wire [1:0][879:0] ___rom_0_data_out;	// mac_array.k:15:5
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
  ) __rom_0 (	// mac_array.k:15:5
    .clk            (clk),	// mac_array.k:15:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// mac_array.k:15:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// mac_array.k:15:5
    .data_in        ({{880'h0}, {write_data_in_0}}),	// mac_array.k:15:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// mac_array.k:15:5
    .data_out       (___rom_0_data_out)
  );	// mac_array.k:15:5
  assign read_data_out_0 = ___rom_0_data_out[1'h1];	// mac_array.k:15:5
  assign init_completed = 1'h1;	// mac_array.k:15:5
endmodule

module mac_array__grid__mem_container(	// mac_array.k:18:5
  input  wire        clk,
  input  wire        rst,
  input  wire        rden_in_0,
  input  wire [8:0]  read_addr_in_0,
  input  wire        wren_in_0,
  input  wire [8:0]  write_addr_in_0,
  input  wire [31:0] write_data_in_0,
  output wire [31:0] read_data_out_0,
  output wire        init_completed
);

  wire [1:0][31:0] ___grid_0_data_out;	// mac_array.k:18:5
  KanagawaSyncRam #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(9),
    .DEPTH(512),
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
  ) __grid_0 (	// mac_array.k:18:5
    .clk            (clk),	// mac_array.k:18:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// mac_array.k:18:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// mac_array.k:18:5
    .data_in        ({{32'h0}, {write_data_in_0}}),	// mac_array.k:18:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// mac_array.k:18:5
    .data_out       (___grid_0_data_out)
  );	// mac_array.k:18:5
  assign read_data_out_0 = ___grid_0_data_out[1'h1];	// mac_array.k:18:5
  assign init_completed = 1'h1;	// mac_array.k:18:5
endmodule

module mac_array(
  input  wire         clk,
  input  wire         rst,
  input  wire         mac_step_valid_in,
  input  wire [1:0]   mac_step_pe_id_in,
  input  wire [3:0]   mac_step_magnitude_in,
  input  wire         mac_step_sign_bit_in,
  input  wire [7:0]   mac_step_activation_in,
  input  wire         mac_step_rden_in,
  input  wire         read_accum_valid_in,
  input  wire [1:0]   read_accum_pe_id_in,
  input  wire         read_accum_rden_in,
  input  wire         read_rom_block_valid_in,
  input  wire [15:0]  read_rom_block_block_addr_in,
  input  wire         read_rom_block_rden_in,
  input  wire         write_rom_block_valid_in,
  input  wire [15:0]  write_rom_block_block_addr_in,
  input  wire [879:0] write_rom_block_value_in,
  input  wire         write_rom_block_rden_in,
  input  wire         read_grid_valid_in,
  input  wire [8:0]   read_grid_index_in,
  input  wire         read_grid_rden_in,
  input  wire         write_grid_valid_in,
  input  wire [8:0]   write_grid_index_in,
  input  wire [31:0]  write_grid_value_in,
  input  wire         write_grid_rden_in,
  input  wire         set_fp32_accum_valid_in,
  input  wire [1:0]   set_fp32_accum_pe_id_in,
  input  wire [31:0]  set_fp32_accum_value_in,
  input  wire         set_fp32_accum_rden_in,
  input  wire         read_fp32_accum_valid_in,
  input  wire [1:0]   read_fp32_accum_pe_id_in,
  input  wire         read_fp32_accum_rden_in,
  input  wire         clear_pe_valid_in,
  input  wire [1:0]   clear_pe_pe_id_in,
  input  wire         clear_pe_rden_in,
  input  wire         clear_fp32_valid_in,
  input  wire [1:0]   clear_fp32_pe_id_in,
  input  wire         clear_fp32_rden_in,
  input  wire         clear_all_valid_in,
  input  wire         clear_all_rden_in,
  input  wire [2:0]   stall_rate_in,
  input  wire         stall_rate_valid_in,
  output wire         rst_and_startup_done_out,
  output wire         mac_step_rdy_out,
  output wire         mac_step_empty_out,
  output wire [23:0]  mac_step_result_out,
  output wire         read_accum_rdy_out,
  output wire         read_accum_empty_out,
  output wire [23:0]  read_accum_result_out,
  output wire         read_rom_block_rdy_out,
  output wire         read_rom_block_empty_out,
  output wire [879:0] read_rom_block_result_out,
  output wire         write_rom_block_rdy_out,
  output wire         write_rom_block_empty_out,
  output wire         read_grid_rdy_out,
  output wire         read_grid_empty_out,
  output wire [31:0]  read_grid_result_out,
  output wire         write_grid_rdy_out,
  output wire         write_grid_empty_out,
  output wire         set_fp32_accum_rdy_out,
  output wire         set_fp32_accum_empty_out,
  output wire         read_fp32_accum_rdy_out,
  output wire         read_fp32_accum_empty_out,
  output wire [31:0]  read_fp32_accum_result_out,
  output wire         clear_pe_rdy_out,
  output wire         clear_pe_empty_out,
  output wire         clear_fp32_rdy_out,
  output wire         clear_fp32_empty_out,
  output wire         clear_all_rdy_out,
  output wire         clear_all_empty_out,
  output wire         stall_rate_supported_out
);

  wire         _clear_all_BasicBlock_0Impl_global_out__accum_element_0_21_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__accum_element_1_22_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__accum_element_2_23_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__accum_element_3_24_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_2_valid;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:82:9
  wire         _clear_all_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:82:9
  wire         _clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_1_valid;	// mac_array.k:79:38
  wire         _clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_1_valid;	// mac_array.k:79:38
  wire         _clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_1_valid;	// mac_array.k:79:38
  wire         _clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_1_valid;	// mac_array.k:79:38
  wire         _clear_fp32_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:79:38
  wire         _clear_fp32_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:79:38
  wire         _clear_pe_BasicBlock_0Impl_global_out__accum_element_0_21_1_valid;	// mac_array.k:78:36
  wire         _clear_pe_BasicBlock_0Impl_global_out__accum_element_1_22_1_valid;	// mac_array.k:78:36
  wire         _clear_pe_BasicBlock_0Impl_global_out__accum_element_2_23_1_valid;	// mac_array.k:78:36
  wire         _clear_pe_BasicBlock_0Impl_global_out__accum_element_3_24_1_valid;	// mac_array.k:78:36
  wire         _clear_pe_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:78:36
  wire         _clear_pe_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:78:36
  wire [31:0]  _read_fp32_accum_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:75:45
  wire         _read_fp32_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:75:45
  wire         _read_fp32_accum_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:75:45
  wire
    _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_0_valid;	// mac_array.k:72:9
  wire [31:0]  _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_0;	// mac_array.k:72:9
  wire
    _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_0_valid;	// mac_array.k:72:9
  wire [31:0]  _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_0;	// mac_array.k:72:9
  wire
    _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_0_valid;	// mac_array.k:72:9
  wire [31:0]  _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_0;	// mac_array.k:72:9
  wire
    _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_0_valid;	// mac_array.k:72:9
  wire [31:0]  _set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_0;	// mac_array.k:72:9
  wire         _set_fp32_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:72:9
  wire         _set_fp32_accum_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:72:9
  wire [31:0]  _write_grid_BasicBlock_0Impl_memory_write_data_out_30_0;	// mac_array.k:66:9
  wire [8:0]   _write_grid_BasicBlock_0Impl_memory_write_addr_out_30_0;	// mac_array.k:66:9
  wire         _write_grid_BasicBlock_0Impl_memory_wren_30_0;	// mac_array.k:66:9
  wire         _write_grid_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:66:9
  wire         _write_grid_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:66:9
  wire [8:0]   _read_grid_BasicBlock_0Impl_memory_read_addr_out_30_0;	// mac_array.k:59:9
  wire         _read_grid_BasicBlock_0Impl_memory_rden_out_30_0;	// mac_array.k:59:9
  wire [31:0]  _read_grid_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:59:9
  wire         _read_grid_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:59:9
  wire         _read_grid_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:59:9
  wire [879:0] _write_rom_block_BasicBlock_0Impl_memory_write_data_out_29_0;	// mac_array.k:53:9
  wire [9:0]   _write_rom_block_BasicBlock_0Impl_memory_write_addr_out_29_0;	// mac_array.k:53:9
  wire         _write_rom_block_BasicBlock_0Impl_memory_wren_29_0;	// mac_array.k:53:9
  wire         _write_rom_block_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:53:9
  wire         _write_rom_block_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:53:9
  wire [9:0]   _read_rom_block_BasicBlock_0Impl_memory_read_addr_out_29_0;	// mac_array.k:46:9
  wire         _read_rom_block_BasicBlock_0Impl_memory_rden_out_29_0;	// mac_array.k:46:9
  wire [879:0] _read_rom_block_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:46:9
  wire         _read_rom_block_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:46:9
  wire         _read_rom_block_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:46:9
  wire [23:0]  _read_accum_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:41:41
  wire         _read_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:41:41
  wire         _read_accum_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:41:41
  wire         _mac_step_BasicBlock_0Impl_global_out__accum_element_0_21_0_valid;	// mac_array.k:24:9
  wire [23:0]  _mac_step_BasicBlock_0Impl_global_out__accum_element_0_21_0;	// mac_array.k:24:9
  wire         _mac_step_BasicBlock_0Impl_global_out__accum_element_1_22_0_valid;	// mac_array.k:24:9
  wire [23:0]  _mac_step_BasicBlock_0Impl_global_out__accum_element_1_22_0;	// mac_array.k:24:9
  wire         _mac_step_BasicBlock_0Impl_global_out__accum_element_2_23_0_valid;	// mac_array.k:24:9
  wire [23:0]  _mac_step_BasicBlock_0Impl_global_out__accum_element_2_23_0;	// mac_array.k:24:9
  wire         _mac_step_BasicBlock_0Impl_global_out__accum_element_3_24_0_valid;	// mac_array.k:24:9
  wire [23:0]  _mac_step_BasicBlock_0Impl_global_out__accum_element_3_24_0;	// mac_array.k:24:9
  wire [23:0]  _mac_step_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:24:9
  wire         _mac_step_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:24:9
  wire         _mac_step_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:24:9
  wire         _fifo_10_clear_all_Return_overflow_out;
  wire         _fifo_10_clear_all_Return_underflow_out;
  wire         _fifo_10_clear_all_Return_empty;
  wire         _fifo_10_clear_all_Return_full;
  wire         _fifo_9_clear_fp32_Return_overflow_out;
  wire         _fifo_9_clear_fp32_Return_underflow_out;
  wire         _fifo_9_clear_fp32_Return_empty;
  wire         _fifo_9_clear_fp32_Return_full;
  wire         _fifo_8_clear_pe_Return_overflow_out;
  wire         _fifo_8_clear_pe_Return_underflow_out;
  wire         _fifo_8_clear_pe_Return_empty;
  wire         _fifo_8_clear_pe_Return_full;
  wire         _fifo_7_read_fp32_accum_Return_overflow_out;
  wire         _fifo_7_read_fp32_accum_Return_underflow_out;
  wire         _fifo_7_read_fp32_accum_Return_empty;
  wire         _fifo_7_read_fp32_accum_Return_full;
  wire [31:0]  _fifo_7_read_fp32_accum_Return_q;
  wire         _fifo_6_set_fp32_accum_Return_overflow_out;
  wire         _fifo_6_set_fp32_accum_Return_underflow_out;
  wire         _fifo_6_set_fp32_accum_Return_empty;
  wire         _fifo_6_set_fp32_accum_Return_full;
  wire         _fifo_5_write_grid_Return_overflow_out;
  wire         _fifo_5_write_grid_Return_underflow_out;
  wire         _fifo_5_write_grid_Return_empty;
  wire         _fifo_5_write_grid_Return_full;
  wire         _fifo_4_read_grid_Return_overflow_out;
  wire         _fifo_4_read_grid_Return_underflow_out;
  wire         _fifo_4_read_grid_Return_empty;
  wire         _fifo_4_read_grid_Return_full;
  wire [31:0]  _fifo_4_read_grid_Return_q;
  wire         _fifo_3_write_rom_block_Return_overflow_out;
  wire         _fifo_3_write_rom_block_Return_underflow_out;
  wire         _fifo_3_write_rom_block_Return_empty;
  wire         _fifo_3_write_rom_block_Return_full;
  wire         _fifo_2_read_rom_block_Return_overflow_out;
  wire         _fifo_2_read_rom_block_Return_underflow_out;
  wire         _fifo_2_read_rom_block_Return_empty;
  wire         _fifo_2_read_rom_block_Return_full;
  wire [879:0] _fifo_2_read_rom_block_Return_q;
  wire         _fifo_1_read_accum_Return_overflow_out;
  wire         _fifo_1_read_accum_Return_underflow_out;
  wire         _fifo_1_read_accum_Return_empty;
  wire         _fifo_1_read_accum_Return_full;
  wire [23:0]  _fifo_1_read_accum_Return_q;
  wire         _fifo_0_mac_step_Return_overflow_out;
  wire         _fifo_0_mac_step_Return_underflow_out;
  wire         _fifo_0_mac_step_Return_empty;
  wire         _fifo_0_mac_step_Return_full;
  wire [23:0]  _fifo_0_mac_step_Return_q;
  wire         _has_startup_completed_delayed_10_delay_chain_data_out;
  wire         _has_startup_completed_delayed_9_delay_chain_data_out;
  wire         _has_startup_completed_delayed_8_delay_chain_data_out;
  wire         _has_startup_completed_delayed_7_delay_chain_data_out;
  wire         _has_startup_completed_delayed_6_delay_chain_data_out;
  wire         _has_startup_completed_delayed_5_delay_chain_data_out;
  wire         _has_startup_completed_delayed_4_delay_chain_data_out;
  wire         _has_startup_completed_delayed_3_delay_chain_data_out;
  wire         _has_startup_completed_delayed_2_delay_chain_data_out;
  wire         _has_startup_completed_delayed_1_delay_chain_data_out;
  wire         _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [31:0]  __fp32_accum_element_3_value_out;	// mac_array.k:12:5
  wire [31:0]  __fp32_accum_element_2_value_out;	// mac_array.k:12:5
  wire [31:0]  __fp32_accum_element_1_value_out;	// mac_array.k:12:5
  wire [31:0]  __fp32_accum_element_0_value_out;	// mac_array.k:12:5
  wire [23:0]  __accum_element_3_value_out;	// mac_array.k:11:5
  wire [23:0]  __accum_element_2_value_out;	// mac_array.k:11:5
  wire [23:0]  __accum_element_1_value_out;	// mac_array.k:11:5
  wire [23:0]  __accum_element_0_value_out;	// mac_array.k:11:5
  wire [31:0]  __grid_read_data_out_0;	// mac_array.k:18:5
  wire         __grid_init_completed;	// mac_array.k:18:5
  wire [879:0] __rom_read_data_out_0;	// mac_array.k:15:5
  wire         __rom_init_completed;	// mac_array.k:15:5
  wire         _reset_control_rst_and_startup_done_out;
  wire [21:0]  _reset_control_rst_delayed_out;
  wire         _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  clear_all_empty_out_net;
  logic  clear_all_rdy_out_net;
  logic  clear_fp32_empty_out_net;
  logic  clear_fp32_rdy_out_net;
  logic  clear_pe_empty_out_net;
  logic  clear_pe_rdy_out_net;
  logic  read_fp32_accum_empty_out_net;
  logic [31:0] read_fp32_accum_result_out_net;
  logic  read_fp32_accum_rdy_out_net;
  logic  set_fp32_accum_empty_out_net;
  logic  set_fp32_accum_rdy_out_net;
  logic  write_grid_empty_out_net;
  logic  write_grid_rdy_out_net;
  logic  read_grid_empty_out_net;
  logic [31:0] read_grid_result_out_net;
  logic  read_grid_rdy_out_net;
  logic  write_rom_block_empty_out_net;
  logic  write_rom_block_rdy_out_net;
  logic  read_rom_block_empty_out_net;
  logic [879:0] read_rom_block_result_out_net;
  logic  read_rom_block_rdy_out_net;
  logic  read_accum_empty_out_net;
  logic [23:0] read_accum_result_out_net;
  logic  read_accum_rdy_out_net;
  logic  mac_step_empty_out_net;
  logic [23:0] mac_step_result_out_net;
  logic  mac_step_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [21:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire         _GEN =
    has_startup_completed_raw & __rom_init_completed & __grid_init_completed;	// mac_array.k:15:5, :18:5
  logic has_others_completed;
  assign has_others_completed = _GEN;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;

  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

  logic has_startup_completed_delayed_3;

  logic has_startup_completed_delayed_4;

  logic has_startup_completed_delayed_5;

  logic has_startup_completed_delayed_6;

  logic has_startup_completed_delayed_7;

  logic has_startup_completed_delayed_8;

  logic has_startup_completed_delayed_9;

  logic has_startup_completed_delayed_10;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [23:0] data_in;
      logic [23:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [23:0] data_in;
      logic [23:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [879:0] data_in;
      logic [879:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_3;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_4;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_5;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_6;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [31:0] data_in;
      logic [31:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_7;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_8;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_9;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_10;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [14:0] data;
      logic underflow;
  } passthrough_data_11;
  assign passthrough_data_11.underflow = 1'b0;
  assign passthrough_data_11.rdy_ext = passthrough_data_11.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_12;
  assign passthrough_data_12.underflow = 1'b0;
  assign passthrough_data_12.rdy_ext = passthrough_data_12.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_13;
  assign passthrough_data_13.underflow = 1'b0;
  assign passthrough_data_13.rdy_ext = passthrough_data_13.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [895:0] data;
      logic underflow;
  } passthrough_data_14;
  assign passthrough_data_14.underflow = 1'b0;
  assign passthrough_data_14.rdy_ext = passthrough_data_14.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [8:0] data;
      logic underflow;
  } passthrough_data_15;
  assign passthrough_data_15.underflow = 1'b0;
  assign passthrough_data_15.rdy_ext = passthrough_data_15.rdy_int & !(!has_startup_completed_delayed_4);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [40:0] data;
      logic underflow;
  } passthrough_data_16;
  assign passthrough_data_16.underflow = 1'b0;
  assign passthrough_data_16.rdy_ext = passthrough_data_16.rdy_int & !(!has_startup_completed_delayed_5);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [33:0] data;
      logic underflow;
  } passthrough_data_17;
  assign passthrough_data_17.underflow = 1'b0;
  assign passthrough_data_17.rdy_ext = passthrough_data_17.rdy_int & !(!has_startup_completed_delayed_6);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_18;
  assign passthrough_data_18.underflow = 1'b0;
  assign passthrough_data_18.rdy_ext = passthrough_data_18.rdy_int & !(!has_startup_completed_delayed_7);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_19;
  assign passthrough_data_19.underflow = 1'b0;
  assign passthrough_data_19.rdy_ext = passthrough_data_19.rdy_int & !(!has_startup_completed_delayed_8);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1:0] data;
      logic underflow;
  } passthrough_data_20;
  assign passthrough_data_20.underflow = 1'b0;
  assign passthrough_data_20.rdy_ext = passthrough_data_20.rdy_int & !(!has_startup_completed_delayed_9);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic underflow;
  } passthrough_data_21;
  assign passthrough_data_21.underflow = 1'b0;
  assign passthrough_data_21.rdy_ext = passthrough_data_21.rdy_int & !(!has_startup_completed_delayed_10);
  assign mac_step_rdy_out_net = passthrough_data_11.rdy_ext;
  assign passthrough_data_11.valid = mac_step_rdy_out & mac_step_valid_in;
  assign passthrough_data_11.data = { mac_step_activation_in, mac_step_sign_bit_in, mac_step_magnitude_in, mac_step_pe_id_in };
  assign fifo_data_0.rden = mac_step_rden_in;
  assign mac_step_result_out_net = fifo_data_0.data_out;
  assign mac_step_empty_out_net = fifo_data_0.empty;
  assign read_accum_rdy_out_net = passthrough_data_12.rdy_ext;
  assign passthrough_data_12.valid = read_accum_rdy_out & read_accum_valid_in;
  assign passthrough_data_12.data = { read_accum_pe_id_in };
  assign fifo_data_1.rden = read_accum_rden_in;
  assign read_accum_result_out_net = fifo_data_1.data_out;
  assign read_accum_empty_out_net = fifo_data_1.empty;
  assign read_rom_block_rdy_out_net = passthrough_data_13.rdy_ext;
  assign passthrough_data_13.valid = read_rom_block_rdy_out & read_rom_block_valid_in;
  assign passthrough_data_13.data = { read_rom_block_block_addr_in };
  assign fifo_data_2.rden = read_rom_block_rden_in;
  assign read_rom_block_result_out_net = fifo_data_2.data_out;
  assign read_rom_block_empty_out_net = fifo_data_2.empty;
  assign write_rom_block_rdy_out_net = passthrough_data_14.rdy_ext;
  assign passthrough_data_14.valid = write_rom_block_rdy_out & write_rom_block_valid_in;
  assign passthrough_data_14.data = { write_rom_block_value_in, write_rom_block_block_addr_in };
  assign fifo_data_3.rden = write_rom_block_rden_in;
  assign write_rom_block_empty_out_net = fifo_data_3.empty;
  assign read_grid_rdy_out_net = passthrough_data_15.rdy_ext;
  assign passthrough_data_15.valid = read_grid_rdy_out & read_grid_valid_in;
  assign passthrough_data_15.data = { read_grid_index_in };
  assign fifo_data_4.rden = read_grid_rden_in;
  assign read_grid_result_out_net = fifo_data_4.data_out;
  assign read_grid_empty_out_net = fifo_data_4.empty;
  assign write_grid_rdy_out_net = passthrough_data_16.rdy_ext;
  assign passthrough_data_16.valid = write_grid_rdy_out & write_grid_valid_in;
  assign passthrough_data_16.data = { write_grid_value_in, write_grid_index_in };
  assign fifo_data_5.rden = write_grid_rden_in;
  assign write_grid_empty_out_net = fifo_data_5.empty;
  assign set_fp32_accum_rdy_out_net = passthrough_data_17.rdy_ext;
  assign passthrough_data_17.valid = set_fp32_accum_rdy_out & set_fp32_accum_valid_in;
  assign passthrough_data_17.data = { set_fp32_accum_value_in, set_fp32_accum_pe_id_in };
  assign fifo_data_6.rden = set_fp32_accum_rden_in;
  assign set_fp32_accum_empty_out_net = fifo_data_6.empty;
  assign read_fp32_accum_rdy_out_net = passthrough_data_18.rdy_ext;
  assign passthrough_data_18.valid = read_fp32_accum_rdy_out & read_fp32_accum_valid_in;
  assign passthrough_data_18.data = { read_fp32_accum_pe_id_in };
  assign fifo_data_7.rden = read_fp32_accum_rden_in;
  assign read_fp32_accum_result_out_net = fifo_data_7.data_out;
  assign read_fp32_accum_empty_out_net = fifo_data_7.empty;
  assign clear_pe_rdy_out_net = passthrough_data_19.rdy_ext;
  assign passthrough_data_19.valid = clear_pe_rdy_out & clear_pe_valid_in;
  assign passthrough_data_19.data = { clear_pe_pe_id_in };
  assign fifo_data_8.rden = clear_pe_rden_in;
  assign clear_pe_empty_out_net = fifo_data_8.empty;
  assign clear_fp32_rdy_out_net = passthrough_data_20.rdy_ext;
  assign passthrough_data_20.valid = clear_fp32_rdy_out & clear_fp32_valid_in;
  assign passthrough_data_20.data = { clear_fp32_pe_id_in };
  assign fifo_data_9.rden = clear_fp32_rden_in;
  assign clear_fp32_empty_out_net = fifo_data_9.empty;
  assign clear_all_rdy_out_net = passthrough_data_21.rdy_ext;
  assign passthrough_data_21.valid = clear_all_rdy_out & clear_all_valid_in;
  assign fifo_data_10.rden = clear_all_rden_in;
  assign clear_all_empty_out_net = fifo_data_10.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    has_startup_completed_delayed_4 = _has_startup_completed_delayed_4_delay_chain_data_out;
    has_startup_completed_delayed_5 = _has_startup_completed_delayed_5_delay_chain_data_out;
    has_startup_completed_delayed_6 = _has_startup_completed_delayed_6_delay_chain_data_out;
    has_startup_completed_delayed_7 = _has_startup_completed_delayed_7_delay_chain_data_out;
    has_startup_completed_delayed_8 = _has_startup_completed_delayed_8_delay_chain_data_out;
    has_startup_completed_delayed_9 = _has_startup_completed_delayed_9_delay_chain_data_out;
    has_startup_completed_delayed_10 = _has_startup_completed_delayed_10_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_mac_step_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_mac_step_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_mac_step_Return_empty;
    fifo_data_0.almost_full = _fifo_0_mac_step_Return_full;
    fifo_data_0.data_out = _fifo_0_mac_step_Return_q;
    fifo_data_1.overflow = _fifo_1_read_accum_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_read_accum_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_read_accum_Return_empty;
    fifo_data_1.almost_full = _fifo_1_read_accum_Return_full;
    fifo_data_1.data_out = _fifo_1_read_accum_Return_q;
    fifo_data_2.overflow = _fifo_2_read_rom_block_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_read_rom_block_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_read_rom_block_Return_empty;
    fifo_data_2.almost_full = _fifo_2_read_rom_block_Return_full;
    fifo_data_2.data_out = _fifo_2_read_rom_block_Return_q;
    fifo_data_3.overflow = _fifo_3_write_rom_block_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_write_rom_block_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_write_rom_block_Return_empty;
    fifo_data_3.almost_full = _fifo_3_write_rom_block_Return_full;
    fifo_data_4.overflow = _fifo_4_read_grid_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_read_grid_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_read_grid_Return_empty;
    fifo_data_4.almost_full = _fifo_4_read_grid_Return_full;
    fifo_data_4.data_out = _fifo_4_read_grid_Return_q;
    fifo_data_5.overflow = _fifo_5_write_grid_Return_overflow_out;
    fifo_data_5.underflow = _fifo_5_write_grid_Return_underflow_out;
    fifo_data_5.empty = _fifo_5_write_grid_Return_empty;
    fifo_data_5.almost_full = _fifo_5_write_grid_Return_full;
    fifo_data_6.overflow = _fifo_6_set_fp32_accum_Return_overflow_out;
    fifo_data_6.underflow = _fifo_6_set_fp32_accum_Return_underflow_out;
    fifo_data_6.empty = _fifo_6_set_fp32_accum_Return_empty;
    fifo_data_6.almost_full = _fifo_6_set_fp32_accum_Return_full;
    fifo_data_7.overflow = _fifo_7_read_fp32_accum_Return_overflow_out;
    fifo_data_7.underflow = _fifo_7_read_fp32_accum_Return_underflow_out;
    fifo_data_7.empty = _fifo_7_read_fp32_accum_Return_empty;
    fifo_data_7.almost_full = _fifo_7_read_fp32_accum_Return_full;
    fifo_data_7.data_out = _fifo_7_read_fp32_accum_Return_q;
    fifo_data_8.overflow = _fifo_8_clear_pe_Return_overflow_out;
    fifo_data_8.underflow = _fifo_8_clear_pe_Return_underflow_out;
    fifo_data_8.empty = _fifo_8_clear_pe_Return_empty;
    fifo_data_8.almost_full = _fifo_8_clear_pe_Return_full;
    fifo_data_9.overflow = _fifo_9_clear_fp32_Return_overflow_out;
    fifo_data_9.underflow = _fifo_9_clear_fp32_Return_underflow_out;
    fifo_data_9.empty = _fifo_9_clear_fp32_Return_empty;
    fifo_data_9.almost_full = _fifo_9_clear_fp32_Return_full;
    fifo_data_10.overflow = _fifo_10_clear_all_Return_overflow_out;
    fifo_data_10.underflow = _fifo_10_clear_all_Return_underflow_out;
    fifo_data_10.empty = _fifo_10_clear_all_Return_empty;
    fifo_data_10.almost_full = _fifo_10_clear_all_Return_full;
    fifo_data_0.data_in = _mac_step_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:24:9
    fifo_data_0.wren = _mac_step_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:24:9
    passthrough_data_11.rdy_int = _mac_step_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:24:9
    fifo_data_1.data_in = _read_accum_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:41:41
    fifo_data_1.wren = _read_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:41:41
    passthrough_data_12.rdy_int = _read_accum_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:41:41
    fifo_data_2.data_in = _read_rom_block_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:46:9
    fifo_data_2.wren = _read_rom_block_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:46:9
    passthrough_data_13.rdy_int = _read_rom_block_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:46:9
    fifo_data_3.wren = _write_rom_block_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:53:9
    passthrough_data_14.rdy_int = _write_rom_block_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:53:9
    fifo_data_4.data_in = _read_grid_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:59:9
    fifo_data_4.wren = _read_grid_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:59:9
    passthrough_data_15.rdy_int = _read_grid_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:59:9
    fifo_data_5.wren = _write_grid_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:66:9
    passthrough_data_16.rdy_int = _write_grid_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:66:9
    fifo_data_6.wren = _set_fp32_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:72:9
    passthrough_data_17.rdy_int = _set_fp32_accum_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:72:9
    fifo_data_7.data_in = _read_fp32_accum_BasicBlock_0Impl_fifo_data_out_0;	// mac_array.k:75:45
    fifo_data_7.wren = _read_fp32_accum_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:75:45
    passthrough_data_18.rdy_int = _read_fp32_accum_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:75:45
    fifo_data_8.wren = _clear_pe_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:78:36
    passthrough_data_19.rdy_int = _clear_pe_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:78:36
    fifo_data_9.wren = _clear_fp32_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:79:38
    passthrough_data_20.rdy_int = _clear_fp32_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:79:38
    fifo_data_10.wren = _clear_all_BasicBlock_0Impl_fifo_wren_0;	// mac_array.k:82:9
    passthrough_data_21.rdy_int = _clear_all_BasicBlock_0Impl_input_rdy_0;	// mac_array.k:82:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(22),
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
  mac_array__rom__mem_container _rom (	// mac_array.k:15:5
    .clk             (clk),	// mac_array.k:15:5
    .rst             (1'b0),	// mac_array.k:15:5
    .rden_in_0       (_read_rom_block_BasicBlock_0Impl_memory_rden_out_29_0),	// mac_array.k:46:9
    .read_addr_in_0  (_read_rom_block_BasicBlock_0Impl_memory_read_addr_out_29_0),	// mac_array.k:46:9
    .wren_in_0       (_write_rom_block_BasicBlock_0Impl_memory_wren_29_0),	// mac_array.k:53:9
    .write_addr_in_0 (_write_rom_block_BasicBlock_0Impl_memory_write_addr_out_29_0),	// mac_array.k:53:9
    .write_data_in_0 (_write_rom_block_BasicBlock_0Impl_memory_write_data_out_29_0),	// mac_array.k:53:9
    .read_data_out_0 (__rom_read_data_out_0),
    .init_completed  (__rom_init_completed)
  );	// mac_array.k:15:5
  mac_array__grid__mem_container _grid (	// mac_array.k:18:5
    .clk             (clk),	// mac_array.k:15:5
    .rst             (1'b0),	// mac_array.k:15:5
    .rden_in_0       (_read_grid_BasicBlock_0Impl_memory_rden_out_30_0),	// mac_array.k:59:9
    .read_addr_in_0  (_read_grid_BasicBlock_0Impl_memory_read_addr_out_30_0),	// mac_array.k:59:9
    .wren_in_0       (_write_grid_BasicBlock_0Impl_memory_wren_30_0),	// mac_array.k:66:9
    .write_addr_in_0 (_write_grid_BasicBlock_0Impl_memory_write_addr_out_30_0),	// mac_array.k:66:9
    .write_data_in_0 (_write_grid_BasicBlock_0Impl_memory_write_data_out_30_0),	// mac_array.k:66:9
    .read_data_out_0 (__grid_read_data_out_0),
    .init_completed  (__grid_init_completed)
  );	// mac_array.k:18:5
  mac_array_reg_24_w3_v_1_24_0_v_2_24_0 _accum_element_0 (	// mac_array.k:11:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0 (_mac_step_BasicBlock_0Impl_global_out__accum_element_0_21_0_valid),	// mac_array.k:24:9
    .input_0       (_mac_step_BasicBlock_0Impl_global_out__accum_element_0_21_0),	// mac_array.k:24:9
    .input_valid_1 (_clear_pe_BasicBlock_0Impl_global_out__accum_element_0_21_1_valid),	// mac_array.k:78:36
    .input_valid_2 (_clear_all_BasicBlock_0Impl_global_out__accum_element_0_21_2_valid),	// mac_array.k:82:9
    .value_out     (__accum_element_0_value_out)
  );	// mac_array.k:11:5
  mac_array_reg_24_w3_v_1_24_0_v_2_24_0 _accum_element_1 (	// mac_array.k:11:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0 (_mac_step_BasicBlock_0Impl_global_out__accum_element_1_22_0_valid),	// mac_array.k:24:9
    .input_0       (_mac_step_BasicBlock_0Impl_global_out__accum_element_1_22_0),	// mac_array.k:24:9
    .input_valid_1 (_clear_pe_BasicBlock_0Impl_global_out__accum_element_1_22_1_valid),	// mac_array.k:78:36
    .input_valid_2 (_clear_all_BasicBlock_0Impl_global_out__accum_element_1_22_2_valid),	// mac_array.k:82:9
    .value_out     (__accum_element_1_value_out)
  );	// mac_array.k:11:5
  mac_array_reg_24_w3_v_1_24_0_v_2_24_0 _accum_element_2 (	// mac_array.k:11:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0 (_mac_step_BasicBlock_0Impl_global_out__accum_element_2_23_0_valid),	// mac_array.k:24:9
    .input_0       (_mac_step_BasicBlock_0Impl_global_out__accum_element_2_23_0),	// mac_array.k:24:9
    .input_valid_1 (_clear_pe_BasicBlock_0Impl_global_out__accum_element_2_23_1_valid),	// mac_array.k:78:36
    .input_valid_2 (_clear_all_BasicBlock_0Impl_global_out__accum_element_2_23_2_valid),	// mac_array.k:82:9
    .value_out     (__accum_element_2_value_out)
  );	// mac_array.k:11:5
  mac_array_reg_24_w3_v_1_24_0_v_2_24_0 _accum_element_3 (	// mac_array.k:11:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0 (_mac_step_BasicBlock_0Impl_global_out__accum_element_3_24_0_valid),	// mac_array.k:24:9
    .input_0       (_mac_step_BasicBlock_0Impl_global_out__accum_element_3_24_0),	// mac_array.k:24:9
    .input_valid_1 (_clear_pe_BasicBlock_0Impl_global_out__accum_element_3_24_1_valid),	// mac_array.k:78:36
    .input_valid_2 (_clear_all_BasicBlock_0Impl_global_out__accum_element_3_24_2_valid),	// mac_array.k:82:9
    .value_out     (__accum_element_3_value_out)
  );	// mac_array.k:11:5
  mac_array_reg_32_w3_v_1_32_0_v_2_32_0 _fp32_accum_element_0 (	// mac_array.k:12:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_0_valid),	// mac_array.k:72:9
    .input_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_0),	// mac_array.k:72:9
    .input_valid_1
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_1_valid),	// mac_array.k:79:38
    .input_valid_2
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_2_valid),	// mac_array.k:82:9
    .value_out     (__fp32_accum_element_0_value_out)
  );	// mac_array.k:12:5
  mac_array_reg_32_w3_v_1_32_0_v_2_32_0 _fp32_accum_element_1 (	// mac_array.k:12:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_0_valid),	// mac_array.k:72:9
    .input_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_0),	// mac_array.k:72:9
    .input_valid_1
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_1_valid),	// mac_array.k:79:38
    .input_valid_2
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_2_valid),	// mac_array.k:82:9
    .value_out     (__fp32_accum_element_1_value_out)
  );	// mac_array.k:12:5
  mac_array_reg_32_w3_v_1_32_0_v_2_32_0 _fp32_accum_element_2 (	// mac_array.k:12:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_0_valid),	// mac_array.k:72:9
    .input_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_0),	// mac_array.k:72:9
    .input_valid_1
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_1_valid),	// mac_array.k:79:38
    .input_valid_2
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_2_valid),	// mac_array.k:82:9
    .value_out     (__fp32_accum_element_2_value_out)
  );	// mac_array.k:12:5
  mac_array_reg_32_w3_v_1_32_0_v_2_32_0 _fp32_accum_element_3 (	// mac_array.k:12:5
    .clk           (clk),	// mac_array.k:15:5
    .input_valid_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_0_valid),	// mac_array.k:72:9
    .input_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_0),	// mac_array.k:72:9
    .input_valid_1
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_1_valid),	// mac_array.k:79:38
    .input_valid_2
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_2_valid),	// mac_array.k:82:9
    .value_out     (__fp32_accum_element_3_value_out)
  );	// mac_array.k:12:5
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
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_2_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_2_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_3_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_3_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_4_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_4_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_5_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_5_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_6_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_6_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_7_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_7_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_8_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_8_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_9_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_9_delay_chain_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) has_startup_completed_delayed_10_delay_chain (
    .clk      (clk),
    .data_in  (has_others_completed),
    .data_out (_has_startup_completed_delayed_10_delay_chain_data_out)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(24),
    .PORT_WIDTH(24),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_mac_step_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_mac_step_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_mac_step_Return_overflow_out),
    .underflow_out (_fifo_0_mac_step_Return_underflow_out),
    .empty         (_fifo_0_mac_step_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_mac_step_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_mac_step_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(24),
    .PORT_WIDTH(24),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_read_accum_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_1_read_accum_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_read_accum_Return_overflow_out),
    .underflow_out (_fifo_1_read_accum_Return_underflow_out),
    .empty         (_fifo_1_read_accum_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_read_accum_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_read_accum_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(880),
    .PORT_WIDTH(880),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_read_rom_block_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_2_read_rom_block_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_read_rom_block_Return_overflow_out),
    .underflow_out (_fifo_2_read_rom_block_Return_underflow_out),
    .empty         (_fifo_2_read_rom_block_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_read_rom_block_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_read_rom_block_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_write_rom_block_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_3_write_rom_block_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_write_rom_block_Return_overflow_out),
    .underflow_out (_fifo_3_write_rom_block_Return_underflow_out),
    .empty         (_fifo_3_write_rom_block_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_write_rom_block_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_read_grid_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_4_read_grid_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_4_read_grid_Return_overflow_out),
    .underflow_out (_fifo_4_read_grid_Return_underflow_out),
    .empty         (_fifo_4_read_grid_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_read_grid_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          (fifo_data_4.data_in),
    .q             (_fifo_4_read_grid_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_5_write_grid_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_5_write_grid_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[5]),
    .overflow_out  (_fifo_5_write_grid_Return_overflow_out),
    .underflow_out (_fifo_5_write_grid_Return_underflow_out),
    .empty         (_fifo_5_write_grid_Return_empty),
    .rdreq         (fifo_data_5.rden),
    .full          (_fifo_5_write_grid_Return_full),
    .wrreq         (fifo_data_5.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_6_set_fp32_accum_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_6_set_fp32_accum_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[6]),
    .overflow_out  (_fifo_6_set_fp32_accum_Return_overflow_out),
    .underflow_out (_fifo_6_set_fp32_accum_Return_underflow_out),
    .empty         (_fifo_6_set_fp32_accum_Return_empty),
    .rdreq         (fifo_data_6.rden),
    .full          (_fifo_6_set_fp32_accum_Return_full),
    .wrreq         (fifo_data_6.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(32),
    .PORT_WIDTH(32),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_7_read_fp32_accum_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_7_read_fp32_accum_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[7]),
    .overflow_out  (_fifo_7_read_fp32_accum_Return_overflow_out),
    .underflow_out (_fifo_7_read_fp32_accum_Return_underflow_out),
    .empty         (_fifo_7_read_fp32_accum_Return_empty),
    .rdreq         (fifo_data_7.rden),
    .full          (_fifo_7_read_fp32_accum_Return_full),
    .wrreq         (fifo_data_7.wren),
    .data          (fifo_data_7.data_in),
    .q             (_fifo_7_read_fp32_accum_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_8_clear_pe_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_8_clear_pe_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[8]),
    .overflow_out  (_fifo_8_clear_pe_Return_overflow_out),
    .underflow_out (_fifo_8_clear_pe_Return_underflow_out),
    .empty         (_fifo_8_clear_pe_Return_empty),
    .rdreq         (fifo_data_8.rden),
    .full          (_fifo_8_clear_pe_Return_full),
    .wrreq         (fifo_data_8.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_9_clear_fp32_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_9_clear_fp32_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[9]),
    .overflow_out  (_fifo_9_clear_fp32_Return_overflow_out),
    .underflow_out (_fifo_9_clear_fp32_Return_underflow_out),
    .empty         (_fifo_9_clear_fp32_Return_empty),
    .rdreq         (fifo_data_9.rden),
    .full          (_fifo_9_clear_fp32_Return_full),
    .wrreq         (fifo_data_9.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_10_clear_all_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_10_clear_all_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[10]),
    .overflow_out  (_fifo_10_clear_all_Return_overflow_out),
    .underflow_out (_fifo_10_clear_all_Return_underflow_out),
    .empty         (_fifo_10_clear_all_Return_empty),
    .rdreq         (fifo_data_10.rden),
    .full          (_fifo_10_clear_all_Return_full),
    .wrreq         (fifo_data_10.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  mac_array_mac_step_BasicBlock_0 mac_step_BasicBlock_0Impl (	// mac_array.k:24:9
    .clk                                    (clk),	// mac_array.k:24:9
    .rst                                    (reg_rst_delayed[11]),	// mac_array.k:24:9
    .done_out                               (/* unused */),
    .global_in__accum_element_0_21          (__accum_element_0_value_out),	// mac_array.k:11:5
    .global_in__accum_element_1_22          (__accum_element_1_value_out),	// mac_array.k:11:5
    .global_in__accum_element_2_23          (__accum_element_2_value_out),	// mac_array.k:11:5
    .global_in__accum_element_3_24          (__accum_element_3_value_out),	// mac_array.k:11:5
    .global_out__accum_element_0_21_0_valid
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_0_21_0_valid),
    .global_out__accum_element_0_21_0
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_0_21_0),
    .global_out__accum_element_1_22_0_valid
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_1_22_0_valid),
    .global_out__accum_element_1_22_0
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_1_22_0),
    .global_out__accum_element_2_23_0_valid
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_2_23_0_valid),
    .global_out__accum_element_2_23_0
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_2_23_0),
    .global_out__accum_element_3_24_0_valid
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_3_24_0_valid),
    .global_out__accum_element_3_24_0
      (_mac_step_BasicBlock_0Impl_global_out__accum_element_3_24_0),
    .fifo_data_out_0                        (_mac_step_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                            (_mac_step_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0              (fifo_data_0.almost_full),	// mac_array.k:24:9
    .fifo_overflow_in_0                     (fifo_data_0.overflow),	// mac_array.k:24:9
    .data_in_11                             (passthrough_data_11.data),	// mac_array.k:24:9
    .input_fifo_underflow_0                 (passthrough_data_11.underflow),	// mac_array.k:24:9
    .input_rdy_0                            (_mac_step_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                          (passthrough_data_11.valid),	// mac_array.k:24:9
    .control_state_out                      (/* unused */)
  );	// mac_array.k:24:9
  mac_array_read_accum_BasicBlock_0 read_accum_BasicBlock_0Impl (	// mac_array.k:41:41
    .clk                           (clk),	// mac_array.k:41:41
    .rst                           (reg_rst_delayed[12]),	// mac_array.k:41:41
    .done_out                      (/* unused */),
    .global_in__accum_element_0_21 (__accum_element_0_value_out),	// mac_array.k:11:5
    .global_in__accum_element_1_22 (__accum_element_1_value_out),	// mac_array.k:11:5
    .global_in__accum_element_2_23 (__accum_element_2_value_out),	// mac_array.k:11:5
    .global_in__accum_element_3_24 (__accum_element_3_value_out),	// mac_array.k:11:5
    .fifo_data_out_0               (_read_accum_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                   (_read_accum_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0     (fifo_data_1.almost_full),	// mac_array.k:41:41
    .fifo_overflow_in_0            (fifo_data_1.overflow),	// mac_array.k:41:41
    .data_in_12                    (passthrough_data_12.data),	// mac_array.k:41:41
    .input_fifo_underflow_0        (passthrough_data_12.underflow),	// mac_array.k:41:41
    .input_rdy_0                   (_read_accum_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                 (passthrough_data_12.valid),	// mac_array.k:41:41
    .control_state_out             (/* unused */)
  );	// mac_array.k:41:41
  mac_array_read_rom_block_BasicBlock_0 read_rom_block_BasicBlock_0Impl (	// mac_array.k:46:9
    .clk                       (clk),	// mac_array.k:46:9
    .rst                       (reg_rst_delayed[13]),	// mac_array.k:46:9
    .done_out                  (/* unused */),
    .memory_read_data_in_29_0  (__rom_read_data_out_0),	// mac_array.k:15:5
    .memory_read_addr_out_29_0
      (_read_rom_block_BasicBlock_0Impl_memory_read_addr_out_29_0),
    .memory_rden_out_29_0      (_read_rom_block_BasicBlock_0Impl_memory_rden_out_29_0),
    .fifo_data_out_0           (_read_rom_block_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_rom_block_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_2.almost_full),	// mac_array.k:46:9
    .fifo_overflow_in_0        (fifo_data_2.overflow),	// mac_array.k:46:9
    .data_in_13                (passthrough_data_13.data),	// mac_array.k:46:9
    .input_fifo_underflow_0    (passthrough_data_13.underflow),	// mac_array.k:46:9
    .input_rdy_0               (_read_rom_block_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_13.valid),	// mac_array.k:46:9
    .control_state_out         (/* unused */)
  );	// mac_array.k:46:9
  mac_array_write_rom_block_BasicBlock_0 write_rom_block_BasicBlock_0Impl (	// mac_array.k:53:9
    .clk                        (clk),	// mac_array.k:53:9
    .rst                        (reg_rst_delayed[14]),	// mac_array.k:53:9
    .done_out                   (/* unused */),
    .memory_write_data_out_29_0
      (_write_rom_block_BasicBlock_0Impl_memory_write_data_out_29_0),
    .memory_write_addr_out_29_0
      (_write_rom_block_BasicBlock_0Impl_memory_write_addr_out_29_0),
    .memory_wren_29_0           (_write_rom_block_BasicBlock_0Impl_memory_wren_29_0),
    .fifo_wren_0                (_write_rom_block_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_3.almost_full),	// mac_array.k:53:9
    .fifo_overflow_in_0         (fifo_data_3.overflow),	// mac_array.k:53:9
    .data_in_14                 (passthrough_data_14.data),	// mac_array.k:53:9
    .input_fifo_underflow_0     (passthrough_data_14.underflow),	// mac_array.k:53:9
    .input_rdy_0                (_write_rom_block_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_14.valid),	// mac_array.k:53:9
    .control_state_out          (/* unused */)
  );	// mac_array.k:53:9
  mac_array_read_grid_BasicBlock_0 read_grid_BasicBlock_0Impl (	// mac_array.k:59:9
    .clk                       (clk),	// mac_array.k:59:9
    .rst                       (reg_rst_delayed[15]),	// mac_array.k:59:9
    .done_out                  (/* unused */),
    .memory_read_data_in_30_0  (__grid_read_data_out_0),	// mac_array.k:18:5
    .memory_read_addr_out_30_0 (_read_grid_BasicBlock_0Impl_memory_read_addr_out_30_0),
    .memory_rden_out_30_0      (_read_grid_BasicBlock_0Impl_memory_rden_out_30_0),
    .fifo_data_out_0           (_read_grid_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_grid_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_4.almost_full),	// mac_array.k:59:9
    .fifo_overflow_in_0        (fifo_data_4.overflow),	// mac_array.k:59:9
    .data_in_15                (passthrough_data_15.data),	// mac_array.k:59:9
    .input_fifo_underflow_0    (passthrough_data_15.underflow),	// mac_array.k:59:9
    .input_rdy_0               (_read_grid_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_15.valid),	// mac_array.k:59:9
    .control_state_out         (/* unused */)
  );	// mac_array.k:59:9
  mac_array_write_grid_BasicBlock_0 write_grid_BasicBlock_0Impl (	// mac_array.k:66:9
    .clk                        (clk),	// mac_array.k:66:9
    .rst                        (reg_rst_delayed[16]),	// mac_array.k:66:9
    .done_out                   (/* unused */),
    .memory_write_data_out_30_0 (_write_grid_BasicBlock_0Impl_memory_write_data_out_30_0),
    .memory_write_addr_out_30_0 (_write_grid_BasicBlock_0Impl_memory_write_addr_out_30_0),
    .memory_wren_30_0           (_write_grid_BasicBlock_0Impl_memory_wren_30_0),
    .fifo_wren_0                (_write_grid_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_5.almost_full),	// mac_array.k:66:9
    .fifo_overflow_in_0         (fifo_data_5.overflow),	// mac_array.k:66:9
    .data_in_16                 (passthrough_data_16.data),	// mac_array.k:66:9
    .input_fifo_underflow_0     (passthrough_data_16.underflow),	// mac_array.k:66:9
    .input_rdy_0                (_write_grid_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_16.valid),	// mac_array.k:66:9
    .control_state_out          (/* unused */)
  );	// mac_array.k:66:9
  mac_array_set_fp32_accum_BasicBlock_0 set_fp32_accum_BasicBlock_0Impl (	// mac_array.k:72:9
    .clk                                         (clk),	// mac_array.k:72:9
    .rst                                         (reg_rst_delayed[17]),	// mac_array.k:72:9
    .done_out                                    (/* unused */),
    .global_out__fp32_accum_element_0_25_0_valid
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_0_valid),
    .global_out__fp32_accum_element_0_25_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_0),
    .global_out__fp32_accum_element_1_26_0_valid
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_0_valid),
    .global_out__fp32_accum_element_1_26_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_0),
    .global_out__fp32_accum_element_2_27_0_valid
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_0_valid),
    .global_out__fp32_accum_element_2_27_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_0),
    .global_out__fp32_accum_element_3_28_0_valid
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_0_valid),
    .global_out__fp32_accum_element_3_28_0
      (_set_fp32_accum_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_0),
    .fifo_wren_0
      (_set_fp32_accum_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0                   (fifo_data_6.almost_full),	// mac_array.k:72:9
    .fifo_overflow_in_0                          (fifo_data_6.overflow),	// mac_array.k:72:9
    .data_in_17                                  (passthrough_data_17.data),	// mac_array.k:72:9
    .input_fifo_underflow_0                      (passthrough_data_17.underflow),	// mac_array.k:72:9
    .input_rdy_0
      (_set_fp32_accum_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                               (passthrough_data_17.valid),	// mac_array.k:72:9
    .control_state_out                           (/* unused */)
  );	// mac_array.k:72:9
  mac_array_read_fp32_accum_BasicBlock_0 read_fp32_accum_BasicBlock_0Impl (	// mac_array.k:75:45
    .clk                                (clk),	// mac_array.k:75:45
    .rst                                (reg_rst_delayed[18]),	// mac_array.k:75:45
    .done_out                           (/* unused */),
    .global_in__fp32_accum_element_0_25 (__fp32_accum_element_0_value_out),	// mac_array.k:12:5
    .global_in__fp32_accum_element_1_26 (__fp32_accum_element_1_value_out),	// mac_array.k:12:5
    .global_in__fp32_accum_element_2_27 (__fp32_accum_element_2_value_out),	// mac_array.k:12:5
    .global_in__fp32_accum_element_3_28 (__fp32_accum_element_3_value_out),	// mac_array.k:12:5
    .fifo_data_out_0
      (_read_fp32_accum_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                        (_read_fp32_accum_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0          (fifo_data_7.almost_full),	// mac_array.k:75:45
    .fifo_overflow_in_0                 (fifo_data_7.overflow),	// mac_array.k:75:45
    .data_in_18                         (passthrough_data_18.data),	// mac_array.k:75:45
    .input_fifo_underflow_0             (passthrough_data_18.underflow),	// mac_array.k:75:45
    .input_rdy_0                        (_read_fp32_accum_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                      (passthrough_data_18.valid),	// mac_array.k:75:45
    .control_state_out                  (/* unused */)
  );	// mac_array.k:75:45
  mac_array_clear_pe_BasicBlock_0 clear_pe_BasicBlock_0Impl (	// mac_array.k:78:36
    .clk                                    (clk),	// mac_array.k:78:36
    .rst                                    (reg_rst_delayed[19]),	// mac_array.k:78:36
    .done_out                               (/* unused */),
    .global_out__accum_element_0_21_1_valid
      (_clear_pe_BasicBlock_0Impl_global_out__accum_element_0_21_1_valid),
    .global_out__accum_element_1_22_1_valid
      (_clear_pe_BasicBlock_0Impl_global_out__accum_element_1_22_1_valid),
    .global_out__accum_element_2_23_1_valid
      (_clear_pe_BasicBlock_0Impl_global_out__accum_element_2_23_1_valid),
    .global_out__accum_element_3_24_1_valid
      (_clear_pe_BasicBlock_0Impl_global_out__accum_element_3_24_1_valid),
    .fifo_wren_0                            (_clear_pe_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0              (fifo_data_8.almost_full),	// mac_array.k:78:36
    .fifo_overflow_in_0                     (fifo_data_8.overflow),	// mac_array.k:78:36
    .data_in_19                             (passthrough_data_19.data),	// mac_array.k:78:36
    .input_fifo_underflow_0                 (passthrough_data_19.underflow),	// mac_array.k:78:36
    .input_rdy_0                            (_clear_pe_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                          (passthrough_data_19.valid),	// mac_array.k:78:36
    .control_state_out                      (/* unused */)
  );	// mac_array.k:78:36
  mac_array_clear_fp32_BasicBlock_0 clear_fp32_BasicBlock_0Impl (	// mac_array.k:79:38
    .clk                                         (clk),	// mac_array.k:79:38
    .rst                                         (reg_rst_delayed[20]),	// mac_array.k:79:38
    .done_out                                    (/* unused */),
    .global_out__fp32_accum_element_0_25_1_valid
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_1_valid),
    .global_out__fp32_accum_element_1_26_1_valid
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_1_valid),
    .global_out__fp32_accum_element_2_27_1_valid
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_1_valid),
    .global_out__fp32_accum_element_3_28_1_valid
      (_clear_fp32_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_1_valid),
    .fifo_wren_0
      (_clear_fp32_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0                   (fifo_data_9.almost_full),	// mac_array.k:79:38
    .fifo_overflow_in_0                          (fifo_data_9.overflow),	// mac_array.k:79:38
    .data_in_20                                  (passthrough_data_20.data),	// mac_array.k:79:38
    .input_fifo_underflow_0                      (passthrough_data_20.underflow),	// mac_array.k:79:38
    .input_rdy_0
      (_clear_fp32_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                               (passthrough_data_20.valid),	// mac_array.k:79:38
    .control_state_out                           (/* unused */)
  );	// mac_array.k:79:38
  mac_array_clear_all_BasicBlock_0 clear_all_BasicBlock_0Impl (	// mac_array.k:82:9
    .clk                                         (clk),	// mac_array.k:82:9
    .rst                                         (reg_rst_delayed[21]),	// mac_array.k:82:9
    .done_out                                    (/* unused */),
    .global_out__accum_element_0_21_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__accum_element_0_21_2_valid),
    .global_out__accum_element_1_22_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__accum_element_1_22_2_valid),
    .global_out__accum_element_2_23_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__accum_element_2_23_2_valid),
    .global_out__accum_element_3_24_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__accum_element_3_24_2_valid),
    .global_out__fp32_accum_element_0_25_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_0_25_2_valid),
    .global_out__fp32_accum_element_1_26_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_1_26_2_valid),
    .global_out__fp32_accum_element_2_27_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_2_27_2_valid),
    .global_out__fp32_accum_element_3_28_2_valid
      (_clear_all_BasicBlock_0Impl_global_out__fp32_accum_element_3_28_2_valid),
    .fifo_wren_0
      (_clear_all_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0                   (fifo_data_10.almost_full),	// mac_array.k:82:9
    .fifo_overflow_in_0                          (fifo_data_10.overflow),	// mac_array.k:82:9
    .input_fifo_underflow_0                      (passthrough_data_21.underflow),	// mac_array.k:82:9
    .input_rdy_0
      (_clear_all_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                               (passthrough_data_21.valid),	// mac_array.k:82:9
    .control_state_out                           (/* unused */)
  );	// mac_array.k:82:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign mac_step_rdy_out = mac_step_rdy_out_net;
  assign mac_step_empty_out = mac_step_empty_out_net;
  assign mac_step_result_out = mac_step_result_out_net;
  assign read_accum_rdy_out = read_accum_rdy_out_net;
  assign read_accum_empty_out = read_accum_empty_out_net;
  assign read_accum_result_out = read_accum_result_out_net;
  assign read_rom_block_rdy_out = read_rom_block_rdy_out_net;
  assign read_rom_block_empty_out = read_rom_block_empty_out_net;
  assign read_rom_block_result_out = read_rom_block_result_out_net;
  assign write_rom_block_rdy_out = write_rom_block_rdy_out_net;
  assign write_rom_block_empty_out = write_rom_block_empty_out_net;
  assign read_grid_rdy_out = read_grid_rdy_out_net;
  assign read_grid_empty_out = read_grid_empty_out_net;
  assign read_grid_result_out = read_grid_result_out_net;
  assign write_grid_rdy_out = write_grid_rdy_out_net;
  assign write_grid_empty_out = write_grid_empty_out_net;
  assign set_fp32_accum_rdy_out = set_fp32_accum_rdy_out_net;
  assign set_fp32_accum_empty_out = set_fp32_accum_empty_out_net;
  assign read_fp32_accum_rdy_out = read_fp32_accum_rdy_out_net;
  assign read_fp32_accum_empty_out = read_fp32_accum_empty_out_net;
  assign read_fp32_accum_result_out = read_fp32_accum_result_out_net;
  assign clear_pe_rdy_out = clear_pe_rdy_out_net;
  assign clear_pe_empty_out = clear_pe_empty_out_net;
  assign clear_fp32_rdy_out = clear_fp32_rdy_out_net;
  assign clear_fp32_empty_out = clear_fp32_empty_out_net;
  assign clear_all_rdy_out = clear_all_rdy_out_net;
  assign clear_all_empty_out = clear_all_empty_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module mac_array_EsiWrapper(
     input  wire                                                                                                    clk,
     input  wire                                                                                                    rst,
     input  wire [2:0]                                                                                              stall_rate_in,
     input  wire                                                                                                    stall_rate_valid_in,
  // input  wire /*Zero Width*/                                                                                     clear_all_arg,
     input  wire                                                                                                    clear_all_arg_valid,
     input  wire struct packed {logic [1:0] pe_id; }                                                                clear_fp32_arg,
     input  wire                                                                                                    clear_fp32_arg_valid,
     input  wire struct packed {logic [1:0] pe_id; }                                                                clear_pe_arg,
     input  wire                                                                                                    clear_pe_arg_valid,
     input  wire struct packed {logic [1:0] pe_id; logic [3:0] magnitude; logic sign_bit; logic [7:0] activation; } mac_step_arg,
     input  wire                                                                                                    mac_step_arg_valid,
     input  wire struct packed {logic [1:0] pe_id; }                                                                read_accum_arg,
     input  wire                                                                                                    read_accum_arg_valid,
     input  wire struct packed {logic [1:0] pe_id; }                                                                read_fp32_accum_arg,
     input  wire                                                                                                    read_fp32_accum_arg_valid,
     input  wire struct packed {logic [8:0] index; }                                                                read_grid_arg,
     input  wire                                                                                                    read_grid_arg_valid,
     input  wire struct packed {logic [15:0] block_addr; }                                                          read_rom_block_arg,
     input  wire                                                                                                    read_rom_block_arg_valid,
     input  wire struct packed {logic [1:0] pe_id; logic [31:0] value; }                                            set_fp32_accum_arg,
     input  wire                                                                                                    set_fp32_accum_arg_valid,
     input  wire struct packed {logic [8:0] index; logic [31:0] value; }                                            write_grid_arg,
     input  wire                                                                                                    write_grid_arg_valid,
     input  wire struct packed {logic [15:0] block_addr; logic [879:0] value; }                                     write_rom_block_arg,
     input  wire                                                                                                    write_rom_block_arg_valid,
     input  wire                                                                                                    clear_all_result_rden,
     input  wire                                                                                                    clear_fp32_result_rden,
     input  wire                                                                                                    clear_pe_result_rden,
     input  wire                                                                                                    mac_step_result_rden,
     input  wire                                                                                                    read_accum_result_rden,
     input  wire                                                                                                    read_fp32_accum_result_rden,
     input  wire                                                                                                    read_grid_result_rden,
     input  wire                                                                                                    read_rom_block_result_rden,
     input  wire                                                                                                    set_fp32_accum_result_rden,
     input  wire                                                                                                    write_grid_result_rden,
     input  wire                                                                                                    write_rom_block_result_rden,
     output wire                                                                                                    clear_all_arg_ready,
     output wire                                                                                                    clear_fp32_arg_ready,
     output wire                                                                                                    clear_pe_arg_ready,
     output wire                                                                                                    mac_step_arg_ready,
     output wire                                                                                                    read_accum_arg_ready,
     output wire                                                                                                    read_fp32_accum_arg_ready,
     output wire                                                                                                    read_grid_arg_ready,
     output wire                                                                                                    read_rom_block_arg_ready,
     output wire                                                                                                    set_fp32_accum_arg_ready,
     output wire                                                                                                    write_grid_arg_ready,
     output wire                                                                                                    write_rom_block_arg_ready,
  // output wire /*Zero Width*/                                                                                     clear_all_result,
     output wire                                                                                                    clear_all_result_empty,
  // output wire /*Zero Width*/                                                                                     clear_fp32_result,
     output wire                                                                                                    clear_fp32_result_empty,
  // output wire /*Zero Width*/                                                                                     clear_pe_result,
     output wire                                                                                                    clear_pe_result_empty,
     output wire [23:0]                                                                                             mac_step_result,
     output wire                                                                                                    mac_step_result_empty,
     output wire [23:0]                                                                                             read_accum_result,
     output wire                                                                                                    read_accum_result_empty,
     output wire [31:0]                                                                                             read_fp32_accum_result,
     output wire                                                                                                    read_fp32_accum_result_empty,
     output wire [31:0]                                                                                             read_grid_result,
     output wire                                                                                                    read_grid_result_empty,
     output wire [879:0]                                                                                            read_rom_block_result,
     output wire                                                                                                    read_rom_block_result_empty,
  // output wire /*Zero Width*/                                                                                     set_fp32_accum_result,
     output wire                                                                                                    set_fp32_accum_result_empty,
  // output wire /*Zero Width*/                                                                                     write_grid_result,
     output wire                                                                                                    write_grid_result_empty,
  // output wire /*Zero Width*/                                                                                     write_rom_block_result,
     output wire                                                                                                    write_rom_block_result_empty,
     output wire                                                                                                    rst_and_startup_done_out,
     output wire                                                                                                    stall_rate_supported_out
);

  wire [23:0]  _EsiWrapped_mac_step_result_out;
  wire [23:0]  _EsiWrapped_read_accum_result_out;
  wire [879:0] _EsiWrapped_read_rom_block_result_out;
  wire [31:0]  _EsiWrapped_read_grid_result_out;
  wire [31:0]  _EsiWrapped_read_fp32_accum_result_out;
  mac_array EsiWrapped (
    .clk                           (clk),
    .rst                           (rst),
    .mac_step_valid_in             (mac_step_arg_valid),
    .mac_step_pe_id_in             (mac_step_arg.pe_id),
    .mac_step_magnitude_in         (mac_step_arg.magnitude),
    .mac_step_sign_bit_in          (mac_step_arg.sign_bit),
    .mac_step_activation_in        (mac_step_arg.activation),
    .mac_step_rden_in              (mac_step_result_rden),
    .read_accum_valid_in           (read_accum_arg_valid),
    .read_accum_pe_id_in           (read_accum_arg.pe_id),
    .read_accum_rden_in            (read_accum_result_rden),
    .read_rom_block_valid_in       (read_rom_block_arg_valid),
    .read_rom_block_block_addr_in  (read_rom_block_arg.block_addr),
    .read_rom_block_rden_in        (read_rom_block_result_rden),
    .write_rom_block_valid_in      (write_rom_block_arg_valid),
    .write_rom_block_block_addr_in (write_rom_block_arg.block_addr),
    .write_rom_block_value_in      (write_rom_block_arg.value),
    .write_rom_block_rden_in       (write_rom_block_result_rden),
    .read_grid_valid_in            (read_grid_arg_valid),
    .read_grid_index_in            (read_grid_arg.index),
    .read_grid_rden_in             (read_grid_result_rden),
    .write_grid_valid_in           (write_grid_arg_valid),
    .write_grid_index_in           (write_grid_arg.index),
    .write_grid_value_in           (write_grid_arg.value),
    .write_grid_rden_in            (write_grid_result_rden),
    .set_fp32_accum_valid_in       (set_fp32_accum_arg_valid),
    .set_fp32_accum_pe_id_in       (set_fp32_accum_arg.pe_id),
    .set_fp32_accum_value_in       (set_fp32_accum_arg.value),
    .set_fp32_accum_rden_in        (set_fp32_accum_result_rden),
    .read_fp32_accum_valid_in      (read_fp32_accum_arg_valid),
    .read_fp32_accum_pe_id_in      (read_fp32_accum_arg.pe_id),
    .read_fp32_accum_rden_in       (read_fp32_accum_result_rden),
    .clear_pe_valid_in             (clear_pe_arg_valid),
    .clear_pe_pe_id_in             (clear_pe_arg.pe_id),
    .clear_pe_rden_in              (clear_pe_result_rden),
    .clear_fp32_valid_in           (clear_fp32_arg_valid),
    .clear_fp32_pe_id_in           (clear_fp32_arg.pe_id),
    .clear_fp32_rden_in            (clear_fp32_result_rden),
    .clear_all_valid_in            (clear_all_arg_valid),
    .clear_all_rden_in             (clear_all_result_rden),
    .stall_rate_in                 (stall_rate_in),
    .stall_rate_valid_in           (stall_rate_valid_in),
    .rst_and_startup_done_out      (rst_and_startup_done_out),
    .mac_step_rdy_out              (mac_step_arg_ready),
    .mac_step_empty_out            (mac_step_result_empty),
    .mac_step_result_out           (_EsiWrapped_mac_step_result_out),
    .read_accum_rdy_out            (read_accum_arg_ready),
    .read_accum_empty_out          (read_accum_result_empty),
    .read_accum_result_out         (_EsiWrapped_read_accum_result_out),
    .read_rom_block_rdy_out        (read_rom_block_arg_ready),
    .read_rom_block_empty_out      (read_rom_block_result_empty),
    .read_rom_block_result_out     (_EsiWrapped_read_rom_block_result_out),
    .write_rom_block_rdy_out       (write_rom_block_arg_ready),
    .write_rom_block_empty_out     (write_rom_block_result_empty),
    .read_grid_rdy_out             (read_grid_arg_ready),
    .read_grid_empty_out           (read_grid_result_empty),
    .read_grid_result_out          (_EsiWrapped_read_grid_result_out),
    .write_grid_rdy_out            (write_grid_arg_ready),
    .write_grid_empty_out          (write_grid_result_empty),
    .set_fp32_accum_rdy_out        (set_fp32_accum_arg_ready),
    .set_fp32_accum_empty_out      (set_fp32_accum_result_empty),
    .read_fp32_accum_rdy_out       (read_fp32_accum_arg_ready),
    .read_fp32_accum_empty_out     (read_fp32_accum_result_empty),
    .read_fp32_accum_result_out    (_EsiWrapped_read_fp32_accum_result_out),
    .clear_pe_rdy_out              (clear_pe_arg_ready),
    .clear_pe_empty_out            (clear_pe_result_empty),
    .clear_fp32_rdy_out            (clear_fp32_arg_ready),
    .clear_fp32_empty_out          (clear_fp32_result_empty),
    .clear_all_rdy_out             (clear_all_arg_ready),
    .clear_all_empty_out           (clear_all_result_empty),
    .stall_rate_supported_out      (stall_rate_supported_out)
  );
  // Zero width: assign clear_all_result = /*Zero width*/;
  // Zero width: assign clear_fp32_result = /*Zero width*/;
  // Zero width: assign clear_pe_result = /*Zero width*/;
  assign mac_step_result = _EsiWrapped_mac_step_result_out;
  assign read_accum_result = _EsiWrapped_read_accum_result_out;
  assign read_fp32_accum_result = _EsiWrapped_read_fp32_accum_result_out;
  assign read_grid_result = _EsiWrapped_read_grid_result_out;
  assign read_rom_block_result = _EsiWrapped_read_rom_block_result_out;
  // Zero width: assign set_fp32_accum_result = /*Zero width*/;
  // Zero width: assign write_grid_result = /*Zero width*/;
  // Zero width: assign write_rom_block_result = /*Zero width*/;
endmodule

