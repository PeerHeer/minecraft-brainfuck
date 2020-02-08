# Iterate over the Program list.
#define storage bfi:temp Temporary storage.

# Set current element to last element in Program list.
data modify storage bfi:internal root.Parse.Current set from storage bfi:internal root.Input.Program[0]
data remove storage bfi:internal root.Input.Program[0]

# Copy operators from internal to temp.
data modify storage bfi:temp root.Operators set from storage bfi:internal root.Operators

# Get the used operator, starting at ADD.
function bfi:read/parse/program/get_op/add

# If an operator was found, add it to the new Program list.
execute unless score #bfi.read.parse.opcode bfi.var matches -1 run function bfi:read/parse/program/add_op/add_operator

# Add to index if opcode is not -1.
execute unless score #bfi.read.parse.opcode bfi.var matches -1 run scoreboard players add #bfi.read.parse.index bfi.var 1

# Remove 1 from length if opcode is -1.
execute if score #bfi.read.parse.opcode bfi.var matches -1 run scoreboard players remove #bfi.read.parse.length bfi.var 1

# Add to error_index.
scoreboard players add #bfi.read.parse.error_index bfi.var 1

# Add 1 to the current count.
scoreboard players add #bfi.parse.program.count.current bfi.var 1

# Recursive call as long as index < length.
execute if score #bfi.parse.program.count.current bfi.var = #bfi.parse.program.count.max bfi.const if score $bfi.exit_code bfi.var matches 0 if score #bfi.read.parse.index bfi.var < #bfi.read.parse.length bfi.var run schedule function bfi:read/parse/program/schedule_function 1t
execute unless score #bfi.parse.program.count.current bfi.var = #bfi.parse.program.count.max bfi.const if score $bfi.exit_code bfi.var matches 0 if score #bfi.read.parse.index bfi.var < #bfi.read.parse.length bfi.var run function bfi:read/parse/program/loop
