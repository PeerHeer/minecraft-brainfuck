# If the current pointer points to cell 0, throw error.
execute if score $bfi.memory.ptr bfi.var matches 0 run function bfi:error_handler/invalid_left_op
# Else, move to the left.
execute if score $bfi.memory.ptr bfi.var matches 1.. run function bfi:interpret/ops/left/move_left