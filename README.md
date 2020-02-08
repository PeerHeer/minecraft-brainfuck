# minecraft-brainfuck
Brainfuck interpreter for Minecraft 1.15.2.

## How to use
The `Program` field in the `bfi:in` storage stores a Brainfuck program inside a list of single characters.
Any invalid characters or strings will be ignored.  
The `Args` field in the `bfi:in` storage contains the arguments to be passed to the Brainfuck program. This must
be a list of characters as well.  
Start the process by calling the `bfi:read/main` function and make sure that the executing entity is a player.

Example:
```mcfunction
data modify storage bfi:in Program set value ['+', '>', ',', '>', ',']
data modify storage bfi:in Args set value ['1', '2', '3']
execute as @a run function bfi:read/main
```

To stop the current process, run the `bfi:stop` function. To reset all scores and storage, use the `bfi:reset` function.

## Behavior
This interpreter gives the program an 'infinite' tape to the **right**, which means that too many `<` operations will lead to an error. Because dynamic list operations in Minecraft take a lot of resources, the tape is increased by a constant value if needed.  
Memory values range from `0`-`255` and can be overflowed: using `-` on a cell with value `0` will overflow to `255`. Vice versa, using `+` on a cell with value `255` will set the value to `0`.  
Input can be parsed from any unicode character ranging from `32`-`127` and `161`-`255`. Any other characters will be ignored. Similarly, the program can contain any character but only the 8 Brainfuck operations will be parsed.

## Configuration
The user can configure how many iterations per tick should be used for parsing the program, input and interpreting the program. The config file is located in `bfi.config/functions/config.mcfunction`.
