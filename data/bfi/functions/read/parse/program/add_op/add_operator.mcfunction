# Add operator to the parsed Program.

# Set stack_changed to 0
scoreboard players set #bfi.read.parse.stack_changed bfi.var 0

# If stack is empty, use the main program.
execute if score #bfi.read.parse.stack_size bfi.var matches 0 run function bfi:read/parse/program/add_op/stack_empty
# Else, use top stack element.
execute if score #bfi.read.parse.stack_size bfi.var matches 1.. if score #bfi.read.parse.stack_changed bfi.var matches 0 run function bfi:read/parse/program/add_op/stack_not_empty