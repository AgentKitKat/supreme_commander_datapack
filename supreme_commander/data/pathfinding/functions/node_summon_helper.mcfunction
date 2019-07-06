##
# node_summon_helper.mcfunction
# Author: Micheal Kerr
# Summary: helper function for node_summon.mcfunction; summons nodes
##

# summons an open armor stand at the unit
execute as @e[tag=unit] at @s align xz positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~ ~ ~ {Tags:["node"]}
execute as @e[tag=unit] at @s as @e[tag=node,limit=1,sort=nearest] run scoreboard players set @s open 1

# destroy the armor stand if it has los to the enemy, else continue
execute as @e[tag=unit] at @s as @e[tag=node,limit=1,sort=nearest] at @s facing entity @e[tag=goal,sort=nearest,limit=1] eyes run function pathfinding:los_to_goal_kill
execute if entity @e[tag=node] run function pathfinding:node_summon
