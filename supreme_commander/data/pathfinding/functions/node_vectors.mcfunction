##
# node_vectors.mcfunction
# Author: Micheal Kerr
# Summary: calculates the direction that the node field pushes units
##
scoreboard players set @s open 0

# N
execute positioned ~ ~ ~-1 if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY = @e[limit=1,distance=0,tag=node] cost
execute positioned ~ ~ ~-1 unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY = @s cost
# S
execute positioned ~ ~ ~1 if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY -= @e[limit=1,distance=0,tag=node] cost
execute positioned ~ ~ ~1 unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY -= @s cost
# W
execute positioned ~-1 ~ ~ if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX = @e[limit=1,distance=0,tag=node] cost
execute positioned ~-1 ~ ~ unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX = @s cost
# E
execute positioned ~1 ~ ~ if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX -= @e[limit=1,distance=0,tag=node] cost
execute positioned ~1 ~ ~ unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX -= @s cost
