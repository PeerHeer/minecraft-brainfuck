# Check if character is equal.
execute store result score #bfi.parse.args.success bfi.var run data modify storage bfi:temp root.Characters[18] set from storage bfi:temp root.ArgCurrent
# If character is equal, set value to 18.
execute if score #bfi.parse.args.success bfi.var matches 0 run scoreboard players set #bfi.parse.args.ascii_val bfi.var 18
# Else, go to next character.
execute if score #bfi.parse.args.success bfi.var matches 1 run function bfi:read/parse/args/get_byte/19
