# Stop current process
function bfi:stop

# Remove storage
data remove storage bfi:internal root
data remove storage bfi:temp root
data remove storage bfi:in Program
data remove storage bfi:in Args

# Reset scores
scoreboard players reset * bfi.var
scoreboard players reset * bfi.const

# Load
function bfi:load