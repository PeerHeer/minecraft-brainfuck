# Get current instruction
data modify storage bfi:internal root.Interpret.Program.Current set from storage bfi:internal root.Interpret.Program.Right[0]
data remove storage bfi:internal root.Interpret.Program.Right[0]

# Move the current instruction to the left.
data modify storage bfi:internal root.Interpret.Program.Left append from storage bfi:internal root.Interpret.Program.Current

# Get opcode
execute store result score $bfi.opcode bfi.var run data get storage bfi:internal root.Interpret.Program.Current.OpCode

# tellraw @a[tag=bfi.log] ["[DEBUG] Current: ", {"nbt":"root.Interpret.Program.Current", "storage":"bfi:internal"}]
# tellraw @a[tag=bfi.log] ["[DEBUG] Memory: ", {"nbt":"root.Interpret.Memory.Left", "storage":"bfi:internal"}, {"nbt":"root.Interpret.Memory.Current", "storage":"bfi:internal"}, {"nbt":"root.Interpret.Memory.Right", "storage":"bfi:internal"}]

# Execute operation
execute if score $bfi.opcode bfi.var matches 0..3 run function bfi:interpret/get_op/0_3
execute if score $bfi.opcode bfi.var matches 4..7 run function bfi:interpret/get_op/4_7

# Add 1 to the instruction pointer.
scoreboard players add $bfi.program.ptr bfi.var 1

# Add 1 to the current count.
scoreboard players add #bfi.interpret.count.current bfi.var 1

# Recursive call
execute if score #bfi.interpret.count.current bfi.var = #bfi.interpret.count.max bfi.const if score $bfi.program.ptr bfi.var < $bfi.program.length bfi.var if score $bfi.exit_code bfi.var matches 0 run schedule function bfi:interpret/schedule_function 1t
execute unless score #bfi.interpret.count.current bfi.var = #bfi.interpret.count.max bfi.const if score $bfi.program.ptr bfi.var < $bfi.program.length bfi.var if score $bfi.exit_code bfi.var matches 0 run function bfi:interpret/loop
