# Append character value to list.
data modify storage bfi:internal root.Args.Main append value 0
execute store result storage bfi:internal root.Args.Main[-1] int 1 run scoreboard players get #bfi.parse.args.ascii_val bfi.var