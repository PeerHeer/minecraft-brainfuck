# Start parsing arguments from ascii to byte value.

# Notify the user.
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Program parsed successfully!", "color":"white"}]
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Start input parsing...", "color":"white"}]

# Initialize scores
scoreboard players set #bfi.read.parse.index bfi.var 0
execute store result score #bfi.read.parse.length bfi.var run data get storage bfi:internal root.Input.Args

# Initialize storage
data modify storage bfi:internal root.Args.Main set value []

# Start loop if input is not empty.
execute unless score #bfi.read.parse.length bfi.var matches 0 run schedule function bfi:read/parse/args/schedule_function 1t