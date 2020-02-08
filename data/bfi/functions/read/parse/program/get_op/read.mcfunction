# Check if the character is the READ operator (,).
# The READ operator has opcode 6.

# Check character.
execute store success score #bfi.read.parse.get_op.success bfi.var run data modify storage bfi:temp root.Operators.READ set from storage bfi:internal root.Parse.Current
# If the character is ',', set the opcode.
execute if score #bfi.read.parse.get_op.success bfi.var matches 0 run scoreboard players set #bfi.read.parse.opcode bfi.var 6
# Else, all operators were tried but the character was not valid.
execute if score #bfi.read.parse.get_op.success bfi.var matches 1 run function bfi:read/parse/program/get_op/write