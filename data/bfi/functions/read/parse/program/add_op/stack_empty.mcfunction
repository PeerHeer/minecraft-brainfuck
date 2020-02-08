# Get the main program.
data modify storage bfi:internal root.Program.Current.List set from storage bfi:internal root.Program.Main

# Store an operator entry into the current list.
data modify storage bfi:internal root.Program.Current.List append value {OpCode: 0}
execute store result storage bfi:internal root.Program.Current.List[-1].OpCode int 1 run scoreboard players get #bfi.read.parse.opcode bfi.var

# Add back to main.
data modify storage bfi:internal root.Program.Main set from storage bfi:internal root.Program.Current.List

# If the oprator is JZERO, add to the stack.
execute if score #bfi.read.parse.opcode bfi.var matches 4 run function bfi:read/parse/program/stack/stack_push

# If operator is JNZERO, throw ERROR.
execute if score #bfi.read.parse.opcode bfi.var matches 5 run function bfi:error_handler/unbalanced_brackets_left

