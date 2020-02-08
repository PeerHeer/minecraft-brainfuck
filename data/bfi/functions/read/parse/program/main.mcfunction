# Notify the player.
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Start program parsing...", "color":"white"}]

# Set busy bool
scoreboard players set #bfi.busy bfi.var 1

# Reset scores.
scoreboard players set #bfi.read.parse.index bfi.var 0
scoreboard players set #bfi.read.parse.error_index bfi.var 0
scoreboard players set #bfi.read.parse.stack_size bfi.var 0
execute store result score #bfi.read.parse.length bfi.var run data get storage bfi:in Program

# Reset storage.
data modify storage bfi:internal root.Program.Stack set value []
data modify storage bfi:internal root.Program.Current set value {}
data modify storage bfi:internal root.Program.Main set value []

# Copy input program.
data modify storage bfi:internal root.Input.Program set from storage bfi:in Program

# Schedule parsing loop for program
schedule function bfi:read/parse/program/schedule_function 1t