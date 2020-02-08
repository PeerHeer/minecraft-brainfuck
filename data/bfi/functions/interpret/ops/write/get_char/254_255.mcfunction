execute if score $bfi.memory.value bfi.var matches 254 run data modify block -29999994 0 8007 Text1 set value '{"text":"\\u00fe"}'
execute if score $bfi.memory.value bfi.var matches 255 run data modify block -29999994 0 8007 Text1 set value '{"text":"\\u00ff"}'
