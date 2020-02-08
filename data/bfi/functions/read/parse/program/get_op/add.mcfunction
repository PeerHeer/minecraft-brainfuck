# Check if the character is the ADD operator (+).
# The ADD operator has opcode 0.

# Check character.
execute store success score #bfi.read.parse.get_op.success bfi.var run data modify storage bfi:temp root.Operators.ADD set from storage bfi:internal root.Parse.Current
# If the character is '+', set the opcode.
execute if score #bfi.read.parse.get_op.success bfi.var matches 0 run scoreboard players set #bfi.read.parse.opcode bfi.var 0
# Else, go to the next operator.
execute if score #bfi.read.parse.get_op.success bfi.var matches 1 run function bfi:read/parse/program/get_op/sub