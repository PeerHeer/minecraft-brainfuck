# Loop over input characters and convert to byte values.

# Get character.
data modify storage bfi:temp root.ArgCurrent set from storage bfi:internal root.Input.Args[-1]
data remove storage bfi:internal root.Input.Args[-1]

# Copy character list.
data modify storage bfi:temp root.Characters set from storage bfi:internal root.Characters

# Get byte value
function bfi:read/parse/args/get_byte/32

# Append to list.
execute if score #bfi.parse.args.ascii_val bfi.var matches 0.. run function bfi:read/parse/args/append_to_list

# Increment index
scoreboard players add #bfi.read.parse.index bfi.var 1

# Add 1 to the current count.
scoreboard players add #bfi.parse.args.count.current bfi.var 1

# Recrusive call
execute if score #bfi.parse.args.count.current bfi.var = #bfi.parse.args.count.max bfi.const if score $bfi.exit_code bfi.var matches 0 if score #bfi.read.parse.index bfi.var < #bfi.read.parse.length bfi.var run schedule function bfi:read/parse/args/schedule_function 1t
execute unless score #bfi.parse.args.count.current bfi.var = #bfi.parse.args.count.max bfi.const if score $bfi.exit_code bfi.var matches 0 if score #bfi.read.parse.index bfi.var < #bfi.read.parse.length bfi.var run function bfi:read/parse/args/loop
