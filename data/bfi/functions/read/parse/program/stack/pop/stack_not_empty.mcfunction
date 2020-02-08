# Get top stack element.
data modify storage bfi:temp root.Program.StackCurrent set from storage bfi:internal root.Program.Stack[-1]

# Set previous [ jump value equal to current index.
execute store result storage bfi:temp root.Program.StackCurrent.List[-1].Jump int 1 run scoreboard players get #bfi.read.parse.index bfi.var

# Set current ] jump to start value.
execute store result storage bfi:internal root.Program.Current.List[-1].Jump int 1 run data get storage bfi:internal root.Program.Current.Start

# Merge lists
data modify storage bfi:temp root.Program.StackCurrent.List append from storage bfi:internal root.Program.Current.List[]

# Copy back to stack
data modify storage bfi:internal root.Program.Stack[-1] set from storage bfi:temp root.Program.StackCurrent