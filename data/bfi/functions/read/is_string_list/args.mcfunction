# Check if Args is a list of strings.
execute store result score #bfi.read.is_char_list.args bfi.var run data modify storage bfi:internal root.Input.Args append value ""
# If not, run a tellraw message to notify the user.
execute if score #bfi.read.is_char_list.args bfi.var matches 0 run function bfi:error_handler/args_not_list_of_strings
# Else, remove the appended string.
execute if score #bfi.read.is_char_list.args bfi.var matches 1 run data remove storage bfi:internal root.Input.Args[-1]