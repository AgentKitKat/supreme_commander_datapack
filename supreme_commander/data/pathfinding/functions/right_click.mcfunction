##
# loop.mcfunction
# Author: Micheal Kerr
# Summary: selects a goal location where the player is looking when the item is right clicked
# and recalculates the flowfield
##

# reset/summon final goal
kill @e[tag=goal]
execute at @s positioned ~ ~1.5 ~ run function pathfinding:goal_summon_final

# if the unit is in a different quad than the goal, then find portals to the goal
execute as @e[tag=unit] run function pathfinding:calculate_quad
execute as @e[tag=goal] run function pathfinding:calculate_quad
execute as @e[tag=goal] at @s unless score @s chunkPosX = @e[tag=unit,limit=1] chunkPosX run tag @s add recurse
execute as @e[tag=goal] at @s unless score @s chunkPosY = @e[tag=unit,limit=1] chunkPosY run tag @s add recurse
execute as @e[tag=goal,tag=recurse] at @s run function pathfinding:goal_summon_windows

# reset and update nodes
function pathfinding:node_summon_helper
function pathfinding:node_cost_helper
execute as @e[tag=node] at @s run function pathfinding:node_facing

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
scoreboard players set @s action 0
