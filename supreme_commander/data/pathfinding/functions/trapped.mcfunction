##
# trapped.mcfunction
# Author: Michael Kerr
# Summary: moves a goal if it is inside of a block
## 

execute if score @s chunkPosY > @e[tag=goal2,limit=1] chunkPosY run tp @s ~-1 ~ ~
execute if score @s chunkPosY < @e[tag=goal2,limit=1] chunkPosY run tp @s ~ ~ ~1
#execute unless block ~ ~ ~ air run function dijkstra:trapped