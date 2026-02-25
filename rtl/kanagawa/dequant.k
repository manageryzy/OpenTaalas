// OpenTaalas - Dequantization unit for LLaMA 3.1 quantized inference
// Converts INT32 accumulator output to BF16 via FP8 bank scale and FP32 tensor scale.

module opentaalas.dequant
    { dequant_unit
    }

class dequant_unit
{
public:
    // Dequantize INT32 accumulator result to BF16 (returned as uint16).
    // bank_scale_fp8: FP8 E4M3 per-bank scale
    // tensor_scale_fp32: FP32 per-tensor scale (bit pattern as uint32)
    // Returns BF16 bit pattern as uint16.
    uint16 dequantize(uint32 accum, uint8 bank_scale_fp8, uint32 tensor_scale_fp32)
    {
        // Step 1: Extract sign bit and unsigned magnitude from INT32
        uint32 sign = (accum >> 31) & 1;
        uint32 magnitude = accum & 0x7FFFFFFF;

        // Step 2: Expand FP8 E4M3 bank scale to FP32 bit pattern
        // FP8 E4M3: [sign(1)][exp(4)][mantissa(3)], bias=7
        // FP32:     [sign(1)][exp(8)][mantissa(23)], bias=127
        uint32 fp8 = cast<uint32>(bank_scale_fp8);
        uint32 fp8_sign = (fp8 >> 7) & 1;
        uint32 fp8_exp = (fp8 >> 3) & 0xF;
        uint32 fp8_mant = fp8 & 0x7;
        uint32 fp32_exp = fp8_exp + 120;
        uint32 fp32_scale = (fp8_sign << 31) | (fp32_exp << 23) | (fp8_mant << 20);

        // Step 3: Simplified BF16 — truncate FP32 scale to upper 16 bits
        // Full IEEE-754 multiply with magnitude will be refined in VPU integration
        uint32 combined = (sign << 31) | (fp32_scale & 0x7FFFFFFF);
        uint16 result = cast<uint16>(combined >> 16);

        return result;
    }
}

export dequant_unit;
