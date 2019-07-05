# /execute as @e[tag=node] run scoreboard players reset @s open
# /execute as @e[tag=goal] at @s run function dijkstra:point_to

# N
execute align xz positioned ~.5 ~ ~-.5 if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY = @e[limit=1,distance=0,tag=node] cost
execute align xz positioned ~.5 ~ ~-.5 unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY = @s cost
# S
execute align xz positioned ~.5 ~ ~1.5 if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY -= @e[limit=1,distance=0,tag=node] cost
execute align xz positioned ~.5 ~ ~1.5 unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorY -= @s cost
# W
execute align xz positioned ~-.5 ~ ~.5 if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX = @e[limit=1,distance=0,tag=node] cost
execute align xz positioned ~-.5 ~ ~.5 unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX = @s cost
# E
execute align xz positioned ~1.5 ~ ~.5 if entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX -= @e[limit=1,distance=0,tag=node] cost
execute align xz positioned ~1.5 ~ ~.5 unless entity @e[limit=1,distance=0,tag=node] run scoreboard players operation @s vectorX -= @s cost

scoreboard players set @s open 0

execute align xz positioned ~.5 ~ ~1.5 unless score @e[limit=1,distance=0,tag=node] open matches 0 as @e[limit=1,distance=0,tag=node] at @s run function pathfinding:point_to
execute align xz positioned ~.5 ~ ~-.5 unless score @e[limit=1,distance=0,tag=node] open matches 0 as @e[limit=1,distance=0,tag=node] at @s run function pathfinding:point_to
execute align xz positioned ~1.5 ~ ~.5 unless score @e[limit=1,distance=0,tag=node] open matches 0 as @e[limit=1,distance=0,tag=node] at @s run function pathfinding:point_to
execute align xz positioned ~-.5 ~ ~.5 unless score @e[limit=1,distance=0,tag=node] open matches 0 as @e[limit=1,distance=0,tag=node] at @s run function pathfinding:point_to
