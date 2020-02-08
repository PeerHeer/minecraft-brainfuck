# Store index to jump to.
execute store result score #bfi.interpret.jump_index bfi.var run data get storage bfi:internal root.Interpret.Program.Current.Jump

# Move current element to Right list.
# data modify storage bfi:internal root.Interpret.Program.Right prepend from storage bfi:internal root.Interpret.Program.Current

# tellraw @a[tag=bfi.log] ["Before Left: ", {"nbt":"root.Interpret.Program.Left", "storage":"bfi:internal"}]
# tellraw @a[tag=bfi.log] ["Before Current: ", {"nbt":"root.Interpret.Program.Current", "storage":"bfi:internal"}]
# tellraw @a[tag=bfi.log] ["Before Right: ", {"nbt":"root.Interpret.Program.Right", "storage":"bfi:internal"}]

# Start the jump loop.
function bfi:interpret/ops/jnzero/jump_loop

# Set last element to current.
# data modify storage bfi:internal root.Interpret.Program.Current set from storage bfi:internal root.Interpret.Program.Left[-1]
# data remove storage bfi:internal root.Interpret.Program.Left[-1]

# tellraw @a[tag=bfi.log] ["After Left: ", {"nbt":"root.Interpret.Program.Left", "storage":"bfi:internal"}]
# tellraw @a[tag=bfi.log] ["After Current: ", {"nbt":"root.Interpret.Program.Current", "storage":"bfi:internal"}]
# tellraw @a[tag=bfi.log] ["After Right: ", {"nbt":"root.Interpret.Program.Right", "storage":"bfi:internal"}, "\n"]