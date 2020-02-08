# Set error flag.
scoreboard players set $bfi.exit_code bfi.var 1

# Send a tellraw error message.
tellraw @a[tag=bfi.log] [{"text":"[Error]", "color":"red"}, {"text":" Args must be a list of strings.", "color":"white"}]