# Add 20 null cells to the memory.
data modify storage bfi:internal root.Interpret.Memory.Right append from storage bfi:internal root.Interpret.Memory.Add[]
# Increase the stored memory length.
scoreboard players add $bfi.memory.length bfi.var 20