execute if score $bfi.memory.value bfi.var matches 0..31 run function bfi:interpret/ops/write/get_char/0_31
execute if score $bfi.memory.value bfi.var matches 32..63 run function bfi:interpret/ops/write/get_char/32_63
