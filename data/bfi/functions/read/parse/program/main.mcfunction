# Notify the player.
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Start program parsing...", "color":"white"}]

# Set busy bool
scoreboard players set #bfi.busy bfi.var 1

# Reset scores.
scoreboard players set #bfi.read.parse.index bfi.var 0
scoreboard players set #bfi.read.parse.error_index bfi.var 0
execute store result score #bfi.read.parse.length bfi.var run data get storage bfi:in Program

# Reset storage.
data modify storage bfi:internal root.Program.Stack set value []
data modify storage bfi:internal root.Program.Current set value {}
data modify storage bfi:internal root.Program.Main set value []

# If there are no players to log to, abort.
execute unless entity @a[tag=bfi.log] run function bfi:error_handler/no_executing_entity

# Start the parsing loop.
execute if score $bfi.exit_code bfi.var matches 0 run function bfi:read/parse/program/loop

# If stack is not empty, brackets are unbalanced.
execute if data storage bfi:internal root.Program.Stack[0] run function bfi:error_handler/unbalanced_brackets_right

# If an error occured, stop the process.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop
# Else, continue.
execute if score $bfi.exit_code bfi.var matches 0 run function bfi:read/parse/args/main
