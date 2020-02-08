# Initialize a temporary storage space.
data modify storage bfi:temp root.Program.Current set value {Start: 0, List: []}

# Copy the start value as the index.
execute store result storage bfi:temp root.Program.Current.Start int 1 run scoreboard players get #bfi.read.parse.index bfi.var

# Push to stack.
data modify storage bfi:internal root.Program.Stack append from storage bfi:temp root.Program.Current

# Add 1 to stack size.
scoreboard players add #bfi.read.parse.stack_size bfi.var 1
# Set stack_changed to 1.
scoreboard players set #bfi.read.parse.stack_changed bfi.var 1