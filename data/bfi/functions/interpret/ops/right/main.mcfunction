# If memory pointer is the same as memory length, increase the memory.
execute unless data storage bfi:internal root.Interpret.Memory.Right[0] run function bfi:interpret/ops/right/add_memory

# Add current memory cell to Right list.
data modify storage bfi:internal root.Interpret.Memory.Left append from storage bfi:internal root.Interpret.Memory.Current
# Set current cell to last cell in Left list.
data modify storage bfi:internal root.Interpret.Memory.Current set from storage bfi:internal root.Interpret.Memory.Right[0]
# Remove current element from left list.
data remove storage bfi:internal root.Interpret.Memory.Right[0]
# Move the pointer to the right.
scoreboard players add $bfi.memory.ptr bfi.var 1