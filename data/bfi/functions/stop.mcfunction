# Print exit code.
# tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Exited with code ", "color":"white"}, {"score":{"name":"$bfi.exit_code", "objective":"bfi.var"}, "color":"yellow"}, {"text":".", "color":"white"}]

# Stop the process by setting the exit code to 1.
scoreboard players set $bfi.exit_code bfi.var 1

# Set busy bool to 0
scoreboard players set #bfi.busy bfi.var 0

# Remove log tags
tag @e remove bfi.log
