# Set current count to 0.
scoreboard players set #bfi.interpret.count.current bfi.var 0

# Execute the loop.
function bfi:interpret/loop

# Visualize the output.
execute as @e[tag=bfi.output] run data modify entity @s CustomName set from block -29999994 0 8007 Text2

# Visualize memory.
execute as @e[tag=bfi.memory] run function bfi:interpret/vizualize_memory

# If finished, run the stop function.
execute if score $bfi.exit_code bfi.var matches 0 if score $bfi.program.ptr bfi.var = $bfi.program.length bfi.var run function bfi:interpret/stop
# If errored, stop as well.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop