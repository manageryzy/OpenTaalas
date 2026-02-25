// OpenTaalas smoke test - minimal Kanagawa adder
// Validates that the Kanagawa compiler can parse and compile a trivial design.

    inline void main()
    {
        uint8 a = 3;
        uint8 b = 5;
        auto c = a + b;
        static assert(bitsizeof(c) == 9);
    }

expected:0
