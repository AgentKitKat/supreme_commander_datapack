##
# trapped.mcfunction
# Author: Michael Kerr
# Summary: moves a goal if it is inside of a block
## 

execute as @s[tag=!placed_portal] if block ~ ~ ~ air if block ^1 ^ ^ air unless entity @e[tag=goal,distance=0] run summon minecraft:armor_stand ~ ~ ~ {Tags:["goal"]}
execute as @s[tag=!placed_portal] if block ~ ~ ~ air if block ^1 ^ ^ air positioned ^1 ^ ^ unless entity @e[tag=goal,distance=0] run summon minecraft:armor_stand ^ ^ ^ {Tags:["goal","next_quad"]}
execute as @s[tag=!placed_portal] if block ~ ~ ~ air if block ^1 ^ ^ air run tag @s add placed_portal

execute unless block ~ ~ ~ air run tag @s remove placed_portal

tp ^ ^ ^1

scoreboard players add @s trapped 1

execute at @s if score @s trapped matches ..8 run function dijkstra:trapped_final

tag @s remove placed_portal