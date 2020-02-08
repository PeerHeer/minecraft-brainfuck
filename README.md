# minecraft-brainfuck
Brainfuck interpreter in Minecraft

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
