# Add operator to the parsed Program.

# Check if stack is empty.
execute store result score #bfi.read.parse.stack_size bfi.var run data get storage bfi:internal root.Program.Stack
# If stack is empty, use the main program.
execute if score #bfi.read.parse.stack_size bfi.var matches 0 run function bfi:read/parse/program/add_op/stack_empty
# Else, use top stack element.
execute if score #bfi.read.parse.stack_size bfi.var matches 1.. run function bfi:read/parse/program/add_op/stack_not_empty