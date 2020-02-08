# Forceload chunk in all dimensions.
execute in minecraft:overworld run forceload add -30000000 8000
execute in minecraft:the_nether run forceload add -30000000 8000
execute in minecraft:the_end run forceload add -30000000 8000

# Setblock the sign.
execute in minecraft:overworld unless block -29999994 0 8007 minecraft:oak_wall_sign run setblock -29999994 0 8007 minecraft:oak_wall_sign
execute in minecraft:the_nether unless block -29999994 0 8007 minecraft:oak_wall_sign run setblock -29999994 0 8007 minecraft:oak_wall_sign
execute in minecraft:the_end unless block -29999994 0 8007 minecraft:oak_wall_sign run setblock -29999994 0 8007 minecraft:oak_wall_sign