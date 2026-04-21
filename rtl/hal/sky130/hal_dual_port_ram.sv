// Sky130 HAL Dual Port RAM — maps KanagawaSyncRam to physical macros.
//
// Macro selection by DATA_WIDTH × DEPTH:
//   880 × 1024   → nor_rom_1024x880    (rom_bank, mac_array ROM)
//   1024 × 4096  → nor_rom_4096x1024   (rope tables)
//   192 × 65536  → nor_rom_65536x192   (embed_rom)
//   8 × 16384    → sram_8192x8 × 2     (kv_cache_demo, tiled; 254×293µm col_mux=32)
//   8 × 4194304  → sram_4096x8 × 1024  (kv_cache full-scale, tiled)
//   32 × 512     → synthesized (mac_array grid, small enough for gates)
//
// ROM macros: write port is ignored (weights baked at tapeout).
// For simulation, a behavioral fallback is used.

/* verilator lint_off DECLFILENAME */
module KanagawaHALDualPortRAM
#(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 6,
    parameter DEPTH = 2**ADDR_WIDTH,
    parameter USE_OUTPUT_REG = 0,
    parameter INITIAL_DATA_FILE = "UNUSED",
    parameter TRUE_DUAL_PORT = 0,
    parameter USE_HARDENED_BYPASS = 0,
    /* verilator lint_off UNUSEDPARAM */
    parameter MAX_DEPTH = 0,
    parameter DEVICE_FAMILY = "sky130",
    parameter USE_LUTRAM = 0,
    parameter USE_BRAM = 0,
    parameter SUPPORTS_RW_COLLISIONS = 0,
    parameter RW_COLLISIONS_IMPOSSIBLE = 0,
    parameter ECC
    /* verilator lint_on UNUSEDPARAM */
)
(
    input wire clk,

    input wire [1:0][ADDR_WIDTH-1:0] addr_in,

    // writes
    input wire [1:0] wren_in,
    input wire [1:0][DATA_WIDTH-1:0] data_in,
    input wire inject_correctable_error_in,
    input wire inject_uncorrectable_error_in,

    // reads
    input wire [1:0] rden_in,
    output logic [1:0][DATA_WIDTH-1:0] data_out,
    output logic error_detected_out,
    output logic data_valid_out
);

    assign error_detected_out = 1'b0;
    assign data_valid_out = 1'b1;

    generate
        // ---------------------------------------------------------------
        // NOR ROM: 1024 × 880 (rom_bank, mac_array ROM)
        // ---------------------------------------------------------------
        if (DATA_WIDTH == 880 && DEPTH == 1024) begin : gen_rom_1024x880

            wire [879:0] rom_dout;
            nor_rom_1024x880 u_rom (
                .clk  (clk),
                .ce   (rden_in[1]),
                .addr (addr_in[1][9:0]),
                .dout (rom_dout)
            );

            if (USE_OUTPUT_REG) begin : gen_oreg
                always_ff @(posedge clk) begin
                    data_out[1] <= rom_dout;
                    data_out[0] <= '0;
                end
            end else begin : gen_noreg
                assign data_out[1] = rom_dout;
                assign data_out[0] = '0;
            end

        // ---------------------------------------------------------------
        // NOR ROM: 4096 × 1024 (rope cos/sin tables)
        // ---------------------------------------------------------------
        end else if (DATA_WIDTH == 1024 && DEPTH == 4096) begin : gen_rom_4096x1024

            wire [1023:0] rom_dout;
            nor_rom_4096x1024 u_rom (
                .clk  (clk),
                .ce   (rden_in[1]),
                .addr (addr_in[1][11:0]),
                .dout (rom_dout)
            );

            if (USE_OUTPUT_REG) begin : gen_oreg
                always_ff @(posedge clk) begin
                    data_out[1] <= rom_dout;
                    data_out[0] <= '0;
                end
            end else begin : gen_noreg
                assign data_out[1] = rom_dout;
                assign data_out[0] = '0;
            end

        // ---------------------------------------------------------------
        // NOR ROM: 65536 × 192 (embed_rom) — monolithic nor_rom_65536x192
        // ---------------------------------------------------------------
        end else if (DATA_WIDTH == 192 && DEPTH == 65536) begin : gen_rom_65536x192

            wire [191:0] rom_dout;
            nor_rom_65536x192 u_rom (
                .clk  (clk),
                .ce   (rden_in[1]),
                .addr (addr_in[1][15:0]),
                .dout (rom_dout)
            );

            if (USE_OUTPUT_REG) begin : gen_oreg
                always_ff @(posedge clk) begin
                    data_out[1] <= rom_dout;
                    data_out[0] <= '0;
                end
            end else begin : gen_noreg
                assign data_out[1] = rom_dout;
                assign data_out[0] = '0;
            end

        // ---------------------------------------------------------------
        // SRAM: 8 × 16384 (kv_cache_demo) — tiled as 2 × sram_8192x8
        // ---------------------------------------------------------------
        end else if (DATA_WIDTH == 8 && DEPTH == 16384) begin : gen_sram_kv_demo

            localparam TILE_DEPTH = 8192;
            localparam NUM_TILES  = DEPTH / TILE_DEPTH;  // 2
            localparam TILE_ADDR  = 13;  // log2(8192)
            localparam SEL_BITS   = ADDR_WIDTH - TILE_ADDR;  // 1

            wire [SEL_BITS-1:0] wr_sel = addr_in[0][ADDR_WIDTH-1:TILE_ADDR];
            wire [TILE_ADDR-1:0] wr_addr = addr_in[0][TILE_ADDR-1:0];
            wire [SEL_BITS-1:0] rd_sel = addr_in[1][ADDR_WIDTH-1:TILE_ADDR];
            wire [TILE_ADDR-1:0] rd_addr = addr_in[1][TILE_ADDR-1:0];

            wire [7:0] tile_dout [0:NUM_TILES-1];

            genvar t;
            for (t = 0; t < NUM_TILES; t = t + 1) begin : gen_tile
                wire tile_ce = (rden_in[1] && rd_sel == t) ||
                               (wren_in[0] && wr_sel == t);
                wire tile_we = wren_in[0] && wr_sel == t;
                wire [TILE_ADDR-1:0] tile_addr = tile_we ? wr_addr : rd_addr;

                sram_8192x8 u_sram (
                    .clk  (clk),
                    .ce   (tile_ce),
                    .we   (tile_we),
                    .addr (tile_addr),
                    .din  (data_in[0][7:0]),
                    .dout (tile_dout[t])
                );
            end

            reg [SEL_BITS-1:0] rd_sel_r;
            always_ff @(posedge clk) rd_sel_r <= rd_sel;

            assign data_out[1] = {{(DATA_WIDTH-8){1'b0}}, tile_dout[rd_sel_r]};
            assign data_out[0] = '0;

        // ---------------------------------------------------------------
        // SRAM: 8 × 4194304 (kv_cache) — tiled as 1024 × sram_4096x8
        // ---------------------------------------------------------------
        end else if (DATA_WIDTH == 8 && DEPTH == 4194304) begin : gen_sram_kv

            localparam TILE_DEPTH = 4096;
            localparam NUM_TILES  = DEPTH / TILE_DEPTH;  // 1024
            localparam TILE_ADDR  = 12;  // log2(4096)
            localparam SEL_BITS   = ADDR_WIDTH - TILE_ADDR;  // 10

            wire [SEL_BITS-1:0] wr_sel = addr_in[0][ADDR_WIDTH-1:TILE_ADDR];
            wire [TILE_ADDR-1:0] wr_addr = addr_in[0][TILE_ADDR-1:0];
            wire [SEL_BITS-1:0] rd_sel = addr_in[1][ADDR_WIDTH-1:TILE_ADDR];
            wire [TILE_ADDR-1:0] rd_addr = addr_in[1][TILE_ADDR-1:0];

            wire [7:0] tile_dout [0:NUM_TILES-1];

            genvar t;
            for (t = 0; t < NUM_TILES; t = t + 1) begin : gen_tile
                wire tile_ce = (rden_in[1] && rd_sel == t) ||
                               (wren_in[0] && wr_sel == t);
                wire tile_we = wren_in[0] && wr_sel == t;
                wire [TILE_ADDR-1:0] tile_addr = tile_we ? wr_addr : rd_addr;

                sram_4096x8 u_sram (
                    .clk  (clk),
                    .ce   (tile_ce),
                    .we   (tile_we),
                    .addr (tile_addr),
                    .din  (data_in[0][7:0]),
                    .dout (tile_dout[t])
                );
            end

            reg [SEL_BITS-1:0] rd_sel_r;
            always_ff @(posedge clk) rd_sel_r <= rd_sel;

            assign data_out[1] = {{(DATA_WIDTH-8){1'b0}}, tile_dout[rd_sel_r]};
            assign data_out[0] = '0;

        // ---------------------------------------------------------------
        // Small memories: gate-synthesized behavioral RAM
        // (mac_array grid: 32×512, and any other small configs)
        // ---------------------------------------------------------------
        end else begin : gen_behavioral

            logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

            // synopsys translate_off
            initial begin
                if (INITIAL_DATA_FILE != "UNUSED" && INITIAL_DATA_FILE != "") begin
                    $readmemh(INITIAL_DATA_FILE, mem);
                end
            end
            // synopsys translate_on

            always_ff @(posedge clk) begin
                if (wren_in[0])
                    mem[addr_in[0]] <= data_in[0];
            end

            logic [DATA_WIDTH-1:0] rd_data;
            always_ff @(posedge clk) begin
                if (rden_in[1])
                    rd_data <= mem[addr_in[1]];
            end

            if (USE_OUTPUT_REG) begin : gen_oreg
                logic [DATA_WIDTH-1:0] rd_data_r;
                always_ff @(posedge clk) rd_data_r <= rd_data;
                assign data_out[1] = rd_data_r;
            end else begin : gen_noreg
                assign data_out[1] = rd_data;
            end
            assign data_out[0] = '0;

        end
    endgenerate

endmodule
/* verilator lint_on DECLFILENAME */
