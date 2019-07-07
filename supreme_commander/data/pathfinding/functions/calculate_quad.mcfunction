##
# loop.mcfunction
# Author: Micheal Kerr
# Summary: stores the location of the entity as a 10x10 chunk
##

execute store result score @s chunkPosX run data get entity @s Pos[0]
execute run scoreboard players operation @s chunkPosX /= 10 constants
execute store result score @s chunkPosY run data get entity @s Pos[2]
execute run scoreboard players operation @s chunkPosY /= 10 constants
