##
# goal_summon_final.mcfunction
# Author: Michael Kerr
# Summary: summons a goal object where called entity is looking
##

# if block is found, create object
execute unless block ~ ~ ~ air align xyz positioned ~.5 ~1 ~.5 run summon minecraft:armor_stand ~ ~ ~ {Tags:["goal","final"]}
execute unless block ~ ~ ~ air run kill @e[type=item]

# else, recurse
execute if block ~ ~ ~ minecraft:air unless entity @e[distance=...75,type=armor_stand] positioned ^ ^ ^1 run function dijkstra:raycast
