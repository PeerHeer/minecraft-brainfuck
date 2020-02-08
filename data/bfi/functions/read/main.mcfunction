#define storage bfi:internal Internal storage.
#define storage bfi:in Input storage.
#define storage bfi:out Output storage.

# Reset error score.
scoreboard players set $bfi.exit_code bfi.var 0

# Clear output.
data modify storage bfi:out Memory set value []
data modify storage bfi:out Output set value []

# Check if @s exists.
tag @s[type=player] add bfi.log

# Check if a process is already running.
execute if score #bfi.busy bfi.var matches 1 run function bfi:error_handler/already_busy

# Check if Program is a list of strings.
function bfi:read/is_string_list/program

# Check if Args is a list of strings.
function bfi:read/is_string_list/args

# If no error was encountered, continue.
execute if score $bfi.exit_code bfi.var matches 0 unless score #bfi.busy bfi.var matches 1 run schedule function bfi:read/parse/program/main 1t