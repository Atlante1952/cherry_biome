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


minetest.register_alias("sakura_sapling", "cherry_biome:sakura_sapling")


local function grow_sakura_sapling(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/sakura_tree_1.mts", "0", nil, false)
end

minetest.register_node("cherry_biome:sakura_sapling", {
	description = S("Sakura Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"cherry_biome_sakura_tree_sapling.png"},
	inventory_image = "cherry_biome_sakura_tree_sapling.png",
	wield_image = "cherry_biome_sakura_tree_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sakura_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"cherry_biome:sakura_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -3, y = 1, z = -3},
			{x = 3, y = 8, z = -3},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"cherry_biome:sakura_sapling", grow_sakura_sapling, "soil"},
	})
	end

	if minetest.global_exists("flowerpot") then
		flowerpot.register_node("cherry_biome:sakura_sapling")
	end