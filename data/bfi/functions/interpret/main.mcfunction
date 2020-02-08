# Start interpretation

# Notify the user.
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Input parsed successfully!", "color":"white"}]
tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Start interpreting...", "color":"white"}]

# Initialize scores
scoreboard players set $bfi.exit_code bfi.var 0
scoreboard players set $bfi.program.ptr bfi.var 0
scoreboard players set $bfi.memory.ptr bfi.var 0
scoreboard players set $bfi.memory.length bfi.var 20
execute store result score #bfi.interpret.input.length bfi.var run data get storage bfi:internal root.Args.Main
execute store result score $bfi.program.length bfi.var run data get storage bfi:internal root.Program.Main

# Initialize Program
data modify storage bfi:internal root.Interpret.Program.Current set value {}
data modify storage bfi:internal root.Interpret.Program.Left set value []
data modify storage bfi:internal root.Interpret.Program.Right set from storage bfi:internal root.Program.Main

# Initialize Args
data modify storage bfi:internal root.Interpret.Args set from storage bfi:internal root.Args.Main

# Initialize memory of 19 + 1 null bytes.
data modify storage bfi:internal root.Interpret.Memory.Current set value 0
data modify storage bfi:internal root.Interpret.Memory.Left set value []
data modify storage bfi:internal root.Interpret.Memory.Right set value [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# Set the current count to 0
scoreboard players set #bfi.interpret.count.current bfi.var 0

# Start interpretation loop
schedule function bfi:interpret/schedule_function 1t

# # Set memory
# data modify storage bfi:out Memory append from storage bfi:internal root.Interpret.Memory.Left[]
# data modify storage bfi:out Memory append from storage bfi:internal root.Interpret.Memory.Current
# data modify storage bfi:out Memory append from storage bfi:internal root.Interpret.Memory.Right[]

# # Notify the user.
# tellraw @a[tag=bfi.log] [{"text":"[NOTE]", "color":"green"}, {"text":" Exited with code ", "color":"white"}, {"score":{"name":"$bfi.error", "objective":"bfi.var"}, "color":"yellow"}, {"text":".", "color":"white"}]