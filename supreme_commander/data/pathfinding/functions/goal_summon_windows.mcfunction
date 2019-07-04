##
# goal_summon_windows.mcfunction
# Author: Michael Kerr
# Summary: moves a helper armor stand in a square along the borders of the 10x10 chunk that the parent goal is located in; summons child goals
##
tag @s remove goal2
tag @s remove recurse

# summon a helper armor stand
execute align xz run summon minecraft:armor_stand ~ ~ ~ {Tags:["goal2"]}
execute store result entity @e[tag=goal2,limit=1] Pos[0] double 10 run scoreboard players get @s chunkPosX
execute store result entity @e[tag=goal2,limit=1] Pos[2] double 10 run scoreboard players get @s chunkPosY

# teleport the helper along each line of the 10x10 chunk; summons child goals at each window
execute as @e[tag=goal2] at @s facing ~1 ~ ~ run tp ~.5 ~ ~.5
execute as @e[tag=goal2] run scoreboard players set @s trapped 0
execute as @e[tag=goal2] at @s run function dijkstra:trapped_final
execute as @e[tag=goal2] at @s facing ^-1 ^ ^ run tp ~ ~ ~
execute as @e[tag=goal2] run scoreboard players set @s trapped 0
execute as @e[tag=goal2] at @s run function dijkstra:trapped_final
execute as @e[tag=goal2] at @s facing ^-1 ^ ^ run tp ~ ~ ~
execute as @e[tag=goal2] run scoreboard players set @s trapped 0
execute as @e[tag=goal2] at @s run function dijkstra:trapped_final
execute as @e[tag=goal2] at @s facing ^-1 ^ ^ run tp ~ ~ ~
execute as @e[tag=goal2] run scoreboard players set @s trapped 0
execute as @e[tag=goal2] at @s run function dijkstra:trapped_final

# removes the helper armor stand; selects the next closest goal to the unit
kill @e[tag=goal2]
execute as @e[tag=unit] at @s run tag @e[tag=next_quad,sort=nearest,limit=1] add goal2
tag @e[tag=next_quad] remove next_quad

# recurse unless the next goal is in the same chunk as the unit
execute as @e[tag=unit] store result score @s chunkPosX run data get entity @s Pos[0]
execute as @e[tag=unit] run scoreboard players operation @s chunkPosX /= 10 constants
execute as @e[tag=unit] store result score @s chunkPosY run data get entity @s Pos[2]
execute as @e[tag=unit] run scoreboard players operation @s chunkPosY /= 10 constants
execute as @e[tag=goal2] store result score @s chunkPosX run data get entity @s Pos[0]
execute as @e[tag=goal2] run scoreboard players operation @s chunkPosX /= 10 constants
execute as @e[tag=goal2] store result score @s chunkPosY run data get entity @s Pos[2]
execute as @e[tag=goal2] run scoreboard players operation @s chunkPosY /= 10 constants
execute as @e[tag=goal2] at @s unless score @s chunkPosX = @e[tag=unit,limit=1] chunkPosX run tag @s add recurse
execute as @e[tag=goal2] at @s unless score @s chunkPosY = @e[tag=unit,limit=1] chunkPosY run tag @s add recurse
execute as @e[tag=goal2,tag=recurse] at @s run function dijkstra:path_to_quad_new
