# If an error occured, stop the process.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop
# Else, continue.
execute if score $bfi.exit_code bfi.var matches 0 run schedule function bfi:interpret/main 1t
