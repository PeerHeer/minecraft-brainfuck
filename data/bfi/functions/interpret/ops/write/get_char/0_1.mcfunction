execute if score $bfi.memory.value bfi.var matches 0 run data modify block -29999994 0 8007 Text1 set value '{"text":"\\u0000"}'
execute if score $bfi.memory.value bfi.var matches 1 run data modify block -29999994 0 8007 Text1 set value '{"text":"\\u0001"}'
