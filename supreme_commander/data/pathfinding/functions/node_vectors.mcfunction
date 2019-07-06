##
# node_vectors.mcfunction
# Author: Micheal Kerr
# Summary: updates the cost of nodes
##
tag @e[tag=cur] remove cur
tag @e[tag=lowest_cost] remove lowest_cost

# can't adjust value again during recursion
tag @s add cur
scoreboard players set @e[tag=cur] open 0

# south
execute as @e[tag=cur] at @s positioned ~ ~ ~1 unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_vectors_adjust_cost
# north
execute as @e[tag=cur] at @s positioned ~ ~ ~-1 unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_vectors_adjust_cost
# east
execute as @e[tag=cur] at @s positioned ~1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_vectors_adjust_cost
# west
execute as @e[tag=cur] at @s positioned ~-1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_vectors_adjust_cost

tag @s add lowest_cost

# else, recurse
execute as @e[tag=node,scores={open=1}] if score @s cost < @e[tag=lowest_cost,limit=1] cost run function pathfinding:node_vectors_change_lowest
execute if entity @e[tag=node,scores={open=1}] as @e[tag=lowest_cost] at @s as @e[scores={open=1},tag=node,sort=nearest,limit=1] run function pathfinding:node_vectors

# if no more available nodes, calculate vectors (point_to)
#scoreboard players set total numOpen 0
#execute as @e[tag=node] if score @s open matches 1 run scoreboard players add total numOpen 1
#execute if score total numOpen matches 0 as @e[tag=node] run scoreboard players reset @s open
#execute if score total numOpen matches 0 as @e[tag=goal] at @s run function pathfinding:point_to
