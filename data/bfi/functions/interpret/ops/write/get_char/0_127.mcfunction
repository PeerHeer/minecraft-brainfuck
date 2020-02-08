execute if score $bfi.memory.value bfi.var matches 0..63 run function bfi:interpret/ops/write/get_char/0_63
execute if score $bfi.memory.value bfi.var matches 64..127 run function bfi:interpret/ops/write/get_char/64_127
