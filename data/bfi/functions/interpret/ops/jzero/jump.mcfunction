# Store index to jump to.
execute store result score #bfi.interpret.jump_index bfi.var run data get storage bfi:internal root.Interpret.Program.Current.Jump

# Move current element to Left list.
# data modify storage bfi:internal root.Interpret.Program.Left append from storage bfi:internal root.Interpret.Program.Current

# Start the jump loop.
function bfi:interpret/ops/jzero/jump_loop