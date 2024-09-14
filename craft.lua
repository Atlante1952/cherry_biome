--[[
    Copyright (C) 2023
Atlante
AtlanteWork@gmail.com

                      GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.
5349666272645780583
]]

local S = minetest.get_translator("cherry_biome")
local path = minetest.get_modpath("cherry_biome")
local modpath = minetest.get_modpath("cherry_biome")

minetest.register_craft({
	output = "cherry_biome:sakura_wood 4",
	recipe = {
		{"cherry_biome:sakura_tree"},
	}
})

minetest.register_craft({
	output = "cherry_biome:sakura_trapdoor 2",
	recipe = {
		{"cherry_biome:sakura_wood", "cherry_biome:sakura_wood", ""},
		{"cherry_biome:sakura_wood", "cherry_biome:sakura_wood", "cherry_biome:sakura_wood"},
		{"", "cherry_biome:sakura_wood", "cherry_biome:sakura_wood"},
	}
})

minetest.register_craft({
	output = "cherry_biome:fence_rail_sakura_wood 16",
	recipe = {
		{"", "cherry_biome:sakura_wood", "cherry_biome:sakura_wood"},
		{"", "", ""},
		{"", "cherry_biome:sakura_wood", "cherry_biome:sakura_wood"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "cherry_biome:sakura_sapling",
	burntime = 6,
})