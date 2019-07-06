##
# node_vectors_change_lowest.mcfunction
# Author: Micheal Kerr
# Summary: updates the cost of nodes
##

scoreboard players operation @e[tag=node,distance=0,limit=1] cost = @s cost
scoreboard players add @e[tag=node,distance=0,limit=1] cost 1
scoreboard players set @e[tag=node,distance=0,limit=1] open 1
