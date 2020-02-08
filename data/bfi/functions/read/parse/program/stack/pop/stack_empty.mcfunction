# Set previous [ jump value equal to current index.
execute store result storage bfi:internal root.Program.Main[-1].Jump int 1 run scoreboard players get #bfi.read.parse.index bfi.var

# Set current ] jump value to Start.
execute store result storage bfi:internal root.Program.Current.List[-1].Jump int 1 run data get storage bfi:internal root.Program.Current.Start

# Merge with Main.
data modify storage bfi:internal root.Program.Main append from storage bfi:internal root.Program.Current.List[]