# Set error flag.
scoreboard players set $bfi.exit_code bfi.var 1

# Send a tellraw error message.
tellraw @a[tag=bfi.log] [{"text":"[Error]", "color":"red"}, {"text":" Cannot read from empty input: too many '", "color":"white"}, {"text":",", "color":"green"}, {"text":"' operations.", "color":"white"}]