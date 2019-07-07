##
# node_facing.mcfunction
# Author: Micheal Kerr
# Summary: turns the node in the direction indicated by it's vectorX and vectorY scores
##
execute as @e[tag=node] at @s run tp @s ~ ~ ~ facing entity ATLtimber

#calculate the location that the node should be facing
execute store result score @s posX run data get entity @s Pos[0] 1
execute store result score @s posY run data get entity @s Pos[2] 1
scoreboard players operation @s posX += @s vectorX
scoreboard players operation @s posY += @s vectorY

# summon a temp armor stand at the new location
summon armor_stand ~ ~ ~ {Tags:["facing"]}
execute store result entity @e[tag=facing,limit=1] Pos[0] double 1 run scoreboard players get @s posX
execute store result entity @e[tag=facing,limit=1] Pos[2] double 1 run scoreboard players get @s posY
execute as @e[tag=facing] at @s align xz run tp ~.5 ~ ~.5

# face and remove the temp armor stand
execute facing entity @e[tag=facing,limit=1] feet run tp ~ ~ ~
kill @e[tag=facing]
