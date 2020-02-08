# Add current memory cell to Right list.
data modify storage bfi:internal root.Interpret.Memory.Right prepend from storage bfi:internal root.Interpret.Memory.Current
# Set current cell to last cell in Left list.
data modify storage bfi:internal root.Interpret.Memory.Current set from storage bfi:internal root.Interpret.Memory.Left[-1]
# Remove current element from left list.
data remove storage bfi:internal root.Interpret.Memory.Left[-1]
# Move the pointer to the left.
scoreboard players remove $bfi.memory.ptr bfi.var 1