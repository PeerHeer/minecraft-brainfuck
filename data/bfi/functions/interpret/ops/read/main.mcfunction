# If the input is empty, throw error.
execute if score #bfi.interpret.input.length bfi.var matches 0 run function bfi:error_handler/invalid_read_op
# Else, read from input.
execute if score #bfi.interpret.input.length bfi.var matches 1.. run function bfi:interpret/ops/read/read_input