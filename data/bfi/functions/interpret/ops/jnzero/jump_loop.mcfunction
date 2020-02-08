# Add element from Left list to Right list.
data modify storage bfi:internal root.Interpret.Program.Right prepend from storage bfi:internal root.Interpret.Program.Left[-1]
data remove storage bfi:internal root.Interpret.Program.Left[-1]

# Move instruction pointer
scoreboard players remove $bfi.program.ptr bfi.var 1

# Recursive call
execute if score #bfi.interpret.jump_index bfi.var < $bfi.program.ptr bfi.var run function bfi:interpret/ops/jnzero/jump_loop