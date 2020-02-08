# Set memory cell equal to next input character.
data modify storage bfi:internal root.Interpret.Memory.Current set from storage bfi:internal root.Args.Main[-1]
# Remove next input character.
data remove storage bfi:internal root.Args.Main[-1]
# Remove one from the length.
scoreboard players remove #bfi.interpret.input.length bfi.var 1