##
# loop.mcfunction
# Author: Micheal Kerr
# Summary: selects a goal location where the player is looking when the item is right clicked
# and recalculates the flowfield
# Init: /give @s minecraft:stick{move_goal:1b}
##

#kill @e[type=armor_stand]

# give player carrot on a stick if they are holding the stick (init)
execute as @a[nbt=!{Inventory:[{Slot: -106b, id: "minecraft:carrot_on_a_stick"}]}] run clear @s minecraft:carrot_on_a_stick
execute as @a[nbt={SelectedItem:{tag:{move_goal:1b}}}] run replaceitem entity @s weapon.offhand minecraft:carrot_on_a_stick
execute as @a[nbt=!{SelectedItem:{tag:{move_goal:1b}}}] run replaceitem entity @s weapon.offhand minecraft:air

# reset/summon final goal
execute as @e[scores={action=1..}] run kill @e[tag=goal]
execute as @e[scores={action=1..}] at @s positioned ~ ~1.5 ~ run function pathfinding:goal_summon_final

# if the unit is in a different quad than the goal, then find portals to the goal
execute if entity @e[scores={action=1..}] as @e[tag=unit] store result score @s chunkPosX run data get entity @s Pos[0]
execute if entity @e[scores={action=1..}] as @e[tag=unit] run scoreboard players operation @s chunkPosX /= 10 constants
execute if entity @e[scores={action=1..}] as @e[tag=unit] store result score @s chunkPosY run data get entity @s Pos[2]
execute if entity @e[scores={action=1..}] as @e[tag=unit] run scoreboard players operation @s chunkPosY /= 10 constants
execute if entity @e[scores={action=1..}] as @e[tag=goal] store result score @s chunkPosX run data get entity @s Pos[0]
execute if entity @e[scores={action=1..}] as @e[tag=goal] run scoreboard players operation @s chunkPosX /= 10 constants
execute if entity @e[scores={action=1..}] as @e[tag=goal] store result score @s chunkPosY run data get entity @s Pos[2]
execute if entity @e[scores={action=1..}] as @e[tag=goal] run scoreboard players operation @s chunkPosY /= 10 constants
execute if entity @e[scores={action=1..}] as @e[tag=goal] at @s unless score @s chunkPosX = @e[tag=unit,limit=1] chunkPosX run tag @s add recurse
execute if entity @e[scores={action=1..}] as @e[tag=goal] at @s unless score @s chunkPosY = @e[tag=unit,limit=1] chunkPosY run tag @s add recurse
execute if entity @e[scores={action=1..}] as @e[tag=goal,tag=recurse] at @s run function pathfinding:goal_summon_windows

# reset and update nodes
execute if entity @e[scores={action=1..}] run kill @e[tag=node]
execute if entity @e[scores={action=1..}] run function pathfinding:node_summon_helper
execute if entity @e[scores={action=1..}] run function pathfinding:node_vectors_helper
#execute if entity @e[scores={action=1..}] as @e[tag=node] run scoreboard players reset @s open
#execute if entity @e[scores={action=1..}] if entity @e[tag=unit,tag=!has_los] as @e[tag=unit] at @s as @e[tag=node,sort=nearest,limit=1] run function dijkstra.point_to


# if unit has los to the second closest target, kill closest target
#execute as @e[tag=unit,limit=1] at @s as @e[tag=goal,sort=nearest,limit=1] at @s as @e[tag=goal,sort=nearest,distance=.1..,limit=1] at @s positioned ~ ~.5 ~ facing entity @e[tag=unit,limit=1] eyes run function pathfinding:los_to_unit
#execute if entity @e[tag=goal,tag=los_to_unit] as @e[tag=unit,limit=1] at @s as @e[tag=goal,sort=nearest,limit=1] run kill @s

# if unit has los to any target, kill nodes and move to current target
#execute as @e[tag=unit] at @s positioned ~ ~1.5 ~ facing entity @e[tag=goal] eyes run function dijkstra:has_los
#execute if entity @e[tag=unit,tag=has_los] run kill @e[tag=node]
#execute as @e[tag=unit] at @s unless entity @e[tag=goal,distance=..1] if entity @e[tag=unit,tag=has_los] facing entity @e[tag=goal] feet run tp ^ ^ ^.1

# kill goal if reached
#execute as @e[tag=unit] at @s if entity @e[tag=goal,limit=1,sort=nearest,distance=..2.5] run kill @e[tag=goal,limit=1,sort=nearest,distance=..2.5]

# reset scores and tags
execute as @e[scores={action=1..}] run scoreboard players set @s action 0
