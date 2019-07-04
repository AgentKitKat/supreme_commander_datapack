##
# los_true.mcfunction
# Author: Michael Kerr
# Summary: tags the selected entity if has los to goal
##

execute if entity @e[tag=goal,distance=..2] run tag @s add has_los

execute if block ~ ~ ~ minecraft:air unless entity @e[distance=..1,tag=goal] positioned ^ ^ ^1 run function dijkstra:has_los
