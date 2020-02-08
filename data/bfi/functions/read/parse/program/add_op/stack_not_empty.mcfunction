# Get the top entry from the stack.
data modify storage bfi:internal root.Program.Current set from storage bfi:internal root.Program.Stack[-1]

# Store an operator entry into the current list.
data modify storage bfi:internal root.Program.Current.List append value {OpCode: 0}
execute store result storage bfi:internal root.Program.Current.List[-1].OpCode int 1 run scoreboard players get #bfi.read.parse.opcode bfi.var

# Add back to main.
data modify storage bfi:internal root.Program.Stack[-1] set from storage bfi:internal root.Program.Current

# If the oprator is JZERO, add to the stack.
execute if score #bfi.read.parse.opcode bfi.var matches 4 run function bfi:read/parse/program/stack/stack_push

# If operator is JNZERO, pop from stack.
execute if score #bfi.read.parse.opcode bfi.var matches 5 run function bfi:read/parse/program/stack/stack_pop