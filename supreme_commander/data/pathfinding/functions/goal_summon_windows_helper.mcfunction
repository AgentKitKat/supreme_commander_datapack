##
# goal_summon_windows_helper.mcfunction
# Author: Michael Kerr
# Summary: moves a goal if it is inside of a block
##

# if there isn't a block, place a portal 
execute as @s[tag=!placed_portal] if block ~ ~ ~ air if block ^1 ^ ^ air unless entity @e[tag=goal,distance=0] run summon minecraft:armor_stand ~ ~ ~ {Tags:["goal"]}
execute as @s[tag=!placed_portal] if block ~ ~ ~ air if block ^1 ^ ^ air positioned ^1 ^ ^ unless entity @e[tag=goal,distance=0] run summon minecraft:armor_stand ^ ^ ^ {Tags:["goal","next_quad"]}
execute as @s[tag=!placed_portal] if block ~ ~ ~ air if block ^1 ^ ^ air run tag @s add placed_portal

# else, allow the helper to place another portal
execute unless block ~ ~ ~ air run tag @s remove placed_portal

# move the helper forward and increment the counter by 1
tp ^ ^ ^1
scoreboard players add @s counter 1

# keep moving forward until the helper reaches the 10th block
execute at @s if score @s counter matches ..8 run function pathfinding:goal_summon_windows_helper

# once the helper has finished moving, reset
scoreboard players reset @s counter
tag @s remove placed_portal
