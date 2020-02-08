# Check if the character is the SUB operator (-).
# The SUB operator has opcode 1.

# Check character.
execute store success score #bfi.read.parse.get_op.success bfi.var run data modify storage bfi:temp root.Operators.SUB set from storage bfi:internal root.Parse.Current
# If the character is '-', set the opcode.
execute if score #bfi.read.parse.get_op.success bfi.var matches 0 run scoreboard players set #bfi.read.parse.opcode bfi.var 1
# Else, go to the next operator.
execute if score #bfi.read.parse.get_op.success bfi.var matches 1 run function bfi:read/parse/program/get_op/right