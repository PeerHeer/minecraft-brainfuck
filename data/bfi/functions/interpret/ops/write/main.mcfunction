# Get current memory
execute store result score $bfi.memory.value bfi.var run data get storage bfi:internal root.Interpret.Memory.Current

# Put character in Text1 of the sign
function bfi:interpret/ops/write/get_char/0_255

# Concatenate Text1 and Text2 of the sign
data modify block -29999994 0 8007 Text2 set value '[{"nbt":"Text2", "block":"~ ~ ~", "interpret":true}, {"nbt":"Text1", "block":"~ ~ ~", "interpret":true}]'

# Output to chat
# tellraw @a[tag=bfi.log] [{"text":"[OUT] ", "color":"yellow"}, {"nbt":"Text2", "block":"-29999994 0 8007", "interpret":true, "color":"white"}]