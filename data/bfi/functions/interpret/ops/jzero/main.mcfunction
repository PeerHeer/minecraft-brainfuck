# Get current memory
execute store result score $bfi.memory.value bfi.var run data get storage bfi:internal root.Interpret.Memory.Current

# Get current memory
execute if score $bfi.memory.value bfi.var matches 0 run function bfi:interpret/ops/jzero/jump
