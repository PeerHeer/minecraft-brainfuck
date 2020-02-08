# Check if character is equal.
execute store result score #bfi.parse.args.success bfi.var run data modify storage bfi:temp root.Characters[255] set from storage bfi:temp root.ArgCurrent
# If character is equal, set value to 255.
execute if score #bfi.parse.args.success bfi.var matches 0 run scoreboard players set #bfi.parse.args.ascii_val bfi.var 255
# Else, set to -1.
execute if score #bfi.parse.args.success bfi.var matches 1 run scoreboard players set #bfi.parse.args.ascii_val bfi.var -1
