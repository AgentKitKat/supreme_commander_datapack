##
# node_vectors_helper.mcfunction
# Author: Micheal Kerr
# Summary: helper function for node_vectors.mcfunction; updates the cost of nodes
##

# reset scores
execute as @e[tag=node] run scoreboard players reset @s open
execute as @e[tag=node] run scoreboard players set @s cost 0

# choose the node at the closest goal and save it for later
execute as @e[tag=goal] at @s as @e[tag=node,distance=...1] run tag @s add start
execute as @e[tag=start] at @s run function pathfinding:node_vectors
