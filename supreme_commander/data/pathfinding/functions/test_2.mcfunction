##
# Summary: summons armor stands
##

# chooses a node that is open that is closest to the goal
execute as @e[tag=unit] at @s as @e[tag=node,scores={open=1},limit=1,sort=nearest] run tag @s add cur
scoreboard players set @e[tag=cur] open 0

# North
execute as @e[tag=cur] at @s align xz positioned ~.5 ~ ~-.5 unless entity @e[tag=node,limit=1,distance=0] if block ~ ~1 ~ air run summon minecraft:armor_stand ~ ~ ~ {Tags:["node","next"]}
execute as @e[tag=next] store result score @s chunkPosX run data get entity @s Pos[0]
execute as @e[tag=next] run scoreboard players operation @s chunkPosX /= 10 constants
execute as @e[tag=next] store result score @s chunkPosY run data get entity @s Pos[2]
execute as @e[tag=next] run scoreboard players operation @s chunkPosY /= 10 constants
execute unless score @e[tag=unit,limit=1] chunkPosX = @e[tag=next,limit=1] chunkPosX run kill @e[tag=next]
execute unless score @e[tag=unit,limit=1] chunkPosY = @e[tag=next,limit=1] chunkPosY run kill @e[tag=next]
scoreboard players set @e[tag=next,limit=1] open 1
tag @e[tag=next] remove next

# East
execute as @e[tag=cur] at @s align xz positioned ~1.5 ~ ~.5 unless entity @e[tag=node,limit=1,distance=0] if block ~ ~1 ~ air run summon minecraft:armor_stand ~ ~ ~ {Tags:["node","next"]}
execute as @e[tag=next] store result score @s chunkPosX run data get entity @s Pos[0]
execute as @e[tag=next] run scoreboard players operation @s chunkPosX /= 10 constants
execute as @e[tag=next] store result score @s chunkPosY run data get entity @s Pos[2]
execute as @e[tag=next] run scoreboard players operation @s chunkPosY /= 10 constants
execute unless score @e[tag=unit,limit=1] chunkPosX = @e[tag=next,limit=1] chunkPosX run kill @e[tag=next]
execute unless score @e[tag=unit,limit=1] chunkPosY = @e[tag=next,limit=1] chunkPosY run kill @e[tag=next]
scoreboard players set @e[tag=next,limit=1] open 1
tag @e[tag=next] remove next

# South
execute as @e[tag=cur] at @s align xz positioned ~.5 ~ ~1.5 unless entity @e[tag=node,limit=1,distance=0] if block ~ ~1 ~ air run summon minecraft:armor_stand ~ ~ ~ {Tags:["node","next"]}
execute as @e[tag=next] store result score @s chunkPosX run data get entity @s Pos[0]
execute as @e[tag=next] run scoreboard players operation @s chunkPosX /= 10 constants
execute as @e[tag=next] store result score @s chunkPosY run data get entity @s Pos[2]
execute as @e[tag=next] run scoreboard players operation @s chunkPosY /= 10 constants
execute unless score @e[tag=unit,limit=1] chunkPosX = @e[tag=next,limit=1] chunkPosX run kill @e[tag=next]
execute unless score @e[tag=unit,limit=1] chunkPosY = @e[tag=next,limit=1] chunkPosY run kill @e[tag=next]
scoreboard players set @e[tag=next,limit=1] open 1
tag @e[tag=next] remove next

# West
execute as @e[tag=cur] at @s align xz positioned ~-.5 ~ ~.5 unless entity @e[tag=node,limit=1,distance=0] if block ~ ~1 ~ air run summon minecraft:armor_stand ~ ~ ~ {Tags:["node","next"]}
execute as @e[tag=next] store result score @s chunkPosX run data get entity @s Pos[0]
execute as @e[tag=next] run scoreboard players operation @s chunkPosX /= 10 constants
execute as @e[tag=next] store result score @s chunkPosY run data get entity @s Pos[2]
execute as @e[tag=next] run scoreboard players operation @s chunkPosY /= 10 constants
execute unless score @e[tag=unit,limit=1] chunkPosX = @e[tag=next,limit=1] chunkPosX run kill @e[tag=next]
execute unless score @e[tag=unit,limit=1] chunkPosY = @e[tag=next,limit=1] chunkPosY run kill @e[tag=next]
scoreboard players set @e[tag=next,limit=1] open 1
tag @e[tag=next] remove next

execute if entity @e[tag=node,scores={open=1}] run function dijkstra:test_2