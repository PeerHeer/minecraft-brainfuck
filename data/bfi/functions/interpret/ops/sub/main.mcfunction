# Get current memory
execute store result score $bfi.memory.value bfi.var run data get storage bfi:internal root.Interpret.Memory.Current

# Do operation
scoreboard players remove $bfi.memory.value bfi.var 1

# Set current memory
execute if score $bfi.memory.value bfi.var >= #bfi.memory.value.min bfi.const store result storage bfi:internal root.Interpret.Memory.Current int 1 run scoreboard players get $bfi.memory.value bfi.var
execute if score $bfi.memory.value bfi.var < #bfi.memory.value.min bfi.const run data modify storage bfi:internal root.Interpret.Memory.Current set value 255