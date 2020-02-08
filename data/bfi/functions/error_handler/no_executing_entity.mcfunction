# Set error flag.
scoreboard players set $bfi.exit_code bfi.var 1

# Send a tellraw error message.
tellraw @a [{"text":"[Error]", "color":"red"}, {"text":" Function ", "color":"white"}, {"text":"bfi:read/main", "color":"yellow"}, {"text":" must be executed as a player.", "color":"white"}]