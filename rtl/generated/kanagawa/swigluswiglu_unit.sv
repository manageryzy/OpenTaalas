
// This file was generated. Do not modify.
// kanagawa --backend=sv --import-dir=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library --base-library=/home/mana/workspace/OpenTaalas/third-party/kanagawa/library/mini-base.k --output=/home/mana/workspace/OpenTaalas/rtl/generated/kanagawa/swiglu /home/mana/workspace/OpenTaalas/rtl/kanagawa/swiglu.k

`default_nettype wire
module swiglu_unitDebugView_set_sigmoid_lutEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire[15:0]  _value,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("set_sigmoid_lutEntry time: %0t index: %p value: %p", $time, _index, _value);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_lookup_sigmoidEntry
(
    input wire clk,
    input wire[7:0]  _index,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookup_sigmoidEntry time: %0t index: %p", $time, _index);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_lookup_sigmoidExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("lookup_sigmoidExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_siluEntry
(
    input wire clk,
    input wire[15:0]  _gate_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_siluEntry time: %0t gate_bf16: %p", $time, _gate_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_siluExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_siluExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_swigluEntry
(
    input wire clk,
    input wire[15:0]  _gate_bf16,
    input wire[15:0]  _up_bf16,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_swigluEntry time: %0t gate_bf16: %p up_bf16: %p", $time, _gate_bf16, _up_bf16);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
module swiglu_unitDebugView_compute_swigluExit
(
    input wire clk,
    input wire[15:0]  _ReturnValue,
    input wire valid,
    output logic valid_out
);
    `ifdef KANAGAWA_PRINT_DEBUG_VIEW
        always_ff @(posedge clk) begin
            if (valid) $display("compute_swigluExit time: %0t ReturnValue: %p", $time, _ReturnValue);
        end
    `endif // KANAGAWA_PRINT_DEBUG_VIEW
    assign valid_out = valid;
endmodule
`ifndef _TYPESCOPE_CoreModuleTypeScope
`define _TYPESCOPE_CoreModuleTypeScope
`endif // _TYPESCOPE_CoreModuleTypeScope
module swiglu_unit_compute_swiglu_BasicBlock_0(	// swiglu.k:93:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] global_in__sigmoid_lut_element_0_9,
  input  wire [15:0] global_in__sigmoid_lut_element_1_10,
  input  wire [15:0] global_in__sigmoid_lut_element_2_11,
  input  wire [15:0] global_in__sigmoid_lut_element_3_12,
  input  wire [15:0] global_in__sigmoid_lut_element_4_13,
  input  wire [15:0] global_in__sigmoid_lut_element_5_14,
  input  wire [15:0] global_in__sigmoid_lut_element_6_15,
  input  wire [15:0] global_in__sigmoid_lut_element_7_16,
  input  wire [15:0] global_in__sigmoid_lut_element_8_17,
  input  wire [15:0] global_in__sigmoid_lut_element_9_18,
  input  wire [15:0] global_in__sigmoid_lut_element_10_19,
  input  wire [15:0] global_in__sigmoid_lut_element_11_20,
  input  wire [15:0] global_in__sigmoid_lut_element_12_21,
  input  wire [15:0] global_in__sigmoid_lut_element_13_22,
  input  wire [15:0] global_in__sigmoid_lut_element_14_23,
  input  wire [15:0] global_in__sigmoid_lut_element_15_24,
  input  wire [15:0] global_in__sigmoid_lut_element_16_25,
  input  wire [15:0] global_in__sigmoid_lut_element_17_26,
  input  wire [15:0] global_in__sigmoid_lut_element_18_27,
  input  wire [15:0] global_in__sigmoid_lut_element_19_28,
  input  wire [15:0] global_in__sigmoid_lut_element_20_29,
  input  wire [15:0] global_in__sigmoid_lut_element_21_30,
  input  wire [15:0] global_in__sigmoid_lut_element_22_31,
  input  wire [15:0] global_in__sigmoid_lut_element_23_32,
  input  wire [15:0] global_in__sigmoid_lut_element_24_33,
  input  wire [15:0] global_in__sigmoid_lut_element_25_34,
  input  wire [15:0] global_in__sigmoid_lut_element_26_35,
  input  wire [15:0] global_in__sigmoid_lut_element_27_36,
  input  wire [15:0] global_in__sigmoid_lut_element_28_37,
  input  wire [15:0] global_in__sigmoid_lut_element_29_38,
  input  wire [15:0] global_in__sigmoid_lut_element_30_39,
  input  wire [15:0] global_in__sigmoid_lut_element_31_40,
  input  wire [15:0] global_in__sigmoid_lut_element_32_41,
  input  wire [15:0] global_in__sigmoid_lut_element_33_42,
  input  wire [15:0] global_in__sigmoid_lut_element_34_43,
  input  wire [15:0] global_in__sigmoid_lut_element_35_44,
  input  wire [15:0] global_in__sigmoid_lut_element_36_45,
  input  wire [15:0] global_in__sigmoid_lut_element_37_46,
  input  wire [15:0] global_in__sigmoid_lut_element_38_47,
  input  wire [15:0] global_in__sigmoid_lut_element_39_48,
  input  wire [15:0] global_in__sigmoid_lut_element_40_49,
  input  wire [15:0] global_in__sigmoid_lut_element_41_50,
  input  wire [15:0] global_in__sigmoid_lut_element_42_51,
  input  wire [15:0] global_in__sigmoid_lut_element_43_52,
  input  wire [15:0] global_in__sigmoid_lut_element_44_53,
  input  wire [15:0] global_in__sigmoid_lut_element_45_54,
  input  wire [15:0] global_in__sigmoid_lut_element_46_55,
  input  wire [15:0] global_in__sigmoid_lut_element_47_56,
  input  wire [15:0] global_in__sigmoid_lut_element_48_57,
  input  wire [15:0] global_in__sigmoid_lut_element_49_58,
  input  wire [15:0] global_in__sigmoid_lut_element_50_59,
  input  wire [15:0] global_in__sigmoid_lut_element_51_60,
  input  wire [15:0] global_in__sigmoid_lut_element_52_61,
  input  wire [15:0] global_in__sigmoid_lut_element_53_62,
  input  wire [15:0] global_in__sigmoid_lut_element_54_63,
  input  wire [15:0] global_in__sigmoid_lut_element_55_64,
  input  wire [15:0] global_in__sigmoid_lut_element_56_65,
  input  wire [15:0] global_in__sigmoid_lut_element_57_66,
  input  wire [15:0] global_in__sigmoid_lut_element_58_67,
  input  wire [15:0] global_in__sigmoid_lut_element_59_68,
  input  wire [15:0] global_in__sigmoid_lut_element_60_69,
  input  wire [15:0] global_in__sigmoid_lut_element_61_70,
  input  wire [15:0] global_in__sigmoid_lut_element_62_71,
  input  wire [15:0] global_in__sigmoid_lut_element_63_72,
  input  wire [15:0] global_in__sigmoid_lut_element_64_73,
  input  wire [15:0] global_in__sigmoid_lut_element_65_74,
  input  wire [15:0] global_in__sigmoid_lut_element_66_75,
  input  wire [15:0] global_in__sigmoid_lut_element_67_76,
  input  wire [15:0] global_in__sigmoid_lut_element_68_77,
  input  wire [15:0] global_in__sigmoid_lut_element_69_78,
  input  wire [15:0] global_in__sigmoid_lut_element_70_79,
  input  wire [15:0] global_in__sigmoid_lut_element_71_80,
  input  wire [15:0] global_in__sigmoid_lut_element_72_81,
  input  wire [15:0] global_in__sigmoid_lut_element_73_82,
  input  wire [15:0] global_in__sigmoid_lut_element_74_83,
  input  wire [15:0] global_in__sigmoid_lut_element_75_84,
  input  wire [15:0] global_in__sigmoid_lut_element_76_85,
  input  wire [15:0] global_in__sigmoid_lut_element_77_86,
  input  wire [15:0] global_in__sigmoid_lut_element_78_87,
  input  wire [15:0] global_in__sigmoid_lut_element_79_88,
  input  wire [15:0] global_in__sigmoid_lut_element_80_89,
  input  wire [15:0] global_in__sigmoid_lut_element_81_90,
  input  wire [15:0] global_in__sigmoid_lut_element_82_91,
  input  wire [15:0] global_in__sigmoid_lut_element_83_92,
  input  wire [15:0] global_in__sigmoid_lut_element_84_93,
  input  wire [15:0] global_in__sigmoid_lut_element_85_94,
  input  wire [15:0] global_in__sigmoid_lut_element_86_95,
  input  wire [15:0] global_in__sigmoid_lut_element_87_96,
  input  wire [15:0] global_in__sigmoid_lut_element_88_97,
  input  wire [15:0] global_in__sigmoid_lut_element_89_98,
  input  wire [15:0] global_in__sigmoid_lut_element_90_99,
  input  wire [15:0] global_in__sigmoid_lut_element_91_100,
  input  wire [15:0] global_in__sigmoid_lut_element_92_101,
  input  wire [15:0] global_in__sigmoid_lut_element_93_102,
  input  wire [15:0] global_in__sigmoid_lut_element_94_103,
  input  wire [15:0] global_in__sigmoid_lut_element_95_104,
  input  wire [15:0] global_in__sigmoid_lut_element_96_105,
  input  wire [15:0] global_in__sigmoid_lut_element_97_106,
  input  wire [15:0] global_in__sigmoid_lut_element_98_107,
  input  wire [15:0] global_in__sigmoid_lut_element_99_108,
  input  wire [15:0] global_in__sigmoid_lut_element_100_109,
  input  wire [15:0] global_in__sigmoid_lut_element_101_110,
  input  wire [15:0] global_in__sigmoid_lut_element_102_111,
  input  wire [15:0] global_in__sigmoid_lut_element_103_112,
  input  wire [15:0] global_in__sigmoid_lut_element_104_113,
  input  wire [15:0] global_in__sigmoid_lut_element_105_114,
  input  wire [15:0] global_in__sigmoid_lut_element_106_115,
  input  wire [15:0] global_in__sigmoid_lut_element_107_116,
  input  wire [15:0] global_in__sigmoid_lut_element_108_117,
  input  wire [15:0] global_in__sigmoid_lut_element_109_118,
  input  wire [15:0] global_in__sigmoid_lut_element_110_119,
  input  wire [15:0] global_in__sigmoid_lut_element_111_120,
  input  wire [15:0] global_in__sigmoid_lut_element_112_121,
  input  wire [15:0] global_in__sigmoid_lut_element_113_122,
  input  wire [15:0] global_in__sigmoid_lut_element_114_123,
  input  wire [15:0] global_in__sigmoid_lut_element_115_124,
  input  wire [15:0] global_in__sigmoid_lut_element_116_125,
  input  wire [15:0] global_in__sigmoid_lut_element_117_126,
  input  wire [15:0] global_in__sigmoid_lut_element_118_127,
  input  wire [15:0] global_in__sigmoid_lut_element_119_128,
  input  wire [15:0] global_in__sigmoid_lut_element_120_129,
  input  wire [15:0] global_in__sigmoid_lut_element_121_130,
  input  wire [15:0] global_in__sigmoid_lut_element_122_131,
  input  wire [15:0] global_in__sigmoid_lut_element_123_132,
  input  wire [15:0] global_in__sigmoid_lut_element_124_133,
  input  wire [15:0] global_in__sigmoid_lut_element_125_134,
  input  wire [15:0] global_in__sigmoid_lut_element_126_135,
  input  wire [15:0] global_in__sigmoid_lut_element_127_136,
  input  wire [15:0] global_in__sigmoid_lut_element_128_137,
  input  wire [15:0] global_in__sigmoid_lut_element_129_138,
  input  wire [15:0] global_in__sigmoid_lut_element_130_139,
  input  wire [15:0] global_in__sigmoid_lut_element_131_140,
  input  wire [15:0] global_in__sigmoid_lut_element_132_141,
  input  wire [15:0] global_in__sigmoid_lut_element_133_142,
  input  wire [15:0] global_in__sigmoid_lut_element_134_143,
  input  wire [15:0] global_in__sigmoid_lut_element_135_144,
  input  wire [15:0] global_in__sigmoid_lut_element_136_145,
  input  wire [15:0] global_in__sigmoid_lut_element_137_146,
  input  wire [15:0] global_in__sigmoid_lut_element_138_147,
  input  wire [15:0] global_in__sigmoid_lut_element_139_148,
  input  wire [15:0] global_in__sigmoid_lut_element_140_149,
  input  wire [15:0] global_in__sigmoid_lut_element_141_150,
  input  wire [15:0] global_in__sigmoid_lut_element_142_151,
  input  wire [15:0] global_in__sigmoid_lut_element_143_152,
  input  wire [15:0] global_in__sigmoid_lut_element_144_153,
  input  wire [15:0] global_in__sigmoid_lut_element_145_154,
  input  wire [15:0] global_in__sigmoid_lut_element_146_155,
  input  wire [15:0] global_in__sigmoid_lut_element_147_156,
  input  wire [15:0] global_in__sigmoid_lut_element_148_157,
  input  wire [15:0] global_in__sigmoid_lut_element_149_158,
  input  wire [15:0] global_in__sigmoid_lut_element_150_159,
  input  wire [15:0] global_in__sigmoid_lut_element_151_160,
  input  wire [15:0] global_in__sigmoid_lut_element_152_161,
  input  wire [15:0] global_in__sigmoid_lut_element_153_162,
  input  wire [15:0] global_in__sigmoid_lut_element_154_163,
  input  wire [15:0] global_in__sigmoid_lut_element_155_164,
  input  wire [15:0] global_in__sigmoid_lut_element_156_165,
  input  wire [15:0] global_in__sigmoid_lut_element_157_166,
  input  wire [15:0] global_in__sigmoid_lut_element_158_167,
  input  wire [15:0] global_in__sigmoid_lut_element_159_168,
  input  wire [15:0] global_in__sigmoid_lut_element_160_169,
  input  wire [15:0] global_in__sigmoid_lut_element_161_170,
  input  wire [15:0] global_in__sigmoid_lut_element_162_171,
  input  wire [15:0] global_in__sigmoid_lut_element_163_172,
  input  wire [15:0] global_in__sigmoid_lut_element_164_173,
  input  wire [15:0] global_in__sigmoid_lut_element_165_174,
  input  wire [15:0] global_in__sigmoid_lut_element_166_175,
  input  wire [15:0] global_in__sigmoid_lut_element_167_176,
  input  wire [15:0] global_in__sigmoid_lut_element_168_177,
  input  wire [15:0] global_in__sigmoid_lut_element_169_178,
  input  wire [15:0] global_in__sigmoid_lut_element_170_179,
  input  wire [15:0] global_in__sigmoid_lut_element_171_180,
  input  wire [15:0] global_in__sigmoid_lut_element_172_181,
  input  wire [15:0] global_in__sigmoid_lut_element_173_182,
  input  wire [15:0] global_in__sigmoid_lut_element_174_183,
  input  wire [15:0] global_in__sigmoid_lut_element_175_184,
  input  wire [15:0] global_in__sigmoid_lut_element_176_185,
  input  wire [15:0] global_in__sigmoid_lut_element_177_186,
  input  wire [15:0] global_in__sigmoid_lut_element_178_187,
  input  wire [15:0] global_in__sigmoid_lut_element_179_188,
  input  wire [15:0] global_in__sigmoid_lut_element_180_189,
  input  wire [15:0] global_in__sigmoid_lut_element_181_190,
  input  wire [15:0] global_in__sigmoid_lut_element_182_191,
  input  wire [15:0] global_in__sigmoid_lut_element_183_192,
  input  wire [15:0] global_in__sigmoid_lut_element_184_193,
  input  wire [15:0] global_in__sigmoid_lut_element_185_194,
  input  wire [15:0] global_in__sigmoid_lut_element_186_195,
  input  wire [15:0] global_in__sigmoid_lut_element_187_196,
  input  wire [15:0] global_in__sigmoid_lut_element_188_197,
  input  wire [15:0] global_in__sigmoid_lut_element_189_198,
  input  wire [15:0] global_in__sigmoid_lut_element_190_199,
  input  wire [15:0] global_in__sigmoid_lut_element_191_200,
  input  wire [15:0] global_in__sigmoid_lut_element_192_201,
  input  wire [15:0] global_in__sigmoid_lut_element_193_202,
  input  wire [15:0] global_in__sigmoid_lut_element_194_203,
  input  wire [15:0] global_in__sigmoid_lut_element_195_204,
  input  wire [15:0] global_in__sigmoid_lut_element_196_205,
  input  wire [15:0] global_in__sigmoid_lut_element_197_206,
  input  wire [15:0] global_in__sigmoid_lut_element_198_207,
  input  wire [15:0] global_in__sigmoid_lut_element_199_208,
  input  wire [15:0] global_in__sigmoid_lut_element_200_209,
  input  wire [15:0] global_in__sigmoid_lut_element_201_210,
  input  wire [15:0] global_in__sigmoid_lut_element_202_211,
  input  wire [15:0] global_in__sigmoid_lut_element_203_212,
  input  wire [15:0] global_in__sigmoid_lut_element_204_213,
  input  wire [15:0] global_in__sigmoid_lut_element_205_214,
  input  wire [15:0] global_in__sigmoid_lut_element_206_215,
  input  wire [15:0] global_in__sigmoid_lut_element_207_216,
  input  wire [15:0] global_in__sigmoid_lut_element_208_217,
  input  wire [15:0] global_in__sigmoid_lut_element_209_218,
  input  wire [15:0] global_in__sigmoid_lut_element_210_219,
  input  wire [15:0] global_in__sigmoid_lut_element_211_220,
  input  wire [15:0] global_in__sigmoid_lut_element_212_221,
  input  wire [15:0] global_in__sigmoid_lut_element_213_222,
  input  wire [15:0] global_in__sigmoid_lut_element_214_223,
  input  wire [15:0] global_in__sigmoid_lut_element_215_224,
  input  wire [15:0] global_in__sigmoid_lut_element_216_225,
  input  wire [15:0] global_in__sigmoid_lut_element_217_226,
  input  wire [15:0] global_in__sigmoid_lut_element_218_227,
  input  wire [15:0] global_in__sigmoid_lut_element_219_228,
  input  wire [15:0] global_in__sigmoid_lut_element_220_229,
  input  wire [15:0] global_in__sigmoid_lut_element_221_230,
  input  wire [15:0] global_in__sigmoid_lut_element_222_231,
  input  wire [15:0] global_in__sigmoid_lut_element_223_232,
  input  wire [15:0] global_in__sigmoid_lut_element_224_233,
  input  wire [15:0] global_in__sigmoid_lut_element_225_234,
  input  wire [15:0] global_in__sigmoid_lut_element_226_235,
  input  wire [15:0] global_in__sigmoid_lut_element_227_236,
  input  wire [15:0] global_in__sigmoid_lut_element_228_237,
  input  wire [15:0] global_in__sigmoid_lut_element_229_238,
  input  wire [15:0] global_in__sigmoid_lut_element_230_239,
  input  wire [15:0] global_in__sigmoid_lut_element_231_240,
  input  wire [15:0] global_in__sigmoid_lut_element_232_241,
  input  wire [15:0] global_in__sigmoid_lut_element_233_242,
  input  wire [15:0] global_in__sigmoid_lut_element_234_243,
  input  wire [15:0] global_in__sigmoid_lut_element_235_244,
  input  wire [15:0] global_in__sigmoid_lut_element_236_245,
  input  wire [15:0] global_in__sigmoid_lut_element_237_246,
  input  wire [15:0] global_in__sigmoid_lut_element_238_247,
  input  wire [15:0] global_in__sigmoid_lut_element_239_248,
  input  wire [15:0] global_in__sigmoid_lut_element_240_249,
  input  wire [15:0] global_in__sigmoid_lut_element_241_250,
  input  wire [15:0] global_in__sigmoid_lut_element_242_251,
  input  wire [15:0] global_in__sigmoid_lut_element_243_252,
  input  wire [15:0] global_in__sigmoid_lut_element_244_253,
  input  wire [15:0] global_in__sigmoid_lut_element_245_254,
  input  wire [15:0] global_in__sigmoid_lut_element_246_255,
  input  wire [15:0] global_in__sigmoid_lut_element_247_256,
  input  wire [15:0] global_in__sigmoid_lut_element_248_257,
  input  wire [15:0] global_in__sigmoid_lut_element_249_258,
  input  wire [15:0] global_in__sigmoid_lut_element_250_259,
  input  wire [15:0] global_in__sigmoid_lut_element_251_260,
  input  wire [15:0] global_in__sigmoid_lut_element_252_261,
  input  wire [15:0] global_in__sigmoid_lut_element_253_262,
  input  wire [15:0] global_in__sigmoid_lut_element_254_263,
  input  wire [15:0] global_in__sigmoid_lut_element_255_264,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [31:0] data_in_7,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] global_in__sigmoid_lut_element_0_9_0 = global_in__sigmoid_lut_element_0_9;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_1_10_0 =
    global_in__sigmoid_lut_element_1_10;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_2_11_0 =
    global_in__sigmoid_lut_element_2_11;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_3_12_0 =
    global_in__sigmoid_lut_element_3_12;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_4_13_0 =
    global_in__sigmoid_lut_element_4_13;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_5_14_0 =
    global_in__sigmoid_lut_element_5_14;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_6_15_0 =
    global_in__sigmoid_lut_element_6_15;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_7_16_0 =
    global_in__sigmoid_lut_element_7_16;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_8_17_0 =
    global_in__sigmoid_lut_element_8_17;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_9_18_0 =
    global_in__sigmoid_lut_element_9_18;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_10_19_0 =
    global_in__sigmoid_lut_element_10_19;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_11_20_0 =
    global_in__sigmoid_lut_element_11_20;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_12_21_0 =
    global_in__sigmoid_lut_element_12_21;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_13_22_0 =
    global_in__sigmoid_lut_element_13_22;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_14_23_0 =
    global_in__sigmoid_lut_element_14_23;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_15_24_0 =
    global_in__sigmoid_lut_element_15_24;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_16_25_0 =
    global_in__sigmoid_lut_element_16_25;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_17_26_0 =
    global_in__sigmoid_lut_element_17_26;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_18_27_0 =
    global_in__sigmoid_lut_element_18_27;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_19_28_0 =
    global_in__sigmoid_lut_element_19_28;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_20_29_0 =
    global_in__sigmoid_lut_element_20_29;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_21_30_0 =
    global_in__sigmoid_lut_element_21_30;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_22_31_0 =
    global_in__sigmoid_lut_element_22_31;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_23_32_0 =
    global_in__sigmoid_lut_element_23_32;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_24_33_0 =
    global_in__sigmoid_lut_element_24_33;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_25_34_0 =
    global_in__sigmoid_lut_element_25_34;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_26_35_0 =
    global_in__sigmoid_lut_element_26_35;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_27_36_0 =
    global_in__sigmoid_lut_element_27_36;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_28_37_0 =
    global_in__sigmoid_lut_element_28_37;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_29_38_0 =
    global_in__sigmoid_lut_element_29_38;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_30_39_0 =
    global_in__sigmoid_lut_element_30_39;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_31_40_0 =
    global_in__sigmoid_lut_element_31_40;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_32_41_0 =
    global_in__sigmoid_lut_element_32_41;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_33_42_0 =
    global_in__sigmoid_lut_element_33_42;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_34_43_0 =
    global_in__sigmoid_lut_element_34_43;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_35_44_0 =
    global_in__sigmoid_lut_element_35_44;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_36_45_0 =
    global_in__sigmoid_lut_element_36_45;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_37_46_0 =
    global_in__sigmoid_lut_element_37_46;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_38_47_0 =
    global_in__sigmoid_lut_element_38_47;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_39_48_0 =
    global_in__sigmoid_lut_element_39_48;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_40_49_0 =
    global_in__sigmoid_lut_element_40_49;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_41_50_0 =
    global_in__sigmoid_lut_element_41_50;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_42_51_0 =
    global_in__sigmoid_lut_element_42_51;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_43_52_0 =
    global_in__sigmoid_lut_element_43_52;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_44_53_0 =
    global_in__sigmoid_lut_element_44_53;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_45_54_0 =
    global_in__sigmoid_lut_element_45_54;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_46_55_0 =
    global_in__sigmoid_lut_element_46_55;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_47_56_0 =
    global_in__sigmoid_lut_element_47_56;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_48_57_0 =
    global_in__sigmoid_lut_element_48_57;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_49_58_0 =
    global_in__sigmoid_lut_element_49_58;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_50_59_0 =
    global_in__sigmoid_lut_element_50_59;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_51_60_0 =
    global_in__sigmoid_lut_element_51_60;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_52_61_0 =
    global_in__sigmoid_lut_element_52_61;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_53_62_0 =
    global_in__sigmoid_lut_element_53_62;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_54_63_0 =
    global_in__sigmoid_lut_element_54_63;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_55_64_0 =
    global_in__sigmoid_lut_element_55_64;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_56_65_0 =
    global_in__sigmoid_lut_element_56_65;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_57_66_0 =
    global_in__sigmoid_lut_element_57_66;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_58_67_0 =
    global_in__sigmoid_lut_element_58_67;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_59_68_0 =
    global_in__sigmoid_lut_element_59_68;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_60_69_0 =
    global_in__sigmoid_lut_element_60_69;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_61_70_0 =
    global_in__sigmoid_lut_element_61_70;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_62_71_0 =
    global_in__sigmoid_lut_element_62_71;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_63_72_0 =
    global_in__sigmoid_lut_element_63_72;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_64_73_0 =
    global_in__sigmoid_lut_element_64_73;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_65_74_0 =
    global_in__sigmoid_lut_element_65_74;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_66_75_0 =
    global_in__sigmoid_lut_element_66_75;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_67_76_0 =
    global_in__sigmoid_lut_element_67_76;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_68_77_0 =
    global_in__sigmoid_lut_element_68_77;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_69_78_0 =
    global_in__sigmoid_lut_element_69_78;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_70_79_0 =
    global_in__sigmoid_lut_element_70_79;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_71_80_0 =
    global_in__sigmoid_lut_element_71_80;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_72_81_0 =
    global_in__sigmoid_lut_element_72_81;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_73_82_0 =
    global_in__sigmoid_lut_element_73_82;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_74_83_0 =
    global_in__sigmoid_lut_element_74_83;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_75_84_0 =
    global_in__sigmoid_lut_element_75_84;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_76_85_0 =
    global_in__sigmoid_lut_element_76_85;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_77_86_0 =
    global_in__sigmoid_lut_element_77_86;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_78_87_0 =
    global_in__sigmoid_lut_element_78_87;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_79_88_0 =
    global_in__sigmoid_lut_element_79_88;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_80_89_0 =
    global_in__sigmoid_lut_element_80_89;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_81_90_0 =
    global_in__sigmoid_lut_element_81_90;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_82_91_0 =
    global_in__sigmoid_lut_element_82_91;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_83_92_0 =
    global_in__sigmoid_lut_element_83_92;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_84_93_0 =
    global_in__sigmoid_lut_element_84_93;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_85_94_0 =
    global_in__sigmoid_lut_element_85_94;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_86_95_0 =
    global_in__sigmoid_lut_element_86_95;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_87_96_0 =
    global_in__sigmoid_lut_element_87_96;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_88_97_0 =
    global_in__sigmoid_lut_element_88_97;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_89_98_0 =
    global_in__sigmoid_lut_element_89_98;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_90_99_0 =
    global_in__sigmoid_lut_element_90_99;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_91_100_0 =
    global_in__sigmoid_lut_element_91_100;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_92_101_0 =
    global_in__sigmoid_lut_element_92_101;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_93_102_0 =
    global_in__sigmoid_lut_element_93_102;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_94_103_0 =
    global_in__sigmoid_lut_element_94_103;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_95_104_0 =
    global_in__sigmoid_lut_element_95_104;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_96_105_0 =
    global_in__sigmoid_lut_element_96_105;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_97_106_0 =
    global_in__sigmoid_lut_element_97_106;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_98_107_0 =
    global_in__sigmoid_lut_element_98_107;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_99_108_0 =
    global_in__sigmoid_lut_element_99_108;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_100_109_0 =
    global_in__sigmoid_lut_element_100_109;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_101_110_0 =
    global_in__sigmoid_lut_element_101_110;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_102_111_0 =
    global_in__sigmoid_lut_element_102_111;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_103_112_0 =
    global_in__sigmoid_lut_element_103_112;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_104_113_0 =
    global_in__sigmoid_lut_element_104_113;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_105_114_0 =
    global_in__sigmoid_lut_element_105_114;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_106_115_0 =
    global_in__sigmoid_lut_element_106_115;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_107_116_0 =
    global_in__sigmoid_lut_element_107_116;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_108_117_0 =
    global_in__sigmoid_lut_element_108_117;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_109_118_0 =
    global_in__sigmoid_lut_element_109_118;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_110_119_0 =
    global_in__sigmoid_lut_element_110_119;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_111_120_0 =
    global_in__sigmoid_lut_element_111_120;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_112_121_0 =
    global_in__sigmoid_lut_element_112_121;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_113_122_0 =
    global_in__sigmoid_lut_element_113_122;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_114_123_0 =
    global_in__sigmoid_lut_element_114_123;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_115_124_0 =
    global_in__sigmoid_lut_element_115_124;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_116_125_0 =
    global_in__sigmoid_lut_element_116_125;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_117_126_0 =
    global_in__sigmoid_lut_element_117_126;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_118_127_0 =
    global_in__sigmoid_lut_element_118_127;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_119_128_0 =
    global_in__sigmoid_lut_element_119_128;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_120_129_0 =
    global_in__sigmoid_lut_element_120_129;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_121_130_0 =
    global_in__sigmoid_lut_element_121_130;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_122_131_0 =
    global_in__sigmoid_lut_element_122_131;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_123_132_0 =
    global_in__sigmoid_lut_element_123_132;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_124_133_0 =
    global_in__sigmoid_lut_element_124_133;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_125_134_0 =
    global_in__sigmoid_lut_element_125_134;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_126_135_0 =
    global_in__sigmoid_lut_element_126_135;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_127_136_0 =
    global_in__sigmoid_lut_element_127_136;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_128_137_0 =
    global_in__sigmoid_lut_element_128_137;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_129_138_0 =
    global_in__sigmoid_lut_element_129_138;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_130_139_0 =
    global_in__sigmoid_lut_element_130_139;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_131_140_0 =
    global_in__sigmoid_lut_element_131_140;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_132_141_0 =
    global_in__sigmoid_lut_element_132_141;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_133_142_0 =
    global_in__sigmoid_lut_element_133_142;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_134_143_0 =
    global_in__sigmoid_lut_element_134_143;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_135_144_0 =
    global_in__sigmoid_lut_element_135_144;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_136_145_0 =
    global_in__sigmoid_lut_element_136_145;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_137_146_0 =
    global_in__sigmoid_lut_element_137_146;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_138_147_0 =
    global_in__sigmoid_lut_element_138_147;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_139_148_0 =
    global_in__sigmoid_lut_element_139_148;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_140_149_0 =
    global_in__sigmoid_lut_element_140_149;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_141_150_0 =
    global_in__sigmoid_lut_element_141_150;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_142_151_0 =
    global_in__sigmoid_lut_element_142_151;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_143_152_0 =
    global_in__sigmoid_lut_element_143_152;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_144_153_0 =
    global_in__sigmoid_lut_element_144_153;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_145_154_0 =
    global_in__sigmoid_lut_element_145_154;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_146_155_0 =
    global_in__sigmoid_lut_element_146_155;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_147_156_0 =
    global_in__sigmoid_lut_element_147_156;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_148_157_0 =
    global_in__sigmoid_lut_element_148_157;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_149_158_0 =
    global_in__sigmoid_lut_element_149_158;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_150_159_0 =
    global_in__sigmoid_lut_element_150_159;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_151_160_0 =
    global_in__sigmoid_lut_element_151_160;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_152_161_0 =
    global_in__sigmoid_lut_element_152_161;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_153_162_0 =
    global_in__sigmoid_lut_element_153_162;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_154_163_0 =
    global_in__sigmoid_lut_element_154_163;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_155_164_0 =
    global_in__sigmoid_lut_element_155_164;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_156_165_0 =
    global_in__sigmoid_lut_element_156_165;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_157_166_0 =
    global_in__sigmoid_lut_element_157_166;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_158_167_0 =
    global_in__sigmoid_lut_element_158_167;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_159_168_0 =
    global_in__sigmoid_lut_element_159_168;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_160_169_0 =
    global_in__sigmoid_lut_element_160_169;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_161_170_0 =
    global_in__sigmoid_lut_element_161_170;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_162_171_0 =
    global_in__sigmoid_lut_element_162_171;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_163_172_0 =
    global_in__sigmoid_lut_element_163_172;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_164_173_0 =
    global_in__sigmoid_lut_element_164_173;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_165_174_0 =
    global_in__sigmoid_lut_element_165_174;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_166_175_0 =
    global_in__sigmoid_lut_element_166_175;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_167_176_0 =
    global_in__sigmoid_lut_element_167_176;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_168_177_0 =
    global_in__sigmoid_lut_element_168_177;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_169_178_0 =
    global_in__sigmoid_lut_element_169_178;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_170_179_0 =
    global_in__sigmoid_lut_element_170_179;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_171_180_0 =
    global_in__sigmoid_lut_element_171_180;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_172_181_0 =
    global_in__sigmoid_lut_element_172_181;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_173_182_0 =
    global_in__sigmoid_lut_element_173_182;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_174_183_0 =
    global_in__sigmoid_lut_element_174_183;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_175_184_0 =
    global_in__sigmoid_lut_element_175_184;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_176_185_0 =
    global_in__sigmoid_lut_element_176_185;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_177_186_0 =
    global_in__sigmoid_lut_element_177_186;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_178_187_0 =
    global_in__sigmoid_lut_element_178_187;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_179_188_0 =
    global_in__sigmoid_lut_element_179_188;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_180_189_0 =
    global_in__sigmoid_lut_element_180_189;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_181_190_0 =
    global_in__sigmoid_lut_element_181_190;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_182_191_0 =
    global_in__sigmoid_lut_element_182_191;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_183_192_0 =
    global_in__sigmoid_lut_element_183_192;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_184_193_0 =
    global_in__sigmoid_lut_element_184_193;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_185_194_0 =
    global_in__sigmoid_lut_element_185_194;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_186_195_0 =
    global_in__sigmoid_lut_element_186_195;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_187_196_0 =
    global_in__sigmoid_lut_element_187_196;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_188_197_0 =
    global_in__sigmoid_lut_element_188_197;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_189_198_0 =
    global_in__sigmoid_lut_element_189_198;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_190_199_0 =
    global_in__sigmoid_lut_element_190_199;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_191_200_0 =
    global_in__sigmoid_lut_element_191_200;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_192_201_0 =
    global_in__sigmoid_lut_element_192_201;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_193_202_0 =
    global_in__sigmoid_lut_element_193_202;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_194_203_0 =
    global_in__sigmoid_lut_element_194_203;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_195_204_0 =
    global_in__sigmoid_lut_element_195_204;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_196_205_0 =
    global_in__sigmoid_lut_element_196_205;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_197_206_0 =
    global_in__sigmoid_lut_element_197_206;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_198_207_0 =
    global_in__sigmoid_lut_element_198_207;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_199_208_0 =
    global_in__sigmoid_lut_element_199_208;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_200_209_0 =
    global_in__sigmoid_lut_element_200_209;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_201_210_0 =
    global_in__sigmoid_lut_element_201_210;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_202_211_0 =
    global_in__sigmoid_lut_element_202_211;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_203_212_0 =
    global_in__sigmoid_lut_element_203_212;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_204_213_0 =
    global_in__sigmoid_lut_element_204_213;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_205_214_0 =
    global_in__sigmoid_lut_element_205_214;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_206_215_0 =
    global_in__sigmoid_lut_element_206_215;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_207_216_0 =
    global_in__sigmoid_lut_element_207_216;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_208_217_0 =
    global_in__sigmoid_lut_element_208_217;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_209_218_0 =
    global_in__sigmoid_lut_element_209_218;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_210_219_0 =
    global_in__sigmoid_lut_element_210_219;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_211_220_0 =
    global_in__sigmoid_lut_element_211_220;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_212_221_0 =
    global_in__sigmoid_lut_element_212_221;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_213_222_0 =
    global_in__sigmoid_lut_element_213_222;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_214_223_0 =
    global_in__sigmoid_lut_element_214_223;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_215_224_0 =
    global_in__sigmoid_lut_element_215_224;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_216_225_0 =
    global_in__sigmoid_lut_element_216_225;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_217_226_0 =
    global_in__sigmoid_lut_element_217_226;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_218_227_0 =
    global_in__sigmoid_lut_element_218_227;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_219_228_0 =
    global_in__sigmoid_lut_element_219_228;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_220_229_0 =
    global_in__sigmoid_lut_element_220_229;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_221_230_0 =
    global_in__sigmoid_lut_element_221_230;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_222_231_0 =
    global_in__sigmoid_lut_element_222_231;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_223_232_0 =
    global_in__sigmoid_lut_element_223_232;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_224_233_0 =
    global_in__sigmoid_lut_element_224_233;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_225_234_0 =
    global_in__sigmoid_lut_element_225_234;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_226_235_0 =
    global_in__sigmoid_lut_element_226_235;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_227_236_0 =
    global_in__sigmoid_lut_element_227_236;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_228_237_0 =
    global_in__sigmoid_lut_element_228_237;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_229_238_0 =
    global_in__sigmoid_lut_element_229_238;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_230_239_0 =
    global_in__sigmoid_lut_element_230_239;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_231_240_0 =
    global_in__sigmoid_lut_element_231_240;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_232_241_0 =
    global_in__sigmoid_lut_element_232_241;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_233_242_0 =
    global_in__sigmoid_lut_element_233_242;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_234_243_0 =
    global_in__sigmoid_lut_element_234_243;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_235_244_0 =
    global_in__sigmoid_lut_element_235_244;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_236_245_0 =
    global_in__sigmoid_lut_element_236_245;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_237_246_0 =
    global_in__sigmoid_lut_element_237_246;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_238_247_0 =
    global_in__sigmoid_lut_element_238_247;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_239_248_0 =
    global_in__sigmoid_lut_element_239_248;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_240_249_0 =
    global_in__sigmoid_lut_element_240_249;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_241_250_0 =
    global_in__sigmoid_lut_element_241_250;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_242_251_0 =
    global_in__sigmoid_lut_element_242_251;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_243_252_0 =
    global_in__sigmoid_lut_element_243_252;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_244_253_0 =
    global_in__sigmoid_lut_element_244_253;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_245_254_0 =
    global_in__sigmoid_lut_element_245_254;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_246_255_0 =
    global_in__sigmoid_lut_element_246_255;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_247_256_0 =
    global_in__sigmoid_lut_element_247_256;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_248_257_0 =
    global_in__sigmoid_lut_element_248_257;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_249_258_0 =
    global_in__sigmoid_lut_element_249_258;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_250_259_0 =
    global_in__sigmoid_lut_element_250_259;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_251_260_0 =
    global_in__sigmoid_lut_element_251_260;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_252_261_0 =
    global_in__sigmoid_lut_element_252_261;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_253_262_0 =
    global_in__sigmoid_lut_element_253_262;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_254_263_0 =
    global_in__sigmoid_lut_element_254_263;	// swiglu.k:93:9
  wire  [15:0] global_in__sigmoid_lut_element_255_264_0 =
    global_in__sigmoid_lut_element_255_264;	// swiglu.k:93:9
  logic        done_out_0;	// swiglu.k:93:9
  logic [15:0] fifo_data_out_0_0;	// swiglu.k:93:9
  logic        fifo_wren_0_0;	// swiglu.k:93:9
  logic        input_rdy_0_0;	// swiglu.k:93:9
  logic [7:0]  control_state_out_0;	// swiglu.k:93:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:93:9
  always_comb begin	// swiglu.k:93:9
    input_rdy_0_0 = _GEN;	// swiglu.k:93:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:93:9
  end // always_comb
  reg   [15:0] p0_gate_bf16;	// swiglu.k:93:9
  reg   [15:0] p0_up_bf16;	// swiglu.k:93:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:93:9
  reg   [15:0] p0_result;	// swiglu.k:93:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:93:9
  reg   [15:0] p0_result_0;	// swiglu.k:93:9
  reg          p0_stage3_enable = 1'h0;	// swiglu.k:93:9
  wire  [15:0] _sigmoid_lut =
    p0_gate_bf16[15]
      ? (p0_gate_bf16[14]
           ? (p0_gate_bf16[13]
                ? (p0_gate_bf16[12]
                     ? (p0_gate_bf16[11]
                          ? (p0_gate_bf16[10]
                               ? (p0_gate_bf16[9]
                                    ? (p0_gate_bf16[8]
                                         ? global_in__sigmoid_lut_element_255_264_0
                                         : global_in__sigmoid_lut_element_254_263_0)
                                    : p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_253_262_0
                                        : global_in__sigmoid_lut_element_252_261_0)
                               : p0_gate_bf16[9]
                                   ? (p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_251_260_0
                                        : global_in__sigmoid_lut_element_250_259_0)
                                   : p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_249_258_0
                                       : global_in__sigmoid_lut_element_248_257_0)
                          : p0_gate_bf16[10]
                              ? (p0_gate_bf16[9]
                                   ? (p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_247_256_0
                                        : global_in__sigmoid_lut_element_246_255_0)
                                   : p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_245_254_0
                                       : global_in__sigmoid_lut_element_244_253_0)
                              : p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_243_252_0
                                       : global_in__sigmoid_lut_element_242_251_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_241_250_0
                                      : global_in__sigmoid_lut_element_240_249_0)
                     : p0_gate_bf16[11]
                         ? (p0_gate_bf16[10]
                              ? (p0_gate_bf16[9]
                                   ? (p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_239_248_0
                                        : global_in__sigmoid_lut_element_238_247_0)
                                   : p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_237_246_0
                                       : global_in__sigmoid_lut_element_236_245_0)
                              : p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_235_244_0
                                       : global_in__sigmoid_lut_element_234_243_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_233_242_0
                                      : global_in__sigmoid_lut_element_232_241_0)
                         : p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_231_240_0
                                       : global_in__sigmoid_lut_element_230_239_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_229_238_0
                                      : global_in__sigmoid_lut_element_228_237_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_227_236_0
                                      : global_in__sigmoid_lut_element_226_235_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_225_234_0
                                     : global_in__sigmoid_lut_element_224_233_0)
                : p0_gate_bf16[12]
                    ? (p0_gate_bf16[11]
                         ? (p0_gate_bf16[10]
                              ? (p0_gate_bf16[9]
                                   ? (p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_223_232_0
                                        : global_in__sigmoid_lut_element_222_231_0)
                                   : p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_221_230_0
                                       : global_in__sigmoid_lut_element_220_229_0)
                              : p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_219_228_0
                                       : global_in__sigmoid_lut_element_218_227_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_217_226_0
                                      : global_in__sigmoid_lut_element_216_225_0)
                         : p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_215_224_0
                                       : global_in__sigmoid_lut_element_214_223_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_213_222_0
                                      : global_in__sigmoid_lut_element_212_221_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_211_220_0
                                      : global_in__sigmoid_lut_element_210_219_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_209_218_0
                                     : global_in__sigmoid_lut_element_208_217_0)
                    : p0_gate_bf16[11]
                        ? (p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_207_216_0
                                       : global_in__sigmoid_lut_element_206_215_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_205_214_0
                                      : global_in__sigmoid_lut_element_204_213_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_203_212_0
                                      : global_in__sigmoid_lut_element_202_211_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_201_210_0
                                     : global_in__sigmoid_lut_element_200_209_0)
                        : p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_199_208_0
                                      : global_in__sigmoid_lut_element_198_207_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_197_206_0
                                     : global_in__sigmoid_lut_element_196_205_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_195_204_0
                                     : global_in__sigmoid_lut_element_194_203_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_193_202_0
                                    : global_in__sigmoid_lut_element_192_201_0)
           : p0_gate_bf16[13]
               ? (p0_gate_bf16[12]
                    ? (p0_gate_bf16[11]
                         ? (p0_gate_bf16[10]
                              ? (p0_gate_bf16[9]
                                   ? (p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_191_200_0
                                        : global_in__sigmoid_lut_element_190_199_0)
                                   : p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_189_198_0
                                       : global_in__sigmoid_lut_element_188_197_0)
                              : p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_187_196_0
                                       : global_in__sigmoid_lut_element_186_195_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_185_194_0
                                      : global_in__sigmoid_lut_element_184_193_0)
                         : p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_183_192_0
                                       : global_in__sigmoid_lut_element_182_191_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_181_190_0
                                      : global_in__sigmoid_lut_element_180_189_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_179_188_0
                                      : global_in__sigmoid_lut_element_178_187_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_177_186_0
                                     : global_in__sigmoid_lut_element_176_185_0)
                    : p0_gate_bf16[11]
                        ? (p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_175_184_0
                                       : global_in__sigmoid_lut_element_174_183_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_173_182_0
                                      : global_in__sigmoid_lut_element_172_181_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_171_180_0
                                      : global_in__sigmoid_lut_element_170_179_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_169_178_0
                                     : global_in__sigmoid_lut_element_168_177_0)
                        : p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_167_176_0
                                      : global_in__sigmoid_lut_element_166_175_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_165_174_0
                                     : global_in__sigmoid_lut_element_164_173_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_163_172_0
                                     : global_in__sigmoid_lut_element_162_171_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_161_170_0
                                    : global_in__sigmoid_lut_element_160_169_0)
               : p0_gate_bf16[12]
                   ? (p0_gate_bf16[11]
                        ? (p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_159_168_0
                                       : global_in__sigmoid_lut_element_158_167_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_157_166_0
                                      : global_in__sigmoid_lut_element_156_165_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_155_164_0
                                      : global_in__sigmoid_lut_element_154_163_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_153_162_0
                                     : global_in__sigmoid_lut_element_152_161_0)
                        : p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_151_160_0
                                      : global_in__sigmoid_lut_element_150_159_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_149_158_0
                                     : global_in__sigmoid_lut_element_148_157_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_147_156_0
                                     : global_in__sigmoid_lut_element_146_155_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_145_154_0
                                    : global_in__sigmoid_lut_element_144_153_0)
                   : p0_gate_bf16[11]
                       ? (p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_143_152_0
                                      : global_in__sigmoid_lut_element_142_151_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_141_150_0
                                     : global_in__sigmoid_lut_element_140_149_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_139_148_0
                                     : global_in__sigmoid_lut_element_138_147_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_137_146_0
                                    : global_in__sigmoid_lut_element_136_145_0)
                       : p0_gate_bf16[10]
                           ? (p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_135_144_0
                                     : global_in__sigmoid_lut_element_134_143_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_133_142_0
                                    : global_in__sigmoid_lut_element_132_141_0)
                           : p0_gate_bf16[9]
                               ? (p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_131_140_0
                                    : global_in__sigmoid_lut_element_130_139_0)
                               : p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_129_138_0
                                   : global_in__sigmoid_lut_element_128_137_0)
      : p0_gate_bf16[14]
          ? (p0_gate_bf16[13]
               ? (p0_gate_bf16[12]
                    ? (p0_gate_bf16[11]
                         ? (p0_gate_bf16[10]
                              ? (p0_gate_bf16[9]
                                   ? (p0_gate_bf16[8]
                                        ? global_in__sigmoid_lut_element_127_136_0
                                        : global_in__sigmoid_lut_element_126_135_0)
                                   : p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_125_134_0
                                       : global_in__sigmoid_lut_element_124_133_0)
                              : p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_123_132_0
                                       : global_in__sigmoid_lut_element_122_131_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_121_130_0
                                      : global_in__sigmoid_lut_element_120_129_0)
                         : p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_119_128_0
                                       : global_in__sigmoid_lut_element_118_127_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_117_126_0
                                      : global_in__sigmoid_lut_element_116_125_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_115_124_0
                                      : global_in__sigmoid_lut_element_114_123_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_113_122_0
                                     : global_in__sigmoid_lut_element_112_121_0)
                    : p0_gate_bf16[11]
                        ? (p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_111_120_0
                                       : global_in__sigmoid_lut_element_110_119_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_109_118_0
                                      : global_in__sigmoid_lut_element_108_117_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_107_116_0
                                      : global_in__sigmoid_lut_element_106_115_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_105_114_0
                                     : global_in__sigmoid_lut_element_104_113_0)
                        : p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_103_112_0
                                      : global_in__sigmoid_lut_element_102_111_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_101_110_0
                                     : global_in__sigmoid_lut_element_100_109_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_99_108_0
                                     : global_in__sigmoid_lut_element_98_107_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_97_106_0
                                    : global_in__sigmoid_lut_element_96_105_0)
               : p0_gate_bf16[12]
                   ? (p0_gate_bf16[11]
                        ? (p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_95_104_0
                                       : global_in__sigmoid_lut_element_94_103_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_93_102_0
                                      : global_in__sigmoid_lut_element_92_101_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_91_100_0
                                      : global_in__sigmoid_lut_element_90_99_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_89_98_0
                                     : global_in__sigmoid_lut_element_88_97_0)
                        : p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_87_96_0
                                      : global_in__sigmoid_lut_element_86_95_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_85_94_0
                                     : global_in__sigmoid_lut_element_84_93_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_83_92_0
                                     : global_in__sigmoid_lut_element_82_91_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_81_90_0
                                    : global_in__sigmoid_lut_element_80_89_0)
                   : p0_gate_bf16[11]
                       ? (p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_79_88_0
                                      : global_in__sigmoid_lut_element_78_87_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_77_86_0
                                     : global_in__sigmoid_lut_element_76_85_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_75_84_0
                                     : global_in__sigmoid_lut_element_74_83_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_73_82_0
                                    : global_in__sigmoid_lut_element_72_81_0)
                       : p0_gate_bf16[10]
                           ? (p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_71_80_0
                                     : global_in__sigmoid_lut_element_70_79_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_69_78_0
                                    : global_in__sigmoid_lut_element_68_77_0)
                           : p0_gate_bf16[9]
                               ? (p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_67_76_0
                                    : global_in__sigmoid_lut_element_66_75_0)
                               : p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_65_74_0
                                   : global_in__sigmoid_lut_element_64_73_0)
          : p0_gate_bf16[13]
              ? (p0_gate_bf16[12]
                   ? (p0_gate_bf16[11]
                        ? (p0_gate_bf16[10]
                             ? (p0_gate_bf16[9]
                                  ? (p0_gate_bf16[8]
                                       ? global_in__sigmoid_lut_element_63_72_0
                                       : global_in__sigmoid_lut_element_62_71_0)
                                  : p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_61_70_0
                                      : global_in__sigmoid_lut_element_60_69_0)
                             : p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_59_68_0
                                      : global_in__sigmoid_lut_element_58_67_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_57_66_0
                                     : global_in__sigmoid_lut_element_56_65_0)
                        : p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_55_64_0
                                      : global_in__sigmoid_lut_element_54_63_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_53_62_0
                                     : global_in__sigmoid_lut_element_52_61_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_51_60_0
                                     : global_in__sigmoid_lut_element_50_59_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_49_58_0
                                    : global_in__sigmoid_lut_element_48_57_0)
                   : p0_gate_bf16[11]
                       ? (p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_47_56_0
                                      : global_in__sigmoid_lut_element_46_55_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_45_54_0
                                     : global_in__sigmoid_lut_element_44_53_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_43_52_0
                                     : global_in__sigmoid_lut_element_42_51_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_41_50_0
                                    : global_in__sigmoid_lut_element_40_49_0)
                       : p0_gate_bf16[10]
                           ? (p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_39_48_0
                                     : global_in__sigmoid_lut_element_38_47_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_37_46_0
                                    : global_in__sigmoid_lut_element_36_45_0)
                           : p0_gate_bf16[9]
                               ? (p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_35_44_0
                                    : global_in__sigmoid_lut_element_34_43_0)
                               : p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_33_42_0
                                   : global_in__sigmoid_lut_element_32_41_0)
              : p0_gate_bf16[12]
                  ? (p0_gate_bf16[11]
                       ? (p0_gate_bf16[10]
                            ? (p0_gate_bf16[9]
                                 ? (p0_gate_bf16[8]
                                      ? global_in__sigmoid_lut_element_31_40_0
                                      : global_in__sigmoid_lut_element_30_39_0)
                                 : p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_29_38_0
                                     : global_in__sigmoid_lut_element_28_37_0)
                            : p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_27_36_0
                                     : global_in__sigmoid_lut_element_26_35_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_25_34_0
                                    : global_in__sigmoid_lut_element_24_33_0)
                       : p0_gate_bf16[10]
                           ? (p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_23_32_0
                                     : global_in__sigmoid_lut_element_22_31_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_21_30_0
                                    : global_in__sigmoid_lut_element_20_29_0)
                           : p0_gate_bf16[9]
                               ? (p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_19_28_0
                                    : global_in__sigmoid_lut_element_18_27_0)
                               : p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_17_26_0
                                   : global_in__sigmoid_lut_element_16_25_0)
                  : p0_gate_bf16[11]
                      ? (p0_gate_bf16[10]
                           ? (p0_gate_bf16[9]
                                ? (p0_gate_bf16[8]
                                     ? global_in__sigmoid_lut_element_15_24_0
                                     : global_in__sigmoid_lut_element_14_23_0)
                                : p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_13_22_0
                                    : global_in__sigmoid_lut_element_12_21_0)
                           : p0_gate_bf16[9]
                               ? (p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_11_20_0
                                    : global_in__sigmoid_lut_element_10_19_0)
                               : p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_9_18_0
                                   : global_in__sigmoid_lut_element_8_17_0)
                      : p0_gate_bf16[10]
                          ? (p0_gate_bf16[9]
                               ? (p0_gate_bf16[8]
                                    ? global_in__sigmoid_lut_element_7_16_0
                                    : global_in__sigmoid_lut_element_6_15_0)
                               : p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_5_14_0
                                   : global_in__sigmoid_lut_element_4_13_0)
                          : p0_gate_bf16[9]
                              ? (p0_gate_bf16[8]
                                   ? global_in__sigmoid_lut_element_3_12_0
                                   : global_in__sigmoid_lut_element_2_11_0)
                              : p0_gate_bf16[8]
                                  ? global_in__sigmoid_lut_element_1_10_0
                                  : global_in__sigmoid_lut_element_0_9_0;	// swiglu.k:93:9, :98:26
  wire         prod = p0_gate_bf16[6] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire         prod_0 = p0_gate_bf16[5] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire         prod_1 = p0_gate_bf16[4] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire         prod_2 = p0_gate_bf16[3] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire         prod_3 = p0_gate_bf16[2] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire         prod_4 = p0_gate_bf16[1] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire         prod_5 = p0_gate_bf16[0] & _sigmoid_lut[0];	// swiglu.k:93:9, :98:26, :108:{21,33}, :109:{21,33}, :111:35, :112:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_gate_bf16[14:7]} + {8'h0, _sigmoid_lut[14:7]});	// swiglu.k:93:9, :98:26, :125:39, :130:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0, _sigmoid_lut[0], prod, prod_0, prod_1, prod_2, prod_3, prod_4, prod_5}
        + {2'h1, p0_gate_bf16[6:0], 1'h0});	// swiglu.k:93:9, :98:26, :109:{21,33}, :112:{21,25}, :113:{51,58}
  wire         prod_6 = _prod_plus_ma32_shl_1_[9] & _sigmoid_lut[1];	// swiglu.k:98:26, :109:{21,33}, :113:{21,25,51}
  wire         prod_7 = _prod_plus_ma32_shl_1_[8] & _sigmoid_lut[1];	// swiglu.k:98:26, :109:{21,33}, :113:{21,25,51}
  wire         prod_8 =
    _prod_plus_ma32_shl_1_[7]
      ? _sigmoid_lut[0] | _sigmoid_lut[1]
      : _sigmoid_lut[0] & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25,51}
  wire         prod_9 =
    _prod_plus_ma32_shl_1_[6] ? prod | _sigmoid_lut[1] : prod & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire         prod_10 =
    _prod_plus_ma32_shl_1_[5] ? prod_0 | _sigmoid_lut[1] : prod_0 & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire         prod_11 =
    _prod_plus_ma32_shl_1_[4] ? prod_1 | _sigmoid_lut[1] : prod_1 & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire         prod_12 =
    _prod_plus_ma32_shl_1_[3] ? prod_2 | _sigmoid_lut[1] : prod_2 & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire         prod_13 =
    _prod_plus_ma32_shl_1_[2] ? prod_3 | _sigmoid_lut[1] : prod_3 & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire         prod_14 =
    _prod_plus_ma32_shl_1_[1] ? prod_4 | _sigmoid_lut[1] : prod_4 & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[0] ? prod_5 | _sigmoid_lut[1] : prod_5 & ~(_sigmoid_lut[1]);	// swiglu.k:98:26, :109:{21,33}, :112:{21,25}, :113:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_6,
         prod_7,
         prod_8,
         prod_9,
         prod_10,
         prod_11,
         prod_12,
         prod_13,
         prod_14,
         prod_15} + {2'h1, p0_gate_bf16[6:0], 2'h0});	// swiglu.k:93:9, :113:{21,25}, :114:{51,58}
  wire         prod_16 = _prod_plus_ma32_shl_2_[10] & _sigmoid_lut[2];	// swiglu.k:98:26, :109:{21,33}, :114:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_2_[9] ? prod_6 | _sigmoid_lut[2] : prod_6 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_2_[8] ? prod_7 | _sigmoid_lut[2] : prod_7 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_2_[7] ? prod_8 | _sigmoid_lut[2] : prod_8 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_2_[6] ? prod_9 | _sigmoid_lut[2] : prod_9 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_2_[5] ? prod_10 | _sigmoid_lut[2] : prod_10 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_2_[4] ? prod_11 | _sigmoid_lut[2] : prod_11 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_23 =
    _prod_plus_ma32_shl_2_[3] ? prod_12 | _sigmoid_lut[2] : prod_12 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_24 =
    _prod_plus_ma32_shl_2_[2] ? prod_13 | _sigmoid_lut[2] : prod_13 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_2_[1] ? prod_14 | _sigmoid_lut[2] : prod_14 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_2_[0] ? prod_15 | _sigmoid_lut[2] : prod_15 & ~(_sigmoid_lut[2]);	// swiglu.k:98:26, :109:{21,33}, :113:{21,25}, :114:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
         prod_16,
         prod_17,
         prod_18,
         prod_19,
         prod_20,
         prod_21,
         prod_22,
         prod_23,
         prod_24,
         prod_25,
         prod_26} + {2'h1, p0_gate_bf16[6:0], 3'h0});	// swiglu.k:93:9, :114:{21,25}, :115:{51,58}
  wire         prod_27 = _prod_plus_ma32_shl_3_[11] & _sigmoid_lut[3];	// swiglu.k:98:26, :109:{21,33}, :115:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_3_[10] ? prod_16 | _sigmoid_lut[3] : prod_16 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_3_[9] ? prod_17 | _sigmoid_lut[3] : prod_17 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_3_[8] ? prod_18 | _sigmoid_lut[3] : prod_18 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_3_[7] ? prod_19 | _sigmoid_lut[3] : prod_19 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_3_[6] ? prod_20 | _sigmoid_lut[3] : prod_20 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_33 =
    _prod_plus_ma32_shl_3_[5] ? prod_21 | _sigmoid_lut[3] : prod_21 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_3_[4] ? prod_22 | _sigmoid_lut[3] : prod_22 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_3_[3] ? prod_23 | _sigmoid_lut[3] : prod_23 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_3_[2] ? prod_24 | _sigmoid_lut[3] : prod_24 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_3_[1] ? prod_25 | _sigmoid_lut[3] : prod_25 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_3_[0] ? prod_26 | _sigmoid_lut[3] : prod_26 & ~(_sigmoid_lut[3]);	// swiglu.k:98:26, :109:{21,33}, :114:{21,25}, :115:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4_ =
    13'({1'h0,
         prod_27,
         prod_28,
         prod_29,
         prod_30,
         prod_31,
         prod_32,
         prod_33,
         prod_34,
         prod_35,
         prod_36,
         prod_37,
         prod_38} + {2'h1, p0_gate_bf16[6:0], 4'h0});	// swiglu.k:93:9, :115:{21,25}, :116:{51,58}
  wire         prod_39 = _prod_plus_ma32_shl_4_[12] & _sigmoid_lut[4];	// swiglu.k:98:26, :109:{21,33}, :116:{21,25,51}
  wire         prod_40 =
    _prod_plus_ma32_shl_4_[11] ? prod_27 | _sigmoid_lut[4] : prod_27 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_41 =
    _prod_plus_ma32_shl_4_[10] ? prod_28 | _sigmoid_lut[4] : prod_28 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_42 =
    _prod_plus_ma32_shl_4_[9] ? prod_29 | _sigmoid_lut[4] : prod_29 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_43 =
    _prod_plus_ma32_shl_4_[8] ? prod_30 | _sigmoid_lut[4] : prod_30 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_44 =
    _prod_plus_ma32_shl_4_[7] ? prod_31 | _sigmoid_lut[4] : prod_31 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_45 =
    _prod_plus_ma32_shl_4_[6] ? prod_32 | _sigmoid_lut[4] : prod_32 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_46 =
    _prod_plus_ma32_shl_4_[5] ? prod_33 | _sigmoid_lut[4] : prod_33 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_47 =
    _prod_plus_ma32_shl_4_[4] ? prod_34 | _sigmoid_lut[4] : prod_34 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_48 =
    _prod_plus_ma32_shl_4_[3] ? prod_35 | _sigmoid_lut[4] : prod_35 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_49 =
    _prod_plus_ma32_shl_4_[2] ? prod_36 | _sigmoid_lut[4] : prod_36 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_50 =
    _prod_plus_ma32_shl_4_[1] ? prod_37 | _sigmoid_lut[4] : prod_37 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire         prod_51 =
    _prod_plus_ma32_shl_4_[0] ? prod_38 | _sigmoid_lut[4] : prod_38 & ~(_sigmoid_lut[4]);	// swiglu.k:98:26, :109:{21,33}, :115:{21,25}, :116:{21,25,51}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_39,
         prod_40,
         prod_41,
         prod_42,
         prod_43,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51} + {2'h1, p0_gate_bf16[6:0], 5'h0});	// swiglu.k:93:9, :116:{21,25}, :117:{51,58}
  wire         prod_52 = _prod_plus_ma32_shl_5_[13] & _sigmoid_lut[5];	// swiglu.k:98:26, :109:{21,33}, :117:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_5_[12] ? prod_39 | _sigmoid_lut[5] : prod_39 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_5_[11] ? prod_40 | _sigmoid_lut[5] : prod_40 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[10] ? prod_41 | _sigmoid_lut[5] : prod_41 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[9] ? prod_42 | _sigmoid_lut[5] : prod_42 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[8] ? prod_43 | _sigmoid_lut[5] : prod_43 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[7] ? prod_44 | _sigmoid_lut[5] : prod_44 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[6] ? prod_45 | _sigmoid_lut[5] : prod_45 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[5] ? prod_46 | _sigmoid_lut[5] : prod_46 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[4] ? prod_47 | _sigmoid_lut[5] : prod_47 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[3] ? prod_48 | _sigmoid_lut[5] : prod_48 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[2] ? prod_49 | _sigmoid_lut[5] : prod_49 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[1] ? prod_50 | _sigmoid_lut[5] : prod_50 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_5_[0] ? prod_51 | _sigmoid_lut[5] : prod_51 & ~(_sigmoid_lut[5]);	// swiglu.k:98:26, :109:{21,33}, :116:{21,25}, :117:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
         prod_52,
         prod_53,
         prod_54,
         prod_55,
         prod_56,
         prod_57,
         prod_58,
         prod_59,
         prod_60,
         prod_61,
         prod_62,
         prod_63,
         prod_64,
         prod_65} + {2'h1, p0_gate_bf16[6:0], 6'h0});	// swiglu.k:93:9, :117:{21,25}, :118:{51,58}
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & _sigmoid_lut[6],
         _prod_plus_ma32_shl_6_[13]
           ? prod_52 | _sigmoid_lut[6]
           : prod_52 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[12]
           ? prod_53 | _sigmoid_lut[6]
           : prod_53 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[11]
           ? prod_54 | _sigmoid_lut[6]
           : prod_54 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[10]
           ? prod_55 | _sigmoid_lut[6]
           : prod_55 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[9]
           ? prod_56 | _sigmoid_lut[6]
           : prod_56 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[8]
           ? prod_57 | _sigmoid_lut[6]
           : prod_57 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[7]
           ? prod_58 | _sigmoid_lut[6]
           : prod_58 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[6]
           ? prod_59 | _sigmoid_lut[6]
           : prod_59 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[5]
           ? prod_60 | _sigmoid_lut[6]
           : prod_60 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[4]
           ? prod_61 | _sigmoid_lut[6]
           : prod_61 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[3]
           ? prod_62 | _sigmoid_lut[6]
           : prod_62 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[2]
           ? prod_63 | _sigmoid_lut[6]
           : prod_63 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[1]
           ? prod_64 | _sigmoid_lut[6]
           : prod_64 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[0]
           ? prod_65 | _sigmoid_lut[6]
           : prod_65 & ~(_sigmoid_lut[6])} + {2'h1, p0_gate_bf16[6:0], 7'h0});	// swiglu.k:93:9, :98:26, :109:{21,33}, :117:{21,25}, :118:{21,51}, :119:{51,58}
  wire  [15:0] r_exp =
    _prod_plus_ma32_shl_7_[15]
      ? 16'(_a_exp_plus_b_exp_ - 16'h7E)
      : 16'(_a_exp_plus_b_exp_ - 16'h7F);	// swiglu.k:119:{21,51}, :122:21, :125:{33,39,47}, :130:{33,39}
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// swiglu.k:107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25,31,44}, :134:{32,47,49}
  wire         _GEN_1 = ~(_prod_plus_ma32_shl_7_[15]) & _GEN_0;	// swiglu.k:107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         _GEN_2 = (|(_sigmoid_lut[14:7])) & (|(p0_gate_bf16[14:7]));	// swiglu.k:93:9, :98:26, :103:{17,32}, :104:{17,32}, :105:{17,21,27,41}
  wire         silu =
    (r_exp[8]
       ? _GEN_0
       : _sigmoid_lut[15] ? ~(p0_gate_bf16[15]) & _GEN_0 : p0_gate_bf16[15] & _GEN_0)
    & _GEN_2;	// swiglu.k:93:9, :98:26, :105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_0 = r_exp[7] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_1 = r_exp[6] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_2 = r_exp[5] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_3 = r_exp[4] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_4 = r_exp[3] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_5 = r_exp[2] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_6 = r_exp[1] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_7 = r_exp[0] & _GEN_0 & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_8 =
    (_prod_plus_ma32_shl_7_[14]
       ? (_prod_plus_ma32_shl_7_[13] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[13] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_9 =
    (_prod_plus_ma32_shl_7_[13]
       ? (_prod_plus_ma32_shl_7_[12] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[12] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_10 =
    (_prod_plus_ma32_shl_7_[12]
       ? (_prod_plus_ma32_shl_7_[11] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[11] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_11 =
    (_prod_plus_ma32_shl_7_[11]
       ? (_prod_plus_ma32_shl_7_[10] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[10] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_12 =
    (_prod_plus_ma32_shl_7_[10]
       ? (_prod_plus_ma32_shl_7_[9] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[9] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_13 =
    (_prod_plus_ma32_shl_7_[9]
       ? (_prod_plus_ma32_shl_7_[8] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[8] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         silu_14 =
    (_prod_plus_ma32_shl_7_[8]
       ? (_prod_plus_ma32_shl_7_[7] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
       : _prod_plus_ma32_shl_7_[7] & _GEN_1) & _GEN_2;	// swiglu.k:105:{17,21}, :107:{21,37,38,58}, :119:{21,51}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}
  wire         prod_66 = silu_8 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire         prod_67 = silu_9 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire         prod_68 = silu_10 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire         prod_69 = silu_11 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire         prod_70 = silu_12 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire         prod_71 = silu_13 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire         prod_72 = silu_14 & p0_up_bf16[0];	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}
  wire  [15:0] _a_exp_plus_b_exp__0 =
    16'({8'h0, silu_0, silu_1, silu_2, silu_3, silu_4, silu_5, silu_6, silu_7}
        + {8'h0, p0_up_bf16[14:7]});	// swiglu.k:93:9, :105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}, :164:39, :169:39
  wire  [9:0]  _prod_plus_ma32_shl_1__0 =
    10'({2'h0,
         p0_up_bf16[0],
         prod_66,
         prod_67,
         prod_68,
         prod_69,
         prod_70,
         prod_71,
         prod_72}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 1'h0});	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :151:{21,25}, :152:{51,58}
  wire         prod_73 = _prod_plus_ma32_shl_1__0[9] & p0_up_bf16[1];	// swiglu.k:93:9, :148:{21,33}, :152:{21,25,51}
  wire         prod_74 = _prod_plus_ma32_shl_1__0[8] & p0_up_bf16[1];	// swiglu.k:93:9, :148:{21,33}, :152:{21,25,51}
  wire         prod_75 =
    _prod_plus_ma32_shl_1__0[7]
      ? p0_up_bf16[0] | p0_up_bf16[1]
      : p0_up_bf16[0] & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25,51}
  wire         prod_76 =
    _prod_plus_ma32_shl_1__0[6] ? prod_66 | p0_up_bf16[1] : prod_66 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire         prod_77 =
    _prod_plus_ma32_shl_1__0[5] ? prod_67 | p0_up_bf16[1] : prod_67 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire         prod_78 =
    _prod_plus_ma32_shl_1__0[4] ? prod_68 | p0_up_bf16[1] : prod_68 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire         prod_79 =
    _prod_plus_ma32_shl_1__0[3] ? prod_69 | p0_up_bf16[1] : prod_69 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire         prod_80 =
    _prod_plus_ma32_shl_1__0[2] ? prod_70 | p0_up_bf16[1] : prod_70 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire         prod_81 =
    _prod_plus_ma32_shl_1__0[1] ? prod_71 | p0_up_bf16[1] : prod_71 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire         prod_82 =
    _prod_plus_ma32_shl_1__0[0] ? prod_72 | p0_up_bf16[1] : prod_72 & ~(p0_up_bf16[1]);	// swiglu.k:93:9, :148:{21,33}, :151:{21,25}, :152:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2__0 =
    11'({1'h0,
         prod_73,
         prod_74,
         prod_75,
         prod_76,
         prod_77,
         prod_78,
         prod_79,
         prod_80,
         prod_81,
         prod_82}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 2'h0});	// swiglu.k:105:{17,21}, :152:{21,25}, :153:{51,58}
  wire         prod_83 = _prod_plus_ma32_shl_2__0[10] & p0_up_bf16[2];	// swiglu.k:93:9, :148:{21,33}, :153:{21,25,51}
  wire         prod_84 =
    _prod_plus_ma32_shl_2__0[9] ? prod_73 | p0_up_bf16[2] : prod_73 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_85 =
    _prod_plus_ma32_shl_2__0[8] ? prod_74 | p0_up_bf16[2] : prod_74 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_86 =
    _prod_plus_ma32_shl_2__0[7] ? prod_75 | p0_up_bf16[2] : prod_75 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_87 =
    _prod_plus_ma32_shl_2__0[6] ? prod_76 | p0_up_bf16[2] : prod_76 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_88 =
    _prod_plus_ma32_shl_2__0[5] ? prod_77 | p0_up_bf16[2] : prod_77 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_89 =
    _prod_plus_ma32_shl_2__0[4] ? prod_78 | p0_up_bf16[2] : prod_78 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_90 =
    _prod_plus_ma32_shl_2__0[3] ? prod_79 | p0_up_bf16[2] : prod_79 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_91 =
    _prod_plus_ma32_shl_2__0[2] ? prod_80 | p0_up_bf16[2] : prod_80 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_92 =
    _prod_plus_ma32_shl_2__0[1] ? prod_81 | p0_up_bf16[2] : prod_81 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire         prod_93 =
    _prod_plus_ma32_shl_2__0[0] ? prod_82 | p0_up_bf16[2] : prod_82 & ~(p0_up_bf16[2]);	// swiglu.k:93:9, :148:{21,33}, :152:{21,25}, :153:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3__0 =
    12'({1'h0,
         prod_83,
         prod_84,
         prod_85,
         prod_86,
         prod_87,
         prod_88,
         prod_89,
         prod_90,
         prod_91,
         prod_92,
         prod_93}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 3'h0});	// swiglu.k:105:{17,21}, :153:{21,25}, :154:{51,58}
  wire         prod_94 = _prod_plus_ma32_shl_3__0[11] & p0_up_bf16[3];	// swiglu.k:93:9, :148:{21,33}, :154:{21,25,51}
  wire         prod_95 =
    _prod_plus_ma32_shl_3__0[10] ? prod_83 | p0_up_bf16[3] : prod_83 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_96 =
    _prod_plus_ma32_shl_3__0[9] ? prod_84 | p0_up_bf16[3] : prod_84 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_97 =
    _prod_plus_ma32_shl_3__0[8] ? prod_85 | p0_up_bf16[3] : prod_85 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_98 =
    _prod_plus_ma32_shl_3__0[7] ? prod_86 | p0_up_bf16[3] : prod_86 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_99 =
    _prod_plus_ma32_shl_3__0[6] ? prod_87 | p0_up_bf16[3] : prod_87 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_100 =
    _prod_plus_ma32_shl_3__0[5] ? prod_88 | p0_up_bf16[3] : prod_88 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_101 =
    _prod_plus_ma32_shl_3__0[4] ? prod_89 | p0_up_bf16[3] : prod_89 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_102 =
    _prod_plus_ma32_shl_3__0[3] ? prod_90 | p0_up_bf16[3] : prod_90 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_103 =
    _prod_plus_ma32_shl_3__0[2] ? prod_91 | p0_up_bf16[3] : prod_91 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_104 =
    _prod_plus_ma32_shl_3__0[1] ? prod_92 | p0_up_bf16[3] : prod_92 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire         prod_105 =
    _prod_plus_ma32_shl_3__0[0] ? prod_93 | p0_up_bf16[3] : prod_93 & ~(p0_up_bf16[3]);	// swiglu.k:93:9, :148:{21,33}, :153:{21,25}, :154:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4__0 =
    13'({1'h0,
         prod_94,
         prod_95,
         prod_96,
         prod_97,
         prod_98,
         prod_99,
         prod_100,
         prod_101,
         prod_102,
         prod_103,
         prod_104,
         prod_105}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 4'h0});	// swiglu.k:105:{17,21}, :154:{21,25}, :155:{51,58}
  wire         prod_106 = _prod_plus_ma32_shl_4__0[12] & p0_up_bf16[4];	// swiglu.k:93:9, :148:{21,33}, :155:{21,25,51}
  wire         prod_107 =
    _prod_plus_ma32_shl_4__0[11] ? prod_94 | p0_up_bf16[4] : prod_94 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_108 =
    _prod_plus_ma32_shl_4__0[10] ? prod_95 | p0_up_bf16[4] : prod_95 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_109 =
    _prod_plus_ma32_shl_4__0[9] ? prod_96 | p0_up_bf16[4] : prod_96 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_110 =
    _prod_plus_ma32_shl_4__0[8] ? prod_97 | p0_up_bf16[4] : prod_97 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_111 =
    _prod_plus_ma32_shl_4__0[7] ? prod_98 | p0_up_bf16[4] : prod_98 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_112 =
    _prod_plus_ma32_shl_4__0[6] ? prod_99 | p0_up_bf16[4] : prod_99 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_113 =
    _prod_plus_ma32_shl_4__0[5] ? prod_100 | p0_up_bf16[4] : prod_100 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_114 =
    _prod_plus_ma32_shl_4__0[4] ? prod_101 | p0_up_bf16[4] : prod_101 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_115 =
    _prod_plus_ma32_shl_4__0[3] ? prod_102 | p0_up_bf16[4] : prod_102 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_116 =
    _prod_plus_ma32_shl_4__0[2] ? prod_103 | p0_up_bf16[4] : prod_103 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_117 =
    _prod_plus_ma32_shl_4__0[1] ? prod_104 | p0_up_bf16[4] : prod_104 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire         prod_118 =
    _prod_plus_ma32_shl_4__0[0] ? prod_105 | p0_up_bf16[4] : prod_105 & ~(p0_up_bf16[4]);	// swiglu.k:93:9, :148:{21,33}, :154:{21,25}, :155:{21,25,51}
  wire  [13:0] _prod_plus_ma32_shl_5__0 =
    14'({1'h0,
         prod_106,
         prod_107,
         prod_108,
         prod_109,
         prod_110,
         prod_111,
         prod_112,
         prod_113,
         prod_114,
         prod_115,
         prod_116,
         prod_117,
         prod_118}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 5'h0});	// swiglu.k:105:{17,21}, :155:{21,25}, :156:{51,58}
  wire         prod_119 = _prod_plus_ma32_shl_5__0[13] & p0_up_bf16[5];	// swiglu.k:93:9, :148:{21,33}, :156:{21,25,51}
  wire         prod_120 =
    _prod_plus_ma32_shl_5__0[12] ? prod_106 | p0_up_bf16[5] : prod_106 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_121 =
    _prod_plus_ma32_shl_5__0[11] ? prod_107 | p0_up_bf16[5] : prod_107 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_122 =
    _prod_plus_ma32_shl_5__0[10] ? prod_108 | p0_up_bf16[5] : prod_108 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_123 =
    _prod_plus_ma32_shl_5__0[9] ? prod_109 | p0_up_bf16[5] : prod_109 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_124 =
    _prod_plus_ma32_shl_5__0[8] ? prod_110 | p0_up_bf16[5] : prod_110 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_125 =
    _prod_plus_ma32_shl_5__0[7] ? prod_111 | p0_up_bf16[5] : prod_111 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_126 =
    _prod_plus_ma32_shl_5__0[6] ? prod_112 | p0_up_bf16[5] : prod_112 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_127 =
    _prod_plus_ma32_shl_5__0[5] ? prod_113 | p0_up_bf16[5] : prod_113 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_128 =
    _prod_plus_ma32_shl_5__0[4] ? prod_114 | p0_up_bf16[5] : prod_114 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_129 =
    _prod_plus_ma32_shl_5__0[3] ? prod_115 | p0_up_bf16[5] : prod_115 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_130 =
    _prod_plus_ma32_shl_5__0[2] ? prod_116 | p0_up_bf16[5] : prod_116 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_131 =
    _prod_plus_ma32_shl_5__0[1] ? prod_117 | p0_up_bf16[5] : prod_117 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire         prod_132 =
    _prod_plus_ma32_shl_5__0[0] ? prod_118 | p0_up_bf16[5] : prod_118 & ~(p0_up_bf16[5]);	// swiglu.k:93:9, :148:{21,33}, :155:{21,25}, :156:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6__0 =
    15'({1'h0,
         prod_119,
         prod_120,
         prod_121,
         prod_122,
         prod_123,
         prod_124,
         prod_125,
         prod_126,
         prod_127,
         prod_128,
         prod_129,
         prod_130,
         prod_131,
         prod_132}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 6'h0});	// swiglu.k:105:{17,21}, :156:{21,25}, :157:{51,58}
  wire  [15:0] _prod_plus_ma32_shl_7__0 =
    16'({1'h0,
         _prod_plus_ma32_shl_6__0[14] & p0_up_bf16[6],
         _prod_plus_ma32_shl_6__0[13]
           ? prod_119 | p0_up_bf16[6]
           : prod_119 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[12]
           ? prod_120 | p0_up_bf16[6]
           : prod_120 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[11]
           ? prod_121 | p0_up_bf16[6]
           : prod_121 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[10]
           ? prod_122 | p0_up_bf16[6]
           : prod_122 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[9]
           ? prod_123 | p0_up_bf16[6]
           : prod_123 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[8]
           ? prod_124 | p0_up_bf16[6]
           : prod_124 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[7]
           ? prod_125 | p0_up_bf16[6]
           : prod_125 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[6]
           ? prod_126 | p0_up_bf16[6]
           : prod_126 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[5]
           ? prod_127 | p0_up_bf16[6]
           : prod_127 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[4]
           ? prod_128 | p0_up_bf16[6]
           : prod_128 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[3]
           ? prod_129 | p0_up_bf16[6]
           : prod_129 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[2]
           ? prod_130 | p0_up_bf16[6]
           : prod_130 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[1]
           ? prod_131 | p0_up_bf16[6]
           : prod_131 & ~(p0_up_bf16[6]),
         _prod_plus_ma32_shl_6__0[0]
           ? prod_132 | p0_up_bf16[6]
           : prod_132 & ~(p0_up_bf16[6])}
        + {2'h1, silu_8, silu_9, silu_10, silu_11, silu_12, silu_13, silu_14, 7'h0});	// swiglu.k:93:9, :105:{17,21}, :148:{21,33}, :156:{21,25}, :157:{21,51}, :158:{51,58}
  wire  [15:0] r_exp_0 =
    _prod_plus_ma32_shl_7__0[15]
      ? 16'(_a_exp_plus_b_exp__0 - 16'h7E)
      : 16'(_a_exp_plus_b_exp__0 - 16'h7F);	// swiglu.k:158:{21,51}, :161:21, :164:{33,39,47}, :169:{33,39}
  wire         _GEN_3 = r_exp_0 < 16'hFF & (|r_exp_0);	// swiglu.k:146:{21,37,38,53}, :161:21, :163:{34,47}, :168:{34,47}, :171:{21,25,31,44}, :173:{34,49,51}
  wire         _GEN_4 = ~(_prod_plus_ma32_shl_7__0[15]) & _GEN_3;	// swiglu.k:146:{21,37,38,53}, :158:{21,51}, :161:21, :163:{34,47}, :168:{34,47}, :171:{21,25}, :173:{34,49,51}
  wire         _GEN_5 =
    (|(p0_up_bf16[14:7]))
    & (|{silu_0, silu_1, silu_2, silu_3, silu_4, silu_5, silu_6, silu_7});	// swiglu.k:93:9, :105:{17,21}, :107:{21,37,38,58}, :122:21, :124:{34,47}, :129:{34,47}, :132:{21,25}, :134:{32,47,49}, :142:{17,32}, :143:{17,32}, :144:{17,21,27,41}
  always @(posedge clk) begin	// swiglu.k:93:9
    p0_gate_bf16 <= data_in_7[15:0];	// swiglu.k:93:9
    p0_up_bf16 <= data_in_7[31:16];	// swiglu.k:93:9
    if (rst)	// swiglu.k:93:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:93:9
    else	// swiglu.k:93:9
      p0_stage1_enable <= _GEN & input_valid_0;	// swiglu.k:93:9
    p0_result <=
      {(r_exp_0[8] ? _GEN_3 : p0_up_bf16[15] ? ~silu & _GEN_3 : silu & _GEN_3) & _GEN_5,
       r_exp_0[7] & _GEN_3 & _GEN_5,
       r_exp_0[6] & _GEN_3 & _GEN_5,
       r_exp_0[5] & _GEN_3 & _GEN_5,
       r_exp_0[4] & _GEN_3 & _GEN_5,
       r_exp_0[3] & _GEN_3 & _GEN_5,
       r_exp_0[2] & _GEN_3 & _GEN_5,
       r_exp_0[1] & _GEN_3 & _GEN_5,
       r_exp_0[0] & _GEN_3 & _GEN_5,
       (_prod_plus_ma32_shl_7__0[14]
          ? (_prod_plus_ma32_shl_7__0[13] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[13] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[13]
          ? (_prod_plus_ma32_shl_7__0[12] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[12] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[12]
          ? (_prod_plus_ma32_shl_7__0[11] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[11] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[11]
          ? (_prod_plus_ma32_shl_7__0[10] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[10] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[10]
          ? (_prod_plus_ma32_shl_7__0[9] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[9] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[9]
          ? (_prod_plus_ma32_shl_7__0[8] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[8] & _GEN_4) & _GEN_5,
       (_prod_plus_ma32_shl_7__0[8]
          ? (_prod_plus_ma32_shl_7__0[7] | _prod_plus_ma32_shl_7__0[15]) & _GEN_3
          : _prod_plus_ma32_shl_7__0[7] & _GEN_4) & _GEN_5};	// swiglu.k:93:9, :105:{17,21}, :144:{17,21}, :146:{21,37,38,53}, :158:{21,51}, :161:21, :163:{34,47}, :168:{34,47}, :171:{21,25}, :173:{34,49,51}
    if (rst)	// swiglu.k:93:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:93:9
    else	// swiglu.k:93:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:93:9
    p0_result_0 <= p0_result;	// swiglu.k:93:9
    if (rst)	// swiglu.k:93:9
      p0_stage3_enable <= 1'h0;	// swiglu.k:93:9
    else	// swiglu.k:93:9
      p0_stage3_enable <= p0_stage2_enable;	// swiglu.k:93:9
  end // always @(posedge)
  always_comb begin	// swiglu.k:93:9
    fifo_wren_0_0 = p0_stage3_enable;	// swiglu.k:91:5, :93:9
    fifo_data_out_0_0 = p0_result_0;	// swiglu.k:91:5, :93:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:93:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:93:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_compute_swigluEntry swiglu_unitDebugView_compute_swigluEntry_instance (	// swiglu.k:91:5
    .clk        (clk),	// swiglu.k:91:5
    ._gate_bf16 (p0_stage1_enable ? p0_gate_bf16 : 'x),	// swiglu.k:91:5, :93:9
    ._up_bf16   (p0_stage1_enable ? p0_up_bf16 : 'x),	// swiglu.k:91:5, :93:9
    .valid      (p0_stage1_enable),	// swiglu.k:93:9
    .valid_out  (/* unused */)
  );	// swiglu.k:91:5
  swiglu_unitDebugView_compute_swigluExit swiglu_unitDebugView_compute_swigluExit_instance (	// swiglu.k:91:5
    .clk          (clk),	// swiglu.k:91:5
    ._ReturnValue (p0_stage2_enable ? p0_result : 'x),	// swiglu.k:91:5, :93:9
    .valid        (p0_stage2_enable),	// swiglu.k:93:9
    .valid_out    (/* unused */)
  );	// swiglu.k:91:5
  assign done_out = p0_stage3_enable;	// swiglu.k:93:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// swiglu.k:93:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:93:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:93:9
  assign control_state_out = control_state_out_0;	// swiglu.k:93:9
endmodule

module swiglu_unit_compute_silu_BasicBlock_0(	// swiglu.k:41:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] global_in__sigmoid_lut_element_0_9,
  input  wire [15:0] global_in__sigmoid_lut_element_1_10,
  input  wire [15:0] global_in__sigmoid_lut_element_2_11,
  input  wire [15:0] global_in__sigmoid_lut_element_3_12,
  input  wire [15:0] global_in__sigmoid_lut_element_4_13,
  input  wire [15:0] global_in__sigmoid_lut_element_5_14,
  input  wire [15:0] global_in__sigmoid_lut_element_6_15,
  input  wire [15:0] global_in__sigmoid_lut_element_7_16,
  input  wire [15:0] global_in__sigmoid_lut_element_8_17,
  input  wire [15:0] global_in__sigmoid_lut_element_9_18,
  input  wire [15:0] global_in__sigmoid_lut_element_10_19,
  input  wire [15:0] global_in__sigmoid_lut_element_11_20,
  input  wire [15:0] global_in__sigmoid_lut_element_12_21,
  input  wire [15:0] global_in__sigmoid_lut_element_13_22,
  input  wire [15:0] global_in__sigmoid_lut_element_14_23,
  input  wire [15:0] global_in__sigmoid_lut_element_15_24,
  input  wire [15:0] global_in__sigmoid_lut_element_16_25,
  input  wire [15:0] global_in__sigmoid_lut_element_17_26,
  input  wire [15:0] global_in__sigmoid_lut_element_18_27,
  input  wire [15:0] global_in__sigmoid_lut_element_19_28,
  input  wire [15:0] global_in__sigmoid_lut_element_20_29,
  input  wire [15:0] global_in__sigmoid_lut_element_21_30,
  input  wire [15:0] global_in__sigmoid_lut_element_22_31,
  input  wire [15:0] global_in__sigmoid_lut_element_23_32,
  input  wire [15:0] global_in__sigmoid_lut_element_24_33,
  input  wire [15:0] global_in__sigmoid_lut_element_25_34,
  input  wire [15:0] global_in__sigmoid_lut_element_26_35,
  input  wire [15:0] global_in__sigmoid_lut_element_27_36,
  input  wire [15:0] global_in__sigmoid_lut_element_28_37,
  input  wire [15:0] global_in__sigmoid_lut_element_29_38,
  input  wire [15:0] global_in__sigmoid_lut_element_30_39,
  input  wire [15:0] global_in__sigmoid_lut_element_31_40,
  input  wire [15:0] global_in__sigmoid_lut_element_32_41,
  input  wire [15:0] global_in__sigmoid_lut_element_33_42,
  input  wire [15:0] global_in__sigmoid_lut_element_34_43,
  input  wire [15:0] global_in__sigmoid_lut_element_35_44,
  input  wire [15:0] global_in__sigmoid_lut_element_36_45,
  input  wire [15:0] global_in__sigmoid_lut_element_37_46,
  input  wire [15:0] global_in__sigmoid_lut_element_38_47,
  input  wire [15:0] global_in__sigmoid_lut_element_39_48,
  input  wire [15:0] global_in__sigmoid_lut_element_40_49,
  input  wire [15:0] global_in__sigmoid_lut_element_41_50,
  input  wire [15:0] global_in__sigmoid_lut_element_42_51,
  input  wire [15:0] global_in__sigmoid_lut_element_43_52,
  input  wire [15:0] global_in__sigmoid_lut_element_44_53,
  input  wire [15:0] global_in__sigmoid_lut_element_45_54,
  input  wire [15:0] global_in__sigmoid_lut_element_46_55,
  input  wire [15:0] global_in__sigmoid_lut_element_47_56,
  input  wire [15:0] global_in__sigmoid_lut_element_48_57,
  input  wire [15:0] global_in__sigmoid_lut_element_49_58,
  input  wire [15:0] global_in__sigmoid_lut_element_50_59,
  input  wire [15:0] global_in__sigmoid_lut_element_51_60,
  input  wire [15:0] global_in__sigmoid_lut_element_52_61,
  input  wire [15:0] global_in__sigmoid_lut_element_53_62,
  input  wire [15:0] global_in__sigmoid_lut_element_54_63,
  input  wire [15:0] global_in__sigmoid_lut_element_55_64,
  input  wire [15:0] global_in__sigmoid_lut_element_56_65,
  input  wire [15:0] global_in__sigmoid_lut_element_57_66,
  input  wire [15:0] global_in__sigmoid_lut_element_58_67,
  input  wire [15:0] global_in__sigmoid_lut_element_59_68,
  input  wire [15:0] global_in__sigmoid_lut_element_60_69,
  input  wire [15:0] global_in__sigmoid_lut_element_61_70,
  input  wire [15:0] global_in__sigmoid_lut_element_62_71,
  input  wire [15:0] global_in__sigmoid_lut_element_63_72,
  input  wire [15:0] global_in__sigmoid_lut_element_64_73,
  input  wire [15:0] global_in__sigmoid_lut_element_65_74,
  input  wire [15:0] global_in__sigmoid_lut_element_66_75,
  input  wire [15:0] global_in__sigmoid_lut_element_67_76,
  input  wire [15:0] global_in__sigmoid_lut_element_68_77,
  input  wire [15:0] global_in__sigmoid_lut_element_69_78,
  input  wire [15:0] global_in__sigmoid_lut_element_70_79,
  input  wire [15:0] global_in__sigmoid_lut_element_71_80,
  input  wire [15:0] global_in__sigmoid_lut_element_72_81,
  input  wire [15:0] global_in__sigmoid_lut_element_73_82,
  input  wire [15:0] global_in__sigmoid_lut_element_74_83,
  input  wire [15:0] global_in__sigmoid_lut_element_75_84,
  input  wire [15:0] global_in__sigmoid_lut_element_76_85,
  input  wire [15:0] global_in__sigmoid_lut_element_77_86,
  input  wire [15:0] global_in__sigmoid_lut_element_78_87,
  input  wire [15:0] global_in__sigmoid_lut_element_79_88,
  input  wire [15:0] global_in__sigmoid_lut_element_80_89,
  input  wire [15:0] global_in__sigmoid_lut_element_81_90,
  input  wire [15:0] global_in__sigmoid_lut_element_82_91,
  input  wire [15:0] global_in__sigmoid_lut_element_83_92,
  input  wire [15:0] global_in__sigmoid_lut_element_84_93,
  input  wire [15:0] global_in__sigmoid_lut_element_85_94,
  input  wire [15:0] global_in__sigmoid_lut_element_86_95,
  input  wire [15:0] global_in__sigmoid_lut_element_87_96,
  input  wire [15:0] global_in__sigmoid_lut_element_88_97,
  input  wire [15:0] global_in__sigmoid_lut_element_89_98,
  input  wire [15:0] global_in__sigmoid_lut_element_90_99,
  input  wire [15:0] global_in__sigmoid_lut_element_91_100,
  input  wire [15:0] global_in__sigmoid_lut_element_92_101,
  input  wire [15:0] global_in__sigmoid_lut_element_93_102,
  input  wire [15:0] global_in__sigmoid_lut_element_94_103,
  input  wire [15:0] global_in__sigmoid_lut_element_95_104,
  input  wire [15:0] global_in__sigmoid_lut_element_96_105,
  input  wire [15:0] global_in__sigmoid_lut_element_97_106,
  input  wire [15:0] global_in__sigmoid_lut_element_98_107,
  input  wire [15:0] global_in__sigmoid_lut_element_99_108,
  input  wire [15:0] global_in__sigmoid_lut_element_100_109,
  input  wire [15:0] global_in__sigmoid_lut_element_101_110,
  input  wire [15:0] global_in__sigmoid_lut_element_102_111,
  input  wire [15:0] global_in__sigmoid_lut_element_103_112,
  input  wire [15:0] global_in__sigmoid_lut_element_104_113,
  input  wire [15:0] global_in__sigmoid_lut_element_105_114,
  input  wire [15:0] global_in__sigmoid_lut_element_106_115,
  input  wire [15:0] global_in__sigmoid_lut_element_107_116,
  input  wire [15:0] global_in__sigmoid_lut_element_108_117,
  input  wire [15:0] global_in__sigmoid_lut_element_109_118,
  input  wire [15:0] global_in__sigmoid_lut_element_110_119,
  input  wire [15:0] global_in__sigmoid_lut_element_111_120,
  input  wire [15:0] global_in__sigmoid_lut_element_112_121,
  input  wire [15:0] global_in__sigmoid_lut_element_113_122,
  input  wire [15:0] global_in__sigmoid_lut_element_114_123,
  input  wire [15:0] global_in__sigmoid_lut_element_115_124,
  input  wire [15:0] global_in__sigmoid_lut_element_116_125,
  input  wire [15:0] global_in__sigmoid_lut_element_117_126,
  input  wire [15:0] global_in__sigmoid_lut_element_118_127,
  input  wire [15:0] global_in__sigmoid_lut_element_119_128,
  input  wire [15:0] global_in__sigmoid_lut_element_120_129,
  input  wire [15:0] global_in__sigmoid_lut_element_121_130,
  input  wire [15:0] global_in__sigmoid_lut_element_122_131,
  input  wire [15:0] global_in__sigmoid_lut_element_123_132,
  input  wire [15:0] global_in__sigmoid_lut_element_124_133,
  input  wire [15:0] global_in__sigmoid_lut_element_125_134,
  input  wire [15:0] global_in__sigmoid_lut_element_126_135,
  input  wire [15:0] global_in__sigmoid_lut_element_127_136,
  input  wire [15:0] global_in__sigmoid_lut_element_128_137,
  input  wire [15:0] global_in__sigmoid_lut_element_129_138,
  input  wire [15:0] global_in__sigmoid_lut_element_130_139,
  input  wire [15:0] global_in__sigmoid_lut_element_131_140,
  input  wire [15:0] global_in__sigmoid_lut_element_132_141,
  input  wire [15:0] global_in__sigmoid_lut_element_133_142,
  input  wire [15:0] global_in__sigmoid_lut_element_134_143,
  input  wire [15:0] global_in__sigmoid_lut_element_135_144,
  input  wire [15:0] global_in__sigmoid_lut_element_136_145,
  input  wire [15:0] global_in__sigmoid_lut_element_137_146,
  input  wire [15:0] global_in__sigmoid_lut_element_138_147,
  input  wire [15:0] global_in__sigmoid_lut_element_139_148,
  input  wire [15:0] global_in__sigmoid_lut_element_140_149,
  input  wire [15:0] global_in__sigmoid_lut_element_141_150,
  input  wire [15:0] global_in__sigmoid_lut_element_142_151,
  input  wire [15:0] global_in__sigmoid_lut_element_143_152,
  input  wire [15:0] global_in__sigmoid_lut_element_144_153,
  input  wire [15:0] global_in__sigmoid_lut_element_145_154,
  input  wire [15:0] global_in__sigmoid_lut_element_146_155,
  input  wire [15:0] global_in__sigmoid_lut_element_147_156,
  input  wire [15:0] global_in__sigmoid_lut_element_148_157,
  input  wire [15:0] global_in__sigmoid_lut_element_149_158,
  input  wire [15:0] global_in__sigmoid_lut_element_150_159,
  input  wire [15:0] global_in__sigmoid_lut_element_151_160,
  input  wire [15:0] global_in__sigmoid_lut_element_152_161,
  input  wire [15:0] global_in__sigmoid_lut_element_153_162,
  input  wire [15:0] global_in__sigmoid_lut_element_154_163,
  input  wire [15:0] global_in__sigmoid_lut_element_155_164,
  input  wire [15:0] global_in__sigmoid_lut_element_156_165,
  input  wire [15:0] global_in__sigmoid_lut_element_157_166,
  input  wire [15:0] global_in__sigmoid_lut_element_158_167,
  input  wire [15:0] global_in__sigmoid_lut_element_159_168,
  input  wire [15:0] global_in__sigmoid_lut_element_160_169,
  input  wire [15:0] global_in__sigmoid_lut_element_161_170,
  input  wire [15:0] global_in__sigmoid_lut_element_162_171,
  input  wire [15:0] global_in__sigmoid_lut_element_163_172,
  input  wire [15:0] global_in__sigmoid_lut_element_164_173,
  input  wire [15:0] global_in__sigmoid_lut_element_165_174,
  input  wire [15:0] global_in__sigmoid_lut_element_166_175,
  input  wire [15:0] global_in__sigmoid_lut_element_167_176,
  input  wire [15:0] global_in__sigmoid_lut_element_168_177,
  input  wire [15:0] global_in__sigmoid_lut_element_169_178,
  input  wire [15:0] global_in__sigmoid_lut_element_170_179,
  input  wire [15:0] global_in__sigmoid_lut_element_171_180,
  input  wire [15:0] global_in__sigmoid_lut_element_172_181,
  input  wire [15:0] global_in__sigmoid_lut_element_173_182,
  input  wire [15:0] global_in__sigmoid_lut_element_174_183,
  input  wire [15:0] global_in__sigmoid_lut_element_175_184,
  input  wire [15:0] global_in__sigmoid_lut_element_176_185,
  input  wire [15:0] global_in__sigmoid_lut_element_177_186,
  input  wire [15:0] global_in__sigmoid_lut_element_178_187,
  input  wire [15:0] global_in__sigmoid_lut_element_179_188,
  input  wire [15:0] global_in__sigmoid_lut_element_180_189,
  input  wire [15:0] global_in__sigmoid_lut_element_181_190,
  input  wire [15:0] global_in__sigmoid_lut_element_182_191,
  input  wire [15:0] global_in__sigmoid_lut_element_183_192,
  input  wire [15:0] global_in__sigmoid_lut_element_184_193,
  input  wire [15:0] global_in__sigmoid_lut_element_185_194,
  input  wire [15:0] global_in__sigmoid_lut_element_186_195,
  input  wire [15:0] global_in__sigmoid_lut_element_187_196,
  input  wire [15:0] global_in__sigmoid_lut_element_188_197,
  input  wire [15:0] global_in__sigmoid_lut_element_189_198,
  input  wire [15:0] global_in__sigmoid_lut_element_190_199,
  input  wire [15:0] global_in__sigmoid_lut_element_191_200,
  input  wire [15:0] global_in__sigmoid_lut_element_192_201,
  input  wire [15:0] global_in__sigmoid_lut_element_193_202,
  input  wire [15:0] global_in__sigmoid_lut_element_194_203,
  input  wire [15:0] global_in__sigmoid_lut_element_195_204,
  input  wire [15:0] global_in__sigmoid_lut_element_196_205,
  input  wire [15:0] global_in__sigmoid_lut_element_197_206,
  input  wire [15:0] global_in__sigmoid_lut_element_198_207,
  input  wire [15:0] global_in__sigmoid_lut_element_199_208,
  input  wire [15:0] global_in__sigmoid_lut_element_200_209,
  input  wire [15:0] global_in__sigmoid_lut_element_201_210,
  input  wire [15:0] global_in__sigmoid_lut_element_202_211,
  input  wire [15:0] global_in__sigmoid_lut_element_203_212,
  input  wire [15:0] global_in__sigmoid_lut_element_204_213,
  input  wire [15:0] global_in__sigmoid_lut_element_205_214,
  input  wire [15:0] global_in__sigmoid_lut_element_206_215,
  input  wire [15:0] global_in__sigmoid_lut_element_207_216,
  input  wire [15:0] global_in__sigmoid_lut_element_208_217,
  input  wire [15:0] global_in__sigmoid_lut_element_209_218,
  input  wire [15:0] global_in__sigmoid_lut_element_210_219,
  input  wire [15:0] global_in__sigmoid_lut_element_211_220,
  input  wire [15:0] global_in__sigmoid_lut_element_212_221,
  input  wire [15:0] global_in__sigmoid_lut_element_213_222,
  input  wire [15:0] global_in__sigmoid_lut_element_214_223,
  input  wire [15:0] global_in__sigmoid_lut_element_215_224,
  input  wire [15:0] global_in__sigmoid_lut_element_216_225,
  input  wire [15:0] global_in__sigmoid_lut_element_217_226,
  input  wire [15:0] global_in__sigmoid_lut_element_218_227,
  input  wire [15:0] global_in__sigmoid_lut_element_219_228,
  input  wire [15:0] global_in__sigmoid_lut_element_220_229,
  input  wire [15:0] global_in__sigmoid_lut_element_221_230,
  input  wire [15:0] global_in__sigmoid_lut_element_222_231,
  input  wire [15:0] global_in__sigmoid_lut_element_223_232,
  input  wire [15:0] global_in__sigmoid_lut_element_224_233,
  input  wire [15:0] global_in__sigmoid_lut_element_225_234,
  input  wire [15:0] global_in__sigmoid_lut_element_226_235,
  input  wire [15:0] global_in__sigmoid_lut_element_227_236,
  input  wire [15:0] global_in__sigmoid_lut_element_228_237,
  input  wire [15:0] global_in__sigmoid_lut_element_229_238,
  input  wire [15:0] global_in__sigmoid_lut_element_230_239,
  input  wire [15:0] global_in__sigmoid_lut_element_231_240,
  input  wire [15:0] global_in__sigmoid_lut_element_232_241,
  input  wire [15:0] global_in__sigmoid_lut_element_233_242,
  input  wire [15:0] global_in__sigmoid_lut_element_234_243,
  input  wire [15:0] global_in__sigmoid_lut_element_235_244,
  input  wire [15:0] global_in__sigmoid_lut_element_236_245,
  input  wire [15:0] global_in__sigmoid_lut_element_237_246,
  input  wire [15:0] global_in__sigmoid_lut_element_238_247,
  input  wire [15:0] global_in__sigmoid_lut_element_239_248,
  input  wire [15:0] global_in__sigmoid_lut_element_240_249,
  input  wire [15:0] global_in__sigmoid_lut_element_241_250,
  input  wire [15:0] global_in__sigmoid_lut_element_242_251,
  input  wire [15:0] global_in__sigmoid_lut_element_243_252,
  input  wire [15:0] global_in__sigmoid_lut_element_244_253,
  input  wire [15:0] global_in__sigmoid_lut_element_245_254,
  input  wire [15:0] global_in__sigmoid_lut_element_246_255,
  input  wire [15:0] global_in__sigmoid_lut_element_247_256,
  input  wire [15:0] global_in__sigmoid_lut_element_248_257,
  input  wire [15:0] global_in__sigmoid_lut_element_249_258,
  input  wire [15:0] global_in__sigmoid_lut_element_250_259,
  input  wire [15:0] global_in__sigmoid_lut_element_251_260,
  input  wire [15:0] global_in__sigmoid_lut_element_252_261,
  input  wire [15:0] global_in__sigmoid_lut_element_253_262,
  input  wire [15:0] global_in__sigmoid_lut_element_254_263,
  input  wire [15:0] global_in__sigmoid_lut_element_255_264,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [15:0] data_in_6,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] global_in__sigmoid_lut_element_0_9_0 = global_in__sigmoid_lut_element_0_9;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_1_10_0 =
    global_in__sigmoid_lut_element_1_10;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_2_11_0 =
    global_in__sigmoid_lut_element_2_11;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_3_12_0 =
    global_in__sigmoid_lut_element_3_12;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_4_13_0 =
    global_in__sigmoid_lut_element_4_13;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_5_14_0 =
    global_in__sigmoid_lut_element_5_14;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_6_15_0 =
    global_in__sigmoid_lut_element_6_15;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_7_16_0 =
    global_in__sigmoid_lut_element_7_16;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_8_17_0 =
    global_in__sigmoid_lut_element_8_17;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_9_18_0 =
    global_in__sigmoid_lut_element_9_18;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_10_19_0 =
    global_in__sigmoid_lut_element_10_19;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_11_20_0 =
    global_in__sigmoid_lut_element_11_20;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_12_21_0 =
    global_in__sigmoid_lut_element_12_21;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_13_22_0 =
    global_in__sigmoid_lut_element_13_22;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_14_23_0 =
    global_in__sigmoid_lut_element_14_23;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_15_24_0 =
    global_in__sigmoid_lut_element_15_24;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_16_25_0 =
    global_in__sigmoid_lut_element_16_25;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_17_26_0 =
    global_in__sigmoid_lut_element_17_26;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_18_27_0 =
    global_in__sigmoid_lut_element_18_27;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_19_28_0 =
    global_in__sigmoid_lut_element_19_28;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_20_29_0 =
    global_in__sigmoid_lut_element_20_29;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_21_30_0 =
    global_in__sigmoid_lut_element_21_30;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_22_31_0 =
    global_in__sigmoid_lut_element_22_31;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_23_32_0 =
    global_in__sigmoid_lut_element_23_32;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_24_33_0 =
    global_in__sigmoid_lut_element_24_33;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_25_34_0 =
    global_in__sigmoid_lut_element_25_34;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_26_35_0 =
    global_in__sigmoid_lut_element_26_35;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_27_36_0 =
    global_in__sigmoid_lut_element_27_36;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_28_37_0 =
    global_in__sigmoid_lut_element_28_37;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_29_38_0 =
    global_in__sigmoid_lut_element_29_38;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_30_39_0 =
    global_in__sigmoid_lut_element_30_39;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_31_40_0 =
    global_in__sigmoid_lut_element_31_40;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_32_41_0 =
    global_in__sigmoid_lut_element_32_41;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_33_42_0 =
    global_in__sigmoid_lut_element_33_42;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_34_43_0 =
    global_in__sigmoid_lut_element_34_43;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_35_44_0 =
    global_in__sigmoid_lut_element_35_44;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_36_45_0 =
    global_in__sigmoid_lut_element_36_45;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_37_46_0 =
    global_in__sigmoid_lut_element_37_46;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_38_47_0 =
    global_in__sigmoid_lut_element_38_47;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_39_48_0 =
    global_in__sigmoid_lut_element_39_48;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_40_49_0 =
    global_in__sigmoid_lut_element_40_49;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_41_50_0 =
    global_in__sigmoid_lut_element_41_50;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_42_51_0 =
    global_in__sigmoid_lut_element_42_51;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_43_52_0 =
    global_in__sigmoid_lut_element_43_52;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_44_53_0 =
    global_in__sigmoid_lut_element_44_53;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_45_54_0 =
    global_in__sigmoid_lut_element_45_54;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_46_55_0 =
    global_in__sigmoid_lut_element_46_55;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_47_56_0 =
    global_in__sigmoid_lut_element_47_56;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_48_57_0 =
    global_in__sigmoid_lut_element_48_57;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_49_58_0 =
    global_in__sigmoid_lut_element_49_58;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_50_59_0 =
    global_in__sigmoid_lut_element_50_59;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_51_60_0 =
    global_in__sigmoid_lut_element_51_60;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_52_61_0 =
    global_in__sigmoid_lut_element_52_61;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_53_62_0 =
    global_in__sigmoid_lut_element_53_62;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_54_63_0 =
    global_in__sigmoid_lut_element_54_63;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_55_64_0 =
    global_in__sigmoid_lut_element_55_64;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_56_65_0 =
    global_in__sigmoid_lut_element_56_65;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_57_66_0 =
    global_in__sigmoid_lut_element_57_66;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_58_67_0 =
    global_in__sigmoid_lut_element_58_67;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_59_68_0 =
    global_in__sigmoid_lut_element_59_68;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_60_69_0 =
    global_in__sigmoid_lut_element_60_69;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_61_70_0 =
    global_in__sigmoid_lut_element_61_70;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_62_71_0 =
    global_in__sigmoid_lut_element_62_71;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_63_72_0 =
    global_in__sigmoid_lut_element_63_72;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_64_73_0 =
    global_in__sigmoid_lut_element_64_73;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_65_74_0 =
    global_in__sigmoid_lut_element_65_74;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_66_75_0 =
    global_in__sigmoid_lut_element_66_75;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_67_76_0 =
    global_in__sigmoid_lut_element_67_76;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_68_77_0 =
    global_in__sigmoid_lut_element_68_77;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_69_78_0 =
    global_in__sigmoid_lut_element_69_78;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_70_79_0 =
    global_in__sigmoid_lut_element_70_79;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_71_80_0 =
    global_in__sigmoid_lut_element_71_80;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_72_81_0 =
    global_in__sigmoid_lut_element_72_81;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_73_82_0 =
    global_in__sigmoid_lut_element_73_82;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_74_83_0 =
    global_in__sigmoid_lut_element_74_83;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_75_84_0 =
    global_in__sigmoid_lut_element_75_84;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_76_85_0 =
    global_in__sigmoid_lut_element_76_85;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_77_86_0 =
    global_in__sigmoid_lut_element_77_86;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_78_87_0 =
    global_in__sigmoid_lut_element_78_87;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_79_88_0 =
    global_in__sigmoid_lut_element_79_88;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_80_89_0 =
    global_in__sigmoid_lut_element_80_89;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_81_90_0 =
    global_in__sigmoid_lut_element_81_90;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_82_91_0 =
    global_in__sigmoid_lut_element_82_91;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_83_92_0 =
    global_in__sigmoid_lut_element_83_92;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_84_93_0 =
    global_in__sigmoid_lut_element_84_93;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_85_94_0 =
    global_in__sigmoid_lut_element_85_94;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_86_95_0 =
    global_in__sigmoid_lut_element_86_95;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_87_96_0 =
    global_in__sigmoid_lut_element_87_96;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_88_97_0 =
    global_in__sigmoid_lut_element_88_97;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_89_98_0 =
    global_in__sigmoid_lut_element_89_98;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_90_99_0 =
    global_in__sigmoid_lut_element_90_99;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_91_100_0 =
    global_in__sigmoid_lut_element_91_100;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_92_101_0 =
    global_in__sigmoid_lut_element_92_101;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_93_102_0 =
    global_in__sigmoid_lut_element_93_102;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_94_103_0 =
    global_in__sigmoid_lut_element_94_103;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_95_104_0 =
    global_in__sigmoid_lut_element_95_104;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_96_105_0 =
    global_in__sigmoid_lut_element_96_105;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_97_106_0 =
    global_in__sigmoid_lut_element_97_106;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_98_107_0 =
    global_in__sigmoid_lut_element_98_107;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_99_108_0 =
    global_in__sigmoid_lut_element_99_108;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_100_109_0 =
    global_in__sigmoid_lut_element_100_109;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_101_110_0 =
    global_in__sigmoid_lut_element_101_110;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_102_111_0 =
    global_in__sigmoid_lut_element_102_111;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_103_112_0 =
    global_in__sigmoid_lut_element_103_112;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_104_113_0 =
    global_in__sigmoid_lut_element_104_113;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_105_114_0 =
    global_in__sigmoid_lut_element_105_114;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_106_115_0 =
    global_in__sigmoid_lut_element_106_115;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_107_116_0 =
    global_in__sigmoid_lut_element_107_116;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_108_117_0 =
    global_in__sigmoid_lut_element_108_117;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_109_118_0 =
    global_in__sigmoid_lut_element_109_118;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_110_119_0 =
    global_in__sigmoid_lut_element_110_119;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_111_120_0 =
    global_in__sigmoid_lut_element_111_120;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_112_121_0 =
    global_in__sigmoid_lut_element_112_121;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_113_122_0 =
    global_in__sigmoid_lut_element_113_122;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_114_123_0 =
    global_in__sigmoid_lut_element_114_123;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_115_124_0 =
    global_in__sigmoid_lut_element_115_124;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_116_125_0 =
    global_in__sigmoid_lut_element_116_125;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_117_126_0 =
    global_in__sigmoid_lut_element_117_126;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_118_127_0 =
    global_in__sigmoid_lut_element_118_127;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_119_128_0 =
    global_in__sigmoid_lut_element_119_128;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_120_129_0 =
    global_in__sigmoid_lut_element_120_129;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_121_130_0 =
    global_in__sigmoid_lut_element_121_130;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_122_131_0 =
    global_in__sigmoid_lut_element_122_131;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_123_132_0 =
    global_in__sigmoid_lut_element_123_132;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_124_133_0 =
    global_in__sigmoid_lut_element_124_133;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_125_134_0 =
    global_in__sigmoid_lut_element_125_134;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_126_135_0 =
    global_in__sigmoid_lut_element_126_135;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_127_136_0 =
    global_in__sigmoid_lut_element_127_136;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_128_137_0 =
    global_in__sigmoid_lut_element_128_137;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_129_138_0 =
    global_in__sigmoid_lut_element_129_138;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_130_139_0 =
    global_in__sigmoid_lut_element_130_139;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_131_140_0 =
    global_in__sigmoid_lut_element_131_140;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_132_141_0 =
    global_in__sigmoid_lut_element_132_141;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_133_142_0 =
    global_in__sigmoid_lut_element_133_142;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_134_143_0 =
    global_in__sigmoid_lut_element_134_143;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_135_144_0 =
    global_in__sigmoid_lut_element_135_144;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_136_145_0 =
    global_in__sigmoid_lut_element_136_145;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_137_146_0 =
    global_in__sigmoid_lut_element_137_146;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_138_147_0 =
    global_in__sigmoid_lut_element_138_147;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_139_148_0 =
    global_in__sigmoid_lut_element_139_148;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_140_149_0 =
    global_in__sigmoid_lut_element_140_149;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_141_150_0 =
    global_in__sigmoid_lut_element_141_150;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_142_151_0 =
    global_in__sigmoid_lut_element_142_151;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_143_152_0 =
    global_in__sigmoid_lut_element_143_152;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_144_153_0 =
    global_in__sigmoid_lut_element_144_153;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_145_154_0 =
    global_in__sigmoid_lut_element_145_154;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_146_155_0 =
    global_in__sigmoid_lut_element_146_155;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_147_156_0 =
    global_in__sigmoid_lut_element_147_156;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_148_157_0 =
    global_in__sigmoid_lut_element_148_157;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_149_158_0 =
    global_in__sigmoid_lut_element_149_158;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_150_159_0 =
    global_in__sigmoid_lut_element_150_159;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_151_160_0 =
    global_in__sigmoid_lut_element_151_160;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_152_161_0 =
    global_in__sigmoid_lut_element_152_161;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_153_162_0 =
    global_in__sigmoid_lut_element_153_162;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_154_163_0 =
    global_in__sigmoid_lut_element_154_163;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_155_164_0 =
    global_in__sigmoid_lut_element_155_164;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_156_165_0 =
    global_in__sigmoid_lut_element_156_165;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_157_166_0 =
    global_in__sigmoid_lut_element_157_166;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_158_167_0 =
    global_in__sigmoid_lut_element_158_167;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_159_168_0 =
    global_in__sigmoid_lut_element_159_168;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_160_169_0 =
    global_in__sigmoid_lut_element_160_169;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_161_170_0 =
    global_in__sigmoid_lut_element_161_170;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_162_171_0 =
    global_in__sigmoid_lut_element_162_171;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_163_172_0 =
    global_in__sigmoid_lut_element_163_172;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_164_173_0 =
    global_in__sigmoid_lut_element_164_173;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_165_174_0 =
    global_in__sigmoid_lut_element_165_174;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_166_175_0 =
    global_in__sigmoid_lut_element_166_175;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_167_176_0 =
    global_in__sigmoid_lut_element_167_176;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_168_177_0 =
    global_in__sigmoid_lut_element_168_177;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_169_178_0 =
    global_in__sigmoid_lut_element_169_178;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_170_179_0 =
    global_in__sigmoid_lut_element_170_179;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_171_180_0 =
    global_in__sigmoid_lut_element_171_180;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_172_181_0 =
    global_in__sigmoid_lut_element_172_181;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_173_182_0 =
    global_in__sigmoid_lut_element_173_182;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_174_183_0 =
    global_in__sigmoid_lut_element_174_183;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_175_184_0 =
    global_in__sigmoid_lut_element_175_184;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_176_185_0 =
    global_in__sigmoid_lut_element_176_185;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_177_186_0 =
    global_in__sigmoid_lut_element_177_186;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_178_187_0 =
    global_in__sigmoid_lut_element_178_187;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_179_188_0 =
    global_in__sigmoid_lut_element_179_188;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_180_189_0 =
    global_in__sigmoid_lut_element_180_189;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_181_190_0 =
    global_in__sigmoid_lut_element_181_190;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_182_191_0 =
    global_in__sigmoid_lut_element_182_191;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_183_192_0 =
    global_in__sigmoid_lut_element_183_192;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_184_193_0 =
    global_in__sigmoid_lut_element_184_193;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_185_194_0 =
    global_in__sigmoid_lut_element_185_194;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_186_195_0 =
    global_in__sigmoid_lut_element_186_195;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_187_196_0 =
    global_in__sigmoid_lut_element_187_196;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_188_197_0 =
    global_in__sigmoid_lut_element_188_197;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_189_198_0 =
    global_in__sigmoid_lut_element_189_198;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_190_199_0 =
    global_in__sigmoid_lut_element_190_199;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_191_200_0 =
    global_in__sigmoid_lut_element_191_200;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_192_201_0 =
    global_in__sigmoid_lut_element_192_201;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_193_202_0 =
    global_in__sigmoid_lut_element_193_202;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_194_203_0 =
    global_in__sigmoid_lut_element_194_203;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_195_204_0 =
    global_in__sigmoid_lut_element_195_204;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_196_205_0 =
    global_in__sigmoid_lut_element_196_205;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_197_206_0 =
    global_in__sigmoid_lut_element_197_206;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_198_207_0 =
    global_in__sigmoid_lut_element_198_207;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_199_208_0 =
    global_in__sigmoid_lut_element_199_208;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_200_209_0 =
    global_in__sigmoid_lut_element_200_209;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_201_210_0 =
    global_in__sigmoid_lut_element_201_210;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_202_211_0 =
    global_in__sigmoid_lut_element_202_211;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_203_212_0 =
    global_in__sigmoid_lut_element_203_212;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_204_213_0 =
    global_in__sigmoid_lut_element_204_213;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_205_214_0 =
    global_in__sigmoid_lut_element_205_214;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_206_215_0 =
    global_in__sigmoid_lut_element_206_215;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_207_216_0 =
    global_in__sigmoid_lut_element_207_216;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_208_217_0 =
    global_in__sigmoid_lut_element_208_217;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_209_218_0 =
    global_in__sigmoid_lut_element_209_218;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_210_219_0 =
    global_in__sigmoid_lut_element_210_219;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_211_220_0 =
    global_in__sigmoid_lut_element_211_220;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_212_221_0 =
    global_in__sigmoid_lut_element_212_221;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_213_222_0 =
    global_in__sigmoid_lut_element_213_222;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_214_223_0 =
    global_in__sigmoid_lut_element_214_223;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_215_224_0 =
    global_in__sigmoid_lut_element_215_224;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_216_225_0 =
    global_in__sigmoid_lut_element_216_225;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_217_226_0 =
    global_in__sigmoid_lut_element_217_226;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_218_227_0 =
    global_in__sigmoid_lut_element_218_227;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_219_228_0 =
    global_in__sigmoid_lut_element_219_228;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_220_229_0 =
    global_in__sigmoid_lut_element_220_229;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_221_230_0 =
    global_in__sigmoid_lut_element_221_230;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_222_231_0 =
    global_in__sigmoid_lut_element_222_231;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_223_232_0 =
    global_in__sigmoid_lut_element_223_232;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_224_233_0 =
    global_in__sigmoid_lut_element_224_233;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_225_234_0 =
    global_in__sigmoid_lut_element_225_234;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_226_235_0 =
    global_in__sigmoid_lut_element_226_235;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_227_236_0 =
    global_in__sigmoid_lut_element_227_236;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_228_237_0 =
    global_in__sigmoid_lut_element_228_237;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_229_238_0 =
    global_in__sigmoid_lut_element_229_238;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_230_239_0 =
    global_in__sigmoid_lut_element_230_239;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_231_240_0 =
    global_in__sigmoid_lut_element_231_240;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_232_241_0 =
    global_in__sigmoid_lut_element_232_241;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_233_242_0 =
    global_in__sigmoid_lut_element_233_242;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_234_243_0 =
    global_in__sigmoid_lut_element_234_243;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_235_244_0 =
    global_in__sigmoid_lut_element_235_244;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_236_245_0 =
    global_in__sigmoid_lut_element_236_245;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_237_246_0 =
    global_in__sigmoid_lut_element_237_246;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_238_247_0 =
    global_in__sigmoid_lut_element_238_247;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_239_248_0 =
    global_in__sigmoid_lut_element_239_248;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_240_249_0 =
    global_in__sigmoid_lut_element_240_249;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_241_250_0 =
    global_in__sigmoid_lut_element_241_250;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_242_251_0 =
    global_in__sigmoid_lut_element_242_251;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_243_252_0 =
    global_in__sigmoid_lut_element_243_252;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_244_253_0 =
    global_in__sigmoid_lut_element_244_253;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_245_254_0 =
    global_in__sigmoid_lut_element_245_254;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_246_255_0 =
    global_in__sigmoid_lut_element_246_255;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_247_256_0 =
    global_in__sigmoid_lut_element_247_256;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_248_257_0 =
    global_in__sigmoid_lut_element_248_257;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_249_258_0 =
    global_in__sigmoid_lut_element_249_258;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_250_259_0 =
    global_in__sigmoid_lut_element_250_259;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_251_260_0 =
    global_in__sigmoid_lut_element_251_260;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_252_261_0 =
    global_in__sigmoid_lut_element_252_261;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_253_262_0 =
    global_in__sigmoid_lut_element_253_262;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_254_263_0 =
    global_in__sigmoid_lut_element_254_263;	// swiglu.k:41:9
  wire  [15:0] global_in__sigmoid_lut_element_255_264_0 =
    global_in__sigmoid_lut_element_255_264;	// swiglu.k:41:9
  logic        done_out_0;	// swiglu.k:41:9
  logic [15:0] fifo_data_out_0_0;	// swiglu.k:41:9
  logic        fifo_wren_0_0;	// swiglu.k:41:9
  logic        input_rdy_0_0;	// swiglu.k:41:9
  logic [7:0]  control_state_out_0;	// swiglu.k:41:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:41:9
  always_comb begin	// swiglu.k:41:9
    input_rdy_0_0 = _GEN;	// swiglu.k:41:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:41:9
  end // always_comb
  reg   [15:0] p0_data_in_6;	// swiglu.k:41:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:41:9
  reg   [15:0] p0_result;	// swiglu.k:41:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:41:9
  reg   [15:0] p0_result_0;	// swiglu.k:41:9
  reg          p0_stage3_enable = 1'h0;	// swiglu.k:41:9
  wire  [15:0] _sigmoid_lut =
    p0_data_in_6[15]
      ? (p0_data_in_6[14]
           ? (p0_data_in_6[13]
                ? (p0_data_in_6[12]
                     ? (p0_data_in_6[11]
                          ? (p0_data_in_6[10]
                               ? (p0_data_in_6[9]
                                    ? (p0_data_in_6[8]
                                         ? global_in__sigmoid_lut_element_255_264_0
                                         : global_in__sigmoid_lut_element_254_263_0)
                                    : p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_253_262_0
                                        : global_in__sigmoid_lut_element_252_261_0)
                               : p0_data_in_6[9]
                                   ? (p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_251_260_0
                                        : global_in__sigmoid_lut_element_250_259_0)
                                   : p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_249_258_0
                                       : global_in__sigmoid_lut_element_248_257_0)
                          : p0_data_in_6[10]
                              ? (p0_data_in_6[9]
                                   ? (p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_247_256_0
                                        : global_in__sigmoid_lut_element_246_255_0)
                                   : p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_245_254_0
                                       : global_in__sigmoid_lut_element_244_253_0)
                              : p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_243_252_0
                                       : global_in__sigmoid_lut_element_242_251_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_241_250_0
                                      : global_in__sigmoid_lut_element_240_249_0)
                     : p0_data_in_6[11]
                         ? (p0_data_in_6[10]
                              ? (p0_data_in_6[9]
                                   ? (p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_239_248_0
                                        : global_in__sigmoid_lut_element_238_247_0)
                                   : p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_237_246_0
                                       : global_in__sigmoid_lut_element_236_245_0)
                              : p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_235_244_0
                                       : global_in__sigmoid_lut_element_234_243_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_233_242_0
                                      : global_in__sigmoid_lut_element_232_241_0)
                         : p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_231_240_0
                                       : global_in__sigmoid_lut_element_230_239_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_229_238_0
                                      : global_in__sigmoid_lut_element_228_237_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_227_236_0
                                      : global_in__sigmoid_lut_element_226_235_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_225_234_0
                                     : global_in__sigmoid_lut_element_224_233_0)
                : p0_data_in_6[12]
                    ? (p0_data_in_6[11]
                         ? (p0_data_in_6[10]
                              ? (p0_data_in_6[9]
                                   ? (p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_223_232_0
                                        : global_in__sigmoid_lut_element_222_231_0)
                                   : p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_221_230_0
                                       : global_in__sigmoid_lut_element_220_229_0)
                              : p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_219_228_0
                                       : global_in__sigmoid_lut_element_218_227_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_217_226_0
                                      : global_in__sigmoid_lut_element_216_225_0)
                         : p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_215_224_0
                                       : global_in__sigmoid_lut_element_214_223_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_213_222_0
                                      : global_in__sigmoid_lut_element_212_221_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_211_220_0
                                      : global_in__sigmoid_lut_element_210_219_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_209_218_0
                                     : global_in__sigmoid_lut_element_208_217_0)
                    : p0_data_in_6[11]
                        ? (p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_207_216_0
                                       : global_in__sigmoid_lut_element_206_215_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_205_214_0
                                      : global_in__sigmoid_lut_element_204_213_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_203_212_0
                                      : global_in__sigmoid_lut_element_202_211_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_201_210_0
                                     : global_in__sigmoid_lut_element_200_209_0)
                        : p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_199_208_0
                                      : global_in__sigmoid_lut_element_198_207_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_197_206_0
                                     : global_in__sigmoid_lut_element_196_205_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_195_204_0
                                     : global_in__sigmoid_lut_element_194_203_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_193_202_0
                                    : global_in__sigmoid_lut_element_192_201_0)
           : p0_data_in_6[13]
               ? (p0_data_in_6[12]
                    ? (p0_data_in_6[11]
                         ? (p0_data_in_6[10]
                              ? (p0_data_in_6[9]
                                   ? (p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_191_200_0
                                        : global_in__sigmoid_lut_element_190_199_0)
                                   : p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_189_198_0
                                       : global_in__sigmoid_lut_element_188_197_0)
                              : p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_187_196_0
                                       : global_in__sigmoid_lut_element_186_195_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_185_194_0
                                      : global_in__sigmoid_lut_element_184_193_0)
                         : p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_183_192_0
                                       : global_in__sigmoid_lut_element_182_191_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_181_190_0
                                      : global_in__sigmoid_lut_element_180_189_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_179_188_0
                                      : global_in__sigmoid_lut_element_178_187_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_177_186_0
                                     : global_in__sigmoid_lut_element_176_185_0)
                    : p0_data_in_6[11]
                        ? (p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_175_184_0
                                       : global_in__sigmoid_lut_element_174_183_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_173_182_0
                                      : global_in__sigmoid_lut_element_172_181_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_171_180_0
                                      : global_in__sigmoid_lut_element_170_179_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_169_178_0
                                     : global_in__sigmoid_lut_element_168_177_0)
                        : p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_167_176_0
                                      : global_in__sigmoid_lut_element_166_175_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_165_174_0
                                     : global_in__sigmoid_lut_element_164_173_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_163_172_0
                                     : global_in__sigmoid_lut_element_162_171_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_161_170_0
                                    : global_in__sigmoid_lut_element_160_169_0)
               : p0_data_in_6[12]
                   ? (p0_data_in_6[11]
                        ? (p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_159_168_0
                                       : global_in__sigmoid_lut_element_158_167_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_157_166_0
                                      : global_in__sigmoid_lut_element_156_165_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_155_164_0
                                      : global_in__sigmoid_lut_element_154_163_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_153_162_0
                                     : global_in__sigmoid_lut_element_152_161_0)
                        : p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_151_160_0
                                      : global_in__sigmoid_lut_element_150_159_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_149_158_0
                                     : global_in__sigmoid_lut_element_148_157_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_147_156_0
                                     : global_in__sigmoid_lut_element_146_155_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_145_154_0
                                    : global_in__sigmoid_lut_element_144_153_0)
                   : p0_data_in_6[11]
                       ? (p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_143_152_0
                                      : global_in__sigmoid_lut_element_142_151_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_141_150_0
                                     : global_in__sigmoid_lut_element_140_149_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_139_148_0
                                     : global_in__sigmoid_lut_element_138_147_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_137_146_0
                                    : global_in__sigmoid_lut_element_136_145_0)
                       : p0_data_in_6[10]
                           ? (p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_135_144_0
                                     : global_in__sigmoid_lut_element_134_143_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_133_142_0
                                    : global_in__sigmoid_lut_element_132_141_0)
                           : p0_data_in_6[9]
                               ? (p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_131_140_0
                                    : global_in__sigmoid_lut_element_130_139_0)
                               : p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_129_138_0
                                   : global_in__sigmoid_lut_element_128_137_0)
      : p0_data_in_6[14]
          ? (p0_data_in_6[13]
               ? (p0_data_in_6[12]
                    ? (p0_data_in_6[11]
                         ? (p0_data_in_6[10]
                              ? (p0_data_in_6[9]
                                   ? (p0_data_in_6[8]
                                        ? global_in__sigmoid_lut_element_127_136_0
                                        : global_in__sigmoid_lut_element_126_135_0)
                                   : p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_125_134_0
                                       : global_in__sigmoid_lut_element_124_133_0)
                              : p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_123_132_0
                                       : global_in__sigmoid_lut_element_122_131_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_121_130_0
                                      : global_in__sigmoid_lut_element_120_129_0)
                         : p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_119_128_0
                                       : global_in__sigmoid_lut_element_118_127_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_117_126_0
                                      : global_in__sigmoid_lut_element_116_125_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_115_124_0
                                      : global_in__sigmoid_lut_element_114_123_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_113_122_0
                                     : global_in__sigmoid_lut_element_112_121_0)
                    : p0_data_in_6[11]
                        ? (p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_111_120_0
                                       : global_in__sigmoid_lut_element_110_119_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_109_118_0
                                      : global_in__sigmoid_lut_element_108_117_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_107_116_0
                                      : global_in__sigmoid_lut_element_106_115_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_105_114_0
                                     : global_in__sigmoid_lut_element_104_113_0)
                        : p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_103_112_0
                                      : global_in__sigmoid_lut_element_102_111_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_101_110_0
                                     : global_in__sigmoid_lut_element_100_109_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_99_108_0
                                     : global_in__sigmoid_lut_element_98_107_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_97_106_0
                                    : global_in__sigmoid_lut_element_96_105_0)
               : p0_data_in_6[12]
                   ? (p0_data_in_6[11]
                        ? (p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_95_104_0
                                       : global_in__sigmoid_lut_element_94_103_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_93_102_0
                                      : global_in__sigmoid_lut_element_92_101_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_91_100_0
                                      : global_in__sigmoid_lut_element_90_99_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_89_98_0
                                     : global_in__sigmoid_lut_element_88_97_0)
                        : p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_87_96_0
                                      : global_in__sigmoid_lut_element_86_95_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_85_94_0
                                     : global_in__sigmoid_lut_element_84_93_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_83_92_0
                                     : global_in__sigmoid_lut_element_82_91_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_81_90_0
                                    : global_in__sigmoid_lut_element_80_89_0)
                   : p0_data_in_6[11]
                       ? (p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_79_88_0
                                      : global_in__sigmoid_lut_element_78_87_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_77_86_0
                                     : global_in__sigmoid_lut_element_76_85_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_75_84_0
                                     : global_in__sigmoid_lut_element_74_83_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_73_82_0
                                    : global_in__sigmoid_lut_element_72_81_0)
                       : p0_data_in_6[10]
                           ? (p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_71_80_0
                                     : global_in__sigmoid_lut_element_70_79_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_69_78_0
                                    : global_in__sigmoid_lut_element_68_77_0)
                           : p0_data_in_6[9]
                               ? (p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_67_76_0
                                    : global_in__sigmoid_lut_element_66_75_0)
                               : p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_65_74_0
                                   : global_in__sigmoid_lut_element_64_73_0)
          : p0_data_in_6[13]
              ? (p0_data_in_6[12]
                   ? (p0_data_in_6[11]
                        ? (p0_data_in_6[10]
                             ? (p0_data_in_6[9]
                                  ? (p0_data_in_6[8]
                                       ? global_in__sigmoid_lut_element_63_72_0
                                       : global_in__sigmoid_lut_element_62_71_0)
                                  : p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_61_70_0
                                      : global_in__sigmoid_lut_element_60_69_0)
                             : p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_59_68_0
                                      : global_in__sigmoid_lut_element_58_67_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_57_66_0
                                     : global_in__sigmoid_lut_element_56_65_0)
                        : p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_55_64_0
                                      : global_in__sigmoid_lut_element_54_63_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_53_62_0
                                     : global_in__sigmoid_lut_element_52_61_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_51_60_0
                                     : global_in__sigmoid_lut_element_50_59_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_49_58_0
                                    : global_in__sigmoid_lut_element_48_57_0)
                   : p0_data_in_6[11]
                       ? (p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_47_56_0
                                      : global_in__sigmoid_lut_element_46_55_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_45_54_0
                                     : global_in__sigmoid_lut_element_44_53_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_43_52_0
                                     : global_in__sigmoid_lut_element_42_51_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_41_50_0
                                    : global_in__sigmoid_lut_element_40_49_0)
                       : p0_data_in_6[10]
                           ? (p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_39_48_0
                                     : global_in__sigmoid_lut_element_38_47_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_37_46_0
                                    : global_in__sigmoid_lut_element_36_45_0)
                           : p0_data_in_6[9]
                               ? (p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_35_44_0
                                    : global_in__sigmoid_lut_element_34_43_0)
                               : p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_33_42_0
                                   : global_in__sigmoid_lut_element_32_41_0)
              : p0_data_in_6[12]
                  ? (p0_data_in_6[11]
                       ? (p0_data_in_6[10]
                            ? (p0_data_in_6[9]
                                 ? (p0_data_in_6[8]
                                      ? global_in__sigmoid_lut_element_31_40_0
                                      : global_in__sigmoid_lut_element_30_39_0)
                                 : p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_29_38_0
                                     : global_in__sigmoid_lut_element_28_37_0)
                            : p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_27_36_0
                                     : global_in__sigmoid_lut_element_26_35_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_25_34_0
                                    : global_in__sigmoid_lut_element_24_33_0)
                       : p0_data_in_6[10]
                           ? (p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_23_32_0
                                     : global_in__sigmoid_lut_element_22_31_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_21_30_0
                                    : global_in__sigmoid_lut_element_20_29_0)
                           : p0_data_in_6[9]
                               ? (p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_19_28_0
                                    : global_in__sigmoid_lut_element_18_27_0)
                               : p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_17_26_0
                                   : global_in__sigmoid_lut_element_16_25_0)
                  : p0_data_in_6[11]
                      ? (p0_data_in_6[10]
                           ? (p0_data_in_6[9]
                                ? (p0_data_in_6[8]
                                     ? global_in__sigmoid_lut_element_15_24_0
                                     : global_in__sigmoid_lut_element_14_23_0)
                                : p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_13_22_0
                                    : global_in__sigmoid_lut_element_12_21_0)
                           : p0_data_in_6[9]
                               ? (p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_11_20_0
                                    : global_in__sigmoid_lut_element_10_19_0)
                               : p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_9_18_0
                                   : global_in__sigmoid_lut_element_8_17_0)
                      : p0_data_in_6[10]
                          ? (p0_data_in_6[9]
                               ? (p0_data_in_6[8]
                                    ? global_in__sigmoid_lut_element_7_16_0
                                    : global_in__sigmoid_lut_element_6_15_0)
                               : p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_5_14_0
                                   : global_in__sigmoid_lut_element_4_13_0)
                          : p0_data_in_6[9]
                              ? (p0_data_in_6[8]
                                   ? global_in__sigmoid_lut_element_3_12_0
                                   : global_in__sigmoid_lut_element_2_11_0)
                              : p0_data_in_6[8]
                                  ? global_in__sigmoid_lut_element_1_10_0
                                  : global_in__sigmoid_lut_element_0_9_0;	// swiglu.k:41:9, :45:26
  wire         prod = p0_data_in_6[6] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire         prod_0 = p0_data_in_6[5] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire         prod_1 = p0_data_in_6[4] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire         prod_2 = p0_data_in_6[3] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire         prod_3 = p0_data_in_6[2] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire         prod_4 = p0_data_in_6[1] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire         prod_5 = p0_data_in_6[0] & _sigmoid_lut[0];	// swiglu.k:41:9, :45:26, :55:{21,33}, :56:{21,33}, :58:35, :59:{21,25}
  wire  [15:0] _a_exp_plus_b_exp_ =
    16'({8'h0, p0_data_in_6[14:7]} + {8'h0, _sigmoid_lut[14:7]});	// swiglu.k:41:9, :45:26, :72:39, :77:39
  wire  [9:0]  _prod_plus_ma32_shl_1_ =
    10'({2'h0, _sigmoid_lut[0], prod, prod_0, prod_1, prod_2, prod_3, prod_4, prod_5}
        + {2'h1, p0_data_in_6[6:0], 1'h0});	// swiglu.k:41:9, :45:26, :56:{21,33}, :59:{21,25}, :60:{51,58}
  wire         prod_6 = _prod_plus_ma32_shl_1_[9] & _sigmoid_lut[1];	// swiglu.k:45:26, :56:{21,33}, :60:{21,25,51}
  wire         prod_7 = _prod_plus_ma32_shl_1_[8] & _sigmoid_lut[1];	// swiglu.k:45:26, :56:{21,33}, :60:{21,25,51}
  wire         prod_8 =
    _prod_plus_ma32_shl_1_[7]
      ? _sigmoid_lut[0] | _sigmoid_lut[1]
      : _sigmoid_lut[0] & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25,51}
  wire         prod_9 =
    _prod_plus_ma32_shl_1_[6] ? prod | _sigmoid_lut[1] : prod & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire         prod_10 =
    _prod_plus_ma32_shl_1_[5] ? prod_0 | _sigmoid_lut[1] : prod_0 & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire         prod_11 =
    _prod_plus_ma32_shl_1_[4] ? prod_1 | _sigmoid_lut[1] : prod_1 & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire         prod_12 =
    _prod_plus_ma32_shl_1_[3] ? prod_2 | _sigmoid_lut[1] : prod_2 & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire         prod_13 =
    _prod_plus_ma32_shl_1_[2] ? prod_3 | _sigmoid_lut[1] : prod_3 & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire         prod_14 =
    _prod_plus_ma32_shl_1_[1] ? prod_4 | _sigmoid_lut[1] : prod_4 & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire         prod_15 =
    _prod_plus_ma32_shl_1_[0] ? prod_5 | _sigmoid_lut[1] : prod_5 & ~(_sigmoid_lut[1]);	// swiglu.k:45:26, :56:{21,33}, :59:{21,25}, :60:{21,25,51}
  wire  [10:0] _prod_plus_ma32_shl_2_ =
    11'({1'h0,
         prod_6,
         prod_7,
         prod_8,
         prod_9,
         prod_10,
         prod_11,
         prod_12,
         prod_13,
         prod_14,
         prod_15} + {2'h1, p0_data_in_6[6:0], 2'h0});	// swiglu.k:41:9, :60:{21,25}, :61:{51,58}
  wire         prod_16 = _prod_plus_ma32_shl_2_[10] & _sigmoid_lut[2];	// swiglu.k:45:26, :56:{21,33}, :61:{21,25,51}
  wire         prod_17 =
    _prod_plus_ma32_shl_2_[9] ? prod_6 | _sigmoid_lut[2] : prod_6 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_18 =
    _prod_plus_ma32_shl_2_[8] ? prod_7 | _sigmoid_lut[2] : prod_7 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_19 =
    _prod_plus_ma32_shl_2_[7] ? prod_8 | _sigmoid_lut[2] : prod_8 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_20 =
    _prod_plus_ma32_shl_2_[6] ? prod_9 | _sigmoid_lut[2] : prod_9 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_21 =
    _prod_plus_ma32_shl_2_[5] ? prod_10 | _sigmoid_lut[2] : prod_10 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_22 =
    _prod_plus_ma32_shl_2_[4] ? prod_11 | _sigmoid_lut[2] : prod_11 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_23 =
    _prod_plus_ma32_shl_2_[3] ? prod_12 | _sigmoid_lut[2] : prod_12 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_24 =
    _prod_plus_ma32_shl_2_[2] ? prod_13 | _sigmoid_lut[2] : prod_13 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_25 =
    _prod_plus_ma32_shl_2_[1] ? prod_14 | _sigmoid_lut[2] : prod_14 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire         prod_26 =
    _prod_plus_ma32_shl_2_[0] ? prod_15 | _sigmoid_lut[2] : prod_15 & ~(_sigmoid_lut[2]);	// swiglu.k:45:26, :56:{21,33}, :60:{21,25}, :61:{21,25,51}
  wire  [11:0] _prod_plus_ma32_shl_3_ =
    12'({1'h0,
         prod_16,
         prod_17,
         prod_18,
         prod_19,
         prod_20,
         prod_21,
         prod_22,
         prod_23,
         prod_24,
         prod_25,
         prod_26} + {2'h1, p0_data_in_6[6:0], 3'h0});	// swiglu.k:41:9, :61:{21,25}, :62:{51,58}
  wire         prod_27 = _prod_plus_ma32_shl_3_[11] & _sigmoid_lut[3];	// swiglu.k:45:26, :56:{21,33}, :62:{21,25,51}
  wire         prod_28 =
    _prod_plus_ma32_shl_3_[10] ? prod_16 | _sigmoid_lut[3] : prod_16 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_29 =
    _prod_plus_ma32_shl_3_[9] ? prod_17 | _sigmoid_lut[3] : prod_17 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_30 =
    _prod_plus_ma32_shl_3_[8] ? prod_18 | _sigmoid_lut[3] : prod_18 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_31 =
    _prod_plus_ma32_shl_3_[7] ? prod_19 | _sigmoid_lut[3] : prod_19 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_32 =
    _prod_plus_ma32_shl_3_[6] ? prod_20 | _sigmoid_lut[3] : prod_20 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_33 =
    _prod_plus_ma32_shl_3_[5] ? prod_21 | _sigmoid_lut[3] : prod_21 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_34 =
    _prod_plus_ma32_shl_3_[4] ? prod_22 | _sigmoid_lut[3] : prod_22 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_35 =
    _prod_plus_ma32_shl_3_[3] ? prod_23 | _sigmoid_lut[3] : prod_23 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_36 =
    _prod_plus_ma32_shl_3_[2] ? prod_24 | _sigmoid_lut[3] : prod_24 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_37 =
    _prod_plus_ma32_shl_3_[1] ? prod_25 | _sigmoid_lut[3] : prod_25 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire         prod_38 =
    _prod_plus_ma32_shl_3_[0] ? prod_26 | _sigmoid_lut[3] : prod_26 & ~(_sigmoid_lut[3]);	// swiglu.k:45:26, :56:{21,33}, :61:{21,25}, :62:{21,25,51}
  wire  [12:0] _prod_plus_ma32_shl_4_ =
    13'({1'h0,
         prod_27,
         prod_28,
         prod_29,
         prod_30,
         prod_31,
         prod_32,
         prod_33,
         prod_34,
         prod_35,
         prod_36,
         prod_37,
         prod_38} + {2'h1, p0_data_in_6[6:0], 4'h0});	// swiglu.k:41:9, :62:{21,25}, :63:{51,58}
  wire         prod_39 = _prod_plus_ma32_shl_4_[12] & _sigmoid_lut[4];	// swiglu.k:45:26, :56:{21,33}, :63:{21,25,51}
  wire         prod_40 =
    _prod_plus_ma32_shl_4_[11] ? prod_27 | _sigmoid_lut[4] : prod_27 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_41 =
    _prod_plus_ma32_shl_4_[10] ? prod_28 | _sigmoid_lut[4] : prod_28 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_42 =
    _prod_plus_ma32_shl_4_[9] ? prod_29 | _sigmoid_lut[4] : prod_29 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_43 =
    _prod_plus_ma32_shl_4_[8] ? prod_30 | _sigmoid_lut[4] : prod_30 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_44 =
    _prod_plus_ma32_shl_4_[7] ? prod_31 | _sigmoid_lut[4] : prod_31 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_45 =
    _prod_plus_ma32_shl_4_[6] ? prod_32 | _sigmoid_lut[4] : prod_32 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_46 =
    _prod_plus_ma32_shl_4_[5] ? prod_33 | _sigmoid_lut[4] : prod_33 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_47 =
    _prod_plus_ma32_shl_4_[4] ? prod_34 | _sigmoid_lut[4] : prod_34 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_48 =
    _prod_plus_ma32_shl_4_[3] ? prod_35 | _sigmoid_lut[4] : prod_35 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_49 =
    _prod_plus_ma32_shl_4_[2] ? prod_36 | _sigmoid_lut[4] : prod_36 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_50 =
    _prod_plus_ma32_shl_4_[1] ? prod_37 | _sigmoid_lut[4] : prod_37 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire         prod_51 =
    _prod_plus_ma32_shl_4_[0] ? prod_38 | _sigmoid_lut[4] : prod_38 & ~(_sigmoid_lut[4]);	// swiglu.k:45:26, :56:{21,33}, :62:{21,25}, :63:{21,25,51}
  wire  [13:0] _prod_plus_ma32_shl_5_ =
    14'({1'h0,
         prod_39,
         prod_40,
         prod_41,
         prod_42,
         prod_43,
         prod_44,
         prod_45,
         prod_46,
         prod_47,
         prod_48,
         prod_49,
         prod_50,
         prod_51} + {2'h1, p0_data_in_6[6:0], 5'h0});	// swiglu.k:41:9, :63:{21,25}, :64:{51,58}
  wire         prod_52 = _prod_plus_ma32_shl_5_[13] & _sigmoid_lut[5];	// swiglu.k:45:26, :56:{21,33}, :64:{21,25,51}
  wire         prod_53 =
    _prod_plus_ma32_shl_5_[12] ? prod_39 | _sigmoid_lut[5] : prod_39 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_54 =
    _prod_plus_ma32_shl_5_[11] ? prod_40 | _sigmoid_lut[5] : prod_40 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_55 =
    _prod_plus_ma32_shl_5_[10] ? prod_41 | _sigmoid_lut[5] : prod_41 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_56 =
    _prod_plus_ma32_shl_5_[9] ? prod_42 | _sigmoid_lut[5] : prod_42 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_57 =
    _prod_plus_ma32_shl_5_[8] ? prod_43 | _sigmoid_lut[5] : prod_43 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_58 =
    _prod_plus_ma32_shl_5_[7] ? prod_44 | _sigmoid_lut[5] : prod_44 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_59 =
    _prod_plus_ma32_shl_5_[6] ? prod_45 | _sigmoid_lut[5] : prod_45 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_60 =
    _prod_plus_ma32_shl_5_[5] ? prod_46 | _sigmoid_lut[5] : prod_46 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_61 =
    _prod_plus_ma32_shl_5_[4] ? prod_47 | _sigmoid_lut[5] : prod_47 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_62 =
    _prod_plus_ma32_shl_5_[3] ? prod_48 | _sigmoid_lut[5] : prod_48 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_63 =
    _prod_plus_ma32_shl_5_[2] ? prod_49 | _sigmoid_lut[5] : prod_49 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_64 =
    _prod_plus_ma32_shl_5_[1] ? prod_50 | _sigmoid_lut[5] : prod_50 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire         prod_65 =
    _prod_plus_ma32_shl_5_[0] ? prod_51 | _sigmoid_lut[5] : prod_51 & ~(_sigmoid_lut[5]);	// swiglu.k:45:26, :56:{21,33}, :63:{21,25}, :64:{21,25,51}
  wire  [14:0] _prod_plus_ma32_shl_6_ =
    15'({1'h0,
         prod_52,
         prod_53,
         prod_54,
         prod_55,
         prod_56,
         prod_57,
         prod_58,
         prod_59,
         prod_60,
         prod_61,
         prod_62,
         prod_63,
         prod_64,
         prod_65} + {2'h1, p0_data_in_6[6:0], 6'h0});	// swiglu.k:41:9, :64:{21,25}, :65:{51,58}
  wire  [15:0] _prod_plus_ma32_shl_7_ =
    16'({1'h0,
         _prod_plus_ma32_shl_6_[14] & _sigmoid_lut[6],
         _prod_plus_ma32_shl_6_[13]
           ? prod_52 | _sigmoid_lut[6]
           : prod_52 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[12]
           ? prod_53 | _sigmoid_lut[6]
           : prod_53 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[11]
           ? prod_54 | _sigmoid_lut[6]
           : prod_54 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[10]
           ? prod_55 | _sigmoid_lut[6]
           : prod_55 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[9]
           ? prod_56 | _sigmoid_lut[6]
           : prod_56 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[8]
           ? prod_57 | _sigmoid_lut[6]
           : prod_57 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[7]
           ? prod_58 | _sigmoid_lut[6]
           : prod_58 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[6]
           ? prod_59 | _sigmoid_lut[6]
           : prod_59 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[5]
           ? prod_60 | _sigmoid_lut[6]
           : prod_60 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[4]
           ? prod_61 | _sigmoid_lut[6]
           : prod_61 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[3]
           ? prod_62 | _sigmoid_lut[6]
           : prod_62 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[2]
           ? prod_63 | _sigmoid_lut[6]
           : prod_63 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[1]
           ? prod_64 | _sigmoid_lut[6]
           : prod_64 & ~(_sigmoid_lut[6]),
         _prod_plus_ma32_shl_6_[0]
           ? prod_65 | _sigmoid_lut[6]
           : prod_65 & ~(_sigmoid_lut[6])} + {2'h1, p0_data_in_6[6:0], 7'h0});	// swiglu.k:41:9, :45:26, :56:{21,33}, :64:{21,25}, :65:{21,51}, :66:{51,58}
  wire  [15:0] r_exp =
    _prod_plus_ma32_shl_7_[15]
      ? 16'(_a_exp_plus_b_exp_ - 16'h7E)
      : 16'(_a_exp_plus_b_exp_ - 16'h7F);	// swiglu.k:66:{21,51}, :69:21, :72:{33,39,47}, :77:{33,39}
  wire         _GEN_0 = r_exp < 16'hFF & (|r_exp);	// swiglu.k:54:{21,37,38,58}, :69:21, :71:{34,47}, :76:{34,47}, :79:{21,25,31,44}, :81:{34,49,51}
  wire         _GEN_1 = ~(_prod_plus_ma32_shl_7_[15]) & _GEN_0;	// swiglu.k:54:{21,37,38,58}, :66:{21,51}, :69:21, :71:{34,47}, :76:{34,47}, :79:{21,25}, :81:{34,49,51}
  wire         _GEN_2 = (|(_sigmoid_lut[14:7])) & (|(p0_data_in_6[14:7]));	// swiglu.k:41:9, :45:26, :50:{17,32}, :51:{17,32}, :52:{17,21,27,41}
  always @(posedge clk) begin	// swiglu.k:41:9
    p0_data_in_6 <= data_in_6;	// swiglu.k:41:9
    if (rst)	// swiglu.k:41:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:41:9
    else	// swiglu.k:41:9
      p0_stage1_enable <= _GEN & input_valid_0;	// swiglu.k:41:9
    p0_result <=
      {(r_exp[8]
          ? _GEN_0
          : _sigmoid_lut[15] ? ~(p0_data_in_6[15]) & _GEN_0 : p0_data_in_6[15] & _GEN_0)
         & _GEN_2,
       r_exp[7] & _GEN_0 & _GEN_2,
       r_exp[6] & _GEN_0 & _GEN_2,
       r_exp[5] & _GEN_0 & _GEN_2,
       r_exp[4] & _GEN_0 & _GEN_2,
       r_exp[3] & _GEN_0 & _GEN_2,
       r_exp[2] & _GEN_0 & _GEN_2,
       r_exp[1] & _GEN_0 & _GEN_2,
       r_exp[0] & _GEN_0 & _GEN_2,
       (_prod_plus_ma32_shl_7_[14]
          ? (_prod_plus_ma32_shl_7_[13] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[13] & _GEN_1) & _GEN_2,
       (_prod_plus_ma32_shl_7_[13]
          ? (_prod_plus_ma32_shl_7_[12] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[12] & _GEN_1) & _GEN_2,
       (_prod_plus_ma32_shl_7_[12]
          ? (_prod_plus_ma32_shl_7_[11] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[11] & _GEN_1) & _GEN_2,
       (_prod_plus_ma32_shl_7_[11]
          ? (_prod_plus_ma32_shl_7_[10] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[10] & _GEN_1) & _GEN_2,
       (_prod_plus_ma32_shl_7_[10]
          ? (_prod_plus_ma32_shl_7_[9] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[9] & _GEN_1) & _GEN_2,
       (_prod_plus_ma32_shl_7_[9]
          ? (_prod_plus_ma32_shl_7_[8] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[8] & _GEN_1) & _GEN_2,
       (_prod_plus_ma32_shl_7_[8]
          ? (_prod_plus_ma32_shl_7_[7] | _prod_plus_ma32_shl_7_[15]) & _GEN_0
          : _prod_plus_ma32_shl_7_[7] & _GEN_1) & _GEN_2};	// swiglu.k:41:9, :45:26, :52:{17,21}, :54:{21,37,38,58}, :66:{21,51}, :69:21, :71:{34,47}, :76:{34,47}, :79:{21,25}, :81:{34,49,51}
    if (rst)	// swiglu.k:41:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:41:9
    else	// swiglu.k:41:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:41:9
    p0_result_0 <= p0_result;	// swiglu.k:41:9
    if (rst)	// swiglu.k:41:9
      p0_stage3_enable <= 1'h0;	// swiglu.k:41:9
    else	// swiglu.k:41:9
      p0_stage3_enable <= p0_stage2_enable;	// swiglu.k:41:9
  end // always @(posedge)
  always_comb begin	// swiglu.k:41:9
    fifo_wren_0_0 = p0_stage3_enable;	// swiglu.k:39:5, :41:9
    fifo_data_out_0_0 = p0_result_0;	// swiglu.k:39:5, :41:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:41:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:41:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_compute_siluEntry swiglu_unitDebugView_compute_siluEntry_instance (	// swiglu.k:39:5
    .clk        (clk),	// swiglu.k:39:5
    ._gate_bf16 (p0_stage1_enable ? p0_data_in_6 : 'x),	// swiglu.k:39:5, :41:9
    .valid      (p0_stage1_enable),	// swiglu.k:41:9
    .valid_out  (/* unused */)
  );	// swiglu.k:39:5
  swiglu_unitDebugView_compute_siluExit swiglu_unitDebugView_compute_siluExit_instance (	// swiglu.k:39:5
    .clk          (clk),	// swiglu.k:39:5
    ._ReturnValue (p0_stage2_enable ? p0_result : 'x),	// swiglu.k:39:5, :41:9
    .valid        (p0_stage2_enable),	// swiglu.k:41:9
    .valid_out    (/* unused */)
  );	// swiglu.k:39:5
  assign done_out = p0_stage3_enable;	// swiglu.k:41:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// swiglu.k:41:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:41:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:41:9
  assign control_state_out = control_state_out_0;	// swiglu.k:41:9
endmodule

module swiglu_unit_lookup_sigmoid_BasicBlock_0(	// swiglu.k:28:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  input  wire [15:0] global_in__sigmoid_lut_element_0_9,
  input  wire [15:0] global_in__sigmoid_lut_element_1_10,
  input  wire [15:0] global_in__sigmoid_lut_element_2_11,
  input  wire [15:0] global_in__sigmoid_lut_element_3_12,
  input  wire [15:0] global_in__sigmoid_lut_element_4_13,
  input  wire [15:0] global_in__sigmoid_lut_element_5_14,
  input  wire [15:0] global_in__sigmoid_lut_element_6_15,
  input  wire [15:0] global_in__sigmoid_lut_element_7_16,
  input  wire [15:0] global_in__sigmoid_lut_element_8_17,
  input  wire [15:0] global_in__sigmoid_lut_element_9_18,
  input  wire [15:0] global_in__sigmoid_lut_element_10_19,
  input  wire [15:0] global_in__sigmoid_lut_element_11_20,
  input  wire [15:0] global_in__sigmoid_lut_element_12_21,
  input  wire [15:0] global_in__sigmoid_lut_element_13_22,
  input  wire [15:0] global_in__sigmoid_lut_element_14_23,
  input  wire [15:0] global_in__sigmoid_lut_element_15_24,
  input  wire [15:0] global_in__sigmoid_lut_element_16_25,
  input  wire [15:0] global_in__sigmoid_lut_element_17_26,
  input  wire [15:0] global_in__sigmoid_lut_element_18_27,
  input  wire [15:0] global_in__sigmoid_lut_element_19_28,
  input  wire [15:0] global_in__sigmoid_lut_element_20_29,
  input  wire [15:0] global_in__sigmoid_lut_element_21_30,
  input  wire [15:0] global_in__sigmoid_lut_element_22_31,
  input  wire [15:0] global_in__sigmoid_lut_element_23_32,
  input  wire [15:0] global_in__sigmoid_lut_element_24_33,
  input  wire [15:0] global_in__sigmoid_lut_element_25_34,
  input  wire [15:0] global_in__sigmoid_lut_element_26_35,
  input  wire [15:0] global_in__sigmoid_lut_element_27_36,
  input  wire [15:0] global_in__sigmoid_lut_element_28_37,
  input  wire [15:0] global_in__sigmoid_lut_element_29_38,
  input  wire [15:0] global_in__sigmoid_lut_element_30_39,
  input  wire [15:0] global_in__sigmoid_lut_element_31_40,
  input  wire [15:0] global_in__sigmoid_lut_element_32_41,
  input  wire [15:0] global_in__sigmoid_lut_element_33_42,
  input  wire [15:0] global_in__sigmoid_lut_element_34_43,
  input  wire [15:0] global_in__sigmoid_lut_element_35_44,
  input  wire [15:0] global_in__sigmoid_lut_element_36_45,
  input  wire [15:0] global_in__sigmoid_lut_element_37_46,
  input  wire [15:0] global_in__sigmoid_lut_element_38_47,
  input  wire [15:0] global_in__sigmoid_lut_element_39_48,
  input  wire [15:0] global_in__sigmoid_lut_element_40_49,
  input  wire [15:0] global_in__sigmoid_lut_element_41_50,
  input  wire [15:0] global_in__sigmoid_lut_element_42_51,
  input  wire [15:0] global_in__sigmoid_lut_element_43_52,
  input  wire [15:0] global_in__sigmoid_lut_element_44_53,
  input  wire [15:0] global_in__sigmoid_lut_element_45_54,
  input  wire [15:0] global_in__sigmoid_lut_element_46_55,
  input  wire [15:0] global_in__sigmoid_lut_element_47_56,
  input  wire [15:0] global_in__sigmoid_lut_element_48_57,
  input  wire [15:0] global_in__sigmoid_lut_element_49_58,
  input  wire [15:0] global_in__sigmoid_lut_element_50_59,
  input  wire [15:0] global_in__sigmoid_lut_element_51_60,
  input  wire [15:0] global_in__sigmoid_lut_element_52_61,
  input  wire [15:0] global_in__sigmoid_lut_element_53_62,
  input  wire [15:0] global_in__sigmoid_lut_element_54_63,
  input  wire [15:0] global_in__sigmoid_lut_element_55_64,
  input  wire [15:0] global_in__sigmoid_lut_element_56_65,
  input  wire [15:0] global_in__sigmoid_lut_element_57_66,
  input  wire [15:0] global_in__sigmoid_lut_element_58_67,
  input  wire [15:0] global_in__sigmoid_lut_element_59_68,
  input  wire [15:0] global_in__sigmoid_lut_element_60_69,
  input  wire [15:0] global_in__sigmoid_lut_element_61_70,
  input  wire [15:0] global_in__sigmoid_lut_element_62_71,
  input  wire [15:0] global_in__sigmoid_lut_element_63_72,
  input  wire [15:0] global_in__sigmoid_lut_element_64_73,
  input  wire [15:0] global_in__sigmoid_lut_element_65_74,
  input  wire [15:0] global_in__sigmoid_lut_element_66_75,
  input  wire [15:0] global_in__sigmoid_lut_element_67_76,
  input  wire [15:0] global_in__sigmoid_lut_element_68_77,
  input  wire [15:0] global_in__sigmoid_lut_element_69_78,
  input  wire [15:0] global_in__sigmoid_lut_element_70_79,
  input  wire [15:0] global_in__sigmoid_lut_element_71_80,
  input  wire [15:0] global_in__sigmoid_lut_element_72_81,
  input  wire [15:0] global_in__sigmoid_lut_element_73_82,
  input  wire [15:0] global_in__sigmoid_lut_element_74_83,
  input  wire [15:0] global_in__sigmoid_lut_element_75_84,
  input  wire [15:0] global_in__sigmoid_lut_element_76_85,
  input  wire [15:0] global_in__sigmoid_lut_element_77_86,
  input  wire [15:0] global_in__sigmoid_lut_element_78_87,
  input  wire [15:0] global_in__sigmoid_lut_element_79_88,
  input  wire [15:0] global_in__sigmoid_lut_element_80_89,
  input  wire [15:0] global_in__sigmoid_lut_element_81_90,
  input  wire [15:0] global_in__sigmoid_lut_element_82_91,
  input  wire [15:0] global_in__sigmoid_lut_element_83_92,
  input  wire [15:0] global_in__sigmoid_lut_element_84_93,
  input  wire [15:0] global_in__sigmoid_lut_element_85_94,
  input  wire [15:0] global_in__sigmoid_lut_element_86_95,
  input  wire [15:0] global_in__sigmoid_lut_element_87_96,
  input  wire [15:0] global_in__sigmoid_lut_element_88_97,
  input  wire [15:0] global_in__sigmoid_lut_element_89_98,
  input  wire [15:0] global_in__sigmoid_lut_element_90_99,
  input  wire [15:0] global_in__sigmoid_lut_element_91_100,
  input  wire [15:0] global_in__sigmoid_lut_element_92_101,
  input  wire [15:0] global_in__sigmoid_lut_element_93_102,
  input  wire [15:0] global_in__sigmoid_lut_element_94_103,
  input  wire [15:0] global_in__sigmoid_lut_element_95_104,
  input  wire [15:0] global_in__sigmoid_lut_element_96_105,
  input  wire [15:0] global_in__sigmoid_lut_element_97_106,
  input  wire [15:0] global_in__sigmoid_lut_element_98_107,
  input  wire [15:0] global_in__sigmoid_lut_element_99_108,
  input  wire [15:0] global_in__sigmoid_lut_element_100_109,
  input  wire [15:0] global_in__sigmoid_lut_element_101_110,
  input  wire [15:0] global_in__sigmoid_lut_element_102_111,
  input  wire [15:0] global_in__sigmoid_lut_element_103_112,
  input  wire [15:0] global_in__sigmoid_lut_element_104_113,
  input  wire [15:0] global_in__sigmoid_lut_element_105_114,
  input  wire [15:0] global_in__sigmoid_lut_element_106_115,
  input  wire [15:0] global_in__sigmoid_lut_element_107_116,
  input  wire [15:0] global_in__sigmoid_lut_element_108_117,
  input  wire [15:0] global_in__sigmoid_lut_element_109_118,
  input  wire [15:0] global_in__sigmoid_lut_element_110_119,
  input  wire [15:0] global_in__sigmoid_lut_element_111_120,
  input  wire [15:0] global_in__sigmoid_lut_element_112_121,
  input  wire [15:0] global_in__sigmoid_lut_element_113_122,
  input  wire [15:0] global_in__sigmoid_lut_element_114_123,
  input  wire [15:0] global_in__sigmoid_lut_element_115_124,
  input  wire [15:0] global_in__sigmoid_lut_element_116_125,
  input  wire [15:0] global_in__sigmoid_lut_element_117_126,
  input  wire [15:0] global_in__sigmoid_lut_element_118_127,
  input  wire [15:0] global_in__sigmoid_lut_element_119_128,
  input  wire [15:0] global_in__sigmoid_lut_element_120_129,
  input  wire [15:0] global_in__sigmoid_lut_element_121_130,
  input  wire [15:0] global_in__sigmoid_lut_element_122_131,
  input  wire [15:0] global_in__sigmoid_lut_element_123_132,
  input  wire [15:0] global_in__sigmoid_lut_element_124_133,
  input  wire [15:0] global_in__sigmoid_lut_element_125_134,
  input  wire [15:0] global_in__sigmoid_lut_element_126_135,
  input  wire [15:0] global_in__sigmoid_lut_element_127_136,
  input  wire [15:0] global_in__sigmoid_lut_element_128_137,
  input  wire [15:0] global_in__sigmoid_lut_element_129_138,
  input  wire [15:0] global_in__sigmoid_lut_element_130_139,
  input  wire [15:0] global_in__sigmoid_lut_element_131_140,
  input  wire [15:0] global_in__sigmoid_lut_element_132_141,
  input  wire [15:0] global_in__sigmoid_lut_element_133_142,
  input  wire [15:0] global_in__sigmoid_lut_element_134_143,
  input  wire [15:0] global_in__sigmoid_lut_element_135_144,
  input  wire [15:0] global_in__sigmoid_lut_element_136_145,
  input  wire [15:0] global_in__sigmoid_lut_element_137_146,
  input  wire [15:0] global_in__sigmoid_lut_element_138_147,
  input  wire [15:0] global_in__sigmoid_lut_element_139_148,
  input  wire [15:0] global_in__sigmoid_lut_element_140_149,
  input  wire [15:0] global_in__sigmoid_lut_element_141_150,
  input  wire [15:0] global_in__sigmoid_lut_element_142_151,
  input  wire [15:0] global_in__sigmoid_lut_element_143_152,
  input  wire [15:0] global_in__sigmoid_lut_element_144_153,
  input  wire [15:0] global_in__sigmoid_lut_element_145_154,
  input  wire [15:0] global_in__sigmoid_lut_element_146_155,
  input  wire [15:0] global_in__sigmoid_lut_element_147_156,
  input  wire [15:0] global_in__sigmoid_lut_element_148_157,
  input  wire [15:0] global_in__sigmoid_lut_element_149_158,
  input  wire [15:0] global_in__sigmoid_lut_element_150_159,
  input  wire [15:0] global_in__sigmoid_lut_element_151_160,
  input  wire [15:0] global_in__sigmoid_lut_element_152_161,
  input  wire [15:0] global_in__sigmoid_lut_element_153_162,
  input  wire [15:0] global_in__sigmoid_lut_element_154_163,
  input  wire [15:0] global_in__sigmoid_lut_element_155_164,
  input  wire [15:0] global_in__sigmoid_lut_element_156_165,
  input  wire [15:0] global_in__sigmoid_lut_element_157_166,
  input  wire [15:0] global_in__sigmoid_lut_element_158_167,
  input  wire [15:0] global_in__sigmoid_lut_element_159_168,
  input  wire [15:0] global_in__sigmoid_lut_element_160_169,
  input  wire [15:0] global_in__sigmoid_lut_element_161_170,
  input  wire [15:0] global_in__sigmoid_lut_element_162_171,
  input  wire [15:0] global_in__sigmoid_lut_element_163_172,
  input  wire [15:0] global_in__sigmoid_lut_element_164_173,
  input  wire [15:0] global_in__sigmoid_lut_element_165_174,
  input  wire [15:0] global_in__sigmoid_lut_element_166_175,
  input  wire [15:0] global_in__sigmoid_lut_element_167_176,
  input  wire [15:0] global_in__sigmoid_lut_element_168_177,
  input  wire [15:0] global_in__sigmoid_lut_element_169_178,
  input  wire [15:0] global_in__sigmoid_lut_element_170_179,
  input  wire [15:0] global_in__sigmoid_lut_element_171_180,
  input  wire [15:0] global_in__sigmoid_lut_element_172_181,
  input  wire [15:0] global_in__sigmoid_lut_element_173_182,
  input  wire [15:0] global_in__sigmoid_lut_element_174_183,
  input  wire [15:0] global_in__sigmoid_lut_element_175_184,
  input  wire [15:0] global_in__sigmoid_lut_element_176_185,
  input  wire [15:0] global_in__sigmoid_lut_element_177_186,
  input  wire [15:0] global_in__sigmoid_lut_element_178_187,
  input  wire [15:0] global_in__sigmoid_lut_element_179_188,
  input  wire [15:0] global_in__sigmoid_lut_element_180_189,
  input  wire [15:0] global_in__sigmoid_lut_element_181_190,
  input  wire [15:0] global_in__sigmoid_lut_element_182_191,
  input  wire [15:0] global_in__sigmoid_lut_element_183_192,
  input  wire [15:0] global_in__sigmoid_lut_element_184_193,
  input  wire [15:0] global_in__sigmoid_lut_element_185_194,
  input  wire [15:0] global_in__sigmoid_lut_element_186_195,
  input  wire [15:0] global_in__sigmoid_lut_element_187_196,
  input  wire [15:0] global_in__sigmoid_lut_element_188_197,
  input  wire [15:0] global_in__sigmoid_lut_element_189_198,
  input  wire [15:0] global_in__sigmoid_lut_element_190_199,
  input  wire [15:0] global_in__sigmoid_lut_element_191_200,
  input  wire [15:0] global_in__sigmoid_lut_element_192_201,
  input  wire [15:0] global_in__sigmoid_lut_element_193_202,
  input  wire [15:0] global_in__sigmoid_lut_element_194_203,
  input  wire [15:0] global_in__sigmoid_lut_element_195_204,
  input  wire [15:0] global_in__sigmoid_lut_element_196_205,
  input  wire [15:0] global_in__sigmoid_lut_element_197_206,
  input  wire [15:0] global_in__sigmoid_lut_element_198_207,
  input  wire [15:0] global_in__sigmoid_lut_element_199_208,
  input  wire [15:0] global_in__sigmoid_lut_element_200_209,
  input  wire [15:0] global_in__sigmoid_lut_element_201_210,
  input  wire [15:0] global_in__sigmoid_lut_element_202_211,
  input  wire [15:0] global_in__sigmoid_lut_element_203_212,
  input  wire [15:0] global_in__sigmoid_lut_element_204_213,
  input  wire [15:0] global_in__sigmoid_lut_element_205_214,
  input  wire [15:0] global_in__sigmoid_lut_element_206_215,
  input  wire [15:0] global_in__sigmoid_lut_element_207_216,
  input  wire [15:0] global_in__sigmoid_lut_element_208_217,
  input  wire [15:0] global_in__sigmoid_lut_element_209_218,
  input  wire [15:0] global_in__sigmoid_lut_element_210_219,
  input  wire [15:0] global_in__sigmoid_lut_element_211_220,
  input  wire [15:0] global_in__sigmoid_lut_element_212_221,
  input  wire [15:0] global_in__sigmoid_lut_element_213_222,
  input  wire [15:0] global_in__sigmoid_lut_element_214_223,
  input  wire [15:0] global_in__sigmoid_lut_element_215_224,
  input  wire [15:0] global_in__sigmoid_lut_element_216_225,
  input  wire [15:0] global_in__sigmoid_lut_element_217_226,
  input  wire [15:0] global_in__sigmoid_lut_element_218_227,
  input  wire [15:0] global_in__sigmoid_lut_element_219_228,
  input  wire [15:0] global_in__sigmoid_lut_element_220_229,
  input  wire [15:0] global_in__sigmoid_lut_element_221_230,
  input  wire [15:0] global_in__sigmoid_lut_element_222_231,
  input  wire [15:0] global_in__sigmoid_lut_element_223_232,
  input  wire [15:0] global_in__sigmoid_lut_element_224_233,
  input  wire [15:0] global_in__sigmoid_lut_element_225_234,
  input  wire [15:0] global_in__sigmoid_lut_element_226_235,
  input  wire [15:0] global_in__sigmoid_lut_element_227_236,
  input  wire [15:0] global_in__sigmoid_lut_element_228_237,
  input  wire [15:0] global_in__sigmoid_lut_element_229_238,
  input  wire [15:0] global_in__sigmoid_lut_element_230_239,
  input  wire [15:0] global_in__sigmoid_lut_element_231_240,
  input  wire [15:0] global_in__sigmoid_lut_element_232_241,
  input  wire [15:0] global_in__sigmoid_lut_element_233_242,
  input  wire [15:0] global_in__sigmoid_lut_element_234_243,
  input  wire [15:0] global_in__sigmoid_lut_element_235_244,
  input  wire [15:0] global_in__sigmoid_lut_element_236_245,
  input  wire [15:0] global_in__sigmoid_lut_element_237_246,
  input  wire [15:0] global_in__sigmoid_lut_element_238_247,
  input  wire [15:0] global_in__sigmoid_lut_element_239_248,
  input  wire [15:0] global_in__sigmoid_lut_element_240_249,
  input  wire [15:0] global_in__sigmoid_lut_element_241_250,
  input  wire [15:0] global_in__sigmoid_lut_element_242_251,
  input  wire [15:0] global_in__sigmoid_lut_element_243_252,
  input  wire [15:0] global_in__sigmoid_lut_element_244_253,
  input  wire [15:0] global_in__sigmoid_lut_element_245_254,
  input  wire [15:0] global_in__sigmoid_lut_element_246_255,
  input  wire [15:0] global_in__sigmoid_lut_element_247_256,
  input  wire [15:0] global_in__sigmoid_lut_element_248_257,
  input  wire [15:0] global_in__sigmoid_lut_element_249_258,
  input  wire [15:0] global_in__sigmoid_lut_element_250_259,
  input  wire [15:0] global_in__sigmoid_lut_element_251_260,
  input  wire [15:0] global_in__sigmoid_lut_element_252_261,
  input  wire [15:0] global_in__sigmoid_lut_element_253_262,
  input  wire [15:0] global_in__sigmoid_lut_element_254_263,
  input  wire [15:0] global_in__sigmoid_lut_element_255_264,
  output wire [15:0] fifo_data_out_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [7:0]  data_in_5,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  wire  [15:0] global_in__sigmoid_lut_element_0_9_0 = global_in__sigmoid_lut_element_0_9;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_1_10_0 =
    global_in__sigmoid_lut_element_1_10;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_2_11_0 =
    global_in__sigmoid_lut_element_2_11;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_3_12_0 =
    global_in__sigmoid_lut_element_3_12;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_4_13_0 =
    global_in__sigmoid_lut_element_4_13;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_5_14_0 =
    global_in__sigmoid_lut_element_5_14;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_6_15_0 =
    global_in__sigmoid_lut_element_6_15;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_7_16_0 =
    global_in__sigmoid_lut_element_7_16;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_8_17_0 =
    global_in__sigmoid_lut_element_8_17;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_9_18_0 =
    global_in__sigmoid_lut_element_9_18;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_10_19_0 =
    global_in__sigmoid_lut_element_10_19;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_11_20_0 =
    global_in__sigmoid_lut_element_11_20;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_12_21_0 =
    global_in__sigmoid_lut_element_12_21;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_13_22_0 =
    global_in__sigmoid_lut_element_13_22;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_14_23_0 =
    global_in__sigmoid_lut_element_14_23;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_15_24_0 =
    global_in__sigmoid_lut_element_15_24;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_16_25_0 =
    global_in__sigmoid_lut_element_16_25;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_17_26_0 =
    global_in__sigmoid_lut_element_17_26;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_18_27_0 =
    global_in__sigmoid_lut_element_18_27;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_19_28_0 =
    global_in__sigmoid_lut_element_19_28;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_20_29_0 =
    global_in__sigmoid_lut_element_20_29;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_21_30_0 =
    global_in__sigmoid_lut_element_21_30;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_22_31_0 =
    global_in__sigmoid_lut_element_22_31;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_23_32_0 =
    global_in__sigmoid_lut_element_23_32;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_24_33_0 =
    global_in__sigmoid_lut_element_24_33;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_25_34_0 =
    global_in__sigmoid_lut_element_25_34;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_26_35_0 =
    global_in__sigmoid_lut_element_26_35;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_27_36_0 =
    global_in__sigmoid_lut_element_27_36;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_28_37_0 =
    global_in__sigmoid_lut_element_28_37;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_29_38_0 =
    global_in__sigmoid_lut_element_29_38;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_30_39_0 =
    global_in__sigmoid_lut_element_30_39;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_31_40_0 =
    global_in__sigmoid_lut_element_31_40;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_32_41_0 =
    global_in__sigmoid_lut_element_32_41;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_33_42_0 =
    global_in__sigmoid_lut_element_33_42;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_34_43_0 =
    global_in__sigmoid_lut_element_34_43;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_35_44_0 =
    global_in__sigmoid_lut_element_35_44;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_36_45_0 =
    global_in__sigmoid_lut_element_36_45;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_37_46_0 =
    global_in__sigmoid_lut_element_37_46;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_38_47_0 =
    global_in__sigmoid_lut_element_38_47;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_39_48_0 =
    global_in__sigmoid_lut_element_39_48;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_40_49_0 =
    global_in__sigmoid_lut_element_40_49;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_41_50_0 =
    global_in__sigmoid_lut_element_41_50;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_42_51_0 =
    global_in__sigmoid_lut_element_42_51;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_43_52_0 =
    global_in__sigmoid_lut_element_43_52;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_44_53_0 =
    global_in__sigmoid_lut_element_44_53;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_45_54_0 =
    global_in__sigmoid_lut_element_45_54;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_46_55_0 =
    global_in__sigmoid_lut_element_46_55;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_47_56_0 =
    global_in__sigmoid_lut_element_47_56;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_48_57_0 =
    global_in__sigmoid_lut_element_48_57;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_49_58_0 =
    global_in__sigmoid_lut_element_49_58;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_50_59_0 =
    global_in__sigmoid_lut_element_50_59;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_51_60_0 =
    global_in__sigmoid_lut_element_51_60;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_52_61_0 =
    global_in__sigmoid_lut_element_52_61;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_53_62_0 =
    global_in__sigmoid_lut_element_53_62;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_54_63_0 =
    global_in__sigmoid_lut_element_54_63;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_55_64_0 =
    global_in__sigmoid_lut_element_55_64;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_56_65_0 =
    global_in__sigmoid_lut_element_56_65;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_57_66_0 =
    global_in__sigmoid_lut_element_57_66;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_58_67_0 =
    global_in__sigmoid_lut_element_58_67;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_59_68_0 =
    global_in__sigmoid_lut_element_59_68;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_60_69_0 =
    global_in__sigmoid_lut_element_60_69;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_61_70_0 =
    global_in__sigmoid_lut_element_61_70;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_62_71_0 =
    global_in__sigmoid_lut_element_62_71;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_63_72_0 =
    global_in__sigmoid_lut_element_63_72;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_64_73_0 =
    global_in__sigmoid_lut_element_64_73;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_65_74_0 =
    global_in__sigmoid_lut_element_65_74;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_66_75_0 =
    global_in__sigmoid_lut_element_66_75;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_67_76_0 =
    global_in__sigmoid_lut_element_67_76;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_68_77_0 =
    global_in__sigmoid_lut_element_68_77;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_69_78_0 =
    global_in__sigmoid_lut_element_69_78;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_70_79_0 =
    global_in__sigmoid_lut_element_70_79;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_71_80_0 =
    global_in__sigmoid_lut_element_71_80;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_72_81_0 =
    global_in__sigmoid_lut_element_72_81;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_73_82_0 =
    global_in__sigmoid_lut_element_73_82;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_74_83_0 =
    global_in__sigmoid_lut_element_74_83;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_75_84_0 =
    global_in__sigmoid_lut_element_75_84;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_76_85_0 =
    global_in__sigmoid_lut_element_76_85;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_77_86_0 =
    global_in__sigmoid_lut_element_77_86;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_78_87_0 =
    global_in__sigmoid_lut_element_78_87;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_79_88_0 =
    global_in__sigmoid_lut_element_79_88;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_80_89_0 =
    global_in__sigmoid_lut_element_80_89;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_81_90_0 =
    global_in__sigmoid_lut_element_81_90;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_82_91_0 =
    global_in__sigmoid_lut_element_82_91;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_83_92_0 =
    global_in__sigmoid_lut_element_83_92;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_84_93_0 =
    global_in__sigmoid_lut_element_84_93;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_85_94_0 =
    global_in__sigmoid_lut_element_85_94;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_86_95_0 =
    global_in__sigmoid_lut_element_86_95;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_87_96_0 =
    global_in__sigmoid_lut_element_87_96;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_88_97_0 =
    global_in__sigmoid_lut_element_88_97;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_89_98_0 =
    global_in__sigmoid_lut_element_89_98;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_90_99_0 =
    global_in__sigmoid_lut_element_90_99;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_91_100_0 =
    global_in__sigmoid_lut_element_91_100;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_92_101_0 =
    global_in__sigmoid_lut_element_92_101;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_93_102_0 =
    global_in__sigmoid_lut_element_93_102;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_94_103_0 =
    global_in__sigmoid_lut_element_94_103;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_95_104_0 =
    global_in__sigmoid_lut_element_95_104;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_96_105_0 =
    global_in__sigmoid_lut_element_96_105;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_97_106_0 =
    global_in__sigmoid_lut_element_97_106;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_98_107_0 =
    global_in__sigmoid_lut_element_98_107;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_99_108_0 =
    global_in__sigmoid_lut_element_99_108;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_100_109_0 =
    global_in__sigmoid_lut_element_100_109;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_101_110_0 =
    global_in__sigmoid_lut_element_101_110;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_102_111_0 =
    global_in__sigmoid_lut_element_102_111;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_103_112_0 =
    global_in__sigmoid_lut_element_103_112;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_104_113_0 =
    global_in__sigmoid_lut_element_104_113;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_105_114_0 =
    global_in__sigmoid_lut_element_105_114;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_106_115_0 =
    global_in__sigmoid_lut_element_106_115;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_107_116_0 =
    global_in__sigmoid_lut_element_107_116;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_108_117_0 =
    global_in__sigmoid_lut_element_108_117;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_109_118_0 =
    global_in__sigmoid_lut_element_109_118;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_110_119_0 =
    global_in__sigmoid_lut_element_110_119;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_111_120_0 =
    global_in__sigmoid_lut_element_111_120;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_112_121_0 =
    global_in__sigmoid_lut_element_112_121;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_113_122_0 =
    global_in__sigmoid_lut_element_113_122;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_114_123_0 =
    global_in__sigmoid_lut_element_114_123;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_115_124_0 =
    global_in__sigmoid_lut_element_115_124;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_116_125_0 =
    global_in__sigmoid_lut_element_116_125;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_117_126_0 =
    global_in__sigmoid_lut_element_117_126;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_118_127_0 =
    global_in__sigmoid_lut_element_118_127;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_119_128_0 =
    global_in__sigmoid_lut_element_119_128;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_120_129_0 =
    global_in__sigmoid_lut_element_120_129;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_121_130_0 =
    global_in__sigmoid_lut_element_121_130;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_122_131_0 =
    global_in__sigmoid_lut_element_122_131;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_123_132_0 =
    global_in__sigmoid_lut_element_123_132;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_124_133_0 =
    global_in__sigmoid_lut_element_124_133;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_125_134_0 =
    global_in__sigmoid_lut_element_125_134;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_126_135_0 =
    global_in__sigmoid_lut_element_126_135;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_127_136_0 =
    global_in__sigmoid_lut_element_127_136;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_128_137_0 =
    global_in__sigmoid_lut_element_128_137;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_129_138_0 =
    global_in__sigmoid_lut_element_129_138;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_130_139_0 =
    global_in__sigmoid_lut_element_130_139;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_131_140_0 =
    global_in__sigmoid_lut_element_131_140;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_132_141_0 =
    global_in__sigmoid_lut_element_132_141;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_133_142_0 =
    global_in__sigmoid_lut_element_133_142;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_134_143_0 =
    global_in__sigmoid_lut_element_134_143;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_135_144_0 =
    global_in__sigmoid_lut_element_135_144;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_136_145_0 =
    global_in__sigmoid_lut_element_136_145;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_137_146_0 =
    global_in__sigmoid_lut_element_137_146;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_138_147_0 =
    global_in__sigmoid_lut_element_138_147;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_139_148_0 =
    global_in__sigmoid_lut_element_139_148;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_140_149_0 =
    global_in__sigmoid_lut_element_140_149;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_141_150_0 =
    global_in__sigmoid_lut_element_141_150;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_142_151_0 =
    global_in__sigmoid_lut_element_142_151;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_143_152_0 =
    global_in__sigmoid_lut_element_143_152;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_144_153_0 =
    global_in__sigmoid_lut_element_144_153;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_145_154_0 =
    global_in__sigmoid_lut_element_145_154;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_146_155_0 =
    global_in__sigmoid_lut_element_146_155;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_147_156_0 =
    global_in__sigmoid_lut_element_147_156;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_148_157_0 =
    global_in__sigmoid_lut_element_148_157;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_149_158_0 =
    global_in__sigmoid_lut_element_149_158;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_150_159_0 =
    global_in__sigmoid_lut_element_150_159;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_151_160_0 =
    global_in__sigmoid_lut_element_151_160;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_152_161_0 =
    global_in__sigmoid_lut_element_152_161;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_153_162_0 =
    global_in__sigmoid_lut_element_153_162;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_154_163_0 =
    global_in__sigmoid_lut_element_154_163;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_155_164_0 =
    global_in__sigmoid_lut_element_155_164;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_156_165_0 =
    global_in__sigmoid_lut_element_156_165;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_157_166_0 =
    global_in__sigmoid_lut_element_157_166;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_158_167_0 =
    global_in__sigmoid_lut_element_158_167;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_159_168_0 =
    global_in__sigmoid_lut_element_159_168;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_160_169_0 =
    global_in__sigmoid_lut_element_160_169;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_161_170_0 =
    global_in__sigmoid_lut_element_161_170;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_162_171_0 =
    global_in__sigmoid_lut_element_162_171;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_163_172_0 =
    global_in__sigmoid_lut_element_163_172;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_164_173_0 =
    global_in__sigmoid_lut_element_164_173;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_165_174_0 =
    global_in__sigmoid_lut_element_165_174;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_166_175_0 =
    global_in__sigmoid_lut_element_166_175;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_167_176_0 =
    global_in__sigmoid_lut_element_167_176;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_168_177_0 =
    global_in__sigmoid_lut_element_168_177;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_169_178_0 =
    global_in__sigmoid_lut_element_169_178;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_170_179_0 =
    global_in__sigmoid_lut_element_170_179;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_171_180_0 =
    global_in__sigmoid_lut_element_171_180;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_172_181_0 =
    global_in__sigmoid_lut_element_172_181;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_173_182_0 =
    global_in__sigmoid_lut_element_173_182;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_174_183_0 =
    global_in__sigmoid_lut_element_174_183;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_175_184_0 =
    global_in__sigmoid_lut_element_175_184;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_176_185_0 =
    global_in__sigmoid_lut_element_176_185;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_177_186_0 =
    global_in__sigmoid_lut_element_177_186;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_178_187_0 =
    global_in__sigmoid_lut_element_178_187;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_179_188_0 =
    global_in__sigmoid_lut_element_179_188;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_180_189_0 =
    global_in__sigmoid_lut_element_180_189;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_181_190_0 =
    global_in__sigmoid_lut_element_181_190;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_182_191_0 =
    global_in__sigmoid_lut_element_182_191;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_183_192_0 =
    global_in__sigmoid_lut_element_183_192;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_184_193_0 =
    global_in__sigmoid_lut_element_184_193;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_185_194_0 =
    global_in__sigmoid_lut_element_185_194;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_186_195_0 =
    global_in__sigmoid_lut_element_186_195;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_187_196_0 =
    global_in__sigmoid_lut_element_187_196;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_188_197_0 =
    global_in__sigmoid_lut_element_188_197;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_189_198_0 =
    global_in__sigmoid_lut_element_189_198;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_190_199_0 =
    global_in__sigmoid_lut_element_190_199;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_191_200_0 =
    global_in__sigmoid_lut_element_191_200;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_192_201_0 =
    global_in__sigmoid_lut_element_192_201;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_193_202_0 =
    global_in__sigmoid_lut_element_193_202;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_194_203_0 =
    global_in__sigmoid_lut_element_194_203;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_195_204_0 =
    global_in__sigmoid_lut_element_195_204;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_196_205_0 =
    global_in__sigmoid_lut_element_196_205;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_197_206_0 =
    global_in__sigmoid_lut_element_197_206;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_198_207_0 =
    global_in__sigmoid_lut_element_198_207;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_199_208_0 =
    global_in__sigmoid_lut_element_199_208;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_200_209_0 =
    global_in__sigmoid_lut_element_200_209;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_201_210_0 =
    global_in__sigmoid_lut_element_201_210;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_202_211_0 =
    global_in__sigmoid_lut_element_202_211;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_203_212_0 =
    global_in__sigmoid_lut_element_203_212;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_204_213_0 =
    global_in__sigmoid_lut_element_204_213;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_205_214_0 =
    global_in__sigmoid_lut_element_205_214;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_206_215_0 =
    global_in__sigmoid_lut_element_206_215;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_207_216_0 =
    global_in__sigmoid_lut_element_207_216;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_208_217_0 =
    global_in__sigmoid_lut_element_208_217;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_209_218_0 =
    global_in__sigmoid_lut_element_209_218;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_210_219_0 =
    global_in__sigmoid_lut_element_210_219;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_211_220_0 =
    global_in__sigmoid_lut_element_211_220;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_212_221_0 =
    global_in__sigmoid_lut_element_212_221;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_213_222_0 =
    global_in__sigmoid_lut_element_213_222;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_214_223_0 =
    global_in__sigmoid_lut_element_214_223;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_215_224_0 =
    global_in__sigmoid_lut_element_215_224;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_216_225_0 =
    global_in__sigmoid_lut_element_216_225;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_217_226_0 =
    global_in__sigmoid_lut_element_217_226;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_218_227_0 =
    global_in__sigmoid_lut_element_218_227;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_219_228_0 =
    global_in__sigmoid_lut_element_219_228;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_220_229_0 =
    global_in__sigmoid_lut_element_220_229;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_221_230_0 =
    global_in__sigmoid_lut_element_221_230;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_222_231_0 =
    global_in__sigmoid_lut_element_222_231;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_223_232_0 =
    global_in__sigmoid_lut_element_223_232;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_224_233_0 =
    global_in__sigmoid_lut_element_224_233;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_225_234_0 =
    global_in__sigmoid_lut_element_225_234;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_226_235_0 =
    global_in__sigmoid_lut_element_226_235;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_227_236_0 =
    global_in__sigmoid_lut_element_227_236;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_228_237_0 =
    global_in__sigmoid_lut_element_228_237;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_229_238_0 =
    global_in__sigmoid_lut_element_229_238;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_230_239_0 =
    global_in__sigmoid_lut_element_230_239;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_231_240_0 =
    global_in__sigmoid_lut_element_231_240;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_232_241_0 =
    global_in__sigmoid_lut_element_232_241;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_233_242_0 =
    global_in__sigmoid_lut_element_233_242;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_234_243_0 =
    global_in__sigmoid_lut_element_234_243;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_235_244_0 =
    global_in__sigmoid_lut_element_235_244;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_236_245_0 =
    global_in__sigmoid_lut_element_236_245;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_237_246_0 =
    global_in__sigmoid_lut_element_237_246;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_238_247_0 =
    global_in__sigmoid_lut_element_238_247;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_239_248_0 =
    global_in__sigmoid_lut_element_239_248;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_240_249_0 =
    global_in__sigmoid_lut_element_240_249;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_241_250_0 =
    global_in__sigmoid_lut_element_241_250;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_242_251_0 =
    global_in__sigmoid_lut_element_242_251;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_243_252_0 =
    global_in__sigmoid_lut_element_243_252;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_244_253_0 =
    global_in__sigmoid_lut_element_244_253;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_245_254_0 =
    global_in__sigmoid_lut_element_245_254;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_246_255_0 =
    global_in__sigmoid_lut_element_246_255;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_247_256_0 =
    global_in__sigmoid_lut_element_247_256;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_248_257_0 =
    global_in__sigmoid_lut_element_248_257;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_249_258_0 =
    global_in__sigmoid_lut_element_249_258;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_250_259_0 =
    global_in__sigmoid_lut_element_250_259;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_251_260_0 =
    global_in__sigmoid_lut_element_251_260;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_252_261_0 =
    global_in__sigmoid_lut_element_252_261;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_253_262_0 =
    global_in__sigmoid_lut_element_253_262;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_254_263_0 =
    global_in__sigmoid_lut_element_254_263;	// swiglu.k:28:9
  wire  [15:0] global_in__sigmoid_lut_element_255_264_0 =
    global_in__sigmoid_lut_element_255_264;	// swiglu.k:28:9
  logic        done_out_0;	// swiglu.k:28:9
  logic [15:0] fifo_data_out_0_0;	// swiglu.k:28:9
  logic        fifo_wren_0_0;	// swiglu.k:28:9
  logic        input_rdy_0_0;	// swiglu.k:28:9
  logic [7:0]  control_state_out_0;	// swiglu.k:28:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:28:9
  always_comb begin	// swiglu.k:28:9
    input_rdy_0_0 = _GEN;	// swiglu.k:28:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:28:9
  end // always_comb
  reg   [7:0]  p0_data_in_5;	// swiglu.k:28:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:28:9
  reg   [15:0] p0__sigmoid_lut;	// swiglu.k:28:9
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:28:9
  reg   [15:0] p0__sigmoid_lut_0;	// swiglu.k:28:9
  reg          p0_stage3_enable = 1'h0;	// swiglu.k:28:9
  wire  [15:0] _sigmoid_lut =
    p0_data_in_5[7]
      ? (p0_data_in_5[6]
           ? (p0_data_in_5[5]
                ? (p0_data_in_5[4]
                     ? (p0_data_in_5[3]
                          ? (p0_data_in_5[2]
                               ? (p0_data_in_5[1]
                                    ? (p0_data_in_5[0]
                                         ? global_in__sigmoid_lut_element_255_264_0
                                         : global_in__sigmoid_lut_element_254_263_0)
                                    : p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_253_262_0
                                        : global_in__sigmoid_lut_element_252_261_0)
                               : p0_data_in_5[1]
                                   ? (p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_251_260_0
                                        : global_in__sigmoid_lut_element_250_259_0)
                                   : p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_249_258_0
                                       : global_in__sigmoid_lut_element_248_257_0)
                          : p0_data_in_5[2]
                              ? (p0_data_in_5[1]
                                   ? (p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_247_256_0
                                        : global_in__sigmoid_lut_element_246_255_0)
                                   : p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_245_254_0
                                       : global_in__sigmoid_lut_element_244_253_0)
                              : p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_243_252_0
                                       : global_in__sigmoid_lut_element_242_251_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_241_250_0
                                      : global_in__sigmoid_lut_element_240_249_0)
                     : p0_data_in_5[3]
                         ? (p0_data_in_5[2]
                              ? (p0_data_in_5[1]
                                   ? (p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_239_248_0
                                        : global_in__sigmoid_lut_element_238_247_0)
                                   : p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_237_246_0
                                       : global_in__sigmoid_lut_element_236_245_0)
                              : p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_235_244_0
                                       : global_in__sigmoid_lut_element_234_243_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_233_242_0
                                      : global_in__sigmoid_lut_element_232_241_0)
                         : p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_231_240_0
                                       : global_in__sigmoid_lut_element_230_239_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_229_238_0
                                      : global_in__sigmoid_lut_element_228_237_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_227_236_0
                                      : global_in__sigmoid_lut_element_226_235_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_225_234_0
                                     : global_in__sigmoid_lut_element_224_233_0)
                : p0_data_in_5[4]
                    ? (p0_data_in_5[3]
                         ? (p0_data_in_5[2]
                              ? (p0_data_in_5[1]
                                   ? (p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_223_232_0
                                        : global_in__sigmoid_lut_element_222_231_0)
                                   : p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_221_230_0
                                       : global_in__sigmoid_lut_element_220_229_0)
                              : p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_219_228_0
                                       : global_in__sigmoid_lut_element_218_227_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_217_226_0
                                      : global_in__sigmoid_lut_element_216_225_0)
                         : p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_215_224_0
                                       : global_in__sigmoid_lut_element_214_223_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_213_222_0
                                      : global_in__sigmoid_lut_element_212_221_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_211_220_0
                                      : global_in__sigmoid_lut_element_210_219_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_209_218_0
                                     : global_in__sigmoid_lut_element_208_217_0)
                    : p0_data_in_5[3]
                        ? (p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_207_216_0
                                       : global_in__sigmoid_lut_element_206_215_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_205_214_0
                                      : global_in__sigmoid_lut_element_204_213_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_203_212_0
                                      : global_in__sigmoid_lut_element_202_211_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_201_210_0
                                     : global_in__sigmoid_lut_element_200_209_0)
                        : p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_199_208_0
                                      : global_in__sigmoid_lut_element_198_207_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_197_206_0
                                     : global_in__sigmoid_lut_element_196_205_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_195_204_0
                                     : global_in__sigmoid_lut_element_194_203_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_193_202_0
                                    : global_in__sigmoid_lut_element_192_201_0)
           : p0_data_in_5[5]
               ? (p0_data_in_5[4]
                    ? (p0_data_in_5[3]
                         ? (p0_data_in_5[2]
                              ? (p0_data_in_5[1]
                                   ? (p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_191_200_0
                                        : global_in__sigmoid_lut_element_190_199_0)
                                   : p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_189_198_0
                                       : global_in__sigmoid_lut_element_188_197_0)
                              : p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_187_196_0
                                       : global_in__sigmoid_lut_element_186_195_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_185_194_0
                                      : global_in__sigmoid_lut_element_184_193_0)
                         : p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_183_192_0
                                       : global_in__sigmoid_lut_element_182_191_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_181_190_0
                                      : global_in__sigmoid_lut_element_180_189_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_179_188_0
                                      : global_in__sigmoid_lut_element_178_187_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_177_186_0
                                     : global_in__sigmoid_lut_element_176_185_0)
                    : p0_data_in_5[3]
                        ? (p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_175_184_0
                                       : global_in__sigmoid_lut_element_174_183_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_173_182_0
                                      : global_in__sigmoid_lut_element_172_181_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_171_180_0
                                      : global_in__sigmoid_lut_element_170_179_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_169_178_0
                                     : global_in__sigmoid_lut_element_168_177_0)
                        : p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_167_176_0
                                      : global_in__sigmoid_lut_element_166_175_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_165_174_0
                                     : global_in__sigmoid_lut_element_164_173_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_163_172_0
                                     : global_in__sigmoid_lut_element_162_171_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_161_170_0
                                    : global_in__sigmoid_lut_element_160_169_0)
               : p0_data_in_5[4]
                   ? (p0_data_in_5[3]
                        ? (p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_159_168_0
                                       : global_in__sigmoid_lut_element_158_167_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_157_166_0
                                      : global_in__sigmoid_lut_element_156_165_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_155_164_0
                                      : global_in__sigmoid_lut_element_154_163_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_153_162_0
                                     : global_in__sigmoid_lut_element_152_161_0)
                        : p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_151_160_0
                                      : global_in__sigmoid_lut_element_150_159_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_149_158_0
                                     : global_in__sigmoid_lut_element_148_157_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_147_156_0
                                     : global_in__sigmoid_lut_element_146_155_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_145_154_0
                                    : global_in__sigmoid_lut_element_144_153_0)
                   : p0_data_in_5[3]
                       ? (p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_143_152_0
                                      : global_in__sigmoid_lut_element_142_151_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_141_150_0
                                     : global_in__sigmoid_lut_element_140_149_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_139_148_0
                                     : global_in__sigmoid_lut_element_138_147_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_137_146_0
                                    : global_in__sigmoid_lut_element_136_145_0)
                       : p0_data_in_5[2]
                           ? (p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_135_144_0
                                     : global_in__sigmoid_lut_element_134_143_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_133_142_0
                                    : global_in__sigmoid_lut_element_132_141_0)
                           : p0_data_in_5[1]
                               ? (p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_131_140_0
                                    : global_in__sigmoid_lut_element_130_139_0)
                               : p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_129_138_0
                                   : global_in__sigmoid_lut_element_128_137_0)
      : p0_data_in_5[6]
          ? (p0_data_in_5[5]
               ? (p0_data_in_5[4]
                    ? (p0_data_in_5[3]
                         ? (p0_data_in_5[2]
                              ? (p0_data_in_5[1]
                                   ? (p0_data_in_5[0]
                                        ? global_in__sigmoid_lut_element_127_136_0
                                        : global_in__sigmoid_lut_element_126_135_0)
                                   : p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_125_134_0
                                       : global_in__sigmoid_lut_element_124_133_0)
                              : p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_123_132_0
                                       : global_in__sigmoid_lut_element_122_131_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_121_130_0
                                      : global_in__sigmoid_lut_element_120_129_0)
                         : p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_119_128_0
                                       : global_in__sigmoid_lut_element_118_127_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_117_126_0
                                      : global_in__sigmoid_lut_element_116_125_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_115_124_0
                                      : global_in__sigmoid_lut_element_114_123_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_113_122_0
                                     : global_in__sigmoid_lut_element_112_121_0)
                    : p0_data_in_5[3]
                        ? (p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_111_120_0
                                       : global_in__sigmoid_lut_element_110_119_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_109_118_0
                                      : global_in__sigmoid_lut_element_108_117_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_107_116_0
                                      : global_in__sigmoid_lut_element_106_115_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_105_114_0
                                     : global_in__sigmoid_lut_element_104_113_0)
                        : p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_103_112_0
                                      : global_in__sigmoid_lut_element_102_111_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_101_110_0
                                     : global_in__sigmoid_lut_element_100_109_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_99_108_0
                                     : global_in__sigmoid_lut_element_98_107_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_97_106_0
                                    : global_in__sigmoid_lut_element_96_105_0)
               : p0_data_in_5[4]
                   ? (p0_data_in_5[3]
                        ? (p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_95_104_0
                                       : global_in__sigmoid_lut_element_94_103_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_93_102_0
                                      : global_in__sigmoid_lut_element_92_101_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_91_100_0
                                      : global_in__sigmoid_lut_element_90_99_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_89_98_0
                                     : global_in__sigmoid_lut_element_88_97_0)
                        : p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_87_96_0
                                      : global_in__sigmoid_lut_element_86_95_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_85_94_0
                                     : global_in__sigmoid_lut_element_84_93_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_83_92_0
                                     : global_in__sigmoid_lut_element_82_91_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_81_90_0
                                    : global_in__sigmoid_lut_element_80_89_0)
                   : p0_data_in_5[3]
                       ? (p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_79_88_0
                                      : global_in__sigmoid_lut_element_78_87_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_77_86_0
                                     : global_in__sigmoid_lut_element_76_85_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_75_84_0
                                     : global_in__sigmoid_lut_element_74_83_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_73_82_0
                                    : global_in__sigmoid_lut_element_72_81_0)
                       : p0_data_in_5[2]
                           ? (p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_71_80_0
                                     : global_in__sigmoid_lut_element_70_79_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_69_78_0
                                    : global_in__sigmoid_lut_element_68_77_0)
                           : p0_data_in_5[1]
                               ? (p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_67_76_0
                                    : global_in__sigmoid_lut_element_66_75_0)
                               : p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_65_74_0
                                   : global_in__sigmoid_lut_element_64_73_0)
          : p0_data_in_5[5]
              ? (p0_data_in_5[4]
                   ? (p0_data_in_5[3]
                        ? (p0_data_in_5[2]
                             ? (p0_data_in_5[1]
                                  ? (p0_data_in_5[0]
                                       ? global_in__sigmoid_lut_element_63_72_0
                                       : global_in__sigmoid_lut_element_62_71_0)
                                  : p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_61_70_0
                                      : global_in__sigmoid_lut_element_60_69_0)
                             : p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_59_68_0
                                      : global_in__sigmoid_lut_element_58_67_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_57_66_0
                                     : global_in__sigmoid_lut_element_56_65_0)
                        : p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_55_64_0
                                      : global_in__sigmoid_lut_element_54_63_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_53_62_0
                                     : global_in__sigmoid_lut_element_52_61_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_51_60_0
                                     : global_in__sigmoid_lut_element_50_59_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_49_58_0
                                    : global_in__sigmoid_lut_element_48_57_0)
                   : p0_data_in_5[3]
                       ? (p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_47_56_0
                                      : global_in__sigmoid_lut_element_46_55_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_45_54_0
                                     : global_in__sigmoid_lut_element_44_53_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_43_52_0
                                     : global_in__sigmoid_lut_element_42_51_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_41_50_0
                                    : global_in__sigmoid_lut_element_40_49_0)
                       : p0_data_in_5[2]
                           ? (p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_39_48_0
                                     : global_in__sigmoid_lut_element_38_47_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_37_46_0
                                    : global_in__sigmoid_lut_element_36_45_0)
                           : p0_data_in_5[1]
                               ? (p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_35_44_0
                                    : global_in__sigmoid_lut_element_34_43_0)
                               : p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_33_42_0
                                   : global_in__sigmoid_lut_element_32_41_0)
              : p0_data_in_5[4]
                  ? (p0_data_in_5[3]
                       ? (p0_data_in_5[2]
                            ? (p0_data_in_5[1]
                                 ? (p0_data_in_5[0]
                                      ? global_in__sigmoid_lut_element_31_40_0
                                      : global_in__sigmoid_lut_element_30_39_0)
                                 : p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_29_38_0
                                     : global_in__sigmoid_lut_element_28_37_0)
                            : p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_27_36_0
                                     : global_in__sigmoid_lut_element_26_35_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_25_34_0
                                    : global_in__sigmoid_lut_element_24_33_0)
                       : p0_data_in_5[2]
                           ? (p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_23_32_0
                                     : global_in__sigmoid_lut_element_22_31_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_21_30_0
                                    : global_in__sigmoid_lut_element_20_29_0)
                           : p0_data_in_5[1]
                               ? (p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_19_28_0
                                    : global_in__sigmoid_lut_element_18_27_0)
                               : p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_17_26_0
                                   : global_in__sigmoid_lut_element_16_25_0)
                  : p0_data_in_5[3]
                      ? (p0_data_in_5[2]
                           ? (p0_data_in_5[1]
                                ? (p0_data_in_5[0]
                                     ? global_in__sigmoid_lut_element_15_24_0
                                     : global_in__sigmoid_lut_element_14_23_0)
                                : p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_13_22_0
                                    : global_in__sigmoid_lut_element_12_21_0)
                           : p0_data_in_5[1]
                               ? (p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_11_20_0
                                    : global_in__sigmoid_lut_element_10_19_0)
                               : p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_9_18_0
                                   : global_in__sigmoid_lut_element_8_17_0)
                      : p0_data_in_5[2]
                          ? (p0_data_in_5[1]
                               ? (p0_data_in_5[0]
                                    ? global_in__sigmoid_lut_element_7_16_0
                                    : global_in__sigmoid_lut_element_6_15_0)
                               : p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_5_14_0
                                   : global_in__sigmoid_lut_element_4_13_0)
                          : p0_data_in_5[1]
                              ? (p0_data_in_5[0]
                                   ? global_in__sigmoid_lut_element_3_12_0
                                   : global_in__sigmoid_lut_element_2_11_0)
                              : p0_data_in_5[0]
                                  ? global_in__sigmoid_lut_element_1_10_0
                                  : global_in__sigmoid_lut_element_0_9_0;	// swiglu.k:28:9, :31:22
  always @(posedge clk) begin	// swiglu.k:28:9
    p0_data_in_5 <= data_in_5;	// swiglu.k:28:9
    if (rst)	// swiglu.k:28:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:28:9
    else	// swiglu.k:28:9
      p0_stage1_enable <= _GEN & input_valid_0;	// swiglu.k:28:9
    p0__sigmoid_lut <= _sigmoid_lut;	// swiglu.k:28:9, :31:22
    if (rst)	// swiglu.k:28:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:28:9
    else	// swiglu.k:28:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:28:9
    p0__sigmoid_lut_0 <= p0__sigmoid_lut;	// swiglu.k:28:9
    if (rst)	// swiglu.k:28:9
      p0_stage3_enable <= 1'h0;	// swiglu.k:28:9
    else	// swiglu.k:28:9
      p0_stage3_enable <= p0_stage2_enable;	// swiglu.k:28:9
  end // always @(posedge)
  always_comb begin	// swiglu.k:28:9
    fifo_wren_0_0 = p0_stage3_enable;	// swiglu.k:26:5, :28:9
    fifo_data_out_0_0 = p0__sigmoid_lut_0;	// swiglu.k:26:5, :28:9
  end // always_comb
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:28:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:28:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_lookup_sigmoidEntry swiglu_unitDebugView_lookup_sigmoidEntry_instance (	// swiglu.k:26:5
    .clk       (clk),	// swiglu.k:26:5
    ._index    (p0_stage1_enable ? p0_data_in_5 : 'x),	// swiglu.k:26:5, :28:9
    .valid     (p0_stage1_enable),	// swiglu.k:28:9
    .valid_out (/* unused */)
  );	// swiglu.k:26:5
  swiglu_unitDebugView_lookup_sigmoidExit swiglu_unitDebugView_lookup_sigmoidExit_instance (	// swiglu.k:26:5
    .clk          (clk),	// swiglu.k:26:5
    ._ReturnValue (p0_stage2_enable ? p0__sigmoid_lut : 'x),	// swiglu.k:26:5, :28:9
    .valid        (p0_stage2_enable),	// swiglu.k:28:9
    .valid_out    (/* unused */)
  );	// swiglu.k:26:5
  assign done_out = p0_stage3_enable;	// swiglu.k:28:9
  assign fifo_data_out_0 = fifo_data_out_0_0;	// swiglu.k:28:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:28:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:28:9
  assign control_state_out = control_state_out_0;	// swiglu.k:28:9
endmodule

module swiglu_unit_set_sigmoid_lut_BasicBlock_0(	// swiglu.k:19:9
  input  wire        clk,
  input  wire        rst,
  output wire        done_out,
  output wire        global_out__sigmoid_lut_element_0_9_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_0_9_0,
  output wire        global_out__sigmoid_lut_element_1_10_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_1_10_0,
  output wire        global_out__sigmoid_lut_element_2_11_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_2_11_0,
  output wire        global_out__sigmoid_lut_element_3_12_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_3_12_0,
  output wire        global_out__sigmoid_lut_element_4_13_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_4_13_0,
  output wire        global_out__sigmoid_lut_element_5_14_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_5_14_0,
  output wire        global_out__sigmoid_lut_element_6_15_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_6_15_0,
  output wire        global_out__sigmoid_lut_element_7_16_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_7_16_0,
  output wire        global_out__sigmoid_lut_element_8_17_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_8_17_0,
  output wire        global_out__sigmoid_lut_element_9_18_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_9_18_0,
  output wire        global_out__sigmoid_lut_element_10_19_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_10_19_0,
  output wire        global_out__sigmoid_lut_element_11_20_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_11_20_0,
  output wire        global_out__sigmoid_lut_element_12_21_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_12_21_0,
  output wire        global_out__sigmoid_lut_element_13_22_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_13_22_0,
  output wire        global_out__sigmoid_lut_element_14_23_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_14_23_0,
  output wire        global_out__sigmoid_lut_element_15_24_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_15_24_0,
  output wire        global_out__sigmoid_lut_element_16_25_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_16_25_0,
  output wire        global_out__sigmoid_lut_element_17_26_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_17_26_0,
  output wire        global_out__sigmoid_lut_element_18_27_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_18_27_0,
  output wire        global_out__sigmoid_lut_element_19_28_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_19_28_0,
  output wire        global_out__sigmoid_lut_element_20_29_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_20_29_0,
  output wire        global_out__sigmoid_lut_element_21_30_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_21_30_0,
  output wire        global_out__sigmoid_lut_element_22_31_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_22_31_0,
  output wire        global_out__sigmoid_lut_element_23_32_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_23_32_0,
  output wire        global_out__sigmoid_lut_element_24_33_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_24_33_0,
  output wire        global_out__sigmoid_lut_element_25_34_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_25_34_0,
  output wire        global_out__sigmoid_lut_element_26_35_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_26_35_0,
  output wire        global_out__sigmoid_lut_element_27_36_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_27_36_0,
  output wire        global_out__sigmoid_lut_element_28_37_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_28_37_0,
  output wire        global_out__sigmoid_lut_element_29_38_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_29_38_0,
  output wire        global_out__sigmoid_lut_element_30_39_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_30_39_0,
  output wire        global_out__sigmoid_lut_element_31_40_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_31_40_0,
  output wire        global_out__sigmoid_lut_element_32_41_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_32_41_0,
  output wire        global_out__sigmoid_lut_element_33_42_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_33_42_0,
  output wire        global_out__sigmoid_lut_element_34_43_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_34_43_0,
  output wire        global_out__sigmoid_lut_element_35_44_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_35_44_0,
  output wire        global_out__sigmoid_lut_element_36_45_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_36_45_0,
  output wire        global_out__sigmoid_lut_element_37_46_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_37_46_0,
  output wire        global_out__sigmoid_lut_element_38_47_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_38_47_0,
  output wire        global_out__sigmoid_lut_element_39_48_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_39_48_0,
  output wire        global_out__sigmoid_lut_element_40_49_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_40_49_0,
  output wire        global_out__sigmoid_lut_element_41_50_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_41_50_0,
  output wire        global_out__sigmoid_lut_element_42_51_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_42_51_0,
  output wire        global_out__sigmoid_lut_element_43_52_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_43_52_0,
  output wire        global_out__sigmoid_lut_element_44_53_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_44_53_0,
  output wire        global_out__sigmoid_lut_element_45_54_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_45_54_0,
  output wire        global_out__sigmoid_lut_element_46_55_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_46_55_0,
  output wire        global_out__sigmoid_lut_element_47_56_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_47_56_0,
  output wire        global_out__sigmoid_lut_element_48_57_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_48_57_0,
  output wire        global_out__sigmoid_lut_element_49_58_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_49_58_0,
  output wire        global_out__sigmoid_lut_element_50_59_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_50_59_0,
  output wire        global_out__sigmoid_lut_element_51_60_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_51_60_0,
  output wire        global_out__sigmoid_lut_element_52_61_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_52_61_0,
  output wire        global_out__sigmoid_lut_element_53_62_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_53_62_0,
  output wire        global_out__sigmoid_lut_element_54_63_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_54_63_0,
  output wire        global_out__sigmoid_lut_element_55_64_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_55_64_0,
  output wire        global_out__sigmoid_lut_element_56_65_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_56_65_0,
  output wire        global_out__sigmoid_lut_element_57_66_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_57_66_0,
  output wire        global_out__sigmoid_lut_element_58_67_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_58_67_0,
  output wire        global_out__sigmoid_lut_element_59_68_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_59_68_0,
  output wire        global_out__sigmoid_lut_element_60_69_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_60_69_0,
  output wire        global_out__sigmoid_lut_element_61_70_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_61_70_0,
  output wire        global_out__sigmoid_lut_element_62_71_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_62_71_0,
  output wire        global_out__sigmoid_lut_element_63_72_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_63_72_0,
  output wire        global_out__sigmoid_lut_element_64_73_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_64_73_0,
  output wire        global_out__sigmoid_lut_element_65_74_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_65_74_0,
  output wire        global_out__sigmoid_lut_element_66_75_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_66_75_0,
  output wire        global_out__sigmoid_lut_element_67_76_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_67_76_0,
  output wire        global_out__sigmoid_lut_element_68_77_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_68_77_0,
  output wire        global_out__sigmoid_lut_element_69_78_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_69_78_0,
  output wire        global_out__sigmoid_lut_element_70_79_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_70_79_0,
  output wire        global_out__sigmoid_lut_element_71_80_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_71_80_0,
  output wire        global_out__sigmoid_lut_element_72_81_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_72_81_0,
  output wire        global_out__sigmoid_lut_element_73_82_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_73_82_0,
  output wire        global_out__sigmoid_lut_element_74_83_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_74_83_0,
  output wire        global_out__sigmoid_lut_element_75_84_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_75_84_0,
  output wire        global_out__sigmoid_lut_element_76_85_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_76_85_0,
  output wire        global_out__sigmoid_lut_element_77_86_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_77_86_0,
  output wire        global_out__sigmoid_lut_element_78_87_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_78_87_0,
  output wire        global_out__sigmoid_lut_element_79_88_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_79_88_0,
  output wire        global_out__sigmoid_lut_element_80_89_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_80_89_0,
  output wire        global_out__sigmoid_lut_element_81_90_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_81_90_0,
  output wire        global_out__sigmoid_lut_element_82_91_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_82_91_0,
  output wire        global_out__sigmoid_lut_element_83_92_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_83_92_0,
  output wire        global_out__sigmoid_lut_element_84_93_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_84_93_0,
  output wire        global_out__sigmoid_lut_element_85_94_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_85_94_0,
  output wire        global_out__sigmoid_lut_element_86_95_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_86_95_0,
  output wire        global_out__sigmoid_lut_element_87_96_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_87_96_0,
  output wire        global_out__sigmoid_lut_element_88_97_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_88_97_0,
  output wire        global_out__sigmoid_lut_element_89_98_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_89_98_0,
  output wire        global_out__sigmoid_lut_element_90_99_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_90_99_0,
  output wire        global_out__sigmoid_lut_element_91_100_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_91_100_0,
  output wire        global_out__sigmoid_lut_element_92_101_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_92_101_0,
  output wire        global_out__sigmoid_lut_element_93_102_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_93_102_0,
  output wire        global_out__sigmoid_lut_element_94_103_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_94_103_0,
  output wire        global_out__sigmoid_lut_element_95_104_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_95_104_0,
  output wire        global_out__sigmoid_lut_element_96_105_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_96_105_0,
  output wire        global_out__sigmoid_lut_element_97_106_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_97_106_0,
  output wire        global_out__sigmoid_lut_element_98_107_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_98_107_0,
  output wire        global_out__sigmoid_lut_element_99_108_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_99_108_0,
  output wire        global_out__sigmoid_lut_element_100_109_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_100_109_0,
  output wire        global_out__sigmoid_lut_element_101_110_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_101_110_0,
  output wire        global_out__sigmoid_lut_element_102_111_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_102_111_0,
  output wire        global_out__sigmoid_lut_element_103_112_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_103_112_0,
  output wire        global_out__sigmoid_lut_element_104_113_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_104_113_0,
  output wire        global_out__sigmoid_lut_element_105_114_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_105_114_0,
  output wire        global_out__sigmoid_lut_element_106_115_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_106_115_0,
  output wire        global_out__sigmoid_lut_element_107_116_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_107_116_0,
  output wire        global_out__sigmoid_lut_element_108_117_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_108_117_0,
  output wire        global_out__sigmoid_lut_element_109_118_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_109_118_0,
  output wire        global_out__sigmoid_lut_element_110_119_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_110_119_0,
  output wire        global_out__sigmoid_lut_element_111_120_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_111_120_0,
  output wire        global_out__sigmoid_lut_element_112_121_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_112_121_0,
  output wire        global_out__sigmoid_lut_element_113_122_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_113_122_0,
  output wire        global_out__sigmoid_lut_element_114_123_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_114_123_0,
  output wire        global_out__sigmoid_lut_element_115_124_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_115_124_0,
  output wire        global_out__sigmoid_lut_element_116_125_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_116_125_0,
  output wire        global_out__sigmoid_lut_element_117_126_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_117_126_0,
  output wire        global_out__sigmoid_lut_element_118_127_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_118_127_0,
  output wire        global_out__sigmoid_lut_element_119_128_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_119_128_0,
  output wire        global_out__sigmoid_lut_element_120_129_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_120_129_0,
  output wire        global_out__sigmoid_lut_element_121_130_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_121_130_0,
  output wire        global_out__sigmoid_lut_element_122_131_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_122_131_0,
  output wire        global_out__sigmoid_lut_element_123_132_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_123_132_0,
  output wire        global_out__sigmoid_lut_element_124_133_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_124_133_0,
  output wire        global_out__sigmoid_lut_element_125_134_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_125_134_0,
  output wire        global_out__sigmoid_lut_element_126_135_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_126_135_0,
  output wire        global_out__sigmoid_lut_element_127_136_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_127_136_0,
  output wire        global_out__sigmoid_lut_element_128_137_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_128_137_0,
  output wire        global_out__sigmoid_lut_element_129_138_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_129_138_0,
  output wire        global_out__sigmoid_lut_element_130_139_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_130_139_0,
  output wire        global_out__sigmoid_lut_element_131_140_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_131_140_0,
  output wire        global_out__sigmoid_lut_element_132_141_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_132_141_0,
  output wire        global_out__sigmoid_lut_element_133_142_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_133_142_0,
  output wire        global_out__sigmoid_lut_element_134_143_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_134_143_0,
  output wire        global_out__sigmoid_lut_element_135_144_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_135_144_0,
  output wire        global_out__sigmoid_lut_element_136_145_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_136_145_0,
  output wire        global_out__sigmoid_lut_element_137_146_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_137_146_0,
  output wire        global_out__sigmoid_lut_element_138_147_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_138_147_0,
  output wire        global_out__sigmoid_lut_element_139_148_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_139_148_0,
  output wire        global_out__sigmoid_lut_element_140_149_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_140_149_0,
  output wire        global_out__sigmoid_lut_element_141_150_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_141_150_0,
  output wire        global_out__sigmoid_lut_element_142_151_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_142_151_0,
  output wire        global_out__sigmoid_lut_element_143_152_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_143_152_0,
  output wire        global_out__sigmoid_lut_element_144_153_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_144_153_0,
  output wire        global_out__sigmoid_lut_element_145_154_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_145_154_0,
  output wire        global_out__sigmoid_lut_element_146_155_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_146_155_0,
  output wire        global_out__sigmoid_lut_element_147_156_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_147_156_0,
  output wire        global_out__sigmoid_lut_element_148_157_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_148_157_0,
  output wire        global_out__sigmoid_lut_element_149_158_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_149_158_0,
  output wire        global_out__sigmoid_lut_element_150_159_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_150_159_0,
  output wire        global_out__sigmoid_lut_element_151_160_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_151_160_0,
  output wire        global_out__sigmoid_lut_element_152_161_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_152_161_0,
  output wire        global_out__sigmoid_lut_element_153_162_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_153_162_0,
  output wire        global_out__sigmoid_lut_element_154_163_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_154_163_0,
  output wire        global_out__sigmoid_lut_element_155_164_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_155_164_0,
  output wire        global_out__sigmoid_lut_element_156_165_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_156_165_0,
  output wire        global_out__sigmoid_lut_element_157_166_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_157_166_0,
  output wire        global_out__sigmoid_lut_element_158_167_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_158_167_0,
  output wire        global_out__sigmoid_lut_element_159_168_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_159_168_0,
  output wire        global_out__sigmoid_lut_element_160_169_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_160_169_0,
  output wire        global_out__sigmoid_lut_element_161_170_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_161_170_0,
  output wire        global_out__sigmoid_lut_element_162_171_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_162_171_0,
  output wire        global_out__sigmoid_lut_element_163_172_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_163_172_0,
  output wire        global_out__sigmoid_lut_element_164_173_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_164_173_0,
  output wire        global_out__sigmoid_lut_element_165_174_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_165_174_0,
  output wire        global_out__sigmoid_lut_element_166_175_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_166_175_0,
  output wire        global_out__sigmoid_lut_element_167_176_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_167_176_0,
  output wire        global_out__sigmoid_lut_element_168_177_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_168_177_0,
  output wire        global_out__sigmoid_lut_element_169_178_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_169_178_0,
  output wire        global_out__sigmoid_lut_element_170_179_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_170_179_0,
  output wire        global_out__sigmoid_lut_element_171_180_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_171_180_0,
  output wire        global_out__sigmoid_lut_element_172_181_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_172_181_0,
  output wire        global_out__sigmoid_lut_element_173_182_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_173_182_0,
  output wire        global_out__sigmoid_lut_element_174_183_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_174_183_0,
  output wire        global_out__sigmoid_lut_element_175_184_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_175_184_0,
  output wire        global_out__sigmoid_lut_element_176_185_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_176_185_0,
  output wire        global_out__sigmoid_lut_element_177_186_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_177_186_0,
  output wire        global_out__sigmoid_lut_element_178_187_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_178_187_0,
  output wire        global_out__sigmoid_lut_element_179_188_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_179_188_0,
  output wire        global_out__sigmoid_lut_element_180_189_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_180_189_0,
  output wire        global_out__sigmoid_lut_element_181_190_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_181_190_0,
  output wire        global_out__sigmoid_lut_element_182_191_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_182_191_0,
  output wire        global_out__sigmoid_lut_element_183_192_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_183_192_0,
  output wire        global_out__sigmoid_lut_element_184_193_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_184_193_0,
  output wire        global_out__sigmoid_lut_element_185_194_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_185_194_0,
  output wire        global_out__sigmoid_lut_element_186_195_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_186_195_0,
  output wire        global_out__sigmoid_lut_element_187_196_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_187_196_0,
  output wire        global_out__sigmoid_lut_element_188_197_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_188_197_0,
  output wire        global_out__sigmoid_lut_element_189_198_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_189_198_0,
  output wire        global_out__sigmoid_lut_element_190_199_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_190_199_0,
  output wire        global_out__sigmoid_lut_element_191_200_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_191_200_0,
  output wire        global_out__sigmoid_lut_element_192_201_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_192_201_0,
  output wire        global_out__sigmoid_lut_element_193_202_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_193_202_0,
  output wire        global_out__sigmoid_lut_element_194_203_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_194_203_0,
  output wire        global_out__sigmoid_lut_element_195_204_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_195_204_0,
  output wire        global_out__sigmoid_lut_element_196_205_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_196_205_0,
  output wire        global_out__sigmoid_lut_element_197_206_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_197_206_0,
  output wire        global_out__sigmoid_lut_element_198_207_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_198_207_0,
  output wire        global_out__sigmoid_lut_element_199_208_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_199_208_0,
  output wire        global_out__sigmoid_lut_element_200_209_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_200_209_0,
  output wire        global_out__sigmoid_lut_element_201_210_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_201_210_0,
  output wire        global_out__sigmoid_lut_element_202_211_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_202_211_0,
  output wire        global_out__sigmoid_lut_element_203_212_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_203_212_0,
  output wire        global_out__sigmoid_lut_element_204_213_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_204_213_0,
  output wire        global_out__sigmoid_lut_element_205_214_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_205_214_0,
  output wire        global_out__sigmoid_lut_element_206_215_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_206_215_0,
  output wire        global_out__sigmoid_lut_element_207_216_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_207_216_0,
  output wire        global_out__sigmoid_lut_element_208_217_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_208_217_0,
  output wire        global_out__sigmoid_lut_element_209_218_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_209_218_0,
  output wire        global_out__sigmoid_lut_element_210_219_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_210_219_0,
  output wire        global_out__sigmoid_lut_element_211_220_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_211_220_0,
  output wire        global_out__sigmoid_lut_element_212_221_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_212_221_0,
  output wire        global_out__sigmoid_lut_element_213_222_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_213_222_0,
  output wire        global_out__sigmoid_lut_element_214_223_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_214_223_0,
  output wire        global_out__sigmoid_lut_element_215_224_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_215_224_0,
  output wire        global_out__sigmoid_lut_element_216_225_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_216_225_0,
  output wire        global_out__sigmoid_lut_element_217_226_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_217_226_0,
  output wire        global_out__sigmoid_lut_element_218_227_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_218_227_0,
  output wire        global_out__sigmoid_lut_element_219_228_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_219_228_0,
  output wire        global_out__sigmoid_lut_element_220_229_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_220_229_0,
  output wire        global_out__sigmoid_lut_element_221_230_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_221_230_0,
  output wire        global_out__sigmoid_lut_element_222_231_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_222_231_0,
  output wire        global_out__sigmoid_lut_element_223_232_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_223_232_0,
  output wire        global_out__sigmoid_lut_element_224_233_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_224_233_0,
  output wire        global_out__sigmoid_lut_element_225_234_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_225_234_0,
  output wire        global_out__sigmoid_lut_element_226_235_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_226_235_0,
  output wire        global_out__sigmoid_lut_element_227_236_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_227_236_0,
  output wire        global_out__sigmoid_lut_element_228_237_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_228_237_0,
  output wire        global_out__sigmoid_lut_element_229_238_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_229_238_0,
  output wire        global_out__sigmoid_lut_element_230_239_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_230_239_0,
  output wire        global_out__sigmoid_lut_element_231_240_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_231_240_0,
  output wire        global_out__sigmoid_lut_element_232_241_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_232_241_0,
  output wire        global_out__sigmoid_lut_element_233_242_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_233_242_0,
  output wire        global_out__sigmoid_lut_element_234_243_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_234_243_0,
  output wire        global_out__sigmoid_lut_element_235_244_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_235_244_0,
  output wire        global_out__sigmoid_lut_element_236_245_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_236_245_0,
  output wire        global_out__sigmoid_lut_element_237_246_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_237_246_0,
  output wire        global_out__sigmoid_lut_element_238_247_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_238_247_0,
  output wire        global_out__sigmoid_lut_element_239_248_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_239_248_0,
  output wire        global_out__sigmoid_lut_element_240_249_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_240_249_0,
  output wire        global_out__sigmoid_lut_element_241_250_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_241_250_0,
  output wire        global_out__sigmoid_lut_element_242_251_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_242_251_0,
  output wire        global_out__sigmoid_lut_element_243_252_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_243_252_0,
  output wire        global_out__sigmoid_lut_element_244_253_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_244_253_0,
  output wire        global_out__sigmoid_lut_element_245_254_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_245_254_0,
  output wire        global_out__sigmoid_lut_element_246_255_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_246_255_0,
  output wire        global_out__sigmoid_lut_element_247_256_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_247_256_0,
  output wire        global_out__sigmoid_lut_element_248_257_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_248_257_0,
  output wire        global_out__sigmoid_lut_element_249_258_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_249_258_0,
  output wire        global_out__sigmoid_lut_element_250_259_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_250_259_0,
  output wire        global_out__sigmoid_lut_element_251_260_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_251_260_0,
  output wire        global_out__sigmoid_lut_element_252_261_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_252_261_0,
  output wire        global_out__sigmoid_lut_element_253_262_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_253_262_0,
  output wire        global_out__sigmoid_lut_element_254_263_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_254_263_0,
  output wire        global_out__sigmoid_lut_element_255_264_0_valid,
  output wire [15:0] global_out__sigmoid_lut_element_255_264_0,
  output wire        fifo_wren_0,
  input  wire        fifo_almost_full_in_raw_0,
  input  wire        fifo_overflow_in_0,
  input  wire [23:0] data_in_4,
  input  wire        input_fifo_underflow_0,
  output wire        input_rdy_0,
  input  wire        input_valid_0,
  output wire [7:0]  control_state_out
);

  wire         _fifo_overflow_ffc_0_data_out;
  wire         _fifo_almostfull_ffc_0_data_out;
  logic        done_out_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_0_9_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_0_9_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_1_10_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_1_10_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_2_11_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_2_11_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_3_12_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_3_12_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_4_13_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_4_13_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_5_14_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_5_14_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_6_15_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_6_15_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_7_16_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_7_16_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_8_17_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_8_17_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_9_18_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_9_18_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_10_19_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_10_19_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_11_20_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_11_20_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_12_21_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_12_21_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_13_22_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_13_22_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_14_23_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_14_23_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_15_24_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_15_24_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_16_25_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_16_25_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_17_26_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_17_26_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_18_27_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_18_27_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_19_28_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_19_28_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_20_29_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_20_29_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_21_30_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_21_30_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_22_31_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_22_31_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_23_32_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_23_32_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_24_33_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_24_33_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_25_34_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_25_34_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_26_35_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_26_35_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_27_36_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_27_36_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_28_37_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_28_37_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_29_38_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_29_38_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_30_39_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_30_39_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_31_40_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_31_40_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_32_41_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_32_41_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_33_42_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_33_42_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_34_43_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_34_43_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_35_44_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_35_44_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_36_45_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_36_45_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_37_46_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_37_46_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_38_47_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_38_47_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_39_48_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_39_48_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_40_49_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_40_49_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_41_50_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_41_50_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_42_51_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_42_51_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_43_52_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_43_52_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_44_53_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_44_53_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_45_54_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_45_54_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_46_55_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_46_55_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_47_56_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_47_56_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_48_57_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_48_57_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_49_58_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_49_58_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_50_59_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_50_59_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_51_60_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_51_60_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_52_61_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_52_61_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_53_62_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_53_62_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_54_63_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_54_63_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_55_64_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_55_64_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_56_65_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_56_65_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_57_66_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_57_66_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_58_67_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_58_67_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_59_68_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_59_68_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_60_69_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_60_69_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_61_70_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_61_70_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_62_71_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_62_71_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_63_72_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_63_72_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_64_73_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_64_73_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_65_74_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_65_74_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_66_75_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_66_75_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_67_76_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_67_76_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_68_77_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_68_77_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_69_78_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_69_78_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_70_79_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_70_79_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_71_80_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_71_80_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_72_81_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_72_81_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_73_82_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_73_82_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_74_83_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_74_83_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_75_84_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_75_84_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_76_85_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_76_85_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_77_86_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_77_86_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_78_87_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_78_87_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_79_88_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_79_88_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_80_89_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_80_89_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_81_90_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_81_90_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_82_91_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_82_91_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_83_92_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_83_92_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_84_93_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_84_93_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_85_94_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_85_94_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_86_95_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_86_95_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_87_96_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_87_96_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_88_97_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_88_97_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_89_98_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_89_98_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_90_99_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_90_99_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_91_100_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_91_100_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_92_101_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_92_101_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_93_102_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_93_102_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_94_103_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_94_103_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_95_104_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_95_104_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_96_105_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_96_105_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_97_106_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_97_106_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_98_107_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_98_107_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_99_108_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_99_108_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_100_109_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_100_109_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_101_110_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_101_110_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_102_111_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_102_111_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_103_112_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_103_112_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_104_113_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_104_113_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_105_114_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_105_114_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_106_115_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_106_115_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_107_116_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_107_116_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_108_117_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_108_117_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_109_118_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_109_118_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_110_119_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_110_119_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_111_120_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_111_120_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_112_121_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_112_121_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_113_122_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_113_122_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_114_123_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_114_123_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_115_124_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_115_124_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_116_125_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_116_125_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_117_126_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_117_126_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_118_127_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_118_127_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_119_128_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_119_128_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_120_129_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_120_129_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_121_130_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_121_130_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_122_131_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_122_131_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_123_132_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_123_132_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_124_133_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_124_133_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_125_134_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_125_134_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_126_135_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_126_135_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_127_136_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_127_136_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_128_137_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_128_137_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_129_138_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_129_138_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_130_139_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_130_139_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_131_140_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_131_140_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_132_141_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_132_141_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_133_142_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_133_142_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_134_143_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_134_143_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_135_144_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_135_144_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_136_145_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_136_145_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_137_146_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_137_146_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_138_147_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_138_147_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_139_148_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_139_148_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_140_149_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_140_149_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_141_150_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_141_150_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_142_151_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_142_151_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_143_152_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_143_152_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_144_153_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_144_153_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_145_154_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_145_154_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_146_155_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_146_155_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_147_156_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_147_156_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_148_157_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_148_157_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_149_158_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_149_158_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_150_159_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_150_159_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_151_160_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_151_160_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_152_161_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_152_161_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_153_162_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_153_162_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_154_163_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_154_163_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_155_164_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_155_164_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_156_165_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_156_165_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_157_166_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_157_166_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_158_167_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_158_167_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_159_168_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_159_168_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_160_169_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_160_169_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_161_170_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_161_170_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_162_171_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_162_171_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_163_172_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_163_172_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_164_173_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_164_173_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_165_174_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_165_174_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_166_175_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_166_175_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_167_176_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_167_176_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_168_177_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_168_177_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_169_178_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_169_178_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_170_179_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_170_179_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_171_180_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_171_180_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_172_181_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_172_181_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_173_182_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_173_182_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_174_183_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_174_183_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_175_184_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_175_184_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_176_185_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_176_185_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_177_186_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_177_186_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_178_187_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_178_187_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_179_188_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_179_188_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_180_189_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_180_189_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_181_190_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_181_190_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_182_191_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_182_191_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_183_192_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_183_192_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_184_193_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_184_193_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_185_194_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_185_194_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_186_195_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_186_195_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_187_196_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_187_196_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_188_197_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_188_197_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_189_198_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_189_198_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_190_199_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_190_199_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_191_200_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_191_200_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_192_201_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_192_201_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_193_202_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_193_202_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_194_203_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_194_203_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_195_204_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_195_204_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_196_205_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_196_205_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_197_206_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_197_206_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_198_207_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_198_207_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_199_208_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_199_208_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_200_209_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_200_209_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_201_210_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_201_210_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_202_211_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_202_211_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_203_212_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_203_212_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_204_213_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_204_213_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_205_214_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_205_214_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_206_215_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_206_215_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_207_216_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_207_216_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_208_217_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_208_217_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_209_218_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_209_218_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_210_219_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_210_219_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_211_220_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_211_220_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_212_221_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_212_221_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_213_222_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_213_222_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_214_223_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_214_223_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_215_224_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_215_224_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_216_225_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_216_225_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_217_226_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_217_226_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_218_227_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_218_227_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_219_228_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_219_228_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_220_229_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_220_229_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_221_230_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_221_230_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_222_231_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_222_231_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_223_232_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_223_232_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_224_233_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_224_233_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_225_234_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_225_234_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_226_235_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_226_235_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_227_236_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_227_236_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_228_237_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_228_237_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_229_238_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_229_238_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_230_239_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_230_239_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_231_240_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_231_240_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_232_241_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_232_241_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_233_242_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_233_242_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_234_243_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_234_243_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_235_244_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_235_244_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_236_245_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_236_245_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_237_246_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_237_246_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_238_247_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_238_247_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_239_248_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_239_248_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_240_249_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_240_249_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_241_250_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_241_250_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_242_251_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_242_251_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_243_252_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_243_252_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_244_253_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_244_253_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_245_254_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_245_254_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_246_255_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_246_255_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_247_256_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_247_256_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_248_257_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_248_257_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_249_258_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_249_258_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_250_259_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_250_259_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_251_260_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_251_260_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_252_261_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_252_261_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_253_262_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_253_262_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_254_263_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_254_263_0_0;	// swiglu.k:19:9
  logic        global_out__sigmoid_lut_element_255_264_0_valid_0;	// swiglu.k:19:9
  logic [15:0] global_out__sigmoid_lut_element_255_264_0_0;	// swiglu.k:19:9
  logic        fifo_wren_0_0;	// swiglu.k:19:9
  logic        input_rdy_0_0;	// swiglu.k:19:9
  logic [7:0]  control_state_out_0;	// swiglu.k:19:9
  wire         _GEN = ~rst & _fifo_almostfull_ffc_0_data_out;	// swiglu.k:19:9
  always_comb begin	// swiglu.k:19:9
    input_rdy_0_0 = _GEN;	// swiglu.k:19:9
    control_state_out_0 =
      {2'h0,
       ~_fifo_overflow_ffc_0_data_out,
       input_fifo_underflow_0,
       2'h0,
       ~_fifo_almostfull_ffc_0_data_out,
       ~input_valid_0};	// swiglu.k:19:9
  end // always_comb
  reg   [7:0]  p0_index;	// swiglu.k:19:9
  reg   [15:0] p0_value;	// swiglu.k:19:9
  reg          p0_stage1_enable = 1'h0;	// swiglu.k:19:9
  always_comb begin	// swiglu.k:19:9
    global_out__sigmoid_lut_element_128_137_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_128_137_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h80;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_129_138_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_129_138_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h81;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_130_139_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_130_139_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h82;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_131_140_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_131_140_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h83;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_132_141_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_132_141_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h84;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_133_142_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_133_142_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h85;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_134_143_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_134_143_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h86;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_135_144_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_135_144_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h87;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_136_145_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_136_145_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h88;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_137_146_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_137_146_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h89;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_138_147_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_138_147_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h8A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_139_148_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_139_148_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h8B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_140_149_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_140_149_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h8C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_141_150_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_141_150_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h8D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_142_151_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_142_151_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h8E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_143_152_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_143_152_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h8F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_144_153_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_144_153_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h90;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_145_154_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_145_154_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h91;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_146_155_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_146_155_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h92;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_147_156_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_147_156_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h93;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_148_157_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_148_157_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h94;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_149_158_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_149_158_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h95;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_150_159_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_150_159_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h96;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_151_160_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_151_160_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h97;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_152_161_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_152_161_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h98;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_153_162_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_153_162_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h99;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_154_163_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_154_163_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h9A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_155_164_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_155_164_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h9B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_156_165_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_156_165_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h9C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_157_166_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_157_166_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h9D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_158_167_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_158_167_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h9E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_159_168_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_159_168_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h9F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_160_169_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_160_169_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_161_170_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_161_170_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_162_171_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_162_171_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_163_172_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_163_172_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_164_173_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_164_173_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_165_174_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_165_174_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_166_175_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_166_175_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_167_176_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_167_176_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_168_177_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_168_177_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_169_178_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_169_178_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hA9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_170_179_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_170_179_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hAA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_171_180_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_171_180_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hAB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_172_181_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_172_181_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hAC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_173_182_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_173_182_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hAD;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_174_183_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_174_183_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hAE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_175_184_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_175_184_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hAF;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_176_185_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_176_185_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_177_186_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_177_186_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_178_187_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_178_187_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_179_188_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_179_188_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_180_189_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_180_189_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_181_190_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_181_190_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_182_191_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_182_191_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_183_192_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_183_192_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_184_193_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_184_193_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_185_194_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_185_194_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hB9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_186_195_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_186_195_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hBA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_187_196_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_187_196_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hBB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_188_197_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_188_197_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hBC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_189_198_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_189_198_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hBD;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_190_199_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_190_199_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hBE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_191_200_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_191_200_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hBF;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_192_201_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_192_201_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_193_202_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_193_202_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_194_203_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_194_203_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_195_204_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_195_204_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_196_205_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_196_205_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_197_206_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_197_206_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_198_207_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_198_207_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_199_208_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_199_208_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_200_209_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_200_209_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_201_210_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_201_210_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hC9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_202_211_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_202_211_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hCA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_203_212_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_203_212_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hCB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_204_213_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_204_213_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hCC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_205_214_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_205_214_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hCD;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_206_215_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_206_215_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hCE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_207_216_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_207_216_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hCF;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_208_217_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_208_217_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_209_218_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_209_218_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_210_219_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_210_219_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_211_220_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_211_220_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_212_221_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_212_221_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_213_222_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_213_222_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_214_223_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_214_223_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_215_224_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_215_224_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_216_225_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_216_225_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_217_226_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_217_226_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hD9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_218_227_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_218_227_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hDA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_219_228_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_219_228_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hDB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_220_229_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_220_229_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hDC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_221_230_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_221_230_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hDD;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_222_231_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_222_231_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hDE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_223_232_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_223_232_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hDF;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_224_233_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_224_233_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_225_234_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_225_234_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_226_235_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_226_235_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_227_236_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_227_236_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_228_237_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_228_237_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_229_238_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_229_238_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_230_239_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_230_239_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_231_240_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_231_240_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_232_241_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_232_241_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_233_242_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_233_242_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hE9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_234_243_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_234_243_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hEA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_235_244_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_235_244_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hEB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_236_245_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_236_245_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hEC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_237_246_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_237_246_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hED;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_238_247_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_238_247_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hEE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_239_248_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_239_248_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hEF;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_240_249_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_240_249_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_241_250_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_241_250_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_242_251_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_242_251_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_243_252_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_243_252_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_244_253_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_244_253_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_245_254_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_245_254_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_246_255_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_246_255_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_247_256_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_247_256_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_248_257_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_248_257_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_249_258_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_249_258_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hF9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_250_259_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_250_259_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hFA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_251_260_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_251_260_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hFB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_252_261_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_252_261_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hFC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_253_262_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_253_262_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hFD;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_254_263_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_254_263_0_valid_0 =
      p0_stage1_enable & p0_index == 8'hFE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_255_264_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_255_264_0_valid_0 = p0_stage1_enable & (&p0_index);	// swiglu.k:19:9, :21:13
  end // always_comb
  always_comb begin	// swiglu.k:19:9
    global_out__sigmoid_lut_element_0_9_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_0_9_0_valid_0 = p0_stage1_enable & p0_index == 8'h0;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_1_10_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_1_10_0_valid_0 = p0_stage1_enable & p0_index == 8'h1;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_2_11_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_2_11_0_valid_0 = p0_stage1_enable & p0_index == 8'h2;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_3_12_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_3_12_0_valid_0 = p0_stage1_enable & p0_index == 8'h3;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_4_13_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_4_13_0_valid_0 = p0_stage1_enable & p0_index == 8'h4;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_5_14_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_5_14_0_valid_0 = p0_stage1_enable & p0_index == 8'h5;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_6_15_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_6_15_0_valid_0 = p0_stage1_enable & p0_index == 8'h6;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_7_16_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_7_16_0_valid_0 = p0_stage1_enable & p0_index == 8'h7;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_8_17_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_8_17_0_valid_0 = p0_stage1_enable & p0_index == 8'h8;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_9_18_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_9_18_0_valid_0 = p0_stage1_enable & p0_index == 8'h9;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_10_19_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_10_19_0_valid_0 = p0_stage1_enable & p0_index == 8'hA;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_11_20_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_11_20_0_valid_0 = p0_stage1_enable & p0_index == 8'hB;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_12_21_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_12_21_0_valid_0 = p0_stage1_enable & p0_index == 8'hC;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_13_22_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_13_22_0_valid_0 = p0_stage1_enable & p0_index == 8'hD;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_14_23_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_14_23_0_valid_0 = p0_stage1_enable & p0_index == 8'hE;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_15_24_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_15_24_0_valid_0 = p0_stage1_enable & p0_index == 8'hF;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_16_25_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_16_25_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h10;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_17_26_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_17_26_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h11;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_18_27_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_18_27_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h12;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_19_28_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_19_28_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h13;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_20_29_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_20_29_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h14;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_21_30_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_21_30_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h15;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_22_31_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_22_31_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h16;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_23_32_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_23_32_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h17;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_24_33_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_24_33_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h18;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_25_34_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_25_34_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h19;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_26_35_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_26_35_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h1A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_27_36_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_27_36_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h1B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_28_37_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_28_37_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h1C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_29_38_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_29_38_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h1D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_30_39_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_30_39_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h1E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_31_40_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_31_40_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h1F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_32_41_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_32_41_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h20;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_33_42_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_33_42_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h21;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_34_43_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_34_43_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h22;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_35_44_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_35_44_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h23;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_36_45_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_36_45_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h24;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_37_46_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_37_46_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h25;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_38_47_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_38_47_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h26;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_39_48_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_39_48_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h27;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_40_49_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_40_49_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h28;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_41_50_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_41_50_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h29;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_42_51_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_42_51_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h2A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_43_52_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_43_52_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h2B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_44_53_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_44_53_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h2C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_45_54_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_45_54_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h2D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_46_55_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_46_55_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h2E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_47_56_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_47_56_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h2F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_48_57_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_48_57_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h30;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_49_58_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_49_58_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h31;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_50_59_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_50_59_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h32;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_51_60_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_51_60_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h33;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_52_61_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_52_61_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h34;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_53_62_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_53_62_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h35;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_54_63_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_54_63_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h36;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_55_64_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_55_64_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h37;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_56_65_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_56_65_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h38;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_57_66_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_57_66_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h39;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_58_67_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_58_67_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h3A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_59_68_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_59_68_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h3B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_60_69_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_60_69_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h3C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_61_70_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_61_70_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h3D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_62_71_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_62_71_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h3E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_63_72_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_63_72_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h3F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_64_73_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_64_73_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h40;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_65_74_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_65_74_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h41;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_66_75_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_66_75_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h42;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_67_76_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_67_76_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h43;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_68_77_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_68_77_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h44;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_69_78_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_69_78_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h45;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_70_79_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_70_79_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h46;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_71_80_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_71_80_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h47;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_72_81_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_72_81_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h48;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_73_82_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_73_82_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h49;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_74_83_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_74_83_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h4A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_75_84_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_75_84_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h4B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_76_85_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_76_85_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h4C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_77_86_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_77_86_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h4D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_78_87_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_78_87_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h4E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_79_88_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_79_88_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h4F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_80_89_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_80_89_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h50;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_81_90_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_81_90_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h51;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_82_91_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_82_91_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h52;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_83_92_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_83_92_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h53;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_84_93_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_84_93_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h54;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_85_94_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_85_94_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h55;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_86_95_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_86_95_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h56;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_87_96_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_87_96_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h57;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_88_97_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_88_97_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h58;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_89_98_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_89_98_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h59;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_90_99_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_90_99_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h5A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_91_100_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_91_100_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h5B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_92_101_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_92_101_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h5C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_93_102_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_93_102_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h5D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_94_103_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_94_103_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h5E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_95_104_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_95_104_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h5F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_96_105_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_96_105_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h60;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_97_106_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_97_106_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h61;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_98_107_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_98_107_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h62;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_99_108_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_99_108_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h63;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_100_109_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_100_109_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h64;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_101_110_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_101_110_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h65;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_102_111_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_102_111_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h66;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_103_112_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_103_112_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h67;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_104_113_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_104_113_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h68;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_105_114_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_105_114_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h69;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_106_115_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_106_115_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h6A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_107_116_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_107_116_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h6B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_108_117_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_108_117_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h6C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_109_118_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_109_118_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h6D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_110_119_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_110_119_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h6E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_111_120_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_111_120_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h6F;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_112_121_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_112_121_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h70;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_113_122_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_113_122_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h71;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_114_123_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_114_123_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h72;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_115_124_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_115_124_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h73;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_116_125_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_116_125_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h74;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_117_126_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_117_126_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h75;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_118_127_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_118_127_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h76;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_119_128_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_119_128_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h77;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_120_129_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_120_129_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h78;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_121_130_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_121_130_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h79;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_122_131_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_122_131_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h7A;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_123_132_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_123_132_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h7B;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_124_133_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_124_133_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h7C;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_125_134_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_125_134_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h7D;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_126_135_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_126_135_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h7E;	// swiglu.k:19:9, :21:13
    global_out__sigmoid_lut_element_127_136_0_0 = p0_value;	// swiglu.k:19:9
    global_out__sigmoid_lut_element_127_136_0_valid_0 =
      p0_stage1_enable & p0_index == 8'h7F;	// swiglu.k:19:9, :21:13
  end // always_comb
  reg          p0_stage2_enable = 1'h0;	// swiglu.k:19:9
  always @(posedge clk) begin	// swiglu.k:19:9
    p0_index <= data_in_4[7:0];	// swiglu.k:19:9
    p0_value <= data_in_4[23:8];	// swiglu.k:19:9
    if (rst) begin	// swiglu.k:19:9
      p0_stage1_enable <= 1'h0;	// swiglu.k:19:9
      p0_stage2_enable <= 1'h0;	// swiglu.k:19:9
    end
    else begin	// swiglu.k:19:9
      p0_stage1_enable <= _GEN & input_valid_0;	// swiglu.k:19:9
      p0_stage2_enable <= p0_stage1_enable;	// swiglu.k:19:9
    end
  end // always @(posedge)
  always_comb	// swiglu.k:19:9
    fifo_wren_0_0 = p0_stage2_enable;	// swiglu.k:19:9, :23:9
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_almostfull_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_almost_full_in_raw_0),	// swiglu.k:19:9
    .data_out (_fifo_almostfull_ffc_0_data_out)
  );
  KanagawaFlipFlopChainNoEnable #(
    .WIDTH(1),
    .DEPTH(1)
  ) fifo_overflow_ffc_0 (
    .clk      (clk),
    .data_in  (~fifo_overflow_in_0),	// swiglu.k:19:9
    .data_out (_fifo_overflow_ffc_0_data_out)
  );
  swiglu_unitDebugView_set_sigmoid_lutEntry swiglu_unitDebugView_set_sigmoid_lutEntry_instance (	// swiglu.k:23:9
    .clk       (clk),	// swiglu.k:23:9
    ._index    (p0_stage1_enable ? p0_index : 'x),	// swiglu.k:19:9, :23:9
    ._value    (p0_stage1_enable ? p0_value : 'x),	// swiglu.k:19:9, :23:9
    .valid     (p0_stage1_enable),	// swiglu.k:19:9
    .valid_out (/* unused */)
  );	// swiglu.k:23:9
  assign done_out = p0_stage2_enable;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_0_9_0_valid =
    global_out__sigmoid_lut_element_0_9_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_0_9_0 = global_out__sigmoid_lut_element_0_9_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_1_10_0_valid =
    global_out__sigmoid_lut_element_1_10_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_1_10_0 =
    global_out__sigmoid_lut_element_1_10_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_2_11_0_valid =
    global_out__sigmoid_lut_element_2_11_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_2_11_0 =
    global_out__sigmoid_lut_element_2_11_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_3_12_0_valid =
    global_out__sigmoid_lut_element_3_12_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_3_12_0 =
    global_out__sigmoid_lut_element_3_12_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_4_13_0_valid =
    global_out__sigmoid_lut_element_4_13_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_4_13_0 =
    global_out__sigmoid_lut_element_4_13_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_5_14_0_valid =
    global_out__sigmoid_lut_element_5_14_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_5_14_0 =
    global_out__sigmoid_lut_element_5_14_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_6_15_0_valid =
    global_out__sigmoid_lut_element_6_15_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_6_15_0 =
    global_out__sigmoid_lut_element_6_15_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_7_16_0_valid =
    global_out__sigmoid_lut_element_7_16_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_7_16_0 =
    global_out__sigmoid_lut_element_7_16_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_8_17_0_valid =
    global_out__sigmoid_lut_element_8_17_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_8_17_0 =
    global_out__sigmoid_lut_element_8_17_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_9_18_0_valid =
    global_out__sigmoid_lut_element_9_18_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_9_18_0 =
    global_out__sigmoid_lut_element_9_18_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_10_19_0_valid =
    global_out__sigmoid_lut_element_10_19_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_10_19_0 =
    global_out__sigmoid_lut_element_10_19_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_11_20_0_valid =
    global_out__sigmoid_lut_element_11_20_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_11_20_0 =
    global_out__sigmoid_lut_element_11_20_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_12_21_0_valid =
    global_out__sigmoid_lut_element_12_21_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_12_21_0 =
    global_out__sigmoid_lut_element_12_21_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_13_22_0_valid =
    global_out__sigmoid_lut_element_13_22_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_13_22_0 =
    global_out__sigmoid_lut_element_13_22_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_14_23_0_valid =
    global_out__sigmoid_lut_element_14_23_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_14_23_0 =
    global_out__sigmoid_lut_element_14_23_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_15_24_0_valid =
    global_out__sigmoid_lut_element_15_24_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_15_24_0 =
    global_out__sigmoid_lut_element_15_24_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_16_25_0_valid =
    global_out__sigmoid_lut_element_16_25_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_16_25_0 =
    global_out__sigmoid_lut_element_16_25_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_17_26_0_valid =
    global_out__sigmoid_lut_element_17_26_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_17_26_0 =
    global_out__sigmoid_lut_element_17_26_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_18_27_0_valid =
    global_out__sigmoid_lut_element_18_27_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_18_27_0 =
    global_out__sigmoid_lut_element_18_27_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_19_28_0_valid =
    global_out__sigmoid_lut_element_19_28_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_19_28_0 =
    global_out__sigmoid_lut_element_19_28_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_20_29_0_valid =
    global_out__sigmoid_lut_element_20_29_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_20_29_0 =
    global_out__sigmoid_lut_element_20_29_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_21_30_0_valid =
    global_out__sigmoid_lut_element_21_30_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_21_30_0 =
    global_out__sigmoid_lut_element_21_30_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_22_31_0_valid =
    global_out__sigmoid_lut_element_22_31_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_22_31_0 =
    global_out__sigmoid_lut_element_22_31_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_23_32_0_valid =
    global_out__sigmoid_lut_element_23_32_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_23_32_0 =
    global_out__sigmoid_lut_element_23_32_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_24_33_0_valid =
    global_out__sigmoid_lut_element_24_33_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_24_33_0 =
    global_out__sigmoid_lut_element_24_33_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_25_34_0_valid =
    global_out__sigmoid_lut_element_25_34_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_25_34_0 =
    global_out__sigmoid_lut_element_25_34_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_26_35_0_valid =
    global_out__sigmoid_lut_element_26_35_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_26_35_0 =
    global_out__sigmoid_lut_element_26_35_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_27_36_0_valid =
    global_out__sigmoid_lut_element_27_36_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_27_36_0 =
    global_out__sigmoid_lut_element_27_36_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_28_37_0_valid =
    global_out__sigmoid_lut_element_28_37_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_28_37_0 =
    global_out__sigmoid_lut_element_28_37_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_29_38_0_valid =
    global_out__sigmoid_lut_element_29_38_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_29_38_0 =
    global_out__sigmoid_lut_element_29_38_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_30_39_0_valid =
    global_out__sigmoid_lut_element_30_39_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_30_39_0 =
    global_out__sigmoid_lut_element_30_39_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_31_40_0_valid =
    global_out__sigmoid_lut_element_31_40_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_31_40_0 =
    global_out__sigmoid_lut_element_31_40_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_32_41_0_valid =
    global_out__sigmoid_lut_element_32_41_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_32_41_0 =
    global_out__sigmoid_lut_element_32_41_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_33_42_0_valid =
    global_out__sigmoid_lut_element_33_42_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_33_42_0 =
    global_out__sigmoid_lut_element_33_42_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_34_43_0_valid =
    global_out__sigmoid_lut_element_34_43_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_34_43_0 =
    global_out__sigmoid_lut_element_34_43_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_35_44_0_valid =
    global_out__sigmoid_lut_element_35_44_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_35_44_0 =
    global_out__sigmoid_lut_element_35_44_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_36_45_0_valid =
    global_out__sigmoid_lut_element_36_45_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_36_45_0 =
    global_out__sigmoid_lut_element_36_45_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_37_46_0_valid =
    global_out__sigmoid_lut_element_37_46_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_37_46_0 =
    global_out__sigmoid_lut_element_37_46_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_38_47_0_valid =
    global_out__sigmoid_lut_element_38_47_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_38_47_0 =
    global_out__sigmoid_lut_element_38_47_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_39_48_0_valid =
    global_out__sigmoid_lut_element_39_48_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_39_48_0 =
    global_out__sigmoid_lut_element_39_48_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_40_49_0_valid =
    global_out__sigmoid_lut_element_40_49_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_40_49_0 =
    global_out__sigmoid_lut_element_40_49_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_41_50_0_valid =
    global_out__sigmoid_lut_element_41_50_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_41_50_0 =
    global_out__sigmoid_lut_element_41_50_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_42_51_0_valid =
    global_out__sigmoid_lut_element_42_51_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_42_51_0 =
    global_out__sigmoid_lut_element_42_51_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_43_52_0_valid =
    global_out__sigmoid_lut_element_43_52_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_43_52_0 =
    global_out__sigmoid_lut_element_43_52_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_44_53_0_valid =
    global_out__sigmoid_lut_element_44_53_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_44_53_0 =
    global_out__sigmoid_lut_element_44_53_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_45_54_0_valid =
    global_out__sigmoid_lut_element_45_54_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_45_54_0 =
    global_out__sigmoid_lut_element_45_54_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_46_55_0_valid =
    global_out__sigmoid_lut_element_46_55_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_46_55_0 =
    global_out__sigmoid_lut_element_46_55_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_47_56_0_valid =
    global_out__sigmoid_lut_element_47_56_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_47_56_0 =
    global_out__sigmoid_lut_element_47_56_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_48_57_0_valid =
    global_out__sigmoid_lut_element_48_57_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_48_57_0 =
    global_out__sigmoid_lut_element_48_57_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_49_58_0_valid =
    global_out__sigmoid_lut_element_49_58_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_49_58_0 =
    global_out__sigmoid_lut_element_49_58_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_50_59_0_valid =
    global_out__sigmoid_lut_element_50_59_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_50_59_0 =
    global_out__sigmoid_lut_element_50_59_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_51_60_0_valid =
    global_out__sigmoid_lut_element_51_60_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_51_60_0 =
    global_out__sigmoid_lut_element_51_60_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_52_61_0_valid =
    global_out__sigmoid_lut_element_52_61_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_52_61_0 =
    global_out__sigmoid_lut_element_52_61_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_53_62_0_valid =
    global_out__sigmoid_lut_element_53_62_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_53_62_0 =
    global_out__sigmoid_lut_element_53_62_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_54_63_0_valid =
    global_out__sigmoid_lut_element_54_63_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_54_63_0 =
    global_out__sigmoid_lut_element_54_63_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_55_64_0_valid =
    global_out__sigmoid_lut_element_55_64_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_55_64_0 =
    global_out__sigmoid_lut_element_55_64_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_56_65_0_valid =
    global_out__sigmoid_lut_element_56_65_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_56_65_0 =
    global_out__sigmoid_lut_element_56_65_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_57_66_0_valid =
    global_out__sigmoid_lut_element_57_66_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_57_66_0 =
    global_out__sigmoid_lut_element_57_66_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_58_67_0_valid =
    global_out__sigmoid_lut_element_58_67_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_58_67_0 =
    global_out__sigmoid_lut_element_58_67_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_59_68_0_valid =
    global_out__sigmoid_lut_element_59_68_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_59_68_0 =
    global_out__sigmoid_lut_element_59_68_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_60_69_0_valid =
    global_out__sigmoid_lut_element_60_69_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_60_69_0 =
    global_out__sigmoid_lut_element_60_69_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_61_70_0_valid =
    global_out__sigmoid_lut_element_61_70_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_61_70_0 =
    global_out__sigmoid_lut_element_61_70_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_62_71_0_valid =
    global_out__sigmoid_lut_element_62_71_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_62_71_0 =
    global_out__sigmoid_lut_element_62_71_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_63_72_0_valid =
    global_out__sigmoid_lut_element_63_72_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_63_72_0 =
    global_out__sigmoid_lut_element_63_72_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_64_73_0_valid =
    global_out__sigmoid_lut_element_64_73_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_64_73_0 =
    global_out__sigmoid_lut_element_64_73_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_65_74_0_valid =
    global_out__sigmoid_lut_element_65_74_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_65_74_0 =
    global_out__sigmoid_lut_element_65_74_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_66_75_0_valid =
    global_out__sigmoid_lut_element_66_75_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_66_75_0 =
    global_out__sigmoid_lut_element_66_75_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_67_76_0_valid =
    global_out__sigmoid_lut_element_67_76_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_67_76_0 =
    global_out__sigmoid_lut_element_67_76_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_68_77_0_valid =
    global_out__sigmoid_lut_element_68_77_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_68_77_0 =
    global_out__sigmoid_lut_element_68_77_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_69_78_0_valid =
    global_out__sigmoid_lut_element_69_78_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_69_78_0 =
    global_out__sigmoid_lut_element_69_78_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_70_79_0_valid =
    global_out__sigmoid_lut_element_70_79_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_70_79_0 =
    global_out__sigmoid_lut_element_70_79_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_71_80_0_valid =
    global_out__sigmoid_lut_element_71_80_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_71_80_0 =
    global_out__sigmoid_lut_element_71_80_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_72_81_0_valid =
    global_out__sigmoid_lut_element_72_81_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_72_81_0 =
    global_out__sigmoid_lut_element_72_81_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_73_82_0_valid =
    global_out__sigmoid_lut_element_73_82_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_73_82_0 =
    global_out__sigmoid_lut_element_73_82_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_74_83_0_valid =
    global_out__sigmoid_lut_element_74_83_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_74_83_0 =
    global_out__sigmoid_lut_element_74_83_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_75_84_0_valid =
    global_out__sigmoid_lut_element_75_84_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_75_84_0 =
    global_out__sigmoid_lut_element_75_84_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_76_85_0_valid =
    global_out__sigmoid_lut_element_76_85_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_76_85_0 =
    global_out__sigmoid_lut_element_76_85_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_77_86_0_valid =
    global_out__sigmoid_lut_element_77_86_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_77_86_0 =
    global_out__sigmoid_lut_element_77_86_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_78_87_0_valid =
    global_out__sigmoid_lut_element_78_87_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_78_87_0 =
    global_out__sigmoid_lut_element_78_87_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_79_88_0_valid =
    global_out__sigmoid_lut_element_79_88_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_79_88_0 =
    global_out__sigmoid_lut_element_79_88_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_80_89_0_valid =
    global_out__sigmoid_lut_element_80_89_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_80_89_0 =
    global_out__sigmoid_lut_element_80_89_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_81_90_0_valid =
    global_out__sigmoid_lut_element_81_90_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_81_90_0 =
    global_out__sigmoid_lut_element_81_90_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_82_91_0_valid =
    global_out__sigmoid_lut_element_82_91_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_82_91_0 =
    global_out__sigmoid_lut_element_82_91_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_83_92_0_valid =
    global_out__sigmoid_lut_element_83_92_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_83_92_0 =
    global_out__sigmoid_lut_element_83_92_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_84_93_0_valid =
    global_out__sigmoid_lut_element_84_93_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_84_93_0 =
    global_out__sigmoid_lut_element_84_93_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_85_94_0_valid =
    global_out__sigmoid_lut_element_85_94_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_85_94_0 =
    global_out__sigmoid_lut_element_85_94_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_86_95_0_valid =
    global_out__sigmoid_lut_element_86_95_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_86_95_0 =
    global_out__sigmoid_lut_element_86_95_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_87_96_0_valid =
    global_out__sigmoid_lut_element_87_96_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_87_96_0 =
    global_out__sigmoid_lut_element_87_96_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_88_97_0_valid =
    global_out__sigmoid_lut_element_88_97_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_88_97_0 =
    global_out__sigmoid_lut_element_88_97_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_89_98_0_valid =
    global_out__sigmoid_lut_element_89_98_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_89_98_0 =
    global_out__sigmoid_lut_element_89_98_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_90_99_0_valid =
    global_out__sigmoid_lut_element_90_99_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_90_99_0 =
    global_out__sigmoid_lut_element_90_99_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_91_100_0_valid =
    global_out__sigmoid_lut_element_91_100_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_91_100_0 =
    global_out__sigmoid_lut_element_91_100_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_92_101_0_valid =
    global_out__sigmoid_lut_element_92_101_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_92_101_0 =
    global_out__sigmoid_lut_element_92_101_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_93_102_0_valid =
    global_out__sigmoid_lut_element_93_102_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_93_102_0 =
    global_out__sigmoid_lut_element_93_102_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_94_103_0_valid =
    global_out__sigmoid_lut_element_94_103_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_94_103_0 =
    global_out__sigmoid_lut_element_94_103_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_95_104_0_valid =
    global_out__sigmoid_lut_element_95_104_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_95_104_0 =
    global_out__sigmoid_lut_element_95_104_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_96_105_0_valid =
    global_out__sigmoid_lut_element_96_105_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_96_105_0 =
    global_out__sigmoid_lut_element_96_105_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_97_106_0_valid =
    global_out__sigmoid_lut_element_97_106_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_97_106_0 =
    global_out__sigmoid_lut_element_97_106_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_98_107_0_valid =
    global_out__sigmoid_lut_element_98_107_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_98_107_0 =
    global_out__sigmoid_lut_element_98_107_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_99_108_0_valid =
    global_out__sigmoid_lut_element_99_108_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_99_108_0 =
    global_out__sigmoid_lut_element_99_108_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_100_109_0_valid =
    global_out__sigmoid_lut_element_100_109_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_100_109_0 =
    global_out__sigmoid_lut_element_100_109_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_101_110_0_valid =
    global_out__sigmoid_lut_element_101_110_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_101_110_0 =
    global_out__sigmoid_lut_element_101_110_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_102_111_0_valid =
    global_out__sigmoid_lut_element_102_111_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_102_111_0 =
    global_out__sigmoid_lut_element_102_111_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_103_112_0_valid =
    global_out__sigmoid_lut_element_103_112_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_103_112_0 =
    global_out__sigmoid_lut_element_103_112_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_104_113_0_valid =
    global_out__sigmoid_lut_element_104_113_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_104_113_0 =
    global_out__sigmoid_lut_element_104_113_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_105_114_0_valid =
    global_out__sigmoid_lut_element_105_114_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_105_114_0 =
    global_out__sigmoid_lut_element_105_114_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_106_115_0_valid =
    global_out__sigmoid_lut_element_106_115_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_106_115_0 =
    global_out__sigmoid_lut_element_106_115_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_107_116_0_valid =
    global_out__sigmoid_lut_element_107_116_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_107_116_0 =
    global_out__sigmoid_lut_element_107_116_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_108_117_0_valid =
    global_out__sigmoid_lut_element_108_117_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_108_117_0 =
    global_out__sigmoid_lut_element_108_117_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_109_118_0_valid =
    global_out__sigmoid_lut_element_109_118_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_109_118_0 =
    global_out__sigmoid_lut_element_109_118_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_110_119_0_valid =
    global_out__sigmoid_lut_element_110_119_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_110_119_0 =
    global_out__sigmoid_lut_element_110_119_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_111_120_0_valid =
    global_out__sigmoid_lut_element_111_120_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_111_120_0 =
    global_out__sigmoid_lut_element_111_120_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_112_121_0_valid =
    global_out__sigmoid_lut_element_112_121_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_112_121_0 =
    global_out__sigmoid_lut_element_112_121_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_113_122_0_valid =
    global_out__sigmoid_lut_element_113_122_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_113_122_0 =
    global_out__sigmoid_lut_element_113_122_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_114_123_0_valid =
    global_out__sigmoid_lut_element_114_123_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_114_123_0 =
    global_out__sigmoid_lut_element_114_123_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_115_124_0_valid =
    global_out__sigmoid_lut_element_115_124_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_115_124_0 =
    global_out__sigmoid_lut_element_115_124_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_116_125_0_valid =
    global_out__sigmoid_lut_element_116_125_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_116_125_0 =
    global_out__sigmoid_lut_element_116_125_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_117_126_0_valid =
    global_out__sigmoid_lut_element_117_126_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_117_126_0 =
    global_out__sigmoid_lut_element_117_126_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_118_127_0_valid =
    global_out__sigmoid_lut_element_118_127_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_118_127_0 =
    global_out__sigmoid_lut_element_118_127_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_119_128_0_valid =
    global_out__sigmoid_lut_element_119_128_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_119_128_0 =
    global_out__sigmoid_lut_element_119_128_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_120_129_0_valid =
    global_out__sigmoid_lut_element_120_129_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_120_129_0 =
    global_out__sigmoid_lut_element_120_129_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_121_130_0_valid =
    global_out__sigmoid_lut_element_121_130_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_121_130_0 =
    global_out__sigmoid_lut_element_121_130_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_122_131_0_valid =
    global_out__sigmoid_lut_element_122_131_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_122_131_0 =
    global_out__sigmoid_lut_element_122_131_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_123_132_0_valid =
    global_out__sigmoid_lut_element_123_132_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_123_132_0 =
    global_out__sigmoid_lut_element_123_132_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_124_133_0_valid =
    global_out__sigmoid_lut_element_124_133_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_124_133_0 =
    global_out__sigmoid_lut_element_124_133_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_125_134_0_valid =
    global_out__sigmoid_lut_element_125_134_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_125_134_0 =
    global_out__sigmoid_lut_element_125_134_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_126_135_0_valid =
    global_out__sigmoid_lut_element_126_135_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_126_135_0 =
    global_out__sigmoid_lut_element_126_135_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_127_136_0_valid =
    global_out__sigmoid_lut_element_127_136_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_127_136_0 =
    global_out__sigmoid_lut_element_127_136_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_128_137_0_valid =
    global_out__sigmoid_lut_element_128_137_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_128_137_0 =
    global_out__sigmoid_lut_element_128_137_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_129_138_0_valid =
    global_out__sigmoid_lut_element_129_138_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_129_138_0 =
    global_out__sigmoid_lut_element_129_138_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_130_139_0_valid =
    global_out__sigmoid_lut_element_130_139_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_130_139_0 =
    global_out__sigmoid_lut_element_130_139_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_131_140_0_valid =
    global_out__sigmoid_lut_element_131_140_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_131_140_0 =
    global_out__sigmoid_lut_element_131_140_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_132_141_0_valid =
    global_out__sigmoid_lut_element_132_141_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_132_141_0 =
    global_out__sigmoid_lut_element_132_141_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_133_142_0_valid =
    global_out__sigmoid_lut_element_133_142_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_133_142_0 =
    global_out__sigmoid_lut_element_133_142_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_134_143_0_valid =
    global_out__sigmoid_lut_element_134_143_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_134_143_0 =
    global_out__sigmoid_lut_element_134_143_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_135_144_0_valid =
    global_out__sigmoid_lut_element_135_144_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_135_144_0 =
    global_out__sigmoid_lut_element_135_144_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_136_145_0_valid =
    global_out__sigmoid_lut_element_136_145_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_136_145_0 =
    global_out__sigmoid_lut_element_136_145_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_137_146_0_valid =
    global_out__sigmoid_lut_element_137_146_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_137_146_0 =
    global_out__sigmoid_lut_element_137_146_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_138_147_0_valid =
    global_out__sigmoid_lut_element_138_147_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_138_147_0 =
    global_out__sigmoid_lut_element_138_147_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_139_148_0_valid =
    global_out__sigmoid_lut_element_139_148_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_139_148_0 =
    global_out__sigmoid_lut_element_139_148_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_140_149_0_valid =
    global_out__sigmoid_lut_element_140_149_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_140_149_0 =
    global_out__sigmoid_lut_element_140_149_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_141_150_0_valid =
    global_out__sigmoid_lut_element_141_150_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_141_150_0 =
    global_out__sigmoid_lut_element_141_150_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_142_151_0_valid =
    global_out__sigmoid_lut_element_142_151_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_142_151_0 =
    global_out__sigmoid_lut_element_142_151_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_143_152_0_valid =
    global_out__sigmoid_lut_element_143_152_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_143_152_0 =
    global_out__sigmoid_lut_element_143_152_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_144_153_0_valid =
    global_out__sigmoid_lut_element_144_153_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_144_153_0 =
    global_out__sigmoid_lut_element_144_153_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_145_154_0_valid =
    global_out__sigmoid_lut_element_145_154_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_145_154_0 =
    global_out__sigmoid_lut_element_145_154_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_146_155_0_valid =
    global_out__sigmoid_lut_element_146_155_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_146_155_0 =
    global_out__sigmoid_lut_element_146_155_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_147_156_0_valid =
    global_out__sigmoid_lut_element_147_156_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_147_156_0 =
    global_out__sigmoid_lut_element_147_156_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_148_157_0_valid =
    global_out__sigmoid_lut_element_148_157_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_148_157_0 =
    global_out__sigmoid_lut_element_148_157_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_149_158_0_valid =
    global_out__sigmoid_lut_element_149_158_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_149_158_0 =
    global_out__sigmoid_lut_element_149_158_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_150_159_0_valid =
    global_out__sigmoid_lut_element_150_159_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_150_159_0 =
    global_out__sigmoid_lut_element_150_159_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_151_160_0_valid =
    global_out__sigmoid_lut_element_151_160_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_151_160_0 =
    global_out__sigmoid_lut_element_151_160_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_152_161_0_valid =
    global_out__sigmoid_lut_element_152_161_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_152_161_0 =
    global_out__sigmoid_lut_element_152_161_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_153_162_0_valid =
    global_out__sigmoid_lut_element_153_162_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_153_162_0 =
    global_out__sigmoid_lut_element_153_162_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_154_163_0_valid =
    global_out__sigmoid_lut_element_154_163_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_154_163_0 =
    global_out__sigmoid_lut_element_154_163_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_155_164_0_valid =
    global_out__sigmoid_lut_element_155_164_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_155_164_0 =
    global_out__sigmoid_lut_element_155_164_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_156_165_0_valid =
    global_out__sigmoid_lut_element_156_165_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_156_165_0 =
    global_out__sigmoid_lut_element_156_165_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_157_166_0_valid =
    global_out__sigmoid_lut_element_157_166_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_157_166_0 =
    global_out__sigmoid_lut_element_157_166_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_158_167_0_valid =
    global_out__sigmoid_lut_element_158_167_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_158_167_0 =
    global_out__sigmoid_lut_element_158_167_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_159_168_0_valid =
    global_out__sigmoid_lut_element_159_168_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_159_168_0 =
    global_out__sigmoid_lut_element_159_168_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_160_169_0_valid =
    global_out__sigmoid_lut_element_160_169_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_160_169_0 =
    global_out__sigmoid_lut_element_160_169_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_161_170_0_valid =
    global_out__sigmoid_lut_element_161_170_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_161_170_0 =
    global_out__sigmoid_lut_element_161_170_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_162_171_0_valid =
    global_out__sigmoid_lut_element_162_171_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_162_171_0 =
    global_out__sigmoid_lut_element_162_171_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_163_172_0_valid =
    global_out__sigmoid_lut_element_163_172_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_163_172_0 =
    global_out__sigmoid_lut_element_163_172_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_164_173_0_valid =
    global_out__sigmoid_lut_element_164_173_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_164_173_0 =
    global_out__sigmoid_lut_element_164_173_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_165_174_0_valid =
    global_out__sigmoid_lut_element_165_174_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_165_174_0 =
    global_out__sigmoid_lut_element_165_174_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_166_175_0_valid =
    global_out__sigmoid_lut_element_166_175_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_166_175_0 =
    global_out__sigmoid_lut_element_166_175_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_167_176_0_valid =
    global_out__sigmoid_lut_element_167_176_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_167_176_0 =
    global_out__sigmoid_lut_element_167_176_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_168_177_0_valid =
    global_out__sigmoid_lut_element_168_177_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_168_177_0 =
    global_out__sigmoid_lut_element_168_177_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_169_178_0_valid =
    global_out__sigmoid_lut_element_169_178_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_169_178_0 =
    global_out__sigmoid_lut_element_169_178_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_170_179_0_valid =
    global_out__sigmoid_lut_element_170_179_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_170_179_0 =
    global_out__sigmoid_lut_element_170_179_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_171_180_0_valid =
    global_out__sigmoid_lut_element_171_180_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_171_180_0 =
    global_out__sigmoid_lut_element_171_180_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_172_181_0_valid =
    global_out__sigmoid_lut_element_172_181_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_172_181_0 =
    global_out__sigmoid_lut_element_172_181_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_173_182_0_valid =
    global_out__sigmoid_lut_element_173_182_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_173_182_0 =
    global_out__sigmoid_lut_element_173_182_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_174_183_0_valid =
    global_out__sigmoid_lut_element_174_183_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_174_183_0 =
    global_out__sigmoid_lut_element_174_183_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_175_184_0_valid =
    global_out__sigmoid_lut_element_175_184_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_175_184_0 =
    global_out__sigmoid_lut_element_175_184_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_176_185_0_valid =
    global_out__sigmoid_lut_element_176_185_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_176_185_0 =
    global_out__sigmoid_lut_element_176_185_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_177_186_0_valid =
    global_out__sigmoid_lut_element_177_186_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_177_186_0 =
    global_out__sigmoid_lut_element_177_186_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_178_187_0_valid =
    global_out__sigmoid_lut_element_178_187_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_178_187_0 =
    global_out__sigmoid_lut_element_178_187_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_179_188_0_valid =
    global_out__sigmoid_lut_element_179_188_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_179_188_0 =
    global_out__sigmoid_lut_element_179_188_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_180_189_0_valid =
    global_out__sigmoid_lut_element_180_189_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_180_189_0 =
    global_out__sigmoid_lut_element_180_189_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_181_190_0_valid =
    global_out__sigmoid_lut_element_181_190_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_181_190_0 =
    global_out__sigmoid_lut_element_181_190_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_182_191_0_valid =
    global_out__sigmoid_lut_element_182_191_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_182_191_0 =
    global_out__sigmoid_lut_element_182_191_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_183_192_0_valid =
    global_out__sigmoid_lut_element_183_192_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_183_192_0 =
    global_out__sigmoid_lut_element_183_192_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_184_193_0_valid =
    global_out__sigmoid_lut_element_184_193_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_184_193_0 =
    global_out__sigmoid_lut_element_184_193_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_185_194_0_valid =
    global_out__sigmoid_lut_element_185_194_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_185_194_0 =
    global_out__sigmoid_lut_element_185_194_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_186_195_0_valid =
    global_out__sigmoid_lut_element_186_195_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_186_195_0 =
    global_out__sigmoid_lut_element_186_195_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_187_196_0_valid =
    global_out__sigmoid_lut_element_187_196_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_187_196_0 =
    global_out__sigmoid_lut_element_187_196_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_188_197_0_valid =
    global_out__sigmoid_lut_element_188_197_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_188_197_0 =
    global_out__sigmoid_lut_element_188_197_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_189_198_0_valid =
    global_out__sigmoid_lut_element_189_198_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_189_198_0 =
    global_out__sigmoid_lut_element_189_198_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_190_199_0_valid =
    global_out__sigmoid_lut_element_190_199_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_190_199_0 =
    global_out__sigmoid_lut_element_190_199_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_191_200_0_valid =
    global_out__sigmoid_lut_element_191_200_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_191_200_0 =
    global_out__sigmoid_lut_element_191_200_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_192_201_0_valid =
    global_out__sigmoid_lut_element_192_201_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_192_201_0 =
    global_out__sigmoid_lut_element_192_201_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_193_202_0_valid =
    global_out__sigmoid_lut_element_193_202_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_193_202_0 =
    global_out__sigmoid_lut_element_193_202_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_194_203_0_valid =
    global_out__sigmoid_lut_element_194_203_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_194_203_0 =
    global_out__sigmoid_lut_element_194_203_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_195_204_0_valid =
    global_out__sigmoid_lut_element_195_204_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_195_204_0 =
    global_out__sigmoid_lut_element_195_204_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_196_205_0_valid =
    global_out__sigmoid_lut_element_196_205_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_196_205_0 =
    global_out__sigmoid_lut_element_196_205_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_197_206_0_valid =
    global_out__sigmoid_lut_element_197_206_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_197_206_0 =
    global_out__sigmoid_lut_element_197_206_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_198_207_0_valid =
    global_out__sigmoid_lut_element_198_207_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_198_207_0 =
    global_out__sigmoid_lut_element_198_207_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_199_208_0_valid =
    global_out__sigmoid_lut_element_199_208_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_199_208_0 =
    global_out__sigmoid_lut_element_199_208_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_200_209_0_valid =
    global_out__sigmoid_lut_element_200_209_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_200_209_0 =
    global_out__sigmoid_lut_element_200_209_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_201_210_0_valid =
    global_out__sigmoid_lut_element_201_210_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_201_210_0 =
    global_out__sigmoid_lut_element_201_210_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_202_211_0_valid =
    global_out__sigmoid_lut_element_202_211_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_202_211_0 =
    global_out__sigmoid_lut_element_202_211_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_203_212_0_valid =
    global_out__sigmoid_lut_element_203_212_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_203_212_0 =
    global_out__sigmoid_lut_element_203_212_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_204_213_0_valid =
    global_out__sigmoid_lut_element_204_213_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_204_213_0 =
    global_out__sigmoid_lut_element_204_213_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_205_214_0_valid =
    global_out__sigmoid_lut_element_205_214_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_205_214_0 =
    global_out__sigmoid_lut_element_205_214_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_206_215_0_valid =
    global_out__sigmoid_lut_element_206_215_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_206_215_0 =
    global_out__sigmoid_lut_element_206_215_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_207_216_0_valid =
    global_out__sigmoid_lut_element_207_216_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_207_216_0 =
    global_out__sigmoid_lut_element_207_216_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_208_217_0_valid =
    global_out__sigmoid_lut_element_208_217_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_208_217_0 =
    global_out__sigmoid_lut_element_208_217_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_209_218_0_valid =
    global_out__sigmoid_lut_element_209_218_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_209_218_0 =
    global_out__sigmoid_lut_element_209_218_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_210_219_0_valid =
    global_out__sigmoid_lut_element_210_219_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_210_219_0 =
    global_out__sigmoid_lut_element_210_219_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_211_220_0_valid =
    global_out__sigmoid_lut_element_211_220_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_211_220_0 =
    global_out__sigmoid_lut_element_211_220_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_212_221_0_valid =
    global_out__sigmoid_lut_element_212_221_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_212_221_0 =
    global_out__sigmoid_lut_element_212_221_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_213_222_0_valid =
    global_out__sigmoid_lut_element_213_222_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_213_222_0 =
    global_out__sigmoid_lut_element_213_222_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_214_223_0_valid =
    global_out__sigmoid_lut_element_214_223_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_214_223_0 =
    global_out__sigmoid_lut_element_214_223_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_215_224_0_valid =
    global_out__sigmoid_lut_element_215_224_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_215_224_0 =
    global_out__sigmoid_lut_element_215_224_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_216_225_0_valid =
    global_out__sigmoid_lut_element_216_225_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_216_225_0 =
    global_out__sigmoid_lut_element_216_225_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_217_226_0_valid =
    global_out__sigmoid_lut_element_217_226_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_217_226_0 =
    global_out__sigmoid_lut_element_217_226_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_218_227_0_valid =
    global_out__sigmoid_lut_element_218_227_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_218_227_0 =
    global_out__sigmoid_lut_element_218_227_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_219_228_0_valid =
    global_out__sigmoid_lut_element_219_228_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_219_228_0 =
    global_out__sigmoid_lut_element_219_228_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_220_229_0_valid =
    global_out__sigmoid_lut_element_220_229_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_220_229_0 =
    global_out__sigmoid_lut_element_220_229_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_221_230_0_valid =
    global_out__sigmoid_lut_element_221_230_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_221_230_0 =
    global_out__sigmoid_lut_element_221_230_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_222_231_0_valid =
    global_out__sigmoid_lut_element_222_231_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_222_231_0 =
    global_out__sigmoid_lut_element_222_231_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_223_232_0_valid =
    global_out__sigmoid_lut_element_223_232_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_223_232_0 =
    global_out__sigmoid_lut_element_223_232_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_224_233_0_valid =
    global_out__sigmoid_lut_element_224_233_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_224_233_0 =
    global_out__sigmoid_lut_element_224_233_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_225_234_0_valid =
    global_out__sigmoid_lut_element_225_234_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_225_234_0 =
    global_out__sigmoid_lut_element_225_234_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_226_235_0_valid =
    global_out__sigmoid_lut_element_226_235_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_226_235_0 =
    global_out__sigmoid_lut_element_226_235_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_227_236_0_valid =
    global_out__sigmoid_lut_element_227_236_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_227_236_0 =
    global_out__sigmoid_lut_element_227_236_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_228_237_0_valid =
    global_out__sigmoid_lut_element_228_237_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_228_237_0 =
    global_out__sigmoid_lut_element_228_237_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_229_238_0_valid =
    global_out__sigmoid_lut_element_229_238_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_229_238_0 =
    global_out__sigmoid_lut_element_229_238_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_230_239_0_valid =
    global_out__sigmoid_lut_element_230_239_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_230_239_0 =
    global_out__sigmoid_lut_element_230_239_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_231_240_0_valid =
    global_out__sigmoid_lut_element_231_240_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_231_240_0 =
    global_out__sigmoid_lut_element_231_240_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_232_241_0_valid =
    global_out__sigmoid_lut_element_232_241_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_232_241_0 =
    global_out__sigmoid_lut_element_232_241_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_233_242_0_valid =
    global_out__sigmoid_lut_element_233_242_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_233_242_0 =
    global_out__sigmoid_lut_element_233_242_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_234_243_0_valid =
    global_out__sigmoid_lut_element_234_243_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_234_243_0 =
    global_out__sigmoid_lut_element_234_243_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_235_244_0_valid =
    global_out__sigmoid_lut_element_235_244_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_235_244_0 =
    global_out__sigmoid_lut_element_235_244_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_236_245_0_valid =
    global_out__sigmoid_lut_element_236_245_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_236_245_0 =
    global_out__sigmoid_lut_element_236_245_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_237_246_0_valid =
    global_out__sigmoid_lut_element_237_246_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_237_246_0 =
    global_out__sigmoid_lut_element_237_246_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_238_247_0_valid =
    global_out__sigmoid_lut_element_238_247_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_238_247_0 =
    global_out__sigmoid_lut_element_238_247_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_239_248_0_valid =
    global_out__sigmoid_lut_element_239_248_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_239_248_0 =
    global_out__sigmoid_lut_element_239_248_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_240_249_0_valid =
    global_out__sigmoid_lut_element_240_249_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_240_249_0 =
    global_out__sigmoid_lut_element_240_249_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_241_250_0_valid =
    global_out__sigmoid_lut_element_241_250_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_241_250_0 =
    global_out__sigmoid_lut_element_241_250_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_242_251_0_valid =
    global_out__sigmoid_lut_element_242_251_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_242_251_0 =
    global_out__sigmoid_lut_element_242_251_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_243_252_0_valid =
    global_out__sigmoid_lut_element_243_252_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_243_252_0 =
    global_out__sigmoid_lut_element_243_252_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_244_253_0_valid =
    global_out__sigmoid_lut_element_244_253_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_244_253_0 =
    global_out__sigmoid_lut_element_244_253_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_245_254_0_valid =
    global_out__sigmoid_lut_element_245_254_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_245_254_0 =
    global_out__sigmoid_lut_element_245_254_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_246_255_0_valid =
    global_out__sigmoid_lut_element_246_255_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_246_255_0 =
    global_out__sigmoid_lut_element_246_255_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_247_256_0_valid =
    global_out__sigmoid_lut_element_247_256_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_247_256_0 =
    global_out__sigmoid_lut_element_247_256_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_248_257_0_valid =
    global_out__sigmoid_lut_element_248_257_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_248_257_0 =
    global_out__sigmoid_lut_element_248_257_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_249_258_0_valid =
    global_out__sigmoid_lut_element_249_258_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_249_258_0 =
    global_out__sigmoid_lut_element_249_258_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_250_259_0_valid =
    global_out__sigmoid_lut_element_250_259_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_250_259_0 =
    global_out__sigmoid_lut_element_250_259_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_251_260_0_valid =
    global_out__sigmoid_lut_element_251_260_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_251_260_0 =
    global_out__sigmoid_lut_element_251_260_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_252_261_0_valid =
    global_out__sigmoid_lut_element_252_261_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_252_261_0 =
    global_out__sigmoid_lut_element_252_261_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_253_262_0_valid =
    global_out__sigmoid_lut_element_253_262_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_253_262_0 =
    global_out__sigmoid_lut_element_253_262_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_254_263_0_valid =
    global_out__sigmoid_lut_element_254_263_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_254_263_0 =
    global_out__sigmoid_lut_element_254_263_0_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_255_264_0_valid =
    global_out__sigmoid_lut_element_255_264_0_valid_0;	// swiglu.k:19:9
  assign global_out__sigmoid_lut_element_255_264_0 =
    global_out__sigmoid_lut_element_255_264_0_0;	// swiglu.k:19:9
  assign fifo_wren_0 = fifo_wren_0_0;	// swiglu.k:19:9
  assign input_rdy_0 = input_rdy_0_0;	// swiglu.k:19:9
  assign control_state_out = control_state_out_0;	// swiglu.k:19:9
endmodule

module swiglu_unit_reg_16_w1(
  input  wire        clk,
  input  wire        input_valid_0,
  input  wire [15:0] input_0,
  output wire [15:0] value_out
);

  reg [15:0] value;
  always @(posedge clk)
    value <= input_valid_0 ? input_0 : value;
  assign value_out = value;
endmodule

module swiglu_unit(
  input  wire        clk,
  input  wire        rst,
  input  wire        set_sigmoid_lut_valid_in,
  input  wire [7:0]  set_sigmoid_lut_index_in,
  input  wire [15:0] set_sigmoid_lut_value_in,
  input  wire        set_sigmoid_lut_rden_in,
  input  wire        lookup_sigmoid_valid_in,
  input  wire [7:0]  lookup_sigmoid_index_in,
  input  wire        lookup_sigmoid_rden_in,
  input  wire        compute_silu_valid_in,
  input  wire [15:0] compute_silu_gate_bf16_in,
  input  wire        compute_silu_rden_in,
  input  wire        compute_swiglu_valid_in,
  input  wire [15:0] compute_swiglu_gate_bf16_in,
  input  wire [15:0] compute_swiglu_up_bf16_in,
  input  wire        compute_swiglu_rden_in,
  input  wire [2:0]  stall_rate_in,
  input  wire        stall_rate_valid_in,
  output wire        rst_and_startup_done_out,
  output wire        set_sigmoid_lut_rdy_out,
  output wire        set_sigmoid_lut_empty_out,
  output wire        lookup_sigmoid_rdy_out,
  output wire        lookup_sigmoid_empty_out,
  output wire [15:0] lookup_sigmoid_result_out,
  output wire        compute_silu_rdy_out,
  output wire        compute_silu_empty_out,
  output wire [15:0] compute_silu_result_out,
  output wire        compute_swiglu_rdy_out,
  output wire        compute_swiglu_empty_out,
  output wire [15:0] compute_swiglu_result_out,
  output wire        stall_rate_supported_out
);

  wire [15:0] _compute_swiglu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:93:9
  wire        _compute_swiglu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:93:9
  wire        _compute_swiglu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:93:9
  wire [15:0] _compute_silu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:41:9
  wire        _compute_silu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:41:9
  wire        _compute_silu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:41:9
  wire [15:0] _lookup_sigmoid_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:28:9
  wire        _lookup_sigmoid_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:28:9
  wire        _lookup_sigmoid_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:28:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_0_9_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_0_9_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_1_10_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_1_10_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_2_11_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_2_11_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_3_12_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_3_12_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_4_13_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_4_13_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_5_14_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_5_14_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_6_15_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_6_15_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_7_16_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_7_16_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_8_17_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_8_17_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_9_18_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_9_18_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_10_19_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_10_19_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_11_20_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_11_20_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_12_21_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_12_21_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_13_22_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_13_22_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_14_23_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_14_23_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_15_24_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_15_24_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_16_25_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_16_25_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_17_26_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_17_26_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_18_27_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_18_27_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_19_28_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_19_28_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_20_29_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_20_29_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_21_30_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_21_30_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_22_31_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_22_31_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_23_32_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_23_32_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_24_33_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_24_33_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_25_34_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_25_34_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_26_35_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_26_35_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_27_36_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_27_36_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_28_37_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_28_37_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_29_38_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_29_38_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_30_39_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_30_39_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_31_40_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_31_40_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_32_41_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_32_41_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_33_42_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_33_42_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_34_43_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_34_43_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_35_44_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_35_44_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_36_45_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_36_45_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_37_46_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_37_46_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_38_47_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_38_47_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_39_48_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_39_48_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_40_49_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_40_49_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_41_50_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_41_50_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_42_51_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_42_51_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_43_52_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_43_52_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_44_53_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_44_53_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_45_54_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_45_54_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_46_55_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_46_55_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_47_56_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_47_56_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_48_57_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_48_57_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_49_58_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_49_58_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_50_59_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_50_59_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_51_60_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_51_60_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_52_61_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_52_61_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_53_62_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_53_62_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_54_63_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_54_63_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_55_64_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_55_64_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_56_65_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_56_65_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_57_66_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_57_66_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_58_67_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_58_67_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_59_68_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_59_68_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_60_69_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_60_69_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_61_70_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_61_70_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_62_71_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_62_71_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_63_72_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_63_72_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_64_73_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_64_73_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_65_74_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_65_74_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_66_75_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_66_75_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_67_76_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_67_76_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_68_77_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_68_77_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_69_78_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_69_78_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_70_79_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_70_79_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_71_80_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_71_80_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_72_81_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_72_81_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_73_82_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_73_82_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_74_83_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_74_83_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_75_84_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_75_84_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_76_85_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_76_85_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_77_86_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_77_86_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_78_87_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_78_87_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_79_88_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_79_88_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_80_89_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_80_89_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_81_90_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_81_90_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_82_91_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_82_91_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_83_92_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_83_92_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_84_93_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_84_93_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_85_94_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_85_94_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_86_95_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_86_95_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_87_96_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_87_96_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_88_97_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_88_97_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_89_98_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_89_98_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_90_99_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_90_99_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_91_100_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_91_100_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_92_101_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_92_101_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_93_102_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_93_102_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_94_103_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_94_103_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_95_104_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_95_104_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_96_105_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_96_105_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_97_106_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_97_106_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_98_107_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_98_107_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_99_108_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_99_108_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_100_109_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_100_109_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_101_110_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_101_110_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_102_111_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_102_111_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_103_112_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_103_112_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_104_113_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_104_113_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_105_114_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_105_114_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_106_115_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_106_115_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_107_116_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_107_116_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_108_117_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_108_117_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_109_118_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_109_118_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_110_119_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_110_119_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_111_120_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_111_120_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_112_121_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_112_121_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_113_122_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_113_122_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_114_123_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_114_123_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_115_124_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_115_124_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_116_125_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_116_125_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_117_126_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_117_126_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_118_127_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_118_127_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_119_128_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_119_128_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_120_129_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_120_129_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_121_130_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_121_130_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_122_131_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_122_131_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_123_132_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_123_132_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_124_133_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_124_133_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_125_134_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_125_134_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_126_135_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_126_135_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_127_136_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_127_136_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_128_137_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_128_137_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_129_138_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_129_138_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_130_139_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_130_139_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_131_140_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_131_140_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_132_141_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_132_141_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_133_142_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_133_142_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_134_143_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_134_143_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_135_144_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_135_144_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_136_145_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_136_145_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_137_146_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_137_146_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_138_147_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_138_147_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_139_148_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_139_148_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_140_149_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_140_149_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_141_150_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_141_150_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_142_151_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_142_151_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_143_152_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_143_152_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_144_153_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_144_153_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_145_154_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_145_154_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_146_155_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_146_155_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_147_156_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_147_156_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_148_157_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_148_157_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_149_158_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_149_158_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_150_159_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_150_159_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_151_160_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_151_160_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_152_161_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_152_161_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_153_162_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_153_162_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_154_163_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_154_163_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_155_164_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_155_164_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_156_165_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_156_165_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_157_166_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_157_166_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_158_167_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_158_167_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_159_168_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_159_168_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_160_169_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_160_169_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_161_170_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_161_170_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_162_171_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_162_171_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_163_172_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_163_172_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_164_173_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_164_173_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_165_174_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_165_174_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_166_175_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_166_175_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_167_176_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_167_176_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_168_177_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_168_177_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_169_178_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_169_178_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_170_179_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_170_179_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_171_180_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_171_180_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_172_181_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_172_181_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_173_182_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_173_182_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_174_183_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_174_183_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_175_184_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_175_184_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_176_185_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_176_185_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_177_186_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_177_186_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_178_187_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_178_187_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_179_188_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_179_188_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_180_189_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_180_189_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_181_190_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_181_190_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_182_191_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_182_191_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_183_192_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_183_192_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_184_193_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_184_193_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_185_194_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_185_194_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_186_195_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_186_195_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_187_196_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_187_196_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_188_197_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_188_197_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_189_198_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_189_198_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_190_199_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_190_199_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_191_200_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_191_200_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_192_201_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_192_201_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_193_202_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_193_202_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_194_203_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_194_203_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_195_204_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_195_204_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_196_205_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_196_205_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_197_206_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_197_206_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_198_207_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_198_207_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_199_208_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_199_208_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_200_209_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_200_209_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_201_210_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_201_210_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_202_211_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_202_211_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_203_212_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_203_212_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_204_213_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_204_213_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_205_214_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_205_214_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_206_215_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_206_215_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_207_216_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_207_216_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_208_217_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_208_217_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_209_218_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_209_218_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_210_219_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_210_219_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_211_220_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_211_220_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_212_221_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_212_221_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_213_222_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_213_222_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_214_223_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_214_223_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_215_224_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_215_224_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_216_225_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_216_225_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_217_226_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_217_226_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_218_227_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_218_227_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_219_228_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_219_228_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_220_229_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_220_229_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_221_230_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_221_230_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_222_231_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_222_231_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_223_232_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_223_232_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_224_233_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_224_233_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_225_234_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_225_234_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_226_235_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_226_235_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_227_236_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_227_236_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_228_237_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_228_237_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_229_238_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_229_238_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_230_239_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_230_239_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_231_240_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_231_240_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_232_241_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_232_241_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_233_242_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_233_242_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_234_243_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_234_243_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_235_244_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_235_244_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_236_245_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_236_245_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_237_246_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_237_246_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_238_247_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_238_247_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_239_248_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_239_248_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_240_249_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_240_249_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_241_250_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_241_250_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_242_251_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_242_251_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_243_252_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_243_252_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_244_253_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_244_253_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_245_254_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_245_254_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_246_255_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_246_255_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_247_256_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_247_256_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_248_257_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_248_257_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_249_258_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_249_258_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_250_259_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_250_259_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_251_260_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_251_260_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_252_261_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_252_261_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_253_262_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_253_262_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_254_263_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_254_263_0;	// swiglu.k:19:9
  wire
    _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_255_264_0_valid;	// swiglu.k:19:9
  wire [15:0] _set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_255_264_0;	// swiglu.k:19:9
  wire        _set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:19:9
  wire        _set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:19:9
  wire        _fifo_3_compute_swiglu_Return_overflow_out;
  wire        _fifo_3_compute_swiglu_Return_underflow_out;
  wire        _fifo_3_compute_swiglu_Return_empty;
  wire        _fifo_3_compute_swiglu_Return_full;
  wire [15:0] _fifo_3_compute_swiglu_Return_q;
  wire        _fifo_2_compute_silu_Return_overflow_out;
  wire        _fifo_2_compute_silu_Return_underflow_out;
  wire        _fifo_2_compute_silu_Return_empty;
  wire        _fifo_2_compute_silu_Return_full;
  wire [15:0] _fifo_2_compute_silu_Return_q;
  wire        _fifo_1_lookup_sigmoid_Return_overflow_out;
  wire        _fifo_1_lookup_sigmoid_Return_underflow_out;
  wire        _fifo_1_lookup_sigmoid_Return_empty;
  wire        _fifo_1_lookup_sigmoid_Return_full;
  wire [15:0] _fifo_1_lookup_sigmoid_Return_q;
  wire        _fifo_0_set_sigmoid_lut_Return_overflow_out;
  wire        _fifo_0_set_sigmoid_lut_Return_underflow_out;
  wire        _fifo_0_set_sigmoid_lut_Return_empty;
  wire        _fifo_0_set_sigmoid_lut_Return_full;
  wire        _has_startup_completed_delayed_3_delay_chain_data_out;
  wire        _has_startup_completed_delayed_2_delay_chain_data_out;
  wire        _has_startup_completed_delayed_1_delay_chain_data_out;
  wire        _has_startup_completed_delayed_0_delay_chain_data_out;
  wire [15:0] __sigmoid_lut_element_255_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_254_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_253_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_252_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_251_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_250_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_249_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_248_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_247_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_246_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_245_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_244_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_243_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_242_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_241_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_240_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_239_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_238_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_237_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_236_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_235_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_234_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_233_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_232_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_231_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_230_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_229_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_228_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_227_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_226_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_225_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_224_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_223_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_222_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_221_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_220_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_219_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_218_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_217_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_216_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_215_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_214_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_213_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_212_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_211_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_210_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_209_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_208_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_207_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_206_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_205_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_204_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_203_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_202_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_201_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_200_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_199_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_198_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_197_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_196_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_195_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_194_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_193_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_192_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_191_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_190_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_189_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_188_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_187_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_186_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_185_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_184_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_183_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_182_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_181_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_180_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_179_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_178_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_177_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_176_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_175_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_174_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_173_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_172_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_171_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_170_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_169_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_168_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_167_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_166_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_165_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_164_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_163_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_162_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_161_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_160_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_159_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_158_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_157_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_156_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_155_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_154_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_153_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_152_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_151_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_150_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_149_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_148_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_147_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_146_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_145_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_144_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_143_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_142_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_141_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_140_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_139_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_138_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_137_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_136_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_135_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_134_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_133_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_132_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_131_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_130_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_129_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_128_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_127_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_126_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_125_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_124_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_123_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_122_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_121_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_120_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_119_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_118_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_117_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_116_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_115_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_114_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_113_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_112_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_111_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_110_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_109_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_108_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_107_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_106_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_105_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_104_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_103_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_102_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_101_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_100_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_99_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_98_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_97_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_96_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_95_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_94_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_93_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_92_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_91_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_90_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_89_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_88_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_87_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_86_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_85_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_84_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_83_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_82_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_81_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_80_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_79_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_78_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_77_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_76_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_75_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_74_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_73_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_72_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_71_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_70_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_69_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_68_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_67_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_66_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_65_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_64_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_63_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_62_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_61_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_60_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_59_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_58_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_57_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_56_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_55_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_54_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_53_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_52_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_51_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_50_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_49_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_48_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_47_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_46_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_45_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_44_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_43_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_42_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_41_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_40_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_39_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_38_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_37_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_36_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_35_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_34_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_33_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_32_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_31_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_30_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_29_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_28_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_27_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_26_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_25_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_24_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_23_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_22_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_21_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_20_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_19_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_18_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_17_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_16_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_15_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_14_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_13_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_12_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_11_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_10_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_9_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_8_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_7_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_6_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_5_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_4_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_3_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_2_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_1_value_out;	// swiglu.k:13:5
  wire [15:0] __sigmoid_lut_element_0_value_out;	// swiglu.k:13:5
  wire        _reset_control_rst_and_startup_done_out;
  wire [7:0]  _reset_control_rst_delayed_out;
  wire        _reset_control_reset_sequence_finished_this_cycle_out;
  logic  stall_rate_supported_out_net;
  logic  compute_swiglu_empty_out_net;
  logic [15:0] compute_swiglu_result_out_net;
  logic  compute_swiglu_rdy_out_net;
  logic  compute_silu_empty_out_net;
  logic [15:0] compute_silu_result_out_net;
  logic  compute_silu_rdy_out_net;
  logic  lookup_sigmoid_empty_out_net;
  logic [15:0] lookup_sigmoid_result_out_net;
  logic  lookup_sigmoid_rdy_out_net;
  logic  set_sigmoid_lut_empty_out_net;
  logic  set_sigmoid_lut_rdy_out_net;
  logic  rst_and_startup_done_out_net;

  logic [31:0] dropped_commands;
  //synopsys translate_off
  KanagawaStringTable string_table(.clk(clk));
  //synopsys translate_on
  logic [7:0] reg_rst_delayed;
  logic combined_reset;
  assign combined_reset = rst;
  logic reset_sequence_finished_this_cycle;
  logic has_startup_completed_raw;
  logic has_mem_init_completed;
  logic has_others_completed;
  assign has_others_completed = has_startup_completed_raw;

  logic rst_and_startup_done_raw;

  logic [0:0] rst_array;
  assign rst_array[0] = combined_reset;
  logic has_startup_completed_delayed_0;

  logic has_startup_completed_delayed_1;

  logic has_startup_completed_delayed_2;

  logic has_startup_completed_delayed_3;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic overflow;
      logic underflow;
  } fifo_data_0;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_1;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_2;

  struct packed {
      logic rden;
      logic empty;
      logic wren;
      logic almost_full;
      logic [15:0] data_in;
      logic [15:0] data_out;
      logic overflow;
      logic underflow;
  } fifo_data_3;

  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [23:0] data;
      logic underflow;
  } passthrough_data_4;
  assign passthrough_data_4.underflow = 1'b0;
  assign passthrough_data_4.rdy_ext = passthrough_data_4.rdy_int & !(!has_startup_completed_delayed_0);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [7:0] data;
      logic underflow;
  } passthrough_data_5;
  assign passthrough_data_5.underflow = 1'b0;
  assign passthrough_data_5.rdy_ext = passthrough_data_5.rdy_int & !(!has_startup_completed_delayed_1);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [15:0] data;
      logic underflow;
  } passthrough_data_6;
  assign passthrough_data_6.underflow = 1'b0;
  assign passthrough_data_6.rdy_ext = passthrough_data_6.rdy_int & !(!has_startup_completed_delayed_2);
  struct packed {
      logic rdy_int;
      logic rdy_ext;
      logic valid;
      logic [31:0] data;
      logic underflow;
  } passthrough_data_7;
  assign passthrough_data_7.underflow = 1'b0;
  assign passthrough_data_7.rdy_ext = passthrough_data_7.rdy_int & !(!has_startup_completed_delayed_3);
  assign set_sigmoid_lut_rdy_out_net = passthrough_data_4.rdy_ext;
  assign passthrough_data_4.valid = set_sigmoid_lut_rdy_out & set_sigmoid_lut_valid_in;
  assign passthrough_data_4.data = { set_sigmoid_lut_value_in, set_sigmoid_lut_index_in };
  assign fifo_data_0.rden = set_sigmoid_lut_rden_in;
  assign set_sigmoid_lut_empty_out_net = fifo_data_0.empty;
  assign lookup_sigmoid_rdy_out_net = passthrough_data_5.rdy_ext;
  assign passthrough_data_5.valid = lookup_sigmoid_rdy_out & lookup_sigmoid_valid_in;
  assign passthrough_data_5.data = { lookup_sigmoid_index_in };
  assign fifo_data_1.rden = lookup_sigmoid_rden_in;
  assign lookup_sigmoid_result_out_net = fifo_data_1.data_out;
  assign lookup_sigmoid_empty_out_net = fifo_data_1.empty;
  assign compute_silu_rdy_out_net = passthrough_data_6.rdy_ext;
  assign passthrough_data_6.valid = compute_silu_rdy_out & compute_silu_valid_in;
  assign passthrough_data_6.data = { compute_silu_gate_bf16_in };
  assign fifo_data_2.rden = compute_silu_rden_in;
  assign compute_silu_result_out_net = fifo_data_2.data_out;
  assign compute_silu_empty_out_net = fifo_data_2.empty;
  assign compute_swiglu_rdy_out_net = passthrough_data_7.rdy_ext;
  assign passthrough_data_7.valid = compute_swiglu_rdy_out & compute_swiglu_valid_in;
  assign passthrough_data_7.data = { compute_swiglu_up_bf16_in, compute_swiglu_gate_bf16_in };
  assign fifo_data_3.rden = compute_swiglu_rden_in;
  assign compute_swiglu_result_out_net = fifo_data_3.data_out;
  assign compute_swiglu_empty_out_net = fifo_data_3.empty;
  always_comb begin
    rst_and_startup_done_out_net = _reset_control_rst_and_startup_done_out;
    reg_rst_delayed = _reset_control_rst_delayed_out;
    reset_sequence_finished_this_cycle = _reset_control_reset_sequence_finished_this_cycle_out;
    has_startup_completed_delayed_0 = _has_startup_completed_delayed_0_delay_chain_data_out;
    has_startup_completed_delayed_1 = _has_startup_completed_delayed_1_delay_chain_data_out;
    has_startup_completed_delayed_2 = _has_startup_completed_delayed_2_delay_chain_data_out;
    has_startup_completed_delayed_3 = _has_startup_completed_delayed_3_delay_chain_data_out;
    fifo_data_0.overflow = _fifo_0_set_sigmoid_lut_Return_overflow_out;
    fifo_data_0.underflow = _fifo_0_set_sigmoid_lut_Return_underflow_out;
    fifo_data_0.empty = _fifo_0_set_sigmoid_lut_Return_empty;
    fifo_data_0.almost_full = _fifo_0_set_sigmoid_lut_Return_full;
    fifo_data_1.overflow = _fifo_1_lookup_sigmoid_Return_overflow_out;
    fifo_data_1.underflow = _fifo_1_lookup_sigmoid_Return_underflow_out;
    fifo_data_1.empty = _fifo_1_lookup_sigmoid_Return_empty;
    fifo_data_1.almost_full = _fifo_1_lookup_sigmoid_Return_full;
    fifo_data_1.data_out = _fifo_1_lookup_sigmoid_Return_q;
    fifo_data_2.overflow = _fifo_2_compute_silu_Return_overflow_out;
    fifo_data_2.underflow = _fifo_2_compute_silu_Return_underflow_out;
    fifo_data_2.empty = _fifo_2_compute_silu_Return_empty;
    fifo_data_2.almost_full = _fifo_2_compute_silu_Return_full;
    fifo_data_2.data_out = _fifo_2_compute_silu_Return_q;
    fifo_data_3.overflow = _fifo_3_compute_swiglu_Return_overflow_out;
    fifo_data_3.underflow = _fifo_3_compute_swiglu_Return_underflow_out;
    fifo_data_3.empty = _fifo_3_compute_swiglu_Return_empty;
    fifo_data_3.almost_full = _fifo_3_compute_swiglu_Return_full;
    fifo_data_3.data_out = _fifo_3_compute_swiglu_Return_q;
    fifo_data_0.wren = _set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:19:9
    passthrough_data_4.rdy_int = _set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:19:9
    fifo_data_1.data_in = _lookup_sigmoid_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:28:9
    fifo_data_1.wren = _lookup_sigmoid_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:28:9
    passthrough_data_5.rdy_int = _lookup_sigmoid_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:28:9
    fifo_data_2.data_in = _compute_silu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:41:9
    fifo_data_2.wren = _compute_silu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:41:9
    passthrough_data_6.rdy_int = _compute_silu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:41:9
    fifo_data_3.data_in = _compute_swiglu_BasicBlock_0Impl_fifo_data_out_0;	// swiglu.k:93:9
    fifo_data_3.wren = _compute_swiglu_BasicBlock_0Impl_fifo_wren_0;	// swiglu.k:93:9
    passthrough_data_7.rdy_int = _compute_swiglu_BasicBlock_0Impl_input_rdy_0;	// swiglu.k:93:9
  end // always_comb

  assign has_startup_completed_raw = 1'b1;
  assign stall_rate_supported_out_net = 1'b0;
  KanagawaResetControl #(
    .WIDTH(8),
    .DELAY_CYCLES(3),
    .FAN_OUT_LEVELS(1),
    .HOLD_CYCLES(18),
    .ADDTIONAL_LATENCY(1),
    .INIT_VAL(1)
  ) reset_control (
    .clk                                    (clk),
    .rst_in                                 (combined_reset),
    .has_others_completed_in                (has_startup_completed_raw),
    .rst_and_startup_done_out               (_reset_control_rst_and_startup_done_out),
    .rst_delayed_out                        (_reset_control_rst_delayed_out),
    .reset_sequence_finished_this_cycle_out
      (_reset_control_reset_sequence_finished_this_cycle_out)
  );
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_0 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_0_9_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_0_9_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_0_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_1 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_1_10_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_1_10_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_1_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_2 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_2_11_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_2_11_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_2_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_3 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_3_12_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_3_12_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_3_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_4 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_4_13_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_4_13_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_4_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_5 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_5_14_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_5_14_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_5_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_6 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_6_15_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_6_15_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_6_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_7 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_7_16_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_7_16_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_7_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_8 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_8_17_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_8_17_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_8_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_9 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_9_18_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_9_18_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_9_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_10 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_10_19_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_10_19_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_10_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_11 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_11_20_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_11_20_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_11_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_12 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_12_21_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_12_21_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_12_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_13 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_13_22_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_13_22_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_13_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_14 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_14_23_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_14_23_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_14_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_15 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_15_24_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_15_24_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_15_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_16 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_16_25_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_16_25_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_16_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_17 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_17_26_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_17_26_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_17_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_18 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_18_27_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_18_27_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_18_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_19 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_19_28_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_19_28_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_19_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_20 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_20_29_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_20_29_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_20_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_21 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_21_30_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_21_30_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_21_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_22 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_22_31_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_22_31_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_22_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_23 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_23_32_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_23_32_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_23_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_24 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_24_33_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_24_33_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_24_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_25 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_25_34_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_25_34_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_25_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_26 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_26_35_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_26_35_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_26_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_27 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_27_36_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_27_36_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_27_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_28 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_28_37_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_28_37_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_28_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_29 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_29_38_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_29_38_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_29_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_30 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_30_39_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_30_39_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_30_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_31 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_31_40_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_31_40_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_31_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_32 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_32_41_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_32_41_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_32_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_33 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_33_42_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_33_42_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_33_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_34 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_34_43_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_34_43_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_34_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_35 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_35_44_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_35_44_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_35_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_36 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_36_45_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_36_45_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_36_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_37 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_37_46_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_37_46_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_37_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_38 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_38_47_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_38_47_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_38_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_39 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_39_48_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_39_48_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_39_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_40 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_40_49_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_40_49_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_40_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_41 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_41_50_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_41_50_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_41_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_42 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_42_51_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_42_51_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_42_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_43 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_43_52_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_43_52_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_43_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_44 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_44_53_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_44_53_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_44_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_45 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_45_54_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_45_54_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_45_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_46 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_46_55_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_46_55_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_46_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_47 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_47_56_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_47_56_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_47_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_48 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_48_57_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_48_57_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_48_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_49 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_49_58_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_49_58_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_49_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_50 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_50_59_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_50_59_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_50_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_51 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_51_60_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_51_60_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_51_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_52 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_52_61_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_52_61_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_52_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_53 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_53_62_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_53_62_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_53_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_54 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_54_63_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_54_63_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_54_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_55 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_55_64_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_55_64_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_55_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_56 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_56_65_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_56_65_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_56_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_57 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_57_66_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_57_66_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_57_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_58 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_58_67_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_58_67_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_58_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_59 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_59_68_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_59_68_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_59_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_60 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_60_69_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_60_69_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_60_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_61 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_61_70_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_61_70_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_61_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_62 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_62_71_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_62_71_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_62_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_63 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_63_72_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_63_72_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_63_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_64 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_64_73_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_64_73_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_64_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_65 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_65_74_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_65_74_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_65_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_66 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_66_75_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_66_75_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_66_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_67 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_67_76_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_67_76_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_67_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_68 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_68_77_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_68_77_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_68_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_69 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_69_78_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_69_78_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_69_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_70 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_70_79_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_70_79_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_70_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_71 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_71_80_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_71_80_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_71_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_72 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_72_81_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_72_81_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_72_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_73 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_73_82_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_73_82_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_73_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_74 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_74_83_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_74_83_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_74_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_75 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_75_84_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_75_84_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_75_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_76 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_76_85_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_76_85_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_76_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_77 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_77_86_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_77_86_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_77_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_78 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_78_87_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_78_87_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_78_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_79 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_79_88_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_79_88_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_79_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_80 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_80_89_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_80_89_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_80_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_81 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_81_90_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_81_90_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_81_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_82 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_82_91_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_82_91_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_82_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_83 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_83_92_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_83_92_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_83_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_84 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_84_93_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_84_93_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_84_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_85 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_85_94_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_85_94_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_85_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_86 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_86_95_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_86_95_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_86_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_87 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_87_96_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_87_96_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_87_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_88 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_88_97_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_88_97_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_88_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_89 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_89_98_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_89_98_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_89_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_90 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_90_99_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_90_99_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_90_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_91 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_91_100_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_91_100_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_91_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_92 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_92_101_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_92_101_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_92_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_93 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_93_102_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_93_102_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_93_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_94 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_94_103_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_94_103_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_94_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_95 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_95_104_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_95_104_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_95_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_96 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_96_105_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_96_105_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_96_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_97 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_97_106_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_97_106_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_97_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_98 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_98_107_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_98_107_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_98_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_99 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_99_108_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_99_108_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_99_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_100 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_100_109_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_100_109_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_100_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_101 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_101_110_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_101_110_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_101_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_102 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_102_111_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_102_111_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_102_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_103 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_103_112_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_103_112_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_103_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_104 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_104_113_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_104_113_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_104_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_105 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_105_114_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_105_114_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_105_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_106 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_106_115_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_106_115_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_106_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_107 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_107_116_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_107_116_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_107_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_108 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_108_117_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_108_117_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_108_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_109 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_109_118_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_109_118_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_109_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_110 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_110_119_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_110_119_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_110_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_111 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_111_120_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_111_120_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_111_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_112 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_112_121_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_112_121_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_112_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_113 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_113_122_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_113_122_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_113_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_114 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_114_123_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_114_123_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_114_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_115 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_115_124_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_115_124_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_115_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_116 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_116_125_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_116_125_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_116_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_117 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_117_126_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_117_126_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_117_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_118 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_118_127_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_118_127_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_118_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_119 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_119_128_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_119_128_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_119_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_120 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_120_129_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_120_129_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_120_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_121 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_121_130_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_121_130_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_121_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_122 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_122_131_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_122_131_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_122_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_123 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_123_132_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_123_132_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_123_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_124 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_124_133_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_124_133_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_124_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_125 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_125_134_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_125_134_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_125_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_126 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_126_135_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_126_135_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_126_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_127 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_127_136_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_127_136_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_127_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_128 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_128_137_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_128_137_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_128_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_129 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_129_138_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_129_138_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_129_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_130 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_130_139_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_130_139_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_130_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_131 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_131_140_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_131_140_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_131_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_132 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_132_141_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_132_141_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_132_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_133 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_133_142_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_133_142_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_133_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_134 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_134_143_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_134_143_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_134_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_135 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_135_144_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_135_144_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_135_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_136 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_136_145_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_136_145_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_136_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_137 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_137_146_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_137_146_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_137_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_138 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_138_147_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_138_147_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_138_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_139 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_139_148_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_139_148_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_139_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_140 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_140_149_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_140_149_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_140_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_141 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_141_150_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_141_150_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_141_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_142 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_142_151_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_142_151_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_142_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_143 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_143_152_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_143_152_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_143_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_144 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_144_153_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_144_153_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_144_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_145 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_145_154_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_145_154_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_145_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_146 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_146_155_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_146_155_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_146_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_147 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_147_156_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_147_156_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_147_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_148 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_148_157_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_148_157_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_148_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_149 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_149_158_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_149_158_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_149_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_150 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_150_159_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_150_159_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_150_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_151 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_151_160_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_151_160_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_151_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_152 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_152_161_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_152_161_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_152_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_153 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_153_162_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_153_162_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_153_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_154 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_154_163_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_154_163_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_154_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_155 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_155_164_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_155_164_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_155_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_156 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_156_165_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_156_165_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_156_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_157 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_157_166_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_157_166_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_157_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_158 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_158_167_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_158_167_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_158_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_159 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_159_168_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_159_168_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_159_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_160 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_160_169_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_160_169_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_160_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_161 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_161_170_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_161_170_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_161_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_162 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_162_171_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_162_171_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_162_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_163 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_163_172_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_163_172_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_163_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_164 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_164_173_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_164_173_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_164_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_165 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_165_174_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_165_174_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_165_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_166 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_166_175_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_166_175_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_166_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_167 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_167_176_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_167_176_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_167_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_168 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_168_177_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_168_177_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_168_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_169 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_169_178_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_169_178_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_169_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_170 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_170_179_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_170_179_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_170_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_171 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_171_180_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_171_180_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_171_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_172 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_172_181_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_172_181_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_172_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_173 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_173_182_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_173_182_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_173_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_174 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_174_183_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_174_183_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_174_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_175 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_175_184_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_175_184_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_175_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_176 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_176_185_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_176_185_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_176_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_177 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_177_186_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_177_186_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_177_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_178 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_178_187_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_178_187_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_178_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_179 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_179_188_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_179_188_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_179_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_180 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_180_189_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_180_189_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_180_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_181 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_181_190_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_181_190_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_181_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_182 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_182_191_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_182_191_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_182_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_183 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_183_192_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_183_192_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_183_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_184 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_184_193_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_184_193_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_184_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_185 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_185_194_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_185_194_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_185_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_186 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_186_195_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_186_195_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_186_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_187 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_187_196_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_187_196_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_187_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_188 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_188_197_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_188_197_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_188_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_189 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_189_198_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_189_198_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_189_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_190 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_190_199_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_190_199_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_190_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_191 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_191_200_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_191_200_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_191_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_192 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_192_201_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_192_201_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_192_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_193 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_193_202_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_193_202_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_193_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_194 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_194_203_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_194_203_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_194_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_195 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_195_204_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_195_204_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_195_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_196 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_196_205_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_196_205_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_196_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_197 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_197_206_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_197_206_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_197_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_198 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_198_207_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_198_207_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_198_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_199 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_199_208_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_199_208_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_199_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_200 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_200_209_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_200_209_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_200_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_201 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_201_210_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_201_210_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_201_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_202 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_202_211_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_202_211_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_202_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_203 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_203_212_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_203_212_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_203_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_204 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_204_213_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_204_213_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_204_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_205 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_205_214_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_205_214_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_205_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_206 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_206_215_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_206_215_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_206_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_207 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_207_216_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_207_216_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_207_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_208 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_208_217_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_208_217_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_208_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_209 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_209_218_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_209_218_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_209_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_210 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_210_219_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_210_219_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_210_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_211 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_211_220_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_211_220_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_211_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_212 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_212_221_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_212_221_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_212_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_213 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_213_222_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_213_222_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_213_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_214 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_214_223_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_214_223_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_214_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_215 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_215_224_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_215_224_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_215_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_216 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_216_225_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_216_225_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_216_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_217 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_217_226_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_217_226_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_217_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_218 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_218_227_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_218_227_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_218_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_219 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_219_228_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_219_228_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_219_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_220 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_220_229_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_220_229_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_220_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_221 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_221_230_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_221_230_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_221_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_222 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_222_231_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_222_231_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_222_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_223 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_223_232_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_223_232_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_223_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_224 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_224_233_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_224_233_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_224_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_225 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_225_234_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_225_234_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_225_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_226 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_226_235_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_226_235_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_226_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_227 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_227_236_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_227_236_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_227_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_228 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_228_237_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_228_237_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_228_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_229 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_229_238_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_229_238_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_229_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_230 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_230_239_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_230_239_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_230_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_231 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_231_240_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_231_240_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_231_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_232 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_232_241_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_232_241_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_232_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_233 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_233_242_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_233_242_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_233_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_234 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_234_243_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_234_243_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_234_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_235 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_235_244_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_235_244_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_235_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_236 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_236_245_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_236_245_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_236_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_237 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_237_246_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_237_246_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_237_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_238 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_238_247_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_238_247_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_238_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_239 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_239_248_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_239_248_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_239_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_240 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_240_249_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_240_249_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_240_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_241 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_241_250_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_241_250_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_241_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_242 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_242_251_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_242_251_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_242_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_243 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_243_252_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_243_252_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_243_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_244 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_244_253_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_244_253_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_244_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_245 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_245_254_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_245_254_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_245_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_246 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_246_255_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_246_255_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_246_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_247 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_247_256_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_247_256_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_247_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_248 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_248_257_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_248_257_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_248_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_249 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_249_258_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_249_258_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_249_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_250 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_250_259_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_250_259_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_250_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_251 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_251_260_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_251_260_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_251_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_252 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_252_261_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_252_261_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_252_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_253 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_253_262_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_253_262_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_253_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_254 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_254_263_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_254_263_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_254_value_out)
  );	// swiglu.k:13:5
  swiglu_unit_reg_16_w1 _sigmoid_lut_element_255 (	// swiglu.k:13:5
    .clk           (clk),	// swiglu.k:13:5
    .input_valid_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_255_264_0_valid),	// swiglu.k:19:9
    .input_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_255_264_0),	// swiglu.k:19:9
    .value_out     (__sigmoid_lut_element_255_value_out)
  );	// swiglu.k:13:5
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
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(0),
    .PORT_WIDTH(1),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_0_set_sigmoid_lut_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(3),
    .USE_LUTRAM(0)
  ) fifo_0_set_sigmoid_lut_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[0]),
    .overflow_out  (_fifo_0_set_sigmoid_lut_Return_overflow_out),
    .underflow_out (_fifo_0_set_sigmoid_lut_Return_underflow_out),
    .empty         (_fifo_0_set_sigmoid_lut_Return_empty),
    .rdreq         (fifo_data_0.rden),
    .full          (_fifo_0_set_sigmoid_lut_Return_full),
    .wrreq         (fifo_data_0.wren),
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
    .AUTO_PIPELINE_GROUP("fifo_1_lookup_sigmoid_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_1_lookup_sigmoid_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[1]),
    .overflow_out  (_fifo_1_lookup_sigmoid_Return_overflow_out),
    .underflow_out (_fifo_1_lookup_sigmoid_Return_underflow_out),
    .empty         (_fifo_1_lookup_sigmoid_Return_empty),
    .rdreq         (fifo_data_1.rden),
    .full          (_fifo_1_lookup_sigmoid_Return_full),
    .wrreq         (fifo_data_1.wren),
    .data          (fifo_data_1.data_in),
    .q             (_fifo_1_lookup_sigmoid_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_2_compute_silu_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_2_compute_silu_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[2]),
    .overflow_out  (_fifo_2_compute_silu_Return_overflow_out),
    .underflow_out (_fifo_2_compute_silu_Return_underflow_out),
    .empty         (_fifo_2_compute_silu_Return_empty),
    .rdreq         (fifo_data_2.rden),
    .full          (_fifo_2_compute_silu_Return_full),
    .wrreq         (fifo_data_2.wren),
    .data          (fifo_data_2.data_in),
    .q             (_fifo_2_compute_silu_Return_q)
  );
  KanagawaWriteDelayFifo #(
    .IS_TRANSACTIONAL(0),
    .END_TRANSACTION_OFFSET(0),
    .WIDTH(16),
    .PORT_WIDTH(16),
    .WRITE_DELAY(0),
    .ALMOSTEMPTY_VAL(0),
    .MIN_WRITE_DELAY(0),
    .AUTO_PIPELINE_GROUP("fifo_3_compute_swiglu_Return"),
    .DEPTH(32),
    .ALMOSTFULL_ENTRIES(4),
    .USE_LUTRAM(1)
  ) fifo_3_compute_swiglu_Return (
    .clock         (clk),
    .rst           (reg_rst_delayed[3]),
    .overflow_out  (_fifo_3_compute_swiglu_Return_overflow_out),
    .underflow_out (_fifo_3_compute_swiglu_Return_underflow_out),
    .empty         (_fifo_3_compute_swiglu_Return_empty),
    .rdreq         (fifo_data_3.rden),
    .full          (_fifo_3_compute_swiglu_Return_full),
    .wrreq         (fifo_data_3.wren),
    .data          (fifo_data_3.data_in),
    .q             (_fifo_3_compute_swiglu_Return_q)
  );
  swiglu_unit_set_sigmoid_lut_BasicBlock_0 set_sigmoid_lut_BasicBlock_0Impl (	// swiglu.k:19:9
    .clk                                             (clk),	// swiglu.k:19:9
    .rst                                             (reg_rst_delayed[4]),	// swiglu.k:19:9
    .done_out                                        (/* unused */),
    .global_out__sigmoid_lut_element_0_9_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_0_9_0_valid),
    .global_out__sigmoid_lut_element_0_9_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_0_9_0),
    .global_out__sigmoid_lut_element_1_10_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_1_10_0_valid),
    .global_out__sigmoid_lut_element_1_10_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_1_10_0),
    .global_out__sigmoid_lut_element_2_11_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_2_11_0_valid),
    .global_out__sigmoid_lut_element_2_11_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_2_11_0),
    .global_out__sigmoid_lut_element_3_12_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_3_12_0_valid),
    .global_out__sigmoid_lut_element_3_12_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_3_12_0),
    .global_out__sigmoid_lut_element_4_13_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_4_13_0_valid),
    .global_out__sigmoid_lut_element_4_13_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_4_13_0),
    .global_out__sigmoid_lut_element_5_14_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_5_14_0_valid),
    .global_out__sigmoid_lut_element_5_14_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_5_14_0),
    .global_out__sigmoid_lut_element_6_15_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_6_15_0_valid),
    .global_out__sigmoid_lut_element_6_15_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_6_15_0),
    .global_out__sigmoid_lut_element_7_16_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_7_16_0_valid),
    .global_out__sigmoid_lut_element_7_16_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_7_16_0),
    .global_out__sigmoid_lut_element_8_17_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_8_17_0_valid),
    .global_out__sigmoid_lut_element_8_17_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_8_17_0),
    .global_out__sigmoid_lut_element_9_18_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_9_18_0_valid),
    .global_out__sigmoid_lut_element_9_18_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_9_18_0),
    .global_out__sigmoid_lut_element_10_19_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_10_19_0_valid),
    .global_out__sigmoid_lut_element_10_19_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_10_19_0),
    .global_out__sigmoid_lut_element_11_20_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_11_20_0_valid),
    .global_out__sigmoid_lut_element_11_20_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_11_20_0),
    .global_out__sigmoid_lut_element_12_21_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_12_21_0_valid),
    .global_out__sigmoid_lut_element_12_21_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_12_21_0),
    .global_out__sigmoid_lut_element_13_22_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_13_22_0_valid),
    .global_out__sigmoid_lut_element_13_22_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_13_22_0),
    .global_out__sigmoid_lut_element_14_23_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_14_23_0_valid),
    .global_out__sigmoid_lut_element_14_23_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_14_23_0),
    .global_out__sigmoid_lut_element_15_24_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_15_24_0_valid),
    .global_out__sigmoid_lut_element_15_24_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_15_24_0),
    .global_out__sigmoid_lut_element_16_25_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_16_25_0_valid),
    .global_out__sigmoid_lut_element_16_25_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_16_25_0),
    .global_out__sigmoid_lut_element_17_26_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_17_26_0_valid),
    .global_out__sigmoid_lut_element_17_26_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_17_26_0),
    .global_out__sigmoid_lut_element_18_27_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_18_27_0_valid),
    .global_out__sigmoid_lut_element_18_27_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_18_27_0),
    .global_out__sigmoid_lut_element_19_28_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_19_28_0_valid),
    .global_out__sigmoid_lut_element_19_28_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_19_28_0),
    .global_out__sigmoid_lut_element_20_29_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_20_29_0_valid),
    .global_out__sigmoid_lut_element_20_29_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_20_29_0),
    .global_out__sigmoid_lut_element_21_30_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_21_30_0_valid),
    .global_out__sigmoid_lut_element_21_30_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_21_30_0),
    .global_out__sigmoid_lut_element_22_31_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_22_31_0_valid),
    .global_out__sigmoid_lut_element_22_31_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_22_31_0),
    .global_out__sigmoid_lut_element_23_32_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_23_32_0_valid),
    .global_out__sigmoid_lut_element_23_32_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_23_32_0),
    .global_out__sigmoid_lut_element_24_33_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_24_33_0_valid),
    .global_out__sigmoid_lut_element_24_33_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_24_33_0),
    .global_out__sigmoid_lut_element_25_34_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_25_34_0_valid),
    .global_out__sigmoid_lut_element_25_34_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_25_34_0),
    .global_out__sigmoid_lut_element_26_35_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_26_35_0_valid),
    .global_out__sigmoid_lut_element_26_35_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_26_35_0),
    .global_out__sigmoid_lut_element_27_36_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_27_36_0_valid),
    .global_out__sigmoid_lut_element_27_36_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_27_36_0),
    .global_out__sigmoid_lut_element_28_37_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_28_37_0_valid),
    .global_out__sigmoid_lut_element_28_37_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_28_37_0),
    .global_out__sigmoid_lut_element_29_38_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_29_38_0_valid),
    .global_out__sigmoid_lut_element_29_38_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_29_38_0),
    .global_out__sigmoid_lut_element_30_39_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_30_39_0_valid),
    .global_out__sigmoid_lut_element_30_39_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_30_39_0),
    .global_out__sigmoid_lut_element_31_40_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_31_40_0_valid),
    .global_out__sigmoid_lut_element_31_40_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_31_40_0),
    .global_out__sigmoid_lut_element_32_41_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_32_41_0_valid),
    .global_out__sigmoid_lut_element_32_41_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_32_41_0),
    .global_out__sigmoid_lut_element_33_42_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_33_42_0_valid),
    .global_out__sigmoid_lut_element_33_42_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_33_42_0),
    .global_out__sigmoid_lut_element_34_43_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_34_43_0_valid),
    .global_out__sigmoid_lut_element_34_43_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_34_43_0),
    .global_out__sigmoid_lut_element_35_44_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_35_44_0_valid),
    .global_out__sigmoid_lut_element_35_44_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_35_44_0),
    .global_out__sigmoid_lut_element_36_45_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_36_45_0_valid),
    .global_out__sigmoid_lut_element_36_45_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_36_45_0),
    .global_out__sigmoid_lut_element_37_46_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_37_46_0_valid),
    .global_out__sigmoid_lut_element_37_46_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_37_46_0),
    .global_out__sigmoid_lut_element_38_47_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_38_47_0_valid),
    .global_out__sigmoid_lut_element_38_47_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_38_47_0),
    .global_out__sigmoid_lut_element_39_48_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_39_48_0_valid),
    .global_out__sigmoid_lut_element_39_48_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_39_48_0),
    .global_out__sigmoid_lut_element_40_49_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_40_49_0_valid),
    .global_out__sigmoid_lut_element_40_49_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_40_49_0),
    .global_out__sigmoid_lut_element_41_50_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_41_50_0_valid),
    .global_out__sigmoid_lut_element_41_50_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_41_50_0),
    .global_out__sigmoid_lut_element_42_51_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_42_51_0_valid),
    .global_out__sigmoid_lut_element_42_51_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_42_51_0),
    .global_out__sigmoid_lut_element_43_52_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_43_52_0_valid),
    .global_out__sigmoid_lut_element_43_52_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_43_52_0),
    .global_out__sigmoid_lut_element_44_53_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_44_53_0_valid),
    .global_out__sigmoid_lut_element_44_53_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_44_53_0),
    .global_out__sigmoid_lut_element_45_54_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_45_54_0_valid),
    .global_out__sigmoid_lut_element_45_54_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_45_54_0),
    .global_out__sigmoid_lut_element_46_55_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_46_55_0_valid),
    .global_out__sigmoid_lut_element_46_55_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_46_55_0),
    .global_out__sigmoid_lut_element_47_56_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_47_56_0_valid),
    .global_out__sigmoid_lut_element_47_56_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_47_56_0),
    .global_out__sigmoid_lut_element_48_57_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_48_57_0_valid),
    .global_out__sigmoid_lut_element_48_57_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_48_57_0),
    .global_out__sigmoid_lut_element_49_58_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_49_58_0_valid),
    .global_out__sigmoid_lut_element_49_58_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_49_58_0),
    .global_out__sigmoid_lut_element_50_59_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_50_59_0_valid),
    .global_out__sigmoid_lut_element_50_59_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_50_59_0),
    .global_out__sigmoid_lut_element_51_60_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_51_60_0_valid),
    .global_out__sigmoid_lut_element_51_60_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_51_60_0),
    .global_out__sigmoid_lut_element_52_61_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_52_61_0_valid),
    .global_out__sigmoid_lut_element_52_61_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_52_61_0),
    .global_out__sigmoid_lut_element_53_62_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_53_62_0_valid),
    .global_out__sigmoid_lut_element_53_62_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_53_62_0),
    .global_out__sigmoid_lut_element_54_63_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_54_63_0_valid),
    .global_out__sigmoid_lut_element_54_63_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_54_63_0),
    .global_out__sigmoid_lut_element_55_64_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_55_64_0_valid),
    .global_out__sigmoid_lut_element_55_64_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_55_64_0),
    .global_out__sigmoid_lut_element_56_65_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_56_65_0_valid),
    .global_out__sigmoid_lut_element_56_65_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_56_65_0),
    .global_out__sigmoid_lut_element_57_66_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_57_66_0_valid),
    .global_out__sigmoid_lut_element_57_66_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_57_66_0),
    .global_out__sigmoid_lut_element_58_67_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_58_67_0_valid),
    .global_out__sigmoid_lut_element_58_67_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_58_67_0),
    .global_out__sigmoid_lut_element_59_68_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_59_68_0_valid),
    .global_out__sigmoid_lut_element_59_68_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_59_68_0),
    .global_out__sigmoid_lut_element_60_69_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_60_69_0_valid),
    .global_out__sigmoid_lut_element_60_69_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_60_69_0),
    .global_out__sigmoid_lut_element_61_70_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_61_70_0_valid),
    .global_out__sigmoid_lut_element_61_70_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_61_70_0),
    .global_out__sigmoid_lut_element_62_71_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_62_71_0_valid),
    .global_out__sigmoid_lut_element_62_71_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_62_71_0),
    .global_out__sigmoid_lut_element_63_72_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_63_72_0_valid),
    .global_out__sigmoid_lut_element_63_72_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_63_72_0),
    .global_out__sigmoid_lut_element_64_73_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_64_73_0_valid),
    .global_out__sigmoid_lut_element_64_73_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_64_73_0),
    .global_out__sigmoid_lut_element_65_74_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_65_74_0_valid),
    .global_out__sigmoid_lut_element_65_74_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_65_74_0),
    .global_out__sigmoid_lut_element_66_75_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_66_75_0_valid),
    .global_out__sigmoid_lut_element_66_75_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_66_75_0),
    .global_out__sigmoid_lut_element_67_76_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_67_76_0_valid),
    .global_out__sigmoid_lut_element_67_76_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_67_76_0),
    .global_out__sigmoid_lut_element_68_77_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_68_77_0_valid),
    .global_out__sigmoid_lut_element_68_77_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_68_77_0),
    .global_out__sigmoid_lut_element_69_78_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_69_78_0_valid),
    .global_out__sigmoid_lut_element_69_78_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_69_78_0),
    .global_out__sigmoid_lut_element_70_79_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_70_79_0_valid),
    .global_out__sigmoid_lut_element_70_79_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_70_79_0),
    .global_out__sigmoid_lut_element_71_80_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_71_80_0_valid),
    .global_out__sigmoid_lut_element_71_80_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_71_80_0),
    .global_out__sigmoid_lut_element_72_81_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_72_81_0_valid),
    .global_out__sigmoid_lut_element_72_81_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_72_81_0),
    .global_out__sigmoid_lut_element_73_82_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_73_82_0_valid),
    .global_out__sigmoid_lut_element_73_82_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_73_82_0),
    .global_out__sigmoid_lut_element_74_83_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_74_83_0_valid),
    .global_out__sigmoid_lut_element_74_83_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_74_83_0),
    .global_out__sigmoid_lut_element_75_84_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_75_84_0_valid),
    .global_out__sigmoid_lut_element_75_84_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_75_84_0),
    .global_out__sigmoid_lut_element_76_85_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_76_85_0_valid),
    .global_out__sigmoid_lut_element_76_85_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_76_85_0),
    .global_out__sigmoid_lut_element_77_86_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_77_86_0_valid),
    .global_out__sigmoid_lut_element_77_86_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_77_86_0),
    .global_out__sigmoid_lut_element_78_87_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_78_87_0_valid),
    .global_out__sigmoid_lut_element_78_87_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_78_87_0),
    .global_out__sigmoid_lut_element_79_88_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_79_88_0_valid),
    .global_out__sigmoid_lut_element_79_88_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_79_88_0),
    .global_out__sigmoid_lut_element_80_89_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_80_89_0_valid),
    .global_out__sigmoid_lut_element_80_89_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_80_89_0),
    .global_out__sigmoid_lut_element_81_90_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_81_90_0_valid),
    .global_out__sigmoid_lut_element_81_90_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_81_90_0),
    .global_out__sigmoid_lut_element_82_91_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_82_91_0_valid),
    .global_out__sigmoid_lut_element_82_91_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_82_91_0),
    .global_out__sigmoid_lut_element_83_92_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_83_92_0_valid),
    .global_out__sigmoid_lut_element_83_92_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_83_92_0),
    .global_out__sigmoid_lut_element_84_93_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_84_93_0_valid),
    .global_out__sigmoid_lut_element_84_93_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_84_93_0),
    .global_out__sigmoid_lut_element_85_94_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_85_94_0_valid),
    .global_out__sigmoid_lut_element_85_94_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_85_94_0),
    .global_out__sigmoid_lut_element_86_95_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_86_95_0_valid),
    .global_out__sigmoid_lut_element_86_95_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_86_95_0),
    .global_out__sigmoid_lut_element_87_96_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_87_96_0_valid),
    .global_out__sigmoid_lut_element_87_96_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_87_96_0),
    .global_out__sigmoid_lut_element_88_97_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_88_97_0_valid),
    .global_out__sigmoid_lut_element_88_97_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_88_97_0),
    .global_out__sigmoid_lut_element_89_98_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_89_98_0_valid),
    .global_out__sigmoid_lut_element_89_98_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_89_98_0),
    .global_out__sigmoid_lut_element_90_99_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_90_99_0_valid),
    .global_out__sigmoid_lut_element_90_99_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_90_99_0),
    .global_out__sigmoid_lut_element_91_100_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_91_100_0_valid),
    .global_out__sigmoid_lut_element_91_100_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_91_100_0),
    .global_out__sigmoid_lut_element_92_101_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_92_101_0_valid),
    .global_out__sigmoid_lut_element_92_101_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_92_101_0),
    .global_out__sigmoid_lut_element_93_102_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_93_102_0_valid),
    .global_out__sigmoid_lut_element_93_102_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_93_102_0),
    .global_out__sigmoid_lut_element_94_103_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_94_103_0_valid),
    .global_out__sigmoid_lut_element_94_103_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_94_103_0),
    .global_out__sigmoid_lut_element_95_104_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_95_104_0_valid),
    .global_out__sigmoid_lut_element_95_104_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_95_104_0),
    .global_out__sigmoid_lut_element_96_105_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_96_105_0_valid),
    .global_out__sigmoid_lut_element_96_105_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_96_105_0),
    .global_out__sigmoid_lut_element_97_106_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_97_106_0_valid),
    .global_out__sigmoid_lut_element_97_106_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_97_106_0),
    .global_out__sigmoid_lut_element_98_107_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_98_107_0_valid),
    .global_out__sigmoid_lut_element_98_107_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_98_107_0),
    .global_out__sigmoid_lut_element_99_108_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_99_108_0_valid),
    .global_out__sigmoid_lut_element_99_108_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_99_108_0),
    .global_out__sigmoid_lut_element_100_109_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_100_109_0_valid),
    .global_out__sigmoid_lut_element_100_109_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_100_109_0),
    .global_out__sigmoid_lut_element_101_110_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_101_110_0_valid),
    .global_out__sigmoid_lut_element_101_110_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_101_110_0),
    .global_out__sigmoid_lut_element_102_111_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_102_111_0_valid),
    .global_out__sigmoid_lut_element_102_111_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_102_111_0),
    .global_out__sigmoid_lut_element_103_112_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_103_112_0_valid),
    .global_out__sigmoid_lut_element_103_112_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_103_112_0),
    .global_out__sigmoid_lut_element_104_113_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_104_113_0_valid),
    .global_out__sigmoid_lut_element_104_113_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_104_113_0),
    .global_out__sigmoid_lut_element_105_114_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_105_114_0_valid),
    .global_out__sigmoid_lut_element_105_114_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_105_114_0),
    .global_out__sigmoid_lut_element_106_115_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_106_115_0_valid),
    .global_out__sigmoid_lut_element_106_115_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_106_115_0),
    .global_out__sigmoid_lut_element_107_116_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_107_116_0_valid),
    .global_out__sigmoid_lut_element_107_116_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_107_116_0),
    .global_out__sigmoid_lut_element_108_117_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_108_117_0_valid),
    .global_out__sigmoid_lut_element_108_117_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_108_117_0),
    .global_out__sigmoid_lut_element_109_118_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_109_118_0_valid),
    .global_out__sigmoid_lut_element_109_118_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_109_118_0),
    .global_out__sigmoid_lut_element_110_119_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_110_119_0_valid),
    .global_out__sigmoid_lut_element_110_119_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_110_119_0),
    .global_out__sigmoid_lut_element_111_120_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_111_120_0_valid),
    .global_out__sigmoid_lut_element_111_120_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_111_120_0),
    .global_out__sigmoid_lut_element_112_121_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_112_121_0_valid),
    .global_out__sigmoid_lut_element_112_121_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_112_121_0),
    .global_out__sigmoid_lut_element_113_122_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_113_122_0_valid),
    .global_out__sigmoid_lut_element_113_122_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_113_122_0),
    .global_out__sigmoid_lut_element_114_123_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_114_123_0_valid),
    .global_out__sigmoid_lut_element_114_123_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_114_123_0),
    .global_out__sigmoid_lut_element_115_124_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_115_124_0_valid),
    .global_out__sigmoid_lut_element_115_124_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_115_124_0),
    .global_out__sigmoid_lut_element_116_125_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_116_125_0_valid),
    .global_out__sigmoid_lut_element_116_125_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_116_125_0),
    .global_out__sigmoid_lut_element_117_126_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_117_126_0_valid),
    .global_out__sigmoid_lut_element_117_126_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_117_126_0),
    .global_out__sigmoid_lut_element_118_127_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_118_127_0_valid),
    .global_out__sigmoid_lut_element_118_127_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_118_127_0),
    .global_out__sigmoid_lut_element_119_128_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_119_128_0_valid),
    .global_out__sigmoid_lut_element_119_128_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_119_128_0),
    .global_out__sigmoid_lut_element_120_129_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_120_129_0_valid),
    .global_out__sigmoid_lut_element_120_129_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_120_129_0),
    .global_out__sigmoid_lut_element_121_130_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_121_130_0_valid),
    .global_out__sigmoid_lut_element_121_130_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_121_130_0),
    .global_out__sigmoid_lut_element_122_131_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_122_131_0_valid),
    .global_out__sigmoid_lut_element_122_131_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_122_131_0),
    .global_out__sigmoid_lut_element_123_132_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_123_132_0_valid),
    .global_out__sigmoid_lut_element_123_132_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_123_132_0),
    .global_out__sigmoid_lut_element_124_133_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_124_133_0_valid),
    .global_out__sigmoid_lut_element_124_133_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_124_133_0),
    .global_out__sigmoid_lut_element_125_134_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_125_134_0_valid),
    .global_out__sigmoid_lut_element_125_134_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_125_134_0),
    .global_out__sigmoid_lut_element_126_135_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_126_135_0_valid),
    .global_out__sigmoid_lut_element_126_135_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_126_135_0),
    .global_out__sigmoid_lut_element_127_136_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_127_136_0_valid),
    .global_out__sigmoid_lut_element_127_136_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_127_136_0),
    .global_out__sigmoid_lut_element_128_137_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_128_137_0_valid),
    .global_out__sigmoid_lut_element_128_137_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_128_137_0),
    .global_out__sigmoid_lut_element_129_138_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_129_138_0_valid),
    .global_out__sigmoid_lut_element_129_138_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_129_138_0),
    .global_out__sigmoid_lut_element_130_139_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_130_139_0_valid),
    .global_out__sigmoid_lut_element_130_139_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_130_139_0),
    .global_out__sigmoid_lut_element_131_140_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_131_140_0_valid),
    .global_out__sigmoid_lut_element_131_140_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_131_140_0),
    .global_out__sigmoid_lut_element_132_141_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_132_141_0_valid),
    .global_out__sigmoid_lut_element_132_141_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_132_141_0),
    .global_out__sigmoid_lut_element_133_142_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_133_142_0_valid),
    .global_out__sigmoid_lut_element_133_142_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_133_142_0),
    .global_out__sigmoid_lut_element_134_143_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_134_143_0_valid),
    .global_out__sigmoid_lut_element_134_143_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_134_143_0),
    .global_out__sigmoid_lut_element_135_144_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_135_144_0_valid),
    .global_out__sigmoid_lut_element_135_144_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_135_144_0),
    .global_out__sigmoid_lut_element_136_145_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_136_145_0_valid),
    .global_out__sigmoid_lut_element_136_145_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_136_145_0),
    .global_out__sigmoid_lut_element_137_146_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_137_146_0_valid),
    .global_out__sigmoid_lut_element_137_146_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_137_146_0),
    .global_out__sigmoid_lut_element_138_147_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_138_147_0_valid),
    .global_out__sigmoid_lut_element_138_147_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_138_147_0),
    .global_out__sigmoid_lut_element_139_148_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_139_148_0_valid),
    .global_out__sigmoid_lut_element_139_148_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_139_148_0),
    .global_out__sigmoid_lut_element_140_149_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_140_149_0_valid),
    .global_out__sigmoid_lut_element_140_149_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_140_149_0),
    .global_out__sigmoid_lut_element_141_150_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_141_150_0_valid),
    .global_out__sigmoid_lut_element_141_150_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_141_150_0),
    .global_out__sigmoid_lut_element_142_151_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_142_151_0_valid),
    .global_out__sigmoid_lut_element_142_151_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_142_151_0),
    .global_out__sigmoid_lut_element_143_152_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_143_152_0_valid),
    .global_out__sigmoid_lut_element_143_152_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_143_152_0),
    .global_out__sigmoid_lut_element_144_153_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_144_153_0_valid),
    .global_out__sigmoid_lut_element_144_153_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_144_153_0),
    .global_out__sigmoid_lut_element_145_154_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_145_154_0_valid),
    .global_out__sigmoid_lut_element_145_154_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_145_154_0),
    .global_out__sigmoid_lut_element_146_155_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_146_155_0_valid),
    .global_out__sigmoid_lut_element_146_155_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_146_155_0),
    .global_out__sigmoid_lut_element_147_156_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_147_156_0_valid),
    .global_out__sigmoid_lut_element_147_156_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_147_156_0),
    .global_out__sigmoid_lut_element_148_157_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_148_157_0_valid),
    .global_out__sigmoid_lut_element_148_157_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_148_157_0),
    .global_out__sigmoid_lut_element_149_158_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_149_158_0_valid),
    .global_out__sigmoid_lut_element_149_158_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_149_158_0),
    .global_out__sigmoid_lut_element_150_159_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_150_159_0_valid),
    .global_out__sigmoid_lut_element_150_159_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_150_159_0),
    .global_out__sigmoid_lut_element_151_160_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_151_160_0_valid),
    .global_out__sigmoid_lut_element_151_160_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_151_160_0),
    .global_out__sigmoid_lut_element_152_161_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_152_161_0_valid),
    .global_out__sigmoid_lut_element_152_161_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_152_161_0),
    .global_out__sigmoid_lut_element_153_162_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_153_162_0_valid),
    .global_out__sigmoid_lut_element_153_162_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_153_162_0),
    .global_out__sigmoid_lut_element_154_163_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_154_163_0_valid),
    .global_out__sigmoid_lut_element_154_163_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_154_163_0),
    .global_out__sigmoid_lut_element_155_164_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_155_164_0_valid),
    .global_out__sigmoid_lut_element_155_164_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_155_164_0),
    .global_out__sigmoid_lut_element_156_165_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_156_165_0_valid),
    .global_out__sigmoid_lut_element_156_165_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_156_165_0),
    .global_out__sigmoid_lut_element_157_166_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_157_166_0_valid),
    .global_out__sigmoid_lut_element_157_166_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_157_166_0),
    .global_out__sigmoid_lut_element_158_167_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_158_167_0_valid),
    .global_out__sigmoid_lut_element_158_167_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_158_167_0),
    .global_out__sigmoid_lut_element_159_168_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_159_168_0_valid),
    .global_out__sigmoid_lut_element_159_168_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_159_168_0),
    .global_out__sigmoid_lut_element_160_169_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_160_169_0_valid),
    .global_out__sigmoid_lut_element_160_169_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_160_169_0),
    .global_out__sigmoid_lut_element_161_170_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_161_170_0_valid),
    .global_out__sigmoid_lut_element_161_170_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_161_170_0),
    .global_out__sigmoid_lut_element_162_171_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_162_171_0_valid),
    .global_out__sigmoid_lut_element_162_171_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_162_171_0),
    .global_out__sigmoid_lut_element_163_172_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_163_172_0_valid),
    .global_out__sigmoid_lut_element_163_172_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_163_172_0),
    .global_out__sigmoid_lut_element_164_173_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_164_173_0_valid),
    .global_out__sigmoid_lut_element_164_173_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_164_173_0),
    .global_out__sigmoid_lut_element_165_174_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_165_174_0_valid),
    .global_out__sigmoid_lut_element_165_174_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_165_174_0),
    .global_out__sigmoid_lut_element_166_175_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_166_175_0_valid),
    .global_out__sigmoid_lut_element_166_175_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_166_175_0),
    .global_out__sigmoid_lut_element_167_176_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_167_176_0_valid),
    .global_out__sigmoid_lut_element_167_176_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_167_176_0),
    .global_out__sigmoid_lut_element_168_177_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_168_177_0_valid),
    .global_out__sigmoid_lut_element_168_177_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_168_177_0),
    .global_out__sigmoid_lut_element_169_178_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_169_178_0_valid),
    .global_out__sigmoid_lut_element_169_178_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_169_178_0),
    .global_out__sigmoid_lut_element_170_179_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_170_179_0_valid),
    .global_out__sigmoid_lut_element_170_179_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_170_179_0),
    .global_out__sigmoid_lut_element_171_180_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_171_180_0_valid),
    .global_out__sigmoid_lut_element_171_180_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_171_180_0),
    .global_out__sigmoid_lut_element_172_181_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_172_181_0_valid),
    .global_out__sigmoid_lut_element_172_181_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_172_181_0),
    .global_out__sigmoid_lut_element_173_182_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_173_182_0_valid),
    .global_out__sigmoid_lut_element_173_182_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_173_182_0),
    .global_out__sigmoid_lut_element_174_183_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_174_183_0_valid),
    .global_out__sigmoid_lut_element_174_183_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_174_183_0),
    .global_out__sigmoid_lut_element_175_184_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_175_184_0_valid),
    .global_out__sigmoid_lut_element_175_184_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_175_184_0),
    .global_out__sigmoid_lut_element_176_185_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_176_185_0_valid),
    .global_out__sigmoid_lut_element_176_185_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_176_185_0),
    .global_out__sigmoid_lut_element_177_186_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_177_186_0_valid),
    .global_out__sigmoid_lut_element_177_186_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_177_186_0),
    .global_out__sigmoid_lut_element_178_187_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_178_187_0_valid),
    .global_out__sigmoid_lut_element_178_187_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_178_187_0),
    .global_out__sigmoid_lut_element_179_188_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_179_188_0_valid),
    .global_out__sigmoid_lut_element_179_188_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_179_188_0),
    .global_out__sigmoid_lut_element_180_189_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_180_189_0_valid),
    .global_out__sigmoid_lut_element_180_189_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_180_189_0),
    .global_out__sigmoid_lut_element_181_190_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_181_190_0_valid),
    .global_out__sigmoid_lut_element_181_190_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_181_190_0),
    .global_out__sigmoid_lut_element_182_191_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_182_191_0_valid),
    .global_out__sigmoid_lut_element_182_191_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_182_191_0),
    .global_out__sigmoid_lut_element_183_192_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_183_192_0_valid),
    .global_out__sigmoid_lut_element_183_192_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_183_192_0),
    .global_out__sigmoid_lut_element_184_193_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_184_193_0_valid),
    .global_out__sigmoid_lut_element_184_193_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_184_193_0),
    .global_out__sigmoid_lut_element_185_194_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_185_194_0_valid),
    .global_out__sigmoid_lut_element_185_194_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_185_194_0),
    .global_out__sigmoid_lut_element_186_195_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_186_195_0_valid),
    .global_out__sigmoid_lut_element_186_195_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_186_195_0),
    .global_out__sigmoid_lut_element_187_196_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_187_196_0_valid),
    .global_out__sigmoid_lut_element_187_196_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_187_196_0),
    .global_out__sigmoid_lut_element_188_197_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_188_197_0_valid),
    .global_out__sigmoid_lut_element_188_197_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_188_197_0),
    .global_out__sigmoid_lut_element_189_198_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_189_198_0_valid),
    .global_out__sigmoid_lut_element_189_198_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_189_198_0),
    .global_out__sigmoid_lut_element_190_199_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_190_199_0_valid),
    .global_out__sigmoid_lut_element_190_199_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_190_199_0),
    .global_out__sigmoid_lut_element_191_200_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_191_200_0_valid),
    .global_out__sigmoid_lut_element_191_200_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_191_200_0),
    .global_out__sigmoid_lut_element_192_201_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_192_201_0_valid),
    .global_out__sigmoid_lut_element_192_201_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_192_201_0),
    .global_out__sigmoid_lut_element_193_202_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_193_202_0_valid),
    .global_out__sigmoid_lut_element_193_202_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_193_202_0),
    .global_out__sigmoid_lut_element_194_203_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_194_203_0_valid),
    .global_out__sigmoid_lut_element_194_203_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_194_203_0),
    .global_out__sigmoid_lut_element_195_204_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_195_204_0_valid),
    .global_out__sigmoid_lut_element_195_204_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_195_204_0),
    .global_out__sigmoid_lut_element_196_205_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_196_205_0_valid),
    .global_out__sigmoid_lut_element_196_205_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_196_205_0),
    .global_out__sigmoid_lut_element_197_206_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_197_206_0_valid),
    .global_out__sigmoid_lut_element_197_206_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_197_206_0),
    .global_out__sigmoid_lut_element_198_207_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_198_207_0_valid),
    .global_out__sigmoid_lut_element_198_207_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_198_207_0),
    .global_out__sigmoid_lut_element_199_208_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_199_208_0_valid),
    .global_out__sigmoid_lut_element_199_208_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_199_208_0),
    .global_out__sigmoid_lut_element_200_209_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_200_209_0_valid),
    .global_out__sigmoid_lut_element_200_209_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_200_209_0),
    .global_out__sigmoid_lut_element_201_210_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_201_210_0_valid),
    .global_out__sigmoid_lut_element_201_210_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_201_210_0),
    .global_out__sigmoid_lut_element_202_211_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_202_211_0_valid),
    .global_out__sigmoid_lut_element_202_211_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_202_211_0),
    .global_out__sigmoid_lut_element_203_212_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_203_212_0_valid),
    .global_out__sigmoid_lut_element_203_212_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_203_212_0),
    .global_out__sigmoid_lut_element_204_213_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_204_213_0_valid),
    .global_out__sigmoid_lut_element_204_213_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_204_213_0),
    .global_out__sigmoid_lut_element_205_214_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_205_214_0_valid),
    .global_out__sigmoid_lut_element_205_214_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_205_214_0),
    .global_out__sigmoid_lut_element_206_215_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_206_215_0_valid),
    .global_out__sigmoid_lut_element_206_215_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_206_215_0),
    .global_out__sigmoid_lut_element_207_216_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_207_216_0_valid),
    .global_out__sigmoid_lut_element_207_216_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_207_216_0),
    .global_out__sigmoid_lut_element_208_217_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_208_217_0_valid),
    .global_out__sigmoid_lut_element_208_217_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_208_217_0),
    .global_out__sigmoid_lut_element_209_218_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_209_218_0_valid),
    .global_out__sigmoid_lut_element_209_218_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_209_218_0),
    .global_out__sigmoid_lut_element_210_219_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_210_219_0_valid),
    .global_out__sigmoid_lut_element_210_219_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_210_219_0),
    .global_out__sigmoid_lut_element_211_220_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_211_220_0_valid),
    .global_out__sigmoid_lut_element_211_220_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_211_220_0),
    .global_out__sigmoid_lut_element_212_221_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_212_221_0_valid),
    .global_out__sigmoid_lut_element_212_221_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_212_221_0),
    .global_out__sigmoid_lut_element_213_222_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_213_222_0_valid),
    .global_out__sigmoid_lut_element_213_222_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_213_222_0),
    .global_out__sigmoid_lut_element_214_223_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_214_223_0_valid),
    .global_out__sigmoid_lut_element_214_223_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_214_223_0),
    .global_out__sigmoid_lut_element_215_224_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_215_224_0_valid),
    .global_out__sigmoid_lut_element_215_224_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_215_224_0),
    .global_out__sigmoid_lut_element_216_225_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_216_225_0_valid),
    .global_out__sigmoid_lut_element_216_225_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_216_225_0),
    .global_out__sigmoid_lut_element_217_226_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_217_226_0_valid),
    .global_out__sigmoid_lut_element_217_226_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_217_226_0),
    .global_out__sigmoid_lut_element_218_227_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_218_227_0_valid),
    .global_out__sigmoid_lut_element_218_227_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_218_227_0),
    .global_out__sigmoid_lut_element_219_228_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_219_228_0_valid),
    .global_out__sigmoid_lut_element_219_228_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_219_228_0),
    .global_out__sigmoid_lut_element_220_229_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_220_229_0_valid),
    .global_out__sigmoid_lut_element_220_229_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_220_229_0),
    .global_out__sigmoid_lut_element_221_230_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_221_230_0_valid),
    .global_out__sigmoid_lut_element_221_230_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_221_230_0),
    .global_out__sigmoid_lut_element_222_231_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_222_231_0_valid),
    .global_out__sigmoid_lut_element_222_231_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_222_231_0),
    .global_out__sigmoid_lut_element_223_232_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_223_232_0_valid),
    .global_out__sigmoid_lut_element_223_232_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_223_232_0),
    .global_out__sigmoid_lut_element_224_233_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_224_233_0_valid),
    .global_out__sigmoid_lut_element_224_233_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_224_233_0),
    .global_out__sigmoid_lut_element_225_234_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_225_234_0_valid),
    .global_out__sigmoid_lut_element_225_234_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_225_234_0),
    .global_out__sigmoid_lut_element_226_235_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_226_235_0_valid),
    .global_out__sigmoid_lut_element_226_235_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_226_235_0),
    .global_out__sigmoid_lut_element_227_236_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_227_236_0_valid),
    .global_out__sigmoid_lut_element_227_236_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_227_236_0),
    .global_out__sigmoid_lut_element_228_237_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_228_237_0_valid),
    .global_out__sigmoid_lut_element_228_237_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_228_237_0),
    .global_out__sigmoid_lut_element_229_238_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_229_238_0_valid),
    .global_out__sigmoid_lut_element_229_238_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_229_238_0),
    .global_out__sigmoid_lut_element_230_239_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_230_239_0_valid),
    .global_out__sigmoid_lut_element_230_239_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_230_239_0),
    .global_out__sigmoid_lut_element_231_240_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_231_240_0_valid),
    .global_out__sigmoid_lut_element_231_240_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_231_240_0),
    .global_out__sigmoid_lut_element_232_241_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_232_241_0_valid),
    .global_out__sigmoid_lut_element_232_241_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_232_241_0),
    .global_out__sigmoid_lut_element_233_242_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_233_242_0_valid),
    .global_out__sigmoid_lut_element_233_242_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_233_242_0),
    .global_out__sigmoid_lut_element_234_243_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_234_243_0_valid),
    .global_out__sigmoid_lut_element_234_243_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_234_243_0),
    .global_out__sigmoid_lut_element_235_244_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_235_244_0_valid),
    .global_out__sigmoid_lut_element_235_244_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_235_244_0),
    .global_out__sigmoid_lut_element_236_245_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_236_245_0_valid),
    .global_out__sigmoid_lut_element_236_245_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_236_245_0),
    .global_out__sigmoid_lut_element_237_246_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_237_246_0_valid),
    .global_out__sigmoid_lut_element_237_246_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_237_246_0),
    .global_out__sigmoid_lut_element_238_247_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_238_247_0_valid),
    .global_out__sigmoid_lut_element_238_247_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_238_247_0),
    .global_out__sigmoid_lut_element_239_248_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_239_248_0_valid),
    .global_out__sigmoid_lut_element_239_248_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_239_248_0),
    .global_out__sigmoid_lut_element_240_249_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_240_249_0_valid),
    .global_out__sigmoid_lut_element_240_249_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_240_249_0),
    .global_out__sigmoid_lut_element_241_250_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_241_250_0_valid),
    .global_out__sigmoid_lut_element_241_250_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_241_250_0),
    .global_out__sigmoid_lut_element_242_251_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_242_251_0_valid),
    .global_out__sigmoid_lut_element_242_251_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_242_251_0),
    .global_out__sigmoid_lut_element_243_252_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_243_252_0_valid),
    .global_out__sigmoid_lut_element_243_252_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_243_252_0),
    .global_out__sigmoid_lut_element_244_253_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_244_253_0_valid),
    .global_out__sigmoid_lut_element_244_253_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_244_253_0),
    .global_out__sigmoid_lut_element_245_254_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_245_254_0_valid),
    .global_out__sigmoid_lut_element_245_254_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_245_254_0),
    .global_out__sigmoid_lut_element_246_255_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_246_255_0_valid),
    .global_out__sigmoid_lut_element_246_255_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_246_255_0),
    .global_out__sigmoid_lut_element_247_256_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_247_256_0_valid),
    .global_out__sigmoid_lut_element_247_256_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_247_256_0),
    .global_out__sigmoid_lut_element_248_257_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_248_257_0_valid),
    .global_out__sigmoid_lut_element_248_257_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_248_257_0),
    .global_out__sigmoid_lut_element_249_258_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_249_258_0_valid),
    .global_out__sigmoid_lut_element_249_258_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_249_258_0),
    .global_out__sigmoid_lut_element_250_259_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_250_259_0_valid),
    .global_out__sigmoid_lut_element_250_259_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_250_259_0),
    .global_out__sigmoid_lut_element_251_260_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_251_260_0_valid),
    .global_out__sigmoid_lut_element_251_260_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_251_260_0),
    .global_out__sigmoid_lut_element_252_261_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_252_261_0_valid),
    .global_out__sigmoid_lut_element_252_261_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_252_261_0),
    .global_out__sigmoid_lut_element_253_262_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_253_262_0_valid),
    .global_out__sigmoid_lut_element_253_262_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_253_262_0),
    .global_out__sigmoid_lut_element_254_263_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_254_263_0_valid),
    .global_out__sigmoid_lut_element_254_263_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_254_263_0),
    .global_out__sigmoid_lut_element_255_264_0_valid
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_255_264_0_valid),
    .global_out__sigmoid_lut_element_255_264_0
      (_set_sigmoid_lut_BasicBlock_0Impl_global_out__sigmoid_lut_element_255_264_0),
    .fifo_wren_0
      (_set_sigmoid_lut_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0                       (fifo_data_0.almost_full),	// swiglu.k:19:9
    .fifo_overflow_in_0                              (fifo_data_0.overflow),	// swiglu.k:19:9
    .data_in_4                                       (passthrough_data_4.data),	// swiglu.k:19:9
    .input_fifo_underflow_0                          (passthrough_data_4.underflow),	// swiglu.k:19:9
    .input_rdy_0
      (_set_sigmoid_lut_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                                   (passthrough_data_4.valid),	// swiglu.k:19:9
    .control_state_out                               (/* unused */)
  );	// swiglu.k:19:9
  swiglu_unit_lookup_sigmoid_BasicBlock_0 lookup_sigmoid_BasicBlock_0Impl (	// swiglu.k:28:9
    .clk                                    (clk),	// swiglu.k:28:9
    .rst                                    (reg_rst_delayed[5]),	// swiglu.k:28:9
    .done_out                               (/* unused */),
    .global_in__sigmoid_lut_element_0_9     (__sigmoid_lut_element_0_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_1_10    (__sigmoid_lut_element_1_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_2_11    (__sigmoid_lut_element_2_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_3_12    (__sigmoid_lut_element_3_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_4_13    (__sigmoid_lut_element_4_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_5_14    (__sigmoid_lut_element_5_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_6_15    (__sigmoid_lut_element_6_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_7_16    (__sigmoid_lut_element_7_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_8_17    (__sigmoid_lut_element_8_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_9_18    (__sigmoid_lut_element_9_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_10_19   (__sigmoid_lut_element_10_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_11_20   (__sigmoid_lut_element_11_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_12_21   (__sigmoid_lut_element_12_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_13_22   (__sigmoid_lut_element_13_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_14_23   (__sigmoid_lut_element_14_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_15_24   (__sigmoid_lut_element_15_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_16_25   (__sigmoid_lut_element_16_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_17_26   (__sigmoid_lut_element_17_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_18_27   (__sigmoid_lut_element_18_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_19_28   (__sigmoid_lut_element_19_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_20_29   (__sigmoid_lut_element_20_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_21_30   (__sigmoid_lut_element_21_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_22_31   (__sigmoid_lut_element_22_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_23_32   (__sigmoid_lut_element_23_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_24_33   (__sigmoid_lut_element_24_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_25_34   (__sigmoid_lut_element_25_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_26_35   (__sigmoid_lut_element_26_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_27_36   (__sigmoid_lut_element_27_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_28_37   (__sigmoid_lut_element_28_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_29_38   (__sigmoid_lut_element_29_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_30_39   (__sigmoid_lut_element_30_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_31_40   (__sigmoid_lut_element_31_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_32_41   (__sigmoid_lut_element_32_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_33_42   (__sigmoid_lut_element_33_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_34_43   (__sigmoid_lut_element_34_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_35_44   (__sigmoid_lut_element_35_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_36_45   (__sigmoid_lut_element_36_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_37_46   (__sigmoid_lut_element_37_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_38_47   (__sigmoid_lut_element_38_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_39_48   (__sigmoid_lut_element_39_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_40_49   (__sigmoid_lut_element_40_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_41_50   (__sigmoid_lut_element_41_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_42_51   (__sigmoid_lut_element_42_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_43_52   (__sigmoid_lut_element_43_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_44_53   (__sigmoid_lut_element_44_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_45_54   (__sigmoid_lut_element_45_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_46_55   (__sigmoid_lut_element_46_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_47_56   (__sigmoid_lut_element_47_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_48_57   (__sigmoid_lut_element_48_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_49_58   (__sigmoid_lut_element_49_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_50_59   (__sigmoid_lut_element_50_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_51_60   (__sigmoid_lut_element_51_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_52_61   (__sigmoid_lut_element_52_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_53_62   (__sigmoid_lut_element_53_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_54_63   (__sigmoid_lut_element_54_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_55_64   (__sigmoid_lut_element_55_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_56_65   (__sigmoid_lut_element_56_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_57_66   (__sigmoid_lut_element_57_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_58_67   (__sigmoid_lut_element_58_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_59_68   (__sigmoid_lut_element_59_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_60_69   (__sigmoid_lut_element_60_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_61_70   (__sigmoid_lut_element_61_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_62_71   (__sigmoid_lut_element_62_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_63_72   (__sigmoid_lut_element_63_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_64_73   (__sigmoid_lut_element_64_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_65_74   (__sigmoid_lut_element_65_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_66_75   (__sigmoid_lut_element_66_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_67_76   (__sigmoid_lut_element_67_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_68_77   (__sigmoid_lut_element_68_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_69_78   (__sigmoid_lut_element_69_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_70_79   (__sigmoid_lut_element_70_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_71_80   (__sigmoid_lut_element_71_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_72_81   (__sigmoid_lut_element_72_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_73_82   (__sigmoid_lut_element_73_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_74_83   (__sigmoid_lut_element_74_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_75_84   (__sigmoid_lut_element_75_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_76_85   (__sigmoid_lut_element_76_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_77_86   (__sigmoid_lut_element_77_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_78_87   (__sigmoid_lut_element_78_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_79_88   (__sigmoid_lut_element_79_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_80_89   (__sigmoid_lut_element_80_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_81_90   (__sigmoid_lut_element_81_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_82_91   (__sigmoid_lut_element_82_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_83_92   (__sigmoid_lut_element_83_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_84_93   (__sigmoid_lut_element_84_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_85_94   (__sigmoid_lut_element_85_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_86_95   (__sigmoid_lut_element_86_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_87_96   (__sigmoid_lut_element_87_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_88_97   (__sigmoid_lut_element_88_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_89_98   (__sigmoid_lut_element_89_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_90_99   (__sigmoid_lut_element_90_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_91_100  (__sigmoid_lut_element_91_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_92_101  (__sigmoid_lut_element_92_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_93_102  (__sigmoid_lut_element_93_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_94_103  (__sigmoid_lut_element_94_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_95_104  (__sigmoid_lut_element_95_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_96_105  (__sigmoid_lut_element_96_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_97_106  (__sigmoid_lut_element_97_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_98_107  (__sigmoid_lut_element_98_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_99_108  (__sigmoid_lut_element_99_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_100_109 (__sigmoid_lut_element_100_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_101_110 (__sigmoid_lut_element_101_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_102_111 (__sigmoid_lut_element_102_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_103_112 (__sigmoid_lut_element_103_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_104_113 (__sigmoid_lut_element_104_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_105_114 (__sigmoid_lut_element_105_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_106_115 (__sigmoid_lut_element_106_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_107_116 (__sigmoid_lut_element_107_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_108_117 (__sigmoid_lut_element_108_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_109_118 (__sigmoid_lut_element_109_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_110_119 (__sigmoid_lut_element_110_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_111_120 (__sigmoid_lut_element_111_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_112_121 (__sigmoid_lut_element_112_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_113_122 (__sigmoid_lut_element_113_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_114_123 (__sigmoid_lut_element_114_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_115_124 (__sigmoid_lut_element_115_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_116_125 (__sigmoid_lut_element_116_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_117_126 (__sigmoid_lut_element_117_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_118_127 (__sigmoid_lut_element_118_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_119_128 (__sigmoid_lut_element_119_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_120_129 (__sigmoid_lut_element_120_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_121_130 (__sigmoid_lut_element_121_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_122_131 (__sigmoid_lut_element_122_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_123_132 (__sigmoid_lut_element_123_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_124_133 (__sigmoid_lut_element_124_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_125_134 (__sigmoid_lut_element_125_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_126_135 (__sigmoid_lut_element_126_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_127_136 (__sigmoid_lut_element_127_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_128_137 (__sigmoid_lut_element_128_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_129_138 (__sigmoid_lut_element_129_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_130_139 (__sigmoid_lut_element_130_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_131_140 (__sigmoid_lut_element_131_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_132_141 (__sigmoid_lut_element_132_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_133_142 (__sigmoid_lut_element_133_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_134_143 (__sigmoid_lut_element_134_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_135_144 (__sigmoid_lut_element_135_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_136_145 (__sigmoid_lut_element_136_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_137_146 (__sigmoid_lut_element_137_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_138_147 (__sigmoid_lut_element_138_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_139_148 (__sigmoid_lut_element_139_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_140_149 (__sigmoid_lut_element_140_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_141_150 (__sigmoid_lut_element_141_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_142_151 (__sigmoid_lut_element_142_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_143_152 (__sigmoid_lut_element_143_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_144_153 (__sigmoid_lut_element_144_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_145_154 (__sigmoid_lut_element_145_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_146_155 (__sigmoid_lut_element_146_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_147_156 (__sigmoid_lut_element_147_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_148_157 (__sigmoid_lut_element_148_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_149_158 (__sigmoid_lut_element_149_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_150_159 (__sigmoid_lut_element_150_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_151_160 (__sigmoid_lut_element_151_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_152_161 (__sigmoid_lut_element_152_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_153_162 (__sigmoid_lut_element_153_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_154_163 (__sigmoid_lut_element_154_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_155_164 (__sigmoid_lut_element_155_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_156_165 (__sigmoid_lut_element_156_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_157_166 (__sigmoid_lut_element_157_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_158_167 (__sigmoid_lut_element_158_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_159_168 (__sigmoid_lut_element_159_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_160_169 (__sigmoid_lut_element_160_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_161_170 (__sigmoid_lut_element_161_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_162_171 (__sigmoid_lut_element_162_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_163_172 (__sigmoid_lut_element_163_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_164_173 (__sigmoid_lut_element_164_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_165_174 (__sigmoid_lut_element_165_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_166_175 (__sigmoid_lut_element_166_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_167_176 (__sigmoid_lut_element_167_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_168_177 (__sigmoid_lut_element_168_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_169_178 (__sigmoid_lut_element_169_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_170_179 (__sigmoid_lut_element_170_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_171_180 (__sigmoid_lut_element_171_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_172_181 (__sigmoid_lut_element_172_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_173_182 (__sigmoid_lut_element_173_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_174_183 (__sigmoid_lut_element_174_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_175_184 (__sigmoid_lut_element_175_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_176_185 (__sigmoid_lut_element_176_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_177_186 (__sigmoid_lut_element_177_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_178_187 (__sigmoid_lut_element_178_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_179_188 (__sigmoid_lut_element_179_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_180_189 (__sigmoid_lut_element_180_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_181_190 (__sigmoid_lut_element_181_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_182_191 (__sigmoid_lut_element_182_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_183_192 (__sigmoid_lut_element_183_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_184_193 (__sigmoid_lut_element_184_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_185_194 (__sigmoid_lut_element_185_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_186_195 (__sigmoid_lut_element_186_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_187_196 (__sigmoid_lut_element_187_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_188_197 (__sigmoid_lut_element_188_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_189_198 (__sigmoid_lut_element_189_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_190_199 (__sigmoid_lut_element_190_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_191_200 (__sigmoid_lut_element_191_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_192_201 (__sigmoid_lut_element_192_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_193_202 (__sigmoid_lut_element_193_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_194_203 (__sigmoid_lut_element_194_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_195_204 (__sigmoid_lut_element_195_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_196_205 (__sigmoid_lut_element_196_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_197_206 (__sigmoid_lut_element_197_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_198_207 (__sigmoid_lut_element_198_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_199_208 (__sigmoid_lut_element_199_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_200_209 (__sigmoid_lut_element_200_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_201_210 (__sigmoid_lut_element_201_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_202_211 (__sigmoid_lut_element_202_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_203_212 (__sigmoid_lut_element_203_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_204_213 (__sigmoid_lut_element_204_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_205_214 (__sigmoid_lut_element_205_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_206_215 (__sigmoid_lut_element_206_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_207_216 (__sigmoid_lut_element_207_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_208_217 (__sigmoid_lut_element_208_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_209_218 (__sigmoid_lut_element_209_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_210_219 (__sigmoid_lut_element_210_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_211_220 (__sigmoid_lut_element_211_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_212_221 (__sigmoid_lut_element_212_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_213_222 (__sigmoid_lut_element_213_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_214_223 (__sigmoid_lut_element_214_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_215_224 (__sigmoid_lut_element_215_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_216_225 (__sigmoid_lut_element_216_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_217_226 (__sigmoid_lut_element_217_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_218_227 (__sigmoid_lut_element_218_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_219_228 (__sigmoid_lut_element_219_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_220_229 (__sigmoid_lut_element_220_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_221_230 (__sigmoid_lut_element_221_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_222_231 (__sigmoid_lut_element_222_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_223_232 (__sigmoid_lut_element_223_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_224_233 (__sigmoid_lut_element_224_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_225_234 (__sigmoid_lut_element_225_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_226_235 (__sigmoid_lut_element_226_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_227_236 (__sigmoid_lut_element_227_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_228_237 (__sigmoid_lut_element_228_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_229_238 (__sigmoid_lut_element_229_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_230_239 (__sigmoid_lut_element_230_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_231_240 (__sigmoid_lut_element_231_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_232_241 (__sigmoid_lut_element_232_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_233_242 (__sigmoid_lut_element_233_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_234_243 (__sigmoid_lut_element_234_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_235_244 (__sigmoid_lut_element_235_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_236_245 (__sigmoid_lut_element_236_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_237_246 (__sigmoid_lut_element_237_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_238_247 (__sigmoid_lut_element_238_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_239_248 (__sigmoid_lut_element_239_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_240_249 (__sigmoid_lut_element_240_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_241_250 (__sigmoid_lut_element_241_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_242_251 (__sigmoid_lut_element_242_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_243_252 (__sigmoid_lut_element_243_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_244_253 (__sigmoid_lut_element_244_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_245_254 (__sigmoid_lut_element_245_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_246_255 (__sigmoid_lut_element_246_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_247_256 (__sigmoid_lut_element_247_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_248_257 (__sigmoid_lut_element_248_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_249_258 (__sigmoid_lut_element_249_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_250_259 (__sigmoid_lut_element_250_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_251_260 (__sigmoid_lut_element_251_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_252_261 (__sigmoid_lut_element_252_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_253_262 (__sigmoid_lut_element_253_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_254_263 (__sigmoid_lut_element_254_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_255_264 (__sigmoid_lut_element_255_value_out),	// swiglu.k:13:5
    .fifo_data_out_0
      (_lookup_sigmoid_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0
      (_lookup_sigmoid_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0              (fifo_data_1.almost_full),	// swiglu.k:28:9
    .fifo_overflow_in_0                     (fifo_data_1.overflow),	// swiglu.k:28:9
    .data_in_5                              (passthrough_data_5.data),	// swiglu.k:28:9
    .input_fifo_underflow_0                 (passthrough_data_5.underflow),	// swiglu.k:28:9
    .input_rdy_0
      (_lookup_sigmoid_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                          (passthrough_data_5.valid),	// swiglu.k:28:9
    .control_state_out                      (/* unused */)
  );	// swiglu.k:28:9
  swiglu_unit_compute_silu_BasicBlock_0 compute_silu_BasicBlock_0Impl (	// swiglu.k:41:9
    .clk                                    (clk),	// swiglu.k:41:9
    .rst                                    (reg_rst_delayed[6]),	// swiglu.k:41:9
    .done_out                               (/* unused */),
    .global_in__sigmoid_lut_element_0_9     (__sigmoid_lut_element_0_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_1_10    (__sigmoid_lut_element_1_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_2_11    (__sigmoid_lut_element_2_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_3_12    (__sigmoid_lut_element_3_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_4_13    (__sigmoid_lut_element_4_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_5_14    (__sigmoid_lut_element_5_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_6_15    (__sigmoid_lut_element_6_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_7_16    (__sigmoid_lut_element_7_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_8_17    (__sigmoid_lut_element_8_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_9_18    (__sigmoid_lut_element_9_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_10_19   (__sigmoid_lut_element_10_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_11_20   (__sigmoid_lut_element_11_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_12_21   (__sigmoid_lut_element_12_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_13_22   (__sigmoid_lut_element_13_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_14_23   (__sigmoid_lut_element_14_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_15_24   (__sigmoid_lut_element_15_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_16_25   (__sigmoid_lut_element_16_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_17_26   (__sigmoid_lut_element_17_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_18_27   (__sigmoid_lut_element_18_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_19_28   (__sigmoid_lut_element_19_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_20_29   (__sigmoid_lut_element_20_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_21_30   (__sigmoid_lut_element_21_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_22_31   (__sigmoid_lut_element_22_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_23_32   (__sigmoid_lut_element_23_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_24_33   (__sigmoid_lut_element_24_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_25_34   (__sigmoid_lut_element_25_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_26_35   (__sigmoid_lut_element_26_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_27_36   (__sigmoid_lut_element_27_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_28_37   (__sigmoid_lut_element_28_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_29_38   (__sigmoid_lut_element_29_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_30_39   (__sigmoid_lut_element_30_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_31_40   (__sigmoid_lut_element_31_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_32_41   (__sigmoid_lut_element_32_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_33_42   (__sigmoid_lut_element_33_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_34_43   (__sigmoid_lut_element_34_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_35_44   (__sigmoid_lut_element_35_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_36_45   (__sigmoid_lut_element_36_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_37_46   (__sigmoid_lut_element_37_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_38_47   (__sigmoid_lut_element_38_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_39_48   (__sigmoid_lut_element_39_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_40_49   (__sigmoid_lut_element_40_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_41_50   (__sigmoid_lut_element_41_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_42_51   (__sigmoid_lut_element_42_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_43_52   (__sigmoid_lut_element_43_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_44_53   (__sigmoid_lut_element_44_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_45_54   (__sigmoid_lut_element_45_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_46_55   (__sigmoid_lut_element_46_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_47_56   (__sigmoid_lut_element_47_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_48_57   (__sigmoid_lut_element_48_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_49_58   (__sigmoid_lut_element_49_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_50_59   (__sigmoid_lut_element_50_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_51_60   (__sigmoid_lut_element_51_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_52_61   (__sigmoid_lut_element_52_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_53_62   (__sigmoid_lut_element_53_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_54_63   (__sigmoid_lut_element_54_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_55_64   (__sigmoid_lut_element_55_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_56_65   (__sigmoid_lut_element_56_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_57_66   (__sigmoid_lut_element_57_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_58_67   (__sigmoid_lut_element_58_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_59_68   (__sigmoid_lut_element_59_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_60_69   (__sigmoid_lut_element_60_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_61_70   (__sigmoid_lut_element_61_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_62_71   (__sigmoid_lut_element_62_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_63_72   (__sigmoid_lut_element_63_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_64_73   (__sigmoid_lut_element_64_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_65_74   (__sigmoid_lut_element_65_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_66_75   (__sigmoid_lut_element_66_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_67_76   (__sigmoid_lut_element_67_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_68_77   (__sigmoid_lut_element_68_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_69_78   (__sigmoid_lut_element_69_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_70_79   (__sigmoid_lut_element_70_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_71_80   (__sigmoid_lut_element_71_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_72_81   (__sigmoid_lut_element_72_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_73_82   (__sigmoid_lut_element_73_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_74_83   (__sigmoid_lut_element_74_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_75_84   (__sigmoid_lut_element_75_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_76_85   (__sigmoid_lut_element_76_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_77_86   (__sigmoid_lut_element_77_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_78_87   (__sigmoid_lut_element_78_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_79_88   (__sigmoid_lut_element_79_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_80_89   (__sigmoid_lut_element_80_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_81_90   (__sigmoid_lut_element_81_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_82_91   (__sigmoid_lut_element_82_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_83_92   (__sigmoid_lut_element_83_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_84_93   (__sigmoid_lut_element_84_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_85_94   (__sigmoid_lut_element_85_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_86_95   (__sigmoid_lut_element_86_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_87_96   (__sigmoid_lut_element_87_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_88_97   (__sigmoid_lut_element_88_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_89_98   (__sigmoid_lut_element_89_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_90_99   (__sigmoid_lut_element_90_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_91_100  (__sigmoid_lut_element_91_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_92_101  (__sigmoid_lut_element_92_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_93_102  (__sigmoid_lut_element_93_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_94_103  (__sigmoid_lut_element_94_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_95_104  (__sigmoid_lut_element_95_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_96_105  (__sigmoid_lut_element_96_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_97_106  (__sigmoid_lut_element_97_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_98_107  (__sigmoid_lut_element_98_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_99_108  (__sigmoid_lut_element_99_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_100_109 (__sigmoid_lut_element_100_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_101_110 (__sigmoid_lut_element_101_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_102_111 (__sigmoid_lut_element_102_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_103_112 (__sigmoid_lut_element_103_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_104_113 (__sigmoid_lut_element_104_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_105_114 (__sigmoid_lut_element_105_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_106_115 (__sigmoid_lut_element_106_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_107_116 (__sigmoid_lut_element_107_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_108_117 (__sigmoid_lut_element_108_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_109_118 (__sigmoid_lut_element_109_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_110_119 (__sigmoid_lut_element_110_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_111_120 (__sigmoid_lut_element_111_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_112_121 (__sigmoid_lut_element_112_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_113_122 (__sigmoid_lut_element_113_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_114_123 (__sigmoid_lut_element_114_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_115_124 (__sigmoid_lut_element_115_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_116_125 (__sigmoid_lut_element_116_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_117_126 (__sigmoid_lut_element_117_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_118_127 (__sigmoid_lut_element_118_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_119_128 (__sigmoid_lut_element_119_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_120_129 (__sigmoid_lut_element_120_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_121_130 (__sigmoid_lut_element_121_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_122_131 (__sigmoid_lut_element_122_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_123_132 (__sigmoid_lut_element_123_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_124_133 (__sigmoid_lut_element_124_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_125_134 (__sigmoid_lut_element_125_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_126_135 (__sigmoid_lut_element_126_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_127_136 (__sigmoid_lut_element_127_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_128_137 (__sigmoid_lut_element_128_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_129_138 (__sigmoid_lut_element_129_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_130_139 (__sigmoid_lut_element_130_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_131_140 (__sigmoid_lut_element_131_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_132_141 (__sigmoid_lut_element_132_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_133_142 (__sigmoid_lut_element_133_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_134_143 (__sigmoid_lut_element_134_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_135_144 (__sigmoid_lut_element_135_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_136_145 (__sigmoid_lut_element_136_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_137_146 (__sigmoid_lut_element_137_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_138_147 (__sigmoid_lut_element_138_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_139_148 (__sigmoid_lut_element_139_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_140_149 (__sigmoid_lut_element_140_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_141_150 (__sigmoid_lut_element_141_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_142_151 (__sigmoid_lut_element_142_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_143_152 (__sigmoid_lut_element_143_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_144_153 (__sigmoid_lut_element_144_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_145_154 (__sigmoid_lut_element_145_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_146_155 (__sigmoid_lut_element_146_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_147_156 (__sigmoid_lut_element_147_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_148_157 (__sigmoid_lut_element_148_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_149_158 (__sigmoid_lut_element_149_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_150_159 (__sigmoid_lut_element_150_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_151_160 (__sigmoid_lut_element_151_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_152_161 (__sigmoid_lut_element_152_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_153_162 (__sigmoid_lut_element_153_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_154_163 (__sigmoid_lut_element_154_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_155_164 (__sigmoid_lut_element_155_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_156_165 (__sigmoid_lut_element_156_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_157_166 (__sigmoid_lut_element_157_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_158_167 (__sigmoid_lut_element_158_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_159_168 (__sigmoid_lut_element_159_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_160_169 (__sigmoid_lut_element_160_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_161_170 (__sigmoid_lut_element_161_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_162_171 (__sigmoid_lut_element_162_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_163_172 (__sigmoid_lut_element_163_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_164_173 (__sigmoid_lut_element_164_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_165_174 (__sigmoid_lut_element_165_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_166_175 (__sigmoid_lut_element_166_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_167_176 (__sigmoid_lut_element_167_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_168_177 (__sigmoid_lut_element_168_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_169_178 (__sigmoid_lut_element_169_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_170_179 (__sigmoid_lut_element_170_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_171_180 (__sigmoid_lut_element_171_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_172_181 (__sigmoid_lut_element_172_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_173_182 (__sigmoid_lut_element_173_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_174_183 (__sigmoid_lut_element_174_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_175_184 (__sigmoid_lut_element_175_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_176_185 (__sigmoid_lut_element_176_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_177_186 (__sigmoid_lut_element_177_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_178_187 (__sigmoid_lut_element_178_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_179_188 (__sigmoid_lut_element_179_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_180_189 (__sigmoid_lut_element_180_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_181_190 (__sigmoid_lut_element_181_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_182_191 (__sigmoid_lut_element_182_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_183_192 (__sigmoid_lut_element_183_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_184_193 (__sigmoid_lut_element_184_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_185_194 (__sigmoid_lut_element_185_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_186_195 (__sigmoid_lut_element_186_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_187_196 (__sigmoid_lut_element_187_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_188_197 (__sigmoid_lut_element_188_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_189_198 (__sigmoid_lut_element_189_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_190_199 (__sigmoid_lut_element_190_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_191_200 (__sigmoid_lut_element_191_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_192_201 (__sigmoid_lut_element_192_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_193_202 (__sigmoid_lut_element_193_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_194_203 (__sigmoid_lut_element_194_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_195_204 (__sigmoid_lut_element_195_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_196_205 (__sigmoid_lut_element_196_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_197_206 (__sigmoid_lut_element_197_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_198_207 (__sigmoid_lut_element_198_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_199_208 (__sigmoid_lut_element_199_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_200_209 (__sigmoid_lut_element_200_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_201_210 (__sigmoid_lut_element_201_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_202_211 (__sigmoid_lut_element_202_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_203_212 (__sigmoid_lut_element_203_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_204_213 (__sigmoid_lut_element_204_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_205_214 (__sigmoid_lut_element_205_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_206_215 (__sigmoid_lut_element_206_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_207_216 (__sigmoid_lut_element_207_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_208_217 (__sigmoid_lut_element_208_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_209_218 (__sigmoid_lut_element_209_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_210_219 (__sigmoid_lut_element_210_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_211_220 (__sigmoid_lut_element_211_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_212_221 (__sigmoid_lut_element_212_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_213_222 (__sigmoid_lut_element_213_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_214_223 (__sigmoid_lut_element_214_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_215_224 (__sigmoid_lut_element_215_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_216_225 (__sigmoid_lut_element_216_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_217_226 (__sigmoid_lut_element_217_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_218_227 (__sigmoid_lut_element_218_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_219_228 (__sigmoid_lut_element_219_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_220_229 (__sigmoid_lut_element_220_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_221_230 (__sigmoid_lut_element_221_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_222_231 (__sigmoid_lut_element_222_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_223_232 (__sigmoid_lut_element_223_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_224_233 (__sigmoid_lut_element_224_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_225_234 (__sigmoid_lut_element_225_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_226_235 (__sigmoid_lut_element_226_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_227_236 (__sigmoid_lut_element_227_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_228_237 (__sigmoid_lut_element_228_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_229_238 (__sigmoid_lut_element_229_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_230_239 (__sigmoid_lut_element_230_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_231_240 (__sigmoid_lut_element_231_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_232_241 (__sigmoid_lut_element_232_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_233_242 (__sigmoid_lut_element_233_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_234_243 (__sigmoid_lut_element_234_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_235_244 (__sigmoid_lut_element_235_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_236_245 (__sigmoid_lut_element_236_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_237_246 (__sigmoid_lut_element_237_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_238_247 (__sigmoid_lut_element_238_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_239_248 (__sigmoid_lut_element_239_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_240_249 (__sigmoid_lut_element_240_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_241_250 (__sigmoid_lut_element_241_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_242_251 (__sigmoid_lut_element_242_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_243_252 (__sigmoid_lut_element_243_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_244_253 (__sigmoid_lut_element_244_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_245_254 (__sigmoid_lut_element_245_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_246_255 (__sigmoid_lut_element_246_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_247_256 (__sigmoid_lut_element_247_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_248_257 (__sigmoid_lut_element_248_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_249_258 (__sigmoid_lut_element_249_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_250_259 (__sigmoid_lut_element_250_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_251_260 (__sigmoid_lut_element_251_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_252_261 (__sigmoid_lut_element_252_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_253_262 (__sigmoid_lut_element_253_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_254_263 (__sigmoid_lut_element_254_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_255_264 (__sigmoid_lut_element_255_value_out),	// swiglu.k:13:5
    .fifo_data_out_0
      (_compute_silu_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0                            (_compute_silu_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0              (fifo_data_2.almost_full),	// swiglu.k:41:9
    .fifo_overflow_in_0                     (fifo_data_2.overflow),	// swiglu.k:41:9
    .data_in_6                              (passthrough_data_6.data),	// swiglu.k:41:9
    .input_fifo_underflow_0                 (passthrough_data_6.underflow),	// swiglu.k:41:9
    .input_rdy_0                            (_compute_silu_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                          (passthrough_data_6.valid),	// swiglu.k:41:9
    .control_state_out                      (/* unused */)
  );	// swiglu.k:41:9
  swiglu_unit_compute_swiglu_BasicBlock_0 compute_swiglu_BasicBlock_0Impl (	// swiglu.k:93:9
    .clk                                    (clk),	// swiglu.k:93:9
    .rst                                    (reg_rst_delayed[7]),	// swiglu.k:93:9
    .done_out                               (/* unused */),
    .global_in__sigmoid_lut_element_0_9     (__sigmoid_lut_element_0_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_1_10    (__sigmoid_lut_element_1_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_2_11    (__sigmoid_lut_element_2_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_3_12    (__sigmoid_lut_element_3_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_4_13    (__sigmoid_lut_element_4_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_5_14    (__sigmoid_lut_element_5_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_6_15    (__sigmoid_lut_element_6_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_7_16    (__sigmoid_lut_element_7_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_8_17    (__sigmoid_lut_element_8_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_9_18    (__sigmoid_lut_element_9_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_10_19   (__sigmoid_lut_element_10_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_11_20   (__sigmoid_lut_element_11_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_12_21   (__sigmoid_lut_element_12_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_13_22   (__sigmoid_lut_element_13_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_14_23   (__sigmoid_lut_element_14_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_15_24   (__sigmoid_lut_element_15_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_16_25   (__sigmoid_lut_element_16_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_17_26   (__sigmoid_lut_element_17_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_18_27   (__sigmoid_lut_element_18_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_19_28   (__sigmoid_lut_element_19_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_20_29   (__sigmoid_lut_element_20_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_21_30   (__sigmoid_lut_element_21_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_22_31   (__sigmoid_lut_element_22_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_23_32   (__sigmoid_lut_element_23_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_24_33   (__sigmoid_lut_element_24_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_25_34   (__sigmoid_lut_element_25_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_26_35   (__sigmoid_lut_element_26_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_27_36   (__sigmoid_lut_element_27_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_28_37   (__sigmoid_lut_element_28_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_29_38   (__sigmoid_lut_element_29_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_30_39   (__sigmoid_lut_element_30_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_31_40   (__sigmoid_lut_element_31_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_32_41   (__sigmoid_lut_element_32_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_33_42   (__sigmoid_lut_element_33_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_34_43   (__sigmoid_lut_element_34_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_35_44   (__sigmoid_lut_element_35_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_36_45   (__sigmoid_lut_element_36_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_37_46   (__sigmoid_lut_element_37_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_38_47   (__sigmoid_lut_element_38_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_39_48   (__sigmoid_lut_element_39_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_40_49   (__sigmoid_lut_element_40_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_41_50   (__sigmoid_lut_element_41_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_42_51   (__sigmoid_lut_element_42_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_43_52   (__sigmoid_lut_element_43_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_44_53   (__sigmoid_lut_element_44_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_45_54   (__sigmoid_lut_element_45_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_46_55   (__sigmoid_lut_element_46_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_47_56   (__sigmoid_lut_element_47_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_48_57   (__sigmoid_lut_element_48_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_49_58   (__sigmoid_lut_element_49_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_50_59   (__sigmoid_lut_element_50_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_51_60   (__sigmoid_lut_element_51_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_52_61   (__sigmoid_lut_element_52_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_53_62   (__sigmoid_lut_element_53_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_54_63   (__sigmoid_lut_element_54_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_55_64   (__sigmoid_lut_element_55_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_56_65   (__sigmoid_lut_element_56_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_57_66   (__sigmoid_lut_element_57_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_58_67   (__sigmoid_lut_element_58_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_59_68   (__sigmoid_lut_element_59_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_60_69   (__sigmoid_lut_element_60_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_61_70   (__sigmoid_lut_element_61_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_62_71   (__sigmoid_lut_element_62_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_63_72   (__sigmoid_lut_element_63_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_64_73   (__sigmoid_lut_element_64_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_65_74   (__sigmoid_lut_element_65_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_66_75   (__sigmoid_lut_element_66_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_67_76   (__sigmoid_lut_element_67_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_68_77   (__sigmoid_lut_element_68_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_69_78   (__sigmoid_lut_element_69_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_70_79   (__sigmoid_lut_element_70_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_71_80   (__sigmoid_lut_element_71_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_72_81   (__sigmoid_lut_element_72_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_73_82   (__sigmoid_lut_element_73_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_74_83   (__sigmoid_lut_element_74_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_75_84   (__sigmoid_lut_element_75_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_76_85   (__sigmoid_lut_element_76_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_77_86   (__sigmoid_lut_element_77_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_78_87   (__sigmoid_lut_element_78_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_79_88   (__sigmoid_lut_element_79_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_80_89   (__sigmoid_lut_element_80_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_81_90   (__sigmoid_lut_element_81_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_82_91   (__sigmoid_lut_element_82_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_83_92   (__sigmoid_lut_element_83_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_84_93   (__sigmoid_lut_element_84_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_85_94   (__sigmoid_lut_element_85_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_86_95   (__sigmoid_lut_element_86_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_87_96   (__sigmoid_lut_element_87_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_88_97   (__sigmoid_lut_element_88_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_89_98   (__sigmoid_lut_element_89_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_90_99   (__sigmoid_lut_element_90_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_91_100  (__sigmoid_lut_element_91_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_92_101  (__sigmoid_lut_element_92_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_93_102  (__sigmoid_lut_element_93_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_94_103  (__sigmoid_lut_element_94_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_95_104  (__sigmoid_lut_element_95_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_96_105  (__sigmoid_lut_element_96_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_97_106  (__sigmoid_lut_element_97_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_98_107  (__sigmoid_lut_element_98_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_99_108  (__sigmoid_lut_element_99_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_100_109 (__sigmoid_lut_element_100_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_101_110 (__sigmoid_lut_element_101_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_102_111 (__sigmoid_lut_element_102_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_103_112 (__sigmoid_lut_element_103_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_104_113 (__sigmoid_lut_element_104_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_105_114 (__sigmoid_lut_element_105_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_106_115 (__sigmoid_lut_element_106_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_107_116 (__sigmoid_lut_element_107_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_108_117 (__sigmoid_lut_element_108_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_109_118 (__sigmoid_lut_element_109_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_110_119 (__sigmoid_lut_element_110_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_111_120 (__sigmoid_lut_element_111_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_112_121 (__sigmoid_lut_element_112_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_113_122 (__sigmoid_lut_element_113_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_114_123 (__sigmoid_lut_element_114_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_115_124 (__sigmoid_lut_element_115_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_116_125 (__sigmoid_lut_element_116_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_117_126 (__sigmoid_lut_element_117_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_118_127 (__sigmoid_lut_element_118_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_119_128 (__sigmoid_lut_element_119_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_120_129 (__sigmoid_lut_element_120_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_121_130 (__sigmoid_lut_element_121_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_122_131 (__sigmoid_lut_element_122_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_123_132 (__sigmoid_lut_element_123_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_124_133 (__sigmoid_lut_element_124_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_125_134 (__sigmoid_lut_element_125_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_126_135 (__sigmoid_lut_element_126_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_127_136 (__sigmoid_lut_element_127_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_128_137 (__sigmoid_lut_element_128_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_129_138 (__sigmoid_lut_element_129_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_130_139 (__sigmoid_lut_element_130_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_131_140 (__sigmoid_lut_element_131_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_132_141 (__sigmoid_lut_element_132_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_133_142 (__sigmoid_lut_element_133_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_134_143 (__sigmoid_lut_element_134_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_135_144 (__sigmoid_lut_element_135_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_136_145 (__sigmoid_lut_element_136_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_137_146 (__sigmoid_lut_element_137_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_138_147 (__sigmoid_lut_element_138_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_139_148 (__sigmoid_lut_element_139_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_140_149 (__sigmoid_lut_element_140_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_141_150 (__sigmoid_lut_element_141_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_142_151 (__sigmoid_lut_element_142_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_143_152 (__sigmoid_lut_element_143_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_144_153 (__sigmoid_lut_element_144_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_145_154 (__sigmoid_lut_element_145_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_146_155 (__sigmoid_lut_element_146_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_147_156 (__sigmoid_lut_element_147_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_148_157 (__sigmoid_lut_element_148_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_149_158 (__sigmoid_lut_element_149_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_150_159 (__sigmoid_lut_element_150_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_151_160 (__sigmoid_lut_element_151_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_152_161 (__sigmoid_lut_element_152_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_153_162 (__sigmoid_lut_element_153_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_154_163 (__sigmoid_lut_element_154_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_155_164 (__sigmoid_lut_element_155_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_156_165 (__sigmoid_lut_element_156_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_157_166 (__sigmoid_lut_element_157_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_158_167 (__sigmoid_lut_element_158_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_159_168 (__sigmoid_lut_element_159_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_160_169 (__sigmoid_lut_element_160_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_161_170 (__sigmoid_lut_element_161_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_162_171 (__sigmoid_lut_element_162_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_163_172 (__sigmoid_lut_element_163_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_164_173 (__sigmoid_lut_element_164_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_165_174 (__sigmoid_lut_element_165_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_166_175 (__sigmoid_lut_element_166_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_167_176 (__sigmoid_lut_element_167_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_168_177 (__sigmoid_lut_element_168_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_169_178 (__sigmoid_lut_element_169_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_170_179 (__sigmoid_lut_element_170_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_171_180 (__sigmoid_lut_element_171_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_172_181 (__sigmoid_lut_element_172_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_173_182 (__sigmoid_lut_element_173_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_174_183 (__sigmoid_lut_element_174_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_175_184 (__sigmoid_lut_element_175_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_176_185 (__sigmoid_lut_element_176_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_177_186 (__sigmoid_lut_element_177_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_178_187 (__sigmoid_lut_element_178_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_179_188 (__sigmoid_lut_element_179_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_180_189 (__sigmoid_lut_element_180_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_181_190 (__sigmoid_lut_element_181_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_182_191 (__sigmoid_lut_element_182_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_183_192 (__sigmoid_lut_element_183_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_184_193 (__sigmoid_lut_element_184_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_185_194 (__sigmoid_lut_element_185_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_186_195 (__sigmoid_lut_element_186_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_187_196 (__sigmoid_lut_element_187_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_188_197 (__sigmoid_lut_element_188_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_189_198 (__sigmoid_lut_element_189_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_190_199 (__sigmoid_lut_element_190_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_191_200 (__sigmoid_lut_element_191_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_192_201 (__sigmoid_lut_element_192_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_193_202 (__sigmoid_lut_element_193_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_194_203 (__sigmoid_lut_element_194_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_195_204 (__sigmoid_lut_element_195_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_196_205 (__sigmoid_lut_element_196_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_197_206 (__sigmoid_lut_element_197_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_198_207 (__sigmoid_lut_element_198_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_199_208 (__sigmoid_lut_element_199_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_200_209 (__sigmoid_lut_element_200_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_201_210 (__sigmoid_lut_element_201_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_202_211 (__sigmoid_lut_element_202_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_203_212 (__sigmoid_lut_element_203_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_204_213 (__sigmoid_lut_element_204_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_205_214 (__sigmoid_lut_element_205_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_206_215 (__sigmoid_lut_element_206_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_207_216 (__sigmoid_lut_element_207_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_208_217 (__sigmoid_lut_element_208_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_209_218 (__sigmoid_lut_element_209_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_210_219 (__sigmoid_lut_element_210_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_211_220 (__sigmoid_lut_element_211_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_212_221 (__sigmoid_lut_element_212_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_213_222 (__sigmoid_lut_element_213_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_214_223 (__sigmoid_lut_element_214_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_215_224 (__sigmoid_lut_element_215_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_216_225 (__sigmoid_lut_element_216_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_217_226 (__sigmoid_lut_element_217_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_218_227 (__sigmoid_lut_element_218_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_219_228 (__sigmoid_lut_element_219_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_220_229 (__sigmoid_lut_element_220_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_221_230 (__sigmoid_lut_element_221_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_222_231 (__sigmoid_lut_element_222_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_223_232 (__sigmoid_lut_element_223_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_224_233 (__sigmoid_lut_element_224_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_225_234 (__sigmoid_lut_element_225_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_226_235 (__sigmoid_lut_element_226_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_227_236 (__sigmoid_lut_element_227_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_228_237 (__sigmoid_lut_element_228_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_229_238 (__sigmoid_lut_element_229_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_230_239 (__sigmoid_lut_element_230_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_231_240 (__sigmoid_lut_element_231_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_232_241 (__sigmoid_lut_element_232_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_233_242 (__sigmoid_lut_element_233_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_234_243 (__sigmoid_lut_element_234_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_235_244 (__sigmoid_lut_element_235_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_236_245 (__sigmoid_lut_element_236_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_237_246 (__sigmoid_lut_element_237_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_238_247 (__sigmoid_lut_element_238_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_239_248 (__sigmoid_lut_element_239_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_240_249 (__sigmoid_lut_element_240_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_241_250 (__sigmoid_lut_element_241_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_242_251 (__sigmoid_lut_element_242_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_243_252 (__sigmoid_lut_element_243_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_244_253 (__sigmoid_lut_element_244_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_245_254 (__sigmoid_lut_element_245_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_246_255 (__sigmoid_lut_element_246_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_247_256 (__sigmoid_lut_element_247_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_248_257 (__sigmoid_lut_element_248_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_249_258 (__sigmoid_lut_element_249_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_250_259 (__sigmoid_lut_element_250_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_251_260 (__sigmoid_lut_element_251_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_252_261 (__sigmoid_lut_element_252_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_253_262 (__sigmoid_lut_element_253_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_254_263 (__sigmoid_lut_element_254_value_out),	// swiglu.k:13:5
    .global_in__sigmoid_lut_element_255_264 (__sigmoid_lut_element_255_value_out),	// swiglu.k:13:5
    .fifo_data_out_0
      (_compute_swiglu_BasicBlock_0Impl_fifo_data_out_0),
    .fifo_wren_0
      (_compute_swiglu_BasicBlock_0Impl_fifo_wren_0),
    .fifo_almost_full_in_raw_0              (fifo_data_3.almost_full),	// swiglu.k:93:9
    .fifo_overflow_in_0                     (fifo_data_3.overflow),	// swiglu.k:93:9
    .data_in_7                              (passthrough_data_7.data),	// swiglu.k:93:9
    .input_fifo_underflow_0                 (passthrough_data_7.underflow),	// swiglu.k:93:9
    .input_rdy_0
      (_compute_swiglu_BasicBlock_0Impl_input_rdy_0),
    .input_valid_0                          (passthrough_data_7.valid),	// swiglu.k:93:9
    .control_state_out                      (/* unused */)
  );	// swiglu.k:93:9
  assign rst_and_startup_done_out = rst_and_startup_done_out_net;
  assign set_sigmoid_lut_rdy_out = set_sigmoid_lut_rdy_out_net;
  assign set_sigmoid_lut_empty_out = set_sigmoid_lut_empty_out_net;
  assign lookup_sigmoid_rdy_out = lookup_sigmoid_rdy_out_net;
  assign lookup_sigmoid_empty_out = lookup_sigmoid_empty_out_net;
  assign lookup_sigmoid_result_out = lookup_sigmoid_result_out_net;
  assign compute_silu_rdy_out = compute_silu_rdy_out_net;
  assign compute_silu_empty_out = compute_silu_empty_out_net;
  assign compute_silu_result_out = compute_silu_result_out_net;
  assign compute_swiglu_rdy_out = compute_swiglu_rdy_out_net;
  assign compute_swiglu_empty_out = compute_swiglu_empty_out_net;
  assign compute_swiglu_result_out = compute_swiglu_result_out_net;
  assign stall_rate_supported_out = stall_rate_supported_out_net;
endmodule

module swiglu_unit_EsiWrapper(
     input  wire                                                                clk,
     input  wire                                                                rst,
     input  wire [2:0]                                                          stall_rate_in,
     input  wire                                                                stall_rate_valid_in,
     input  wire struct packed {logic [15:0] gate_bf16; }                       compute_silu_arg,
     input  wire                                                                compute_silu_arg_valid,
     input  wire struct packed {logic [15:0] gate_bf16; logic [15:0] up_bf16; } compute_swiglu_arg,
     input  wire                                                                compute_swiglu_arg_valid,
     input  wire struct packed {logic [7:0] index; }                            lookup_sigmoid_arg,
     input  wire                                                                lookup_sigmoid_arg_valid,
     input  wire struct packed {logic [7:0] index; logic [15:0] value; }        set_sigmoid_lut_arg,
     input  wire                                                                set_sigmoid_lut_arg_valid,
     input  wire                                                                compute_silu_result_rden,
     input  wire                                                                compute_swiglu_result_rden,
     input  wire                                                                lookup_sigmoid_result_rden,
     input  wire                                                                set_sigmoid_lut_result_rden,
     output wire                                                                compute_silu_arg_ready,
     output wire                                                                compute_swiglu_arg_ready,
     output wire                                                                lookup_sigmoid_arg_ready,
     output wire                                                                set_sigmoid_lut_arg_ready,
     output wire [15:0]                                                         compute_silu_result,
     output wire                                                                compute_silu_result_empty,
     output wire [15:0]                                                         compute_swiglu_result,
     output wire                                                                compute_swiglu_result_empty,
     output wire [15:0]                                                         lookup_sigmoid_result,
     output wire                                                                lookup_sigmoid_result_empty,
  // output wire /*Zero Width*/                                                 set_sigmoid_lut_result,
     output wire                                                                set_sigmoid_lut_result_empty,
     output wire                                                                rst_and_startup_done_out,
     output wire                                                                stall_rate_supported_out
);

  wire [15:0] _EsiWrapped_lookup_sigmoid_result_out;
  wire [15:0] _EsiWrapped_compute_silu_result_out;
  wire [15:0] _EsiWrapped_compute_swiglu_result_out;
  swiglu_unit EsiWrapped (
    .clk                         (clk),
    .rst                         (rst),
    .set_sigmoid_lut_valid_in    (set_sigmoid_lut_arg_valid),
    .set_sigmoid_lut_index_in    (set_sigmoid_lut_arg.index),
    .set_sigmoid_lut_value_in    (set_sigmoid_lut_arg.value),
    .set_sigmoid_lut_rden_in     (set_sigmoid_lut_result_rden),
    .lookup_sigmoid_valid_in     (lookup_sigmoid_arg_valid),
    .lookup_sigmoid_index_in     (lookup_sigmoid_arg.index),
    .lookup_sigmoid_rden_in      (lookup_sigmoid_result_rden),
    .compute_silu_valid_in       (compute_silu_arg_valid),
    .compute_silu_gate_bf16_in   (compute_silu_arg.gate_bf16),
    .compute_silu_rden_in        (compute_silu_result_rden),
    .compute_swiglu_valid_in     (compute_swiglu_arg_valid),
    .compute_swiglu_gate_bf16_in (compute_swiglu_arg.gate_bf16),
    .compute_swiglu_up_bf16_in   (compute_swiglu_arg.up_bf16),
    .compute_swiglu_rden_in      (compute_swiglu_result_rden),
    .stall_rate_in               (stall_rate_in),
    .stall_rate_valid_in         (stall_rate_valid_in),
    .rst_and_startup_done_out    (rst_and_startup_done_out),
    .set_sigmoid_lut_rdy_out     (set_sigmoid_lut_arg_ready),
    .set_sigmoid_lut_empty_out   (set_sigmoid_lut_result_empty),
    .lookup_sigmoid_rdy_out      (lookup_sigmoid_arg_ready),
    .lookup_sigmoid_empty_out    (lookup_sigmoid_result_empty),
    .lookup_sigmoid_result_out   (_EsiWrapped_lookup_sigmoid_result_out),
    .compute_silu_rdy_out        (compute_silu_arg_ready),
    .compute_silu_empty_out      (compute_silu_result_empty),
    .compute_silu_result_out     (_EsiWrapped_compute_silu_result_out),
    .compute_swiglu_rdy_out      (compute_swiglu_arg_ready),
    .compute_swiglu_empty_out    (compute_swiglu_result_empty),
    .compute_swiglu_result_out   (_EsiWrapped_compute_swiglu_result_out),
    .stall_rate_supported_out    (stall_rate_supported_out)
  );
  assign compute_silu_result = _EsiWrapped_compute_silu_result_out;
  assign compute_swiglu_result = _EsiWrapped_compute_swiglu_result_out;
  assign lookup_sigmoid_result = _EsiWrapped_lookup_sigmoid_result_out;
  // Zero width: assign set_sigmoid_lut_result = /*Zero width*/;
endmodule

