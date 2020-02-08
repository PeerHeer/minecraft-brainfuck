# Set error flag.
scoreboard players set $bfi.exit_code bfi.var 1

# Send a tellraw error message.
tellraw @a[tag=bfi.log] ["",{"text":"[ERROR]","color":"red"},{"text":" Unbalanced brackets at index "},{"score":{"name":"#bfi.read.parse.error_index","objective":"bfi.var"},"color":"yellow"},{"text":": expected '"},{"text":"]","color":"green"},{"text":"'"}]