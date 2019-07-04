##
# Summary: helper method for test_2.mcfunction (rename), summons armor stands
##

# summons an armor stand at the unit with a score of 1 in open
execute as @e[tag=unit] at @s align xz positioned ~.5 ~ ~.5 run summon minecraft:armor_stand ~ ~ ~ {Tags:["node"]}
execute as @e[tag=unit] at @s as @e[tag=node,limit=1,sort=nearest] run scoreboard players set @s open 1

# destroy the armor stand if it has los to the enemy, else recurse
execute as @e[tag=unit] at @s as @e[tag=node,limit=1,sort=nearest] at @s facing entity @e[tag=goal,limit=1] eyes run function dijkstra:kill_if_los
execute if entity @e[tag=node] run function dijkstra:test_2