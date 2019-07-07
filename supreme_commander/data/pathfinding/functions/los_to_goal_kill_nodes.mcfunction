##
# los_to_goal_kill.mcfunction
# author: Michael Kerr
# kills armor stands that have los to the goal
##

# if goal is found, kill
execute if entity @e[tag=goal,distance=..1] run kill @e[tag=node]

# else, recurse
execute if block ~ ~ ~ minecraft:air unless entity @e[distance=..1,tag=goal] positioned ^ ^ ^1 run function pathfinding:los_to_goal_kill_nodes
