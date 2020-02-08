# Let sign resolve memory text.
data modify block -29999994 0 8007 Text3 set value '[{"nbt":"root.Interpret.Memory.Left[]","storage":"bfi:internal"}, ", ", {"text":">", "color":"yellow"}, {"nbt":"root.Interpret.Memory.Current","storage":"bfi:internal", "color": "green"}, {"text":"<", "color":"yellow"}, {"text":", ", "color":"white"}, {"nbt":"root.Interpret.Memory.Right[]","storage":"bfi:internal"}]'
# Copy to CustomName
data modify entity @s CustomName set from block -29999994 0 8007 Text3