# Add element from Left list to Right list.
data modify storage bfi:internal root.Interpret.Program.Left append from storage bfi:internal root.Interpret.Program.Right[0]
data remove storage bfi:internal root.Interpret.Program.Right[0]

# Move instruction pointer
scoreboard players add $bfi.program.ptr bfi.var 1

# Recursive call
execute if score #bfi.interpret.jump_index bfi.var > $bfi.program.ptr bfi.var run function bfi:interpret/ops/jzero/jump_loop