# Set current count to 0.
scoreboard players set #bfi.interpret.count.current bfi.var 0

# Execute the loop.
function bfi:interpret/loop

# If finished, run the stop function.
execute if score $bfi.exit_code bfi.var matches 0 if score $bfi.program.ptr bfi.var = $bfi.program.length bfi.var run function bfi:interpret/stop
# If errored, stop as well.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop