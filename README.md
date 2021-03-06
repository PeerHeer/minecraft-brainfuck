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

## Configuration
The user can configure how many iterations per tick should be used for parsing the program, input and interpreting the program. The config file is located in `bfi.config/functions/config.mcfunction`.

## Visualization
The interpretation process can be visualized using entities. An entity with the `bfi.output` tag will have the output in its `CustomName`. An entity with the `bfi.memory` tag will have the memory array in its `CustomName`. The former can be summoned using the `bfi:summon/output` function, the latter using the `bfi:summon/memory` function.

For an example visualization, see [this video](https://youtu.be/ZRzMbK8oEK8).

To reduce the interpretation speed and make the program easier to visualize, you can reduce the amount of iterations per tick in the config file by decreasing the `#bfi.interpret.count.max bfi.const` score.

## Behavior
This datapack first parses the program, then the arguments and then interprets the program. If at any stage an error occurs, the process is stopped. This can be done manually by using the `bfi:stop` function.

This interpreter gives the program an 'infinite' tape to the **right**, which means that too many `<` operations will lead to an error. Because dynamic list operations in Minecraft take a lot of resources, the tape is increased by a constant value if needed.  
Memory values range from `0`-`255` and can be overflowed: using `-` on a cell with value `0` will overflow to `255`. Vice versa, using `+` on a cell with value `255` will set the value to `0`.  
Input can be parsed from any unicode character ranging from `32`-`127` and `161`-`255`. Any other characters will be ignored. Similarly, the program can contain any character but only the 8 Brainfuck operations will be parsed.
