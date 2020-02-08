# If stack is not empty, brackets are unbalanced.
execute if data storage bfi:internal root.Program.Stack[0] run function bfi:error_handler/unbalanced_brackets_right

# If an error occured, stop the process.
execute if score $bfi.exit_code bfi.var matches 1 run function bfi:stop
# Else, continue.
execute if score $bfi.exit_code bfi.var matches 0 run function bfi:read/parse/args/main
