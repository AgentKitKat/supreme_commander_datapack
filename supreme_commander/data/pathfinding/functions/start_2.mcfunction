##
# Summary: updates the cost of nodes
##

run say hi

# can't adjust value again during recursion
tag @s add cur
scoreboard players set @e[tag=cur] open 0

# south
execute as @e[tag=cur] at @s positioned ~ ~ ~1 unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players operation @e[tag=node,distance=0,limit=1] cost = @s cost 
execute as @e[tag=cur] at @s positioned ~ ~ ~1 unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players add @e[tag=node,distance=0,limit=1] cost 1 
execute as @e[tag=cur] at @s positioned ~ ~ ~1 unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players set @e[tag=node,distance=0,limit=1] open 1 

# north
execute as @e[tag=cur] at @s positioned ~ ~ ~-1 unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players operation @e[tag=node,distance=0,limit=1] cost = @s cost 
execute as @e[tag=cur] at @s positioned ~ ~ ~-1 unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players add @e[tag=node,distance=0,limit=1] cost 1 
execute as @e[tag=cur] at @s positioned ~ ~ ~-1 unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players set @e[tag=node,distance=0,limit=1] open 1 

# east
execute as @e[tag=cur] at @s positioned ~1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players operation @e[tag=node,distance=0,limit=1] cost = @s cost 
execute as @e[tag=cur] at @s positioned ~1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players add @e[tag=node,distance=0,limit=1] cost 1 
execute as @e[tag=cur] at @s positioned ~1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players set @e[tag=node,distance=0,limit=1] open 1 

# west
execute as @e[tag=cur] at @s positioned ~-1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players operation @e[tag=node,distance=0,limit=1] cost = @s cost 
execute as @e[tag=cur] at @s positioned ~-1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players add @e[tag=node,distance=0,limit=1] cost 1 
execute as @e[tag=cur] at @s positioned ~-1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0.. run scoreboard players set @e[tag=node,distance=0,limit=1] open 1 

tag @e[tag=cur] remove cur

# if no more available nodes, calculate vectors (point_to)
scoreboard players set total numOpen 0
execute as @e[tag=node] if score @s open matches 1 run scoreboard players add total numOpen 1
execute if score total numOpen matches 0 as @e[tag=node] run scoreboard players reset @s open
execute if score total numOpen matches 0 as @e[tag=goal] at @s run function dijkstra:point_to

# else, recurse
execute as @e[tag=start] at @s as @e[tag=node,scores={open=1},limit=1,sort=nearest] at @s run function dijkstra:start_2


