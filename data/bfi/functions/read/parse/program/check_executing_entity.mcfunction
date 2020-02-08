# If there are no players to log to, abort.
execute unless entity @a[tag=bfi.log] run function bfi:error_handler/no_executing_entity

# If no error occured, start parsing.
execute if score $bfi.exit_code bfi.var matches 0 run schedule function bfi:read/parse/program/main 1t
# If error occured, stop.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop