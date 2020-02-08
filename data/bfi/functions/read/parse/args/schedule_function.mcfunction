# Set current count to 0.
scoreboard players set #bfi.parse.args.count.current bfi.var 0

# Execute the loop.
function bfi:read/parse/args/loop

# If finished, run the stop function.
execute if score $bfi.exit_code bfi.var matches 0 if score #bfi.read.parse.index bfi.var = #bfi.read.parse.length bfi.var run function bfi:read/parse/args/stop
# If errored, stop as well.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop