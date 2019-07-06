##
# node_cost.mcfunction
# Author: Micheal Kerr
# Summary: updates the cost of nodes from the goal
##
tag @e[tag=cur] remove cur
tag @e[tag=lowest_cost] remove lowest_cost

# can't adjust value again during recursion
tag @s add cur
scoreboard players set @e[tag=cur] open 0

# north
execute as @e[tag=cur] at @s positioned ~ ~ ~-1 unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_cost_change
# south
execute as @e[tag=cur] at @s positioned ~ ~ ~1 unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_cost_change
# east
execute as @e[tag=cur] at @s positioned ~1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_cost_change
# west
execute as @e[tag=cur] at @s positioned ~-1 ~ ~ unless score @e[tag=node,distance=0,limit=1] open matches 0 unless score @e[tag=node,distance=0,limit=1] cost matches 1.. run function pathfinding:node_cost_change

tag @s add lowest_cost

# else, recurse
execute as @e[tag=node,scores={open=1}] if score @s cost < @e[tag=lowest_cost,limit=1] cost run function pathfinding:node_cost_lowest
execute if entity @e[tag=node,scores={open=1}] as @e[tag=lowest_cost] at @s as @e[scores={open=1},tag=node,sort=nearest,limit=1] run function pathfinding:node_cost

# once done, calculate vectors
scoreboard players set @e[tag=node] open 1
execute as @e[tag=node,scores={open=1}] at @s run function pathfinding:node_vectors

function pathfinding:lol
