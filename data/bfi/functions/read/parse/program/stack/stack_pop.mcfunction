# Remove top element from the stack.
data remove storage bfi:internal root.Program.Stack[-1]

# Check if stack is empty.
execute store result score #bfi.read.parse.stack_size bfi.var run data get storage bfi:internal root.Program.Stack
# If not empty, merge removed element with new top element.
execute if score #bfi.read.parse.stack_size bfi.var matches 1.. run function bfi:read/parse/program/stack/pop/stack_not_empty
# Else, merge with main Program.
execute if score #bfi.read.parse.stack_size bfi.var matches 0 run function bfi:read/parse/program/stack/pop/stack_empty