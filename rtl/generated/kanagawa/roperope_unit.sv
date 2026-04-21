
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=third-party/kanagawa/library --base-library=third-party/kanagawa/library/mini-base.k --output=rtl/generated/kanagawa/rope rtl/kanagawa/rope.k

`default_nettype wire
module rope_unitDebugView_read_cos_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_cos_rowEntry time: %0t position: %p", $time, _position);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_read_cos_rowExit
(
    input wire clk,
    input wire[1023:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_cos_rowExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_read_sin_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_sin_rowEntry time: %0t position: %p", $time, _position);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_read_sin_rowExit
(
    input wire clk,
    input wire[1023:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("read_sin_rowExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_write_cos_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire[1023:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_cos_rowEntry time: %0t position: %p value: %p", $time, _position, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_write_sin_rowEntry
(
    input wire clk,
    input wire[11:0]  _position,
    input wire[1023:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("write_sin_rowEntry time: %0t position: %p value: %p", $time, _position, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_rotate_pairEntry
(
    input wire clk,
    input wire[15:0]  _x_even,
    input wire[15:0]  _x_odd,
    input wire[15:0]  _cos_val,
    input wire[15:0]  _sin_val,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_pairEntry time: %0t x_even: %p x_odd: %p cos_val: %p sin_val: %p", $time, _x_even, _x_odd, _cos_val, _sin_val);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module rope_unitDebugView_rotate_pairExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("rotate_pairExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module rope_unit_rotate_pair_BasicBlock_0(	// rope.k:47:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [63:0] data_in_9,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// rope.k:47:9
  logic [15:0] fifo_data_out_0_0;	// rope.k:47:9
  logic        fifo_wren_0_0;	// rope.k:47:9
  logic        input_rdy_0_0;	// rope.k:47:9
  logic [7:0]  control_state_out_0;	// rope.k:47:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope.k:47:9
  always_comb begin	// rope.k:47:9
    input_rdy_0_0 = _GEN;	// rope.k:47:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope.k:47:9
  end // always_comb
  reg   [15:0] p0_x_even;	// rope.k:47:9
  reg   [15:0] p0_x_odd;	// rope.k:47:9
  reg   [15:0] p0_cos_val;	// rope.k:47:9
  reg   [15:0] p0_sin_val;	// rope.k:47:9
  reg          p0_stage1_enable = 1'h0;	// rope.k:47:9
  wire  [15:0] _GEN_0 = p0_stage1_enable ? p0_x_even : 'x;	// rope.k:45:5, :47:9
  reg   [15:0] p0_x_even_0;	// rope.k:47:9
  reg          p0_stage2_enable = 1'h0;	// rope.k:47:9
  always @(posedge clk) begin	// rope.k:47:9
    p0_x_even <= data_in_9[15:0];	// rope.k:47:9
    p0_x_odd <= data_in_9[31:16];	// rope.k:47:9
    p0_cos_val <= data_in_9[47:32];	// rope.k:47:9
    p0_sin_val <= data_in_9[63:48];	// rope.k:47:9
    if (rst)	// rope.k:47:9
      p0_stage1_enable <= 1'h0;	// rope.k:47:9
    else	// rope.k:47:9
      p0_stage1_enable <= _GEN & input_valid_0;	// rope.k:47:9
    p0_x_even_0 <= p0_x_even;	// rope.k:47:9
    if (rst)	// rope.k:47:9
      p0_stage2_enable <= 1'h0;	// rope.k:47:9
    else	// rope.k:47:9
      p0_stage2_enable <= p0_stage1_enable;	// rope.k:47:9
  end // always @(posedge)
  always_comb begin	// rope.k:47:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope.k:45:5, :47:9
    fifo_data_out_0_0 = p0_x_even_0;	// rope.k:45:5, :47:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope.k:47:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope.k:47:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_unitDebugView_rotate_pairEntry rope_unitDebugView_rotate_pairEntry_instance (	// rope.k:45:5
    .clk       (clk),	// rope.k:45:5
    ._x_even   (_GEN_0),	// rope.k:45:5
    ._x_odd    (p0_stage1_enable ? p0_x_odd : 'x),	// rope.k:45:5, :47:9
    ._cos_val  (p0_stage1_enable ? p0_cos_val : 'x),	// rope.k:45:5, :47:9
    ._sin_val  (p0_stage1_enable ? p0_sin_val : 'x),	// rope.k:45:5, :47:9
    .valid     (p0_stage1_enable),	// rope.k:47:9
    .valid_out (/* unused */)
  );	// rope.k:45:5
  rope_unitDebugView_rotate_pairExit rope_unitDebugView_rotate_pairExit_instance (	// rope.k:45:5
    .clk          (clk),	// rope.k:45:5
    ._ReturnValue (_GEN_0),	// rope.k:45:5
    .valid        (p0_stage1_enable),	// rope.k:47:9
    .valid_out    (/* unused */)
  );	// rope.k:45:5
  assign done_out = p0_stage2_enable;	// rope.k:47:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope.k:47:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope.k:47:9
  assign input_rdy_0 = input_rdy_0_0;	// rope.k:47:9
  assign control_state_out = control_state_out_0;	// rope.k:47:9
endmodule

module rope_unit_write_sin_row_BasicBlock_0(	// rope.k:41:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  output wire [1023:0] memory_write_data_out_14_0,
  output wire [11:0]   memory_write_addr_out_14_0,
  output wire          memory_wren_14_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [1035:0] data_in_8,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  logic          done_out_0;	// rope.k:41:9
  logic [1023:0] memory_write_data_out_14_0_0;	// rope.k:41:9
  logic [11:0]   memory_write_addr_out_14_0_0;	// rope.k:41:9
  logic          memory_wren_14_0_0;	// rope.k:41:9
  logic          fifo_wren_0_0;	// rope.k:41:9
  logic          input_rdy_0_0;	// rope.k:41:9
  logic [7:0]    control_state_out_0;	// rope.k:41:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope.k:41:9
  wire           _GEN_0 = _GEN & input_valid_0;	// rope.k:41:9
  always_comb begin	// rope.k:41:9
    input_rdy_0_0 = _GEN;	// rope.k:41:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope.k:41:9
  end // always_comb
  always_comb begin	// rope.k:41:9
    memory_wren_14_0_0 = _GEN_0;	// rope.k:41:{9,18}
    memory_write_addr_out_14_0_0 = data_in_8[11:0];	// rope.k:41:18
    memory_write_data_out_14_0_0 = data_in_8[1035:12];	// rope.k:41:18
  end // always_comb
  reg   [11:0]   p0_position;	// rope.k:41:9
  reg   [1023:0] p0_value;	// rope.k:41:9
  reg            p0_stage1_enable = 1'h0;	// rope.k:41:9
  reg            p0_stage2_enable = 1'h0;	// rope.k:41:9
  always @(posedge clk) begin	// rope.k:41:9
    p0_position <= data_in_8[11:0];	// rope.k:41:9
    p0_value <= data_in_8[1035:12];	// rope.k:41:9
    if (rst) begin	// rope.k:41:9
      p0_stage1_enable <= 1'h0;	// rope.k:41:9
      p0_stage2_enable <= 1'h0;	// rope.k:41:9
    end
    else begin	// rope.k:41:9
      p0_stage1_enable <= _GEN_0;	// rope.k:41:9
      p0_stage2_enable <= p0_stage1_enable;	// rope.k:41:9
    end
  end // always @(posedge)
  always_comb	// rope.k:41:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope.k:41:9, :42:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope.k:41:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope.k:41:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_unitDebugView_write_sin_rowEntry rope_unitDebugView_write_sin_rowEntry_instance (	// rope.k:42:9
    .clk       (clk),	// rope.k:42:9
    ._position (p0_stage1_enable ? p0_position : 'x),	// rope.k:41:9, :42:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// rope.k:41:9, :42:9
    .valid     (p0_stage1_enable),	// rope.k:41:9
    .valid_out (/* unused */)
  );	// rope.k:42:9
  assign done_out = p0_stage2_enable;	// rope.k:41:9
  assign memory_write_data_out_14_0 = memory_write_data_out_14_0_0;	// rope.k:41:9
  assign memory_write_addr_out_14_0 = memory_write_addr_out_14_0_0;	// rope.k:41:9
  assign memory_wren_14_0 = memory_wren_14_0_0;	// rope.k:41:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope.k:41:9
  assign input_rdy_0 = input_rdy_0_0;	// rope.k:41:9
  assign control_state_out = control_state_out_0;	// rope.k:41:9
endmodule

module rope_unit_write_cos_row_BasicBlock_0(	// rope.k:35:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  output wire [1023:0] memory_write_data_out_13_0,
  output wire [11:0]   memory_write_addr_out_13_0,
  output wire          memory_wren_13_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [1035:0] data_in_7,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  logic          done_out_0;	// rope.k:35:9
  logic [1023:0] memory_write_data_out_13_0_0;	// rope.k:35:9
  logic [11:0]   memory_write_addr_out_13_0_0;	// rope.k:35:9
  logic          memory_wren_13_0_0;	// rope.k:35:9
  logic          fifo_wren_0_0;	// rope.k:35:9
  logic          input_rdy_0_0;	// rope.k:35:9
  logic [7:0]    control_state_out_0;	// rope.k:35:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope.k:35:9
  wire           _GEN_0 = _GEN & input_valid_0;	// rope.k:35:9
  always_comb begin	// rope.k:35:9
    input_rdy_0_0 = _GEN;	// rope.k:35:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope.k:35:9
  end // always_comb
  always_comb begin	// rope.k:35:9
    memory_wren_13_0_0 = _GEN_0;	// rope.k:35:{9,18}
    memory_write_addr_out_13_0_0 = data_in_7[11:0];	// rope.k:35:18
    memory_write_data_out_13_0_0 = data_in_7[1035:12];	// rope.k:35:18
  end // always_comb
  reg   [11:0]   p0_position;	// rope.k:35:9
  reg   [1023:0] p0_value;	// rope.k:35:9
  reg            p0_stage1_enable = 1'h0;	// rope.k:35:9
  reg            p0_stage2_enable = 1'h0;	// rope.k:35:9
  always @(posedge clk) begin	// rope.k:35:9
    p0_position <= data_in_7[11:0];	// rope.k:35:9
    p0_value <= data_in_7[1035:12];	// rope.k:35:9
    if (rst) begin	// rope.k:35:9
      p0_stage1_enable <= 1'h0;	// rope.k:35:9
      p0_stage2_enable <= 1'h0;	// rope.k:35:9
    end
    else begin	// rope.k:35:9
      p0_stage1_enable <= _GEN_0;	// rope.k:35:9
      p0_stage2_enable <= p0_stage1_enable;	// rope.k:35:9
    end
  end // always @(posedge)
  always_comb	// rope.k:35:9
    fifo_wren_0_0 = p0_stage2_enable;	// rope.k:35:9, :36:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope.k:35:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope.k:35:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_unitDebugView_write_cos_rowEntry rope_unitDebugView_write_cos_rowEntry_instance (	// rope.k:36:9
    .clk       (clk),	// rope.k:36:9
    ._position (p0_stage1_enable ? p0_position : 'x),	// rope.k:35:9, :36:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// rope.k:35:9, :36:9
    .valid     (p0_stage1_enable),	// rope.k:35:9
    .valid_out (/* unused */)
  );	// rope.k:36:9
  assign done_out = p0_stage2_enable;	// rope.k:35:9
  assign memory_write_data_out_13_0 = memory_write_data_out_13_0_0;	// rope.k:35:9
  assign memory_write_addr_out_13_0 = memory_write_addr_out_13_0_0;	// rope.k:35:9
  assign memory_wren_13_0 = memory_wren_13_0_0;	// rope.k:35:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope.k:35:9
  assign input_rdy_0 = input_rdy_0_0;	// rope.k:35:9
  assign control_state_out = control_state_out_0;	// rope.k:35:9
endmodule

module rope_unit_read_sin_row_BasicBlock_0(	// rope.k:27:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  input  wire [1023:0] memory_read_data_in_14_0,
  output wire [11:0]   memory_read_addr_out_14_0,
  output wire          memory_rden_out_14_0,
  output wire [1023:0] fifo_data_out_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [11:0]   data_in_6,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  wire  [1023:0] memory_read_data_in_14_0_0 = memory_read_data_in_14_0;	// rope.k:27:9
  logic          done_out_0;	// rope.k:27:9
  logic [11:0]   memory_read_addr_out_14_0_0;	// rope.k:27:9
  logic          memory_rden_out_14_0_0;	// rope.k:27:9
  logic [1023:0] fifo_data_out_0_0;	// rope.k:27:9
  logic          fifo_wren_0_0;	// rope.k:27:9
  logic          input_rdy_0_0;	// rope.k:27:9
  logic [7:0]    control_state_out_0;	// rope.k:27:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope.k:27:9
  wire           _GEN_0 = _GEN & input_valid_0;	// rope.k:27:9
  always_comb begin	// rope.k:27:9
    input_rdy_0_0 = _GEN;	// rope.k:27:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope.k:27:9
  end // always_comb
  always_comb begin	// rope.k:27:9
    memory_read_addr_out_14_0_0 = data_in_6;	// rope.k:28:27
    memory_rden_out_14_0_0 = _GEN_0;	// rope.k:27:9, :28:27
  end // always_comb
  reg   [11:0]   p0_data_in_6;	// rope.k:27:9
  reg            p0_stage1_enable = 1'h0;	// rope.k:27:9
  reg            p0_stage2_enable = 1'h0;	// rope.k:27:9
  reg   [1023:0] p0_memory_read_data_in_14_0;	// rope.k:27:9
  reg            p0_stage3_enable = 1'h0;	// rope.k:27:9
  always @(posedge clk) begin	// rope.k:27:9
    p0_data_in_6 <= data_in_6;	// rope.k:27:9
    if (rst) begin	// rope.k:27:9
      p0_stage1_enable <= 1'h0;	// rope.k:27:9
      p0_stage2_enable <= 1'h0;	// rope.k:27:9
    end
    else begin	// rope.k:27:9
      p0_stage1_enable <= _GEN_0;	// rope.k:27:9
      p0_stage2_enable <= p0_stage1_enable;	// rope.k:27:9
    end
    p0_memory_read_data_in_14_0 <= memory_read_data_in_14_0_0;	// rope.k:27:9
    if (rst)	// rope.k:27:9
      p0_stage3_enable <= 1'h0;	// rope.k:27:9
    else	// rope.k:27:9
      p0_stage3_enable <= p0_stage2_enable;	// rope.k:27:9
  end // always @(posedge)
  always_comb begin	// rope.k:27:9
    fifo_wren_0_0 = p0_stage3_enable;	// rope.k:25:5, :27:9
    fifo_data_out_0_0 = p0_memory_read_data_in_14_0;	// rope.k:25:5, :27:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope.k:27:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope.k:27:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_unitDebugView_read_sin_rowEntry rope_unitDebugView_read_sin_rowEntry_instance (	// rope.k:25:5
    .clk       (clk),	// rope.k:25:5
    ._position (p0_stage1_enable ? p0_data_in_6 : 'x),	// rope.k:25:5, :27:9
    .valid     (p0_stage1_enable),	// rope.k:27:9
    .valid_out (/* unused */)
  );	// rope.k:25:5
  rope_unitDebugView_read_sin_rowExit rope_unitDebugView_read_sin_rowExit_instance (	// rope.k:25:5
    .clk          (clk),	// rope.k:25:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_14_0_0 : 'x),	// rope.k:25:5, :27:9
    .valid        (p0_stage2_enable),	// rope.k:27:9
    .valid_out    (/* unused */)
  );	// rope.k:25:5
  assign done_out = p0_stage3_enable;	// rope.k:27:9
  assign memory_read_addr_out_14_0 = memory_read_addr_out_14_0_0;	// rope.k:27:9
  assign memory_rden_out_14_0 = memory_rden_out_14_0_0;	// rope.k:27:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope.k:27:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope.k:27:9
  assign input_rdy_0 = input_rdy_0_0;	// rope.k:27:9
  assign control_state_out = control_state_out_0;	// rope.k:27:9
endmodule

module rope_unit_read_cos_row_BasicBlock_0(	// rope.k:19:9
  input  wire          clk,
  input  wire          rst,
  output wire          done_out,
  input  wire [1023:0] memory_read_data_in_13_0,
  output wire [11:0]   memory_read_addr_out_13_0,
  output wire          memory_rden_out_13_0,
  output wire [1023:0] fifo_data_out_0,
  output wire          fifo_wren_0,
  input  wire          fifo_almost_full_in_raw_0,
  input  wire          fifo_overflow_in_0,
  input  wire [11:0]   data_in_5,
  input  wire          input_fifo_underflow_0,
  output wire          input_rdy_0,
  input  wire          input_valid_0,
  output wire [7:0]    control_state_out
);

  wire           _fifo_overflow_ffc_0_data_out;
  wire           _fifo_almostfull_ffc_0_data_out;
  wire  [1023:0] memory_read_data_in_13_0_0 = memory_read_data_in_13_0;	// rope.k:19:9
  logic          done_out_0;	// rope.k:19:9
  logic [11:0]   memory_read_addr_out_13_0_0;	// rope.k:19:9
  logic          memory_rden_out_13_0_0;	// rope.k:19:9
  logic [1023:0] fifo_data_out_0_0;	// rope.k:19:9
  logic          fifo_wren_0_0;	// rope.k:19:9
  logic          input_rdy_0_0;	// rope.k:19:9
  logic [7:0]    control_state_out_0;	// rope.k:19:9
  wire           _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// rope.k:19:9
  wire           _GEN_0 = _GEN & input_valid_0;	// rope.k:19:9
  always_comb begin	// rope.k:19:9
    input_rdy_0_0 = _GEN;	// rope.k:19:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// rope.k:19:9
  end // always_comb
  always_comb begin	// rope.k:19:9
    memory_read_addr_out_13_0_0 = data_in_5;	// rope.k:20:27
    memory_rden_out_13_0_0 = _GEN_0;	// rope.k:19:9, :20:27
  end // always_comb
  reg   [11:0]   p0_data_in_5;	// rope.k:19:9
  reg            p0_stage1_enable = 1'h0;	// rope.k:19:9
  reg            p0_stage2_enable = 1'h0;	// rope.k:19:9
  reg   [1023:0] p0_memory_read_data_in_13_0;	// rope.k:19:9
  reg            p0_stage3_enable = 1'h0;	// rope.k:19:9
  always @(posedge clk) begin	// rope.k:19:9
    p0_data_in_5 <= data_in_5;	// rope.k:19:9
    if (rst) begin	// rope.k:19:9
      p0_stage1_enable <= 1'h0;	// rope.k:19:9
      p0_stage2_enable <= 1'h0;	// rope.k:19:9
    end
    else begin	// rope.k:19:9
      p0_stage1_enable <= _GEN_0;	// rope.k:19:9
      p0_stage2_enable <= p0_stage1_enable;	// rope.k:19:9
    end
    p0_memory_read_data_in_13_0 <= memory_read_data_in_13_0_0;	// rope.k:19:9
    if (rst)	// rope.k:19:9
      p0_stage3_enable <= 1'h0;	// rope.k:19:9
    else	// rope.k:19:9
      p0_stage3_enable <= p0_stage2_enable;	// rope.k:19:9
  end // always @(posedge)
  always_comb begin	// rope.k:19:9
    fifo_wren_0_0 = p0_stage3_enable;	// rope.k:17:5, :19:9
    fifo_data_out_0_0 = p0_memory_read_data_in_13_0;	// rope.k:17:5, :19:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// rope.k:19:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// rope.k:19:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  rope_unitDebugView_read_cos_rowEntry rope_unitDebugView_read_cos_rowEntry_instance (	// rope.k:17:5
    .clk       (clk),	// rope.k:17:5
    ._position (p0_stage1_enable ? p0_data_in_5 : 'x),	// rope.k:17:5, :19:9
    .valid     (p0_stage1_enable),	// rope.k:19:9
    .valid_out (/* unused */)
  );	// rope.k:17:5
  rope_unitDebugView_read_cos_rowExit rope_unitDebugView_read_cos_rowExit_instance (	// rope.k:17:5
    .clk          (clk),	// rope.k:17:5
    ._ReturnValue (p0_stage2_enable ? memory_read_data_in_13_0_0 : 'x),	// rope.k:17:5, :19:9
    .valid        (p0_stage2_enable),	// rope.k:19:9
    .valid_out    (/* unused */)
  );	// rope.k:17:5
  assign done_out = p0_stage3_enable;	// rope.k:19:9
  assign memory_read_addr_out_13_0 = memory_read_addr_out_13_0_0;	// rope.k:19:9
  assign memory_rden_out_13_0 = memory_rden_out_13_0_0;	// rope.k:19:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// rope.k:19:9
  assign fifo_wren_0 = fifo_wren_0_0;	// rope.k:19:9
  assign input_rdy_0 = input_rdy_0_0;	// rope.k:19:9
  assign control_state_out = control_state_out_0;	// rope.k:19:9
endmodule

module rope_unit__cos_table__mem_container(	// rope.k:12:5
  input  wire          clk,
  input  wire          rst,
  input  wire          rden_in_0,
  input  wire [11:0]   read_addr_in_0,
  input  wire          wren_in_0,
  input  wire [11:0]   write_addr_in_0,
  input  wire [1023:0] write_data_in_0,
  output wire [1023:0] read_data_out_0,
  output wire          init_completed
);

  wire [1:0][1023:0] ___cos_table_0_data_out;	// rope.k:12:5
  KanagawaSyncRam #(
    .DATA_WIDTH(1024),
    .ADDR_WIDTH(12),
    .DEPTH(4096),
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
  ) __cos_table_0 (	// rope.k:12:5
    .clk            (clk),	// rope.k:12:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// rope.k:12:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// rope.k:12:5
    .data_in        ({{1024'h0}, {write_data_in_0}}),	// rope.k:12:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// rope.k:12:5
    .data_out       (___cos_table_0_data_out)
  );	// rope.k:12:5
  assign read_data_out_0 = ___cos_table_0_data_out[1'h1];	// rope.k:12:5
  assign init_completed = 1'h1;	// rope.k:12:5
endmodule

module rope_unit__sin_table__mem_container(	// rope.k:13:5
  input  wire          clk,
  input  wire          rst,
  input  wire          rden_in_0,
  input  wire [11:0]   read_addr_in_0,
  input  wire          wren_in_0,
  input  wire [11:0]   write_addr_in_0,
  input  wire [1023:0] write_data_in_0,
  output wire [1023:0] read_data_out_0,
  output wire          init_completed
);

  wire [1:0][1023:0] ___sin_table_0_data_out;	// rope.k:13:5
  KanagawaSyncRam #(
    .DATA_WIDTH(1024),
    .ADDR_WIDTH(12),
    .DEPTH(4096),
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
  ) __sin_table_0 (	// rope.k:13:5
    .clk            (clk),	// rope.k:13:5
    .rst            (rst),
    .addr_in        ({{read_addr_in_0}, {write_addr_in_0}}),	// rope.k:13:5
    .ecc_status_out (/* unused */),
    .wren_in        ({{1'h0}, {wren_in_0}}),	// rope.k:13:5
    .data_in        ({{1024'h0}, {write_data_in_0}}),	// rope.k:13:5
    .rden_in        ({{rden_in_0}, {1'h0}}),	// rope.k:13:5
    .data_out       (___sin_table_0_data_out)
  );	// rope.k:13:5
  assign read_data_out_0 = ___sin_table_0_data_out[1'h1];	// rope.k:13:5
  assign init_completed = 1'h1;	// rope.k:13:5
endmodule

module rope_unit(
  input  wire          clk,
  input  wire          rst,
  input  wire          read_cos_row_valid_in,
  input  wire [11:0]   read_cos_row_position_in,
  input  wire          read_cos_row_rden_in,
  input  wire          read_sin_row_valid_in,
  input  wire [11:0]   read_sin_row_position_in,
  input  wire          read_sin_row_rden_in,
  input  wire          write_cos_row_valid_in,
  input  wire [11:0]   write_cos_row_position_in,
  input  wire [1023:0] write_cos_row_value_in,
  input  wire          write_cos_row_rden_in,
  input  wire          write_sin_row_valid_in,
  input  wire [11:0]   write_sin_row_position_in,
  input  wire [1023:0] write_sin_row_value_in,
  input  wire          write_sin_row_rden_in,
  input  wire          rotate_pair_valid_in,
  input  wire [15:0]   rotate_pair_x_even_in,
  input  wire [15:0]   rotate_pair_x_odd_in,
  input  wire [15:0]   rotate_pair_cos_val_in,
  input  wire [15:0]   rotate_pair_sin_val_in,
  input  wire          rotate_pair_rden_in,
  input  wire [2:0]    stall_rate_in,
  input  wire          stall_rate_valid_in,
  output wire          rst_and_startup_done_out,
  output wire          read_cos_row_rdy_out,
  output wire          read_cos_row_empty_out,
  output wire [1023:0] read_cos_row_result_out,
  output wire          read_sin_row_rdy_out,
  output wire          read_sin_row_empty_out,
  output wire [1023:0] read_sin_row_result_out,
  output wire          write_cos_row_rdy_out,
  output wire          write_cos_row_empty_out,
  output wire          write_sin_row_rdy_out,
  output wire          write_sin_row_empty_out,
  output wire          rotate_pair_rdy_out,
  output wire          rotate_pair_empty_out,
  output wire [15:0]   rotate_pair_result_out,
  output wire          stall_rate_supported_out
);

  wire [15:0]   _rotate_pair_BasicBlock_0Impl_fifo_data_out_0;	// rope.k:47:9
  wire          _rotate_pair_BasicBlock_0Impl_fifo_wren_0;	// rope.k:47:9
  wire          _rotate_pair_BasicBlock_0Impl_input_rdy_0;	// rope.k:47:9
  wire [1023:0] _write_sin_row_BasicBlock_0Impl_memory_write_data_out_14_0;	// rope.k:41:9
  wire [11:0]   _write_sin_row_BasicBlock_0Impl_memory_write_addr_out_14_0;	// rope.k:41:9
  wire          _write_sin_row_BasicBlock_0Impl_memory_wren_14_0;	// rope.k:41:9
  wire          _write_sin_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:41:9
  wire          _write_sin_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:41:9
  wire [1023:0] _write_cos_row_BasicBlock_0Impl_memory_write_data_out_13_0;	// rope.k:35:9
  wire [11:0]   _write_cos_row_BasicBlock_0Impl_memory_write_addr_out_13_0;	// rope.k:35:9
  wire          _write_cos_row_BasicBlock_0Impl_memory_wren_13_0;	// rope.k:35:9
  wire          _write_cos_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:35:9
  wire          _write_cos_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:35:9
  wire [11:0]   _read_sin_row_BasicBlock_0Impl_memory_read_addr_out_14_0;	// rope.k:27:9
  wire          _read_sin_row_BasicBlock_0Impl_memory_rden_out_14_0;	// rope.k:27:9
  wire [1023:0] _read_sin_row_BasicBlock_0Impl_fifo_data_out_0;	// rope.k:27:9
  wire          _read_sin_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:27:9
  wire          _read_sin_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:27:9
  wire [11:0]   _read_cos_row_BasicBlock_0Impl_memory_read_addr_out_13_0;	// rope.k:19:9
  wire          _read_cos_row_BasicBlock_0Impl_memory_rden_out_13_0;	// rope.k:19:9
  wire [1023:0] _read_cos_row_BasicBlock_0Impl_fifo_data_out_0;	// rope.k:19:9
  wire          _read_cos_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:19:9
  wire          _read_cos_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:19:9
  wire          _fifo_4_rotate_pair_Return_overflow_out;
  wire          _fifo_4_rotate_pair_Return_underflow_out;
  wire          _fifo_4_rotate_pair_Return_empty;
  wire          _fifo_4_rotate_pair_Return_full;
  wire [15:0]   _fifo_4_rotate_pair_Return_q;
  wire          _fifo_3_write_sin_row_Return_overflow_out;
  wire          _fifo_3_write_sin_row_Return_underflow_out;
  wire          _fifo_3_write_sin_row_Return_empty;
  wire          _fifo_3_write_sin_row_Return_full;
  wire          _fifo_2_write_cos_row_Return_overflow_out;
  wire          _fifo_2_write_cos_row_Return_underflow_out;
  wire          _fifo_2_write_cos_row_Return_empty;
  wire          _fifo_2_write_cos_row_Return_full;
  wire          _fifo_1_read_sin_row_Return_overflow_out;
  wire          _fifo_1_read_sin_row_Return_underflow_out;
  wire          _fifo_1_read_sin_row_Return_empty;
  wire          _fifo_1_read_sin_row_Return_full;
  wire [1023:0] _fifo_1_read_sin_row_Return_q;
  wire          _fifo_0_read_cos_row_Return_overflow_out;
  wire          _fifo_0_read_cos_row_Return_underflow_out;
  wire          _fifo_0_read_cos_row_Return_empty;
  wire          _fifo_0_read_cos_row_Return_full;
  wire [1023:0] _fifo_0_read_cos_row_Return_q;
  wire          _has_startup_completed_delayed_4_delay_chain_data_out;
  wire          _has_startup_completed_delayed_3_delay_chain_data_out;
  wire          _has_startup_completed_delayed_2_delay_chain_data_out;
  wire          _has_startup_completed_delayed_1_delay_chain_data_out;
  wire          _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [1023:0] __sin_table_read_data_out_0;	// rope.k:13:5
  wire          __sin_table_init_completed;	// rope.k:13:5
  wire [1023:0] __cos_table_read_data_out_0;	// rope.k:12:5
  wire          __cos_table_init_completed;	// rope.k:12:5
  wire          _reset_control_rst_and_startup_done_out;
  wire [9:0]    _reset_control_rst_delayed_out;
  wire          _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  rotate_pair_empty_out_net;
  logic [15:0] rotate_pair_result_out_net;
  logic  rotate_pair_rdy_out_net;
  logic  write_sin_row_empty_out_net;
  logic  write_sin_row_rdy_out_net;
  logic  write_cos_row_empty_out_net;
  logic  write_cos_row_rdy_out_net;
  logic  read_sin_row_empty_out_net;
  logic [1023:0] read_sin_row_result_out_net;
  logic  read_sin_row_rdy_out_net;
  logic  read_cos_row_empty_out_net;
  logic [1023:0] read_cos_row_result_out_net;
  logic  read_cos_row_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [9:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  wire          _GEN =
    has_startup_completed_raw & __cos_table_init_completed & __sin_table_init_completed;	// rope.k:12:5, :13:5
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

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [1023:0] data_in;
      logic [1023:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [1023:0] data_in;
      logic [1023:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
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
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_4;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [11:0] data;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [11:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1035:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [1035:0] data;
      logic underflow;
  } passthrough_data_8;
  assign passthrough_data_8.underflow = 1'b0;
  assign passthrough_data_8.rdy_ext = passthrough_data_8.rdy_int & !(!has_startup_completed_delayed_3);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [63:0] data;
      logic underflow;
  } passthrough_data_9;
  assign passthrough_data_9.underflow = 1'b0;
  assign passthrough_data_9.rdy_ext = passthrough_data_9.rdy_int & !(!has_startup_completed_delayed_4);
  assign read_cos_row_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = read_cos_row_rdy_out & read_cos_row_valid_in;
  assign passthrough_data_5.data = { read_cos_row_position_in };
  assign fifo_data_0.rden = read_cos_row_rden_in;
  assign read_cos_row_result_out_net = fifo_data_0.data_out;
  assign read_cos_row_empty_out_net = fifo_data_0.empty;
  assign read_sin_row_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = read_sin_row_rdy_out & read_sin_row_valid_in;
  assign passthrough_data_6.data = { read_sin_row_position_in };
  assign fifo_data_1.rden = read_sin_row_rden_in;
  assign read_sin_row_result_out_net = fifo_data_1.data_out;
  assign read_sin_row_empty_out_net = fifo_data_1.empty;
  assign write_cos_row_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = write_cos_row_rdy_out & write_cos_row_valid_in;
  assign passthrough_data_7.data = { write_cos_row_value_in, write_cos_row_position_in };
  assign fifo_data_2.rden = write_cos_row_rden_in;
  assign write_cos_row_empty_out_net = fifo_data_2.empty;
  assign write_sin_row_rdy_out_net = passthrough_data_8.rdy_ext;
  assign passthrough_data_8.valid = write_sin_row_rdy_out & write_sin_row_valid_in;
  assign passthrough_data_8.data = { write_sin_row_value_in, write_sin_row_position_in };
  assign fifo_data_3.rden = write_sin_row_rden_in;
  assign write_sin_row_empty_out_net = fifo_data_3.empty;
  assign rotate_pair_rdy_out_net = passthrough_data_9.rdy_ext;
  assign passthrough_data_9.valid = rotate_pair_rdy_out & rotate_pair_valid_in;
  assign passthrough_data_9.data = { rotate_pair_sin_val_in, rotate_pair_cos_val_in, rotate_pair_x_odd_in, rotate_pair_x_even_in };
  assign fifo_data_4.rden = rotate_pair_rden_in;
  assign rotate_pair_result_out_net = fifo_data_4.data_out;
  assign rotate_pair_empty_out_net = fifo_data_4.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    has_startup_completed_delayed_4 = _has_startup_completed_delayed_4_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_read_cos_row_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_read_cos_row_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_read_cos_row_Return_empty;
    fifo_data_0.almost_full = _fifo_0_read_cos_row_Return_full;
    fifo_data_0.data_out = _fifo_0_read_cos_row_Return_q;
    fifo_data_1.overflow = _fifo_1_read_sin_row_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_read_sin_row_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_read_sin_row_Return_empty;
    fifo_data_1.almost_full = _fifo_1_read_sin_row_Return_full;
    fifo_data_1.data_out = _fifo_1_read_sin_row_Return_q;
    fifo_data_2.overflow = _fifo_2_write_cos_row_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_write_cos_row_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_write_cos_row_Return_empty;
    fifo_data_2.almost_full = _fifo_2_write_cos_row_Return_full;
    fifo_data_3.overflow = _fifo_3_write_sin_row_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_write_sin_row_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_write_sin_row_Return_empty;
    fifo_data_3.almost_full = _fifo_3_write_sin_row_Return_full;
    fifo_data_4.overflow = _fifo_4_rotate_pair_Return_overflow_out;
    fifo_data_4.underflow = _fifo_4_rotate_pair_Return_underflow_out;
    fifo_data_4.empty = _fifo_4_rotate_pair_Return_empty;
    fifo_data_4.almost_full = _fifo_4_rotate_pair_Return_full;
    fifo_data_4.data_out = _fifo_4_rotate_pair_Return_q;
    fifo_data_0.data_in = _read_cos_row_BasicBlock_0Impl_fifo_data_out_0;	// rope.k:19:9
    fifo_data_0.wren = _read_cos_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:19:9
    passthrough_data_5.rdy_int = _read_cos_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:19:9
    fifo_data_1.data_in = _read_sin_row_BasicBlock_0Impl_fifo_data_out_0;	// rope.k:27:9
    fifo_data_1.wren = _read_sin_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:27:9
    passthrough_data_6.rdy_int = _read_sin_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:27:9
    fifo_data_2.wren = _write_cos_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:35:9
    passthrough_data_7.rdy_int = _write_cos_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:35:9
    fifo_data_3.wren = _write_sin_row_BasicBlock_0Impl_fifo_wren_0;	// rope.k:41:9
    passthrough_data_8.rdy_int = _write_sin_row_BasicBlock_0Impl_input_rdy_0;	// rope.k:41:9
    fifo_data_4.data_in = _rotate_pair_BasicBlock_0Impl_fifo_data_out_0;	// rope.k:47:9
    fifo_data_4.wren = _rotate_pair_BasicBlock_0Impl_fifo_wren_0;	// rope.k:47:9
    passthrough_data_9.rdy_int = _rotate_pair_BasicBlock_0Impl_input_rdy_0;	// rope.k:47:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(10),
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
  rope_unit__cos_table__mem_container _cos_table (	// rope.k:12:5
    .clk             (clk),	// rope.k:12:5
    .rst             (1'b0),	// rope.k:12:5
    .rden_in_0       (_read_cos_row_BasicBlock_0Impl_memory_rden_out_13_0),	// rope.k:19:9
    .read_addr_in_0  (_read_cos_row_BasicBlock_0Impl_memory_read_addr_out_13_0),	// rope.k:19:9
    .wren_in_0       (_write_cos_row_BasicBlock_0Impl_memory_wren_13_0),	// rope.k:35:9
    .write_addr_in_0 (_write_cos_row_BasicBlock_0Impl_memory_write_addr_out_13_0),	// rope.k:35:9
    .write_data_in_0 (_write_cos_row_BasicBlock_0Impl_memory_write_data_out_13_0),	// rope.k:35:9
    .read_data_out_0 (__cos_table_read_data_out_0),
    .init_completed  (__cos_table_init_completed)
  );	// rope.k:12:5
  rope_unit__sin_table__mem_container _sin_table (	// rope.k:13:5
    .clk             (clk),	// rope.k:12:5
    .rst             (1'b0),	// rope.k:12:5
    .rden_in_0       (_read_sin_row_BasicBlock_0Impl_memory_rden_out_14_0),	// rope.k:27:9
    .read_addr_in_0  (_read_sin_row_BasicBlock_0Impl_memory_read_addr_out_14_0),	// rope.k:27:9
    .wren_in_0       (_write_sin_row_BasicBlock_0Impl_memory_wren_14_0),	// rope.k:41:9
    .write_addr_in_0 (_write_sin_row_BasicBlock_0Impl_memory_write_addr_out_14_0),	// rope.k:41:9
    .write_data_in_0 (_write_sin_row_BasicBlock_0Impl_memory_write_data_out_14_0),	// rope.k:41:9
    .read_data_out_0 (__sin_table_read_data_out_0),
    .init_completed  (__sin_table_init_completed)
  );	// rope.k:13:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1024),
    .PORT_WIDTH(1024),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_read_cos_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_0_read_cos_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_read_cos_row_Return_overflow_out),
    .underflow_out (_fifo_0_read_cos_row_Return_underflow_out),
    .empty         (_fifo_0_read_cos_row_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_read_cos_row_Return_full),
    .wrreq         (fifo_data_0.wren),
    .data          (fifo_data_0.data_in),
    .q             (_fifo_0_read_cos_row_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(1024),
    .PORT_WIDTH(1024),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_1_read_sin_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_1_read_sin_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_read_sin_row_Return_overflow_out),
    .underflow_out (_fifo_1_read_sin_row_Return_underflow_out),
    .empty         (_fifo_1_read_sin_row_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_read_sin_row_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_read_sin_row_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_write_cos_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_2_write_cos_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_write_cos_row_Return_overflow_out),
    .underflow_out (_fifo_2_write_cos_row_Return_underflow_out),
    .empty         (_fifo_2_write_cos_row_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_write_cos_row_Return_full),
    .wrreq         (fifo_data_2.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_3_write_sin_row_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_3_write_sin_row_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_write_sin_row_Return_overflow_out),
    .underflow_out (_fifo_3_write_sin_row_Return_underflow_out),
    .empty         (_fifo_3_write_sin_row_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_write_sin_row_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          ('0),
    .q             (/* unused */)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_4_rotate_pair_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(1)
  ) fifo_4_rotate_pair_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[4]),
    .overflow_out  (_fifo_4_rotate_pair_Return_overflow_out),
    .underflow_out (_fifo_4_rotate_pair_Return_underflow_out),
    .empty         (_fifo_4_rotate_pair_Return_empty),
    .rdreq         (fifo_data_4.rden),
    .full          (_fifo_4_rotate_pair_Return_full),
    .wrreq         (fifo_data_4.wren),
    .data          (fifo_data_4.data_in),
    .q             (_fifo_4_rotate_pair_Return_q)
  );
  rope_unit_read_cos_row_BasicBlock_0 read_cos_row_BasicBlock_0Impl (	// rope.k:19:9
    .clk                       (clk),	// rope.k:19:9
    .rst                       (reg_rst_delayed[5]),	// rope.k:19:9
    .done_out                  (/* unused */),
    .memory_read_data_in_13_0  (__cos_table_read_data_out_0),	// rope.k:12:5
    .memory_read_addr_out_13_0 (_read_cos_row_BasicBlock_0Impl_memory_read_addr_out_13_0),
    .memory_rden_out_13_0      (_read_cos_row_BasicBlock_0Impl_memory_rden_out_13_0),
    .fifo_data_out_0           (_read_cos_row_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_cos_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_0.almost_full),	// rope.k:19:9
    .fifo_overflow_in_0        (fifo_data_0.overflow),	// rope.k:19:9
    .data_in_5                 (passthrough_data_5.data),	// rope.k:19:9
    .input_fifo_underflow_0    (passthrough_data_5.underflow),	// rope.k:19:9
    .input_rdy_0               (_read_cos_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_5.valid),	// rope.k:19:9
    .control_state_out         (/* unused */)
  );	// rope.k:19:9
  rope_unit_read_sin_row_BasicBlock_0 read_sin_row_BasicBlock_0Impl (	// rope.k:27:9
    .clk                       (clk),	// rope.k:27:9
    .rst                       (reg_rst_delayed[6]),	// rope.k:27:9
    .done_out                  (/* unused */),
    .memory_read_data_in_14_0  (__sin_table_read_data_out_0),	// rope.k:13:5
    .memory_read_addr_out_14_0 (_read_sin_row_BasicBlock_0Impl_memory_read_addr_out_14_0),
    .memory_rden_out_14_0      (_read_sin_row_BasicBlock_0Impl_memory_rden_out_14_0),
    .fifo_data_out_0           (_read_sin_row_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_read_sin_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_1.almost_full),	// rope.k:27:9
    .fifo_overflow_in_0        (fifo_data_1.overflow),	// rope.k:27:9
    .data_in_6                 (passthrough_data_6.data),	// rope.k:27:9
    .input_fifo_underflow_0    (passthrough_data_6.underflow),	// rope.k:27:9
    .input_rdy_0               (_read_sin_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_6.valid),	// rope.k:27:9
    .control_state_out         (/* unused */)
  );	// rope.k:27:9
  rope_unit_write_cos_row_BasicBlock_0 write_cos_row_BasicBlock_0Impl (	// rope.k:35:9
    .clk                        (clk),	// rope.k:35:9
    .rst                        (reg_rst_delayed[7]),	// rope.k:35:9
    .done_out                   (/* unused */),
    .memory_write_data_out_13_0
      (_write_cos_row_BasicBlock_0Impl_memory_write_data_out_13_0),
    .memory_write_addr_out_13_0
      (_write_cos_row_BasicBlock_0Impl_memory_write_addr_out_13_0),
    .memory_wren_13_0           (_write_cos_row_BasicBlock_0Impl_memory_wren_13_0),
    .fifo_wren_0                (_write_cos_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_2.almost_full),	// rope.k:35:9
    .fifo_overflow_in_0         (fifo_data_2.overflow),	// rope.k:35:9
    .data_in_7                  (passthrough_data_7.data),	// rope.k:35:9
    .input_fifo_underflow_0     (passthrough_data_7.underflow),	// rope.k:35:9
    .input_rdy_0                (_write_cos_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_7.valid),	// rope.k:35:9
    .control_state_out          (/* unused */)
  );	// rope.k:35:9
  rope_unit_write_sin_row_BasicBlock_0 write_sin_row_BasicBlock_0Impl (	// rope.k:41:9
    .clk                        (clk),	// rope.k:41:9
    .rst                        (reg_rst_delayed[8]),	// rope.k:41:9
    .done_out                   (/* unused */),
    .memory_write_data_out_14_0
      (_write_sin_row_BasicBlock_0Impl_memory_write_data_out_14_0),
    .memory_write_addr_out_14_0
      (_write_sin_row_BasicBlock_0Impl_memory_write_addr_out_14_0),
    .memory_wren_14_0           (_write_sin_row_BasicBlock_0Impl_memory_wren_14_0),
    .fifo_wren_0                (_write_sin_row_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0  (fifo_data_3.almost_full),	// rope.k:41:9
    .fifo_overflow_in_0         (fifo_data_3.overflow),	// rope.k:41:9
    .data_in_8                  (passthrough_data_8.data),	// rope.k:41:9
    .input_fifo_underflow_0     (passthrough_data_8.underflow),	// rope.k:41:9
    .input_rdy_0                (_write_sin_row_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0              (passthrough_data_8.valid),	// rope.k:41:9
    .control_state_out          (/* unused */)
  );	// rope.k:41:9
  rope_unit_rotate_pair_BasicBlock_0 rotate_pair_BasicBlock_0Impl (	// rope.k:47:9
    .clk                       (clk),	// rope.k:47:9
    .rst                       (reg_rst_delayed[9]),	// rope.k:47:9
    .done_out                  (/* unused */),
    .fifo_data_out_0           (_rotate_pair_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0               (_rotate_pair_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0 (fifo_data_4.almost_full),	// rope.k:47:9
    .fifo_overflow_in_0        (fifo_data_4.overflow),	// rope.k:47:9
    .data_in_9                 (passthrough_data_9.data),	// rope.k:47:9
    .input_fifo_underflow_0    (passthrough_data_9.underflow),	// rope.k:47:9
    .input_rdy_0               (_rotate_pair_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0             (passthrough_data_9.valid),	// rope.k:47:9
    .control_state_out         (/* unused */)
  );	// rope.k:47:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign read_cos_row_rdy_out = read_cos_row_rdy_out_net;
  assign read_cos_row_empty_out = read_cos_row_empty_out_net;
  assign read_cos_row_result_out = read_cos_row_result_out_net;
  assign read_sin_row_rdy_out = read_sin_row_rdy_out_net;
  assign read_sin_row_empty_out = read_sin_row_empty_out_net;
  assign read_sin_row_result_out = read_sin_row_result_out_net;
  assign write_cos_row_rdy_out = write_cos_row_rdy_out_net;
  assign write_cos_row_empty_out = write_cos_row_empty_out_net;
  assign write_sin_row_rdy_out = write_sin_row_rdy_out_net;
  assign write_sin_row_empty_out = write_sin_row_empty_out_net;
  assign rotate_pair_rdy_out = rotate_pair_rdy_out_net;
  assign rotate_pair_empty_out = rotate_pair_empty_out_net;
  assign rotate_pair_result_out = rotate_pair_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module rope_unit_EsiWrapper(
     input  wire                                                                                                       clk,
     input  wire                                                                                                       rst,
     input  wire [2:0]                                                                                                 stall_rate_in,
     input  wire                                                                                                       stall_rate_valid_in,
     input  wire struct packed {logic [11:0] position; }                                                               read_cos_row_arg,
     input  wire                                                                                                       read_cos_row_arg_valid,
     input  wire struct packed {logic [11:0] position; }                                                               read_sin_row_arg,
     input  wire                                                                                                       read_sin_row_arg_valid,
     input  wire struct packed {logic [15:0] x_even; logic [15:0] x_odd; logic [15:0] cos_val; logic [15:0] sin_val; } rotate_pair_arg,
     input  wire                                                                                                       rotate_pair_arg_valid,
     input  wire struct packed {logic [11:0] position; logic [1023:0] value; }                                         write_cos_row_arg,
     input  wire                                                                                                       write_cos_row_arg_valid,
     input  wire struct packed {logic [11:0] position; logic [1023:0] value; }                                         write_sin_row_arg,
     input  wire                                                                                                       write_sin_row_arg_valid,
     input  wire                                                                                                       read_cos_row_result_rden,
     input  wire                                                                                                       read_sin_row_result_rden,
     input  wire                                                                                                       rotate_pair_result_rden,
     input  wire                                                                                                       write_cos_row_result_rden,
     input  wire                                                                                                       write_sin_row_result_rden,
     output wire                                                                                                       read_cos_row_arg_ready,
     output wire                                                                                                       read_sin_row_arg_ready,
     output wire                                                                                                       rotate_pair_arg_ready,
     output wire                                                                                                       write_cos_row_arg_ready,
     output wire                                                                                                       write_sin_row_arg_ready,
     output wire [1023:0]                                                                                              read_cos_row_result,
     output wire                                                                                                       read_cos_row_result_empty,
     output wire [1023:0]                                                                                              read_sin_row_result,
     output wire                                                                                                       read_sin_row_result_empty,
     output wire [15:0]                                                                                                rotate_pair_result,
     output wire                                                                                                       rotate_pair_result_empty,
  // output wire /*Zero Width*/                                                                                        write_cos_row_result,
     output wire                                                                                                       write_cos_row_result_empty,
  // output wire /*Zero Width*/                                                                                        write_sin_row_result,
     output wire                                                                                                       write_sin_row_result_empty,
     output wire                                                                                                       rst_and_startup_done_out,
     output wire                                                                                                       stall_rate_supported_out
);

  wire [1023:0] _EsiWrapped_read_cos_row_result_out;
  wire [1023:0] _EsiWrapped_read_sin_row_result_out;
  wire [15:0]   _EsiWrapped_rotate_pair_result_out;
  rope_unit EsiWrapped (
    .clk                       (clk),
    .rst                       (rst),
    .read_cos_row_valid_in     (read_cos_row_arg_valid),
    .read_cos_row_position_in  (read_cos_row_arg.position),
    .read_cos_row_rden_in      (read_cos_row_result_rden),
    .read_sin_row_valid_in     (read_sin_row_arg_valid),
    .read_sin_row_position_in  (read_sin_row_arg.position),
    .read_sin_row_rden_in      (read_sin_row_result_rden),
    .write_cos_row_valid_in    (write_cos_row_arg_valid),
    .write_cos_row_position_in (write_cos_row_arg.position),
    .write_cos_row_value_in    (write_cos_row_arg.value),
    .write_cos_row_rden_in     (write_cos_row_result_rden),
    .write_sin_row_valid_in    (write_sin_row_arg_valid),
    .write_sin_row_position_in (write_sin_row_arg.position),
    .write_sin_row_value_in    (write_sin_row_arg.value),
    .write_sin_row_rden_in     (write_sin_row_result_rden),
    .rotate_pair_valid_in      (rotate_pair_arg_valid),
    .rotate_pair_x_even_in     (rotate_pair_arg.x_even),
    .rotate_pair_x_odd_in      (rotate_pair_arg.x_odd),
    .rotate_pair_cos_val_in    (rotate_pair_arg.cos_val),
    .rotate_pair_sin_val_in    (rotate_pair_arg.sin_val),
    .rotate_pair_rden_in       (rotate_pair_result_rden),
    .stall_rate_in             (stall_rate_in),
    .stall_rate_valid_in       (stall_rate_valid_in),
    .rst_and_startup_done_out  (rst_and_startup_done_out),
    .read_cos_row_rdy_out      (read_cos_row_arg_ready),
    .read_cos_row_empty_out    (read_cos_row_result_empty),
    .read_cos_row_result_out   (_EsiWrapped_read_cos_row_result_out),
    .read_sin_row_rdy_out      (read_sin_row_arg_ready),
    .read_sin_row_empty_out    (read_sin_row_result_empty),
    .read_sin_row_result_out   (_EsiWrapped_read_sin_row_result_out),
    .write_cos_row_rdy_out     (write_cos_row_arg_ready),
    .write_cos_row_empty_out   (write_cos_row_result_empty),
    .write_sin_row_rdy_out     (write_sin_row_arg_ready),
    .write_sin_row_empty_out   (write_sin_row_result_empty),
    .rotate_pair_rdy_out       (rotate_pair_arg_ready),
    .rotate_pair_empty_out     (rotate_pair_result_empty),
    .rotate_pair_result_out    (_EsiWrapped_rotate_pair_result_out),
    .stall_rate_supported_out  (stall_rate_supported_out)
  );
  assign read_cos_row_result = _EsiWrapped_read_cos_row_result_out;
  assign read_sin_row_result = _EsiWrapped_read_sin_row_result_out;
  assign rotate_pair_result = _EsiWrapped_rotate_pair_result_out;
  // Zero width: assign write_cos_row_result = /*Zero width*/;
  // Zero width: assign write_sin_row_result = /*Zero width*/;
endmodule

