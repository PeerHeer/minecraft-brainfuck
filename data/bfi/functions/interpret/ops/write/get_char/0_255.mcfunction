execute if score $bfi.memory.value bfi.var matches 0..127 run function bfi:interpret/ops/write/get_char/0_127
execute if score $bfi.memory.value bfi.var matches 128..255 run function bfi:interpret/ops/write/get_char/128_255
