##
# los_to_goal.mcfunction
# Author: Michael Kerr
# Summary: tags the selected entity if has los to goal
##

execute if entity @e[tag=goal,distance=..2] run tag @s add los_to_goal

execute if block ~ ~ ~ minecraft:air unless entity @e[distance=..1,tag=goal] positioned ^ ^ ^1 run function pathfinding:los_to_goal
