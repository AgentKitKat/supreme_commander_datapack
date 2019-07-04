##
# move_to_goal.mcfunction
# author: Michael Kerr
# moves the selected entity to the goal
##

# tag @e[tag=unit] remove has_los
# execute as @e[tag=unit] at @s positioned ~ ~1.5 ~ facing entity @e[tag=goal] eyes run function dijkstra:has_los
# execute as @e[tag=unit] at @s unless entity @e[tag=goal,distance=..3] if entity @e[tag=unit,tag=has_los] facing entity @e[tag=goal] feet run tp ^ ^ ^.1