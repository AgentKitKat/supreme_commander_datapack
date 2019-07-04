##
# Helper function for start_2.mcfunction, updates the cost of nodes
# init: function dijkstra:start
##

# reset scores
execute as @e[tag=node] run scoreboard players reset @s open
execute as @e[tag=node] run scoreboard players set @s cost 0

execute as @e[tag=goal] at @s as @e[tag=node,distance=...1] run tag @s add start
execute as @e[tag=start] at @s run function dijkstra:start_2
