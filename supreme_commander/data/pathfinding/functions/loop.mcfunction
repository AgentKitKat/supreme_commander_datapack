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

# start pathfinding if the player right clicks
execute as @e[scores={action=1..}] run function pathfinding:right_click

# kill nodes if can see goal
execute as @e[tag=unit] at @s facing entity @e[tag=goal,limit=1,sort=nearest] eyes run function los_to_goal_kill_nodes

# move unsing nodes
execute as @e[tag=unit] at @s rotated as @e[tag=node,sort=nearest,limit=1,distance=...6] run tp ^ ^ ^.1
