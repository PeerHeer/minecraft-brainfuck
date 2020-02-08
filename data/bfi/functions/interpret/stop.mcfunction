# Notify the user.
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Finished, printing output...", "color":"white"}]
# Print the output.
tellraw @a[tag=bfi.log] [{"nbt":"Text2", "block":"-29999994 0 8007", "interpret":true, "color":"white"}]

# Set memory
data modify storage bfi:out Memory append from storage bfi:internal root.Interpret.Memory.Left[]
data modify storage bfi:out Memory append from storage bfi:internal root.Interpret.Memory.Current
data modify storage bfi:out Memory append from storage bfi:internal root.Interpret.Memory.Right[]

# Stop the process
function bfi:stop