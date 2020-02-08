# Set error flag.
scoreboard players set $bfi.exit_code bfi.var 1

# Send a tellraw error message.
tellraw @a[tag=bfi.log] [{"text":"[Error]", "color":"red"}, {"text":" Memory pointer cannot be negative: too many '", "color":"white"}, {"text":"<", "color":"green"}, {"text":"' operations.", "color":"white"}]