##
# los_to_unit.mcfunction
# Author: Micheal Kerr
# Summary: tests if the entity has los to the current unit that is pathfinding
##

execute if entity @e[tag=unit,distance=..2] run tag @s add has_los

execute if block ~ ~ ~ minecraft:air unless entity @e[distance=..1,tag=unit] positioned ^ ^ ^1 run function dijkstra:los_to_unit