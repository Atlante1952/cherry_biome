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

local S = minetest.get_translator("default_mtg_biome_reworked")
local path = minetest.get_modpath("default_mtg_biome_reworked")
local modpath = minetest.get_modpath("default_mtg_biome_reworked")

minetest.register_alias("sakura_leaves", "cherry_biome:sakura_leaves")
minetest.register_alias("sakura_tree", "cherry_biome:sakura_tree")
minetest.register_alias("sakura_wood", "cherry_biome:sakura_wood")
minetest.register_alias("dirt_with_cherry_grass", "cherry_biome:dirt_with_cherry_grass")


local function after_place_leaves(...)
	return default.after_place_leaves(...)
end

minetest.register_node("cherry_biome:sakura_leaves", {
	description = S("Sakura Tree Leaves"),
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"cherry_biome_sakura_leaves.png"},
	special_tiles = {"cherry_biome_sakura_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"cherry_biome:sakura_sapling"},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"cherry_biome:sakura_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos)
		minetest.get_node_timer(pos):start(5) 

	end,
})

minetest.register_abm({
	label = S("Sakura Tree Leaves Particle"),
	nodenames = {"cherry_biome:sakura_leaves"},
	interval = 6,
	chance = 24,
	catch_up = false,
	action = function(pos)
		minetest.add_particlespawner({
			amount = 1,
			time = 1,
			minpos = {x = pos.x, y = pos.y, z = pos.z},
			maxpos = {x = pos.x, y = pos.y, z = pos.z},
			minvel = {x = -0.75, y = -0.4, z = -0.75},
			maxvel = {x = 0.75, y = -0.2, z = 0.75},
			minacc = {x = -0.2, y = -0.4, z = -0.2},
			maxacc = {x = 0.2, y = -0.1, z = 0.2},
			minexptime = 8,
			maxexptime = 10,
			minsize = 1.5,
			maxsize = 1.75,
			texture = "cherry_biome_sakura_particul.png",
			collisiondetection = true,
			collision_removal = true,
			vertical = false,
		})
	end,
})


minetest.register_node("cherry_biome:sakura_tree", {
	description = S("Sakura Tree"),
	tiles = {"cherry_biome_sakura_tree_top.png", "cherry_biome_sakura_tree_top.png", "cherry_biome_sakura_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

default.register_leafdecay({
	trunks = {"cherry_biome:sakura_tree"},
	leaves = {"cherry_biome:sakura_leaves"},
	radius = 3,
})

minetest.register_node("cherry_biome:sakura_wood", {
	description = S("Sakura Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"cherry_biome_sakura_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("cherry_biome:dirt_with_cherry_grass", {
	description = S("Dirt with Cherry Blossom Grass"),
	tiles = {"cherry_biome_cherry_grass.png", "default_dirt.png",
		{name = "default_dirt.png^cherry_biome_cherry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
	soil = {
		base = "cherry_biome:dirt_with_cherry_grass",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

stairs.register_stair_and_slab("sakura_wood", "cherry_biome:sakura_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"cherry_biome_sakura_wood.png"},
		S("Sakura Wood Stair"),
		S("Sakura Wood Slab"),
default.node_sound_wood_defaults())

default.register_fence("cherry_biome:fence_sakura_wood", {
	description = S("Sakura Wood Fence"),
	texture = "cherry_biome_sakura_wood.png",
	inventory_image = "default_fence_overlay.png^cherry_biome_sakura_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^cherry_biome_sakura_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "ebiomes:sugi_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("cherry_biome:fence_rail_sakura_wood", {
		description = S("Sakura Wood Fence Rail"),
		texture = "cherry_biome_sakura_wood.png",
		inventory_image = "default_fence_rail_overlay.png^cherry_biome_sakura_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^cherry_biome_sakura_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:sugi_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("cherry_biome:mese_post_light_sakura_wood", {
		description = S("Sakura Wood Mese Post Light"),
		texture = "cherry_biome_sakura_wood.png",
		material = "cherry_biome:sakura_wood",
	})

	doors.register_fencegate("cherry_biome:gate_sakura_wood", {
		description = S("Sakura Wood Fence Gate"),
		texture = "cherry_biome_sakura_wood.png",
		material = "cherry_biome:sakura_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	if minetest.get_modpath("moreblocks") then
		stairsplus:register_all("sakura_tree", "wood", "cherry_biome:sakura_wood", {
			description = S("Sakura Wood"),
			tiles = {"cherry_biome_sakura_wood.png"},
			groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
			sounds = default.node_sound_wood_defaults(),
		})
	end

	if minetest.get_modpath("bonemeal") ~= nil then
		bonemeal:add_deco({
			{"cherry_biome:dirt_with_cherry_grass", {"default:grass_1", "default:grass_2", "default:grass_3", "default:grass_4", "default:grass_5"},
				{""} }
		})
	end

	doors.register_trapdoor("cherry_biome:sakura_trapdoor", {
		description = S("Trapdoor In Sakura Wood Planks"),
		inventory_image = "cherry_biome_doors_trapdoor_sakura.png",
		wield_image = "cherry_biome_doors_trapdoor_sakura.png",
		tile_front = "cherry_biome_doors_trapdoor_sakura.png",
		tile_side = "cherry_biome_doors_trapdoor_side_sakura.png",
		gain_open = 0.06,
		gain_close = 0.13,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1},
	})

	minetest.register_node("cherry_biome:sakura_leaves_on_the_ground", {
		description = S("Cherry Blossom on the ground"),
		drawtype = "signlike",
		waving = 1,
		tiles = {"cherry_biome_sakura_leaves_on_the_ground.png"},
		inventory_image = "cherry_biome_sakura_leaves_on_the_ground.png",
		wield_image = "cherry_biome_sakura_leaves_on_the_ground.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, oddly_breakable_by_hand=3,
	flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type="wallmounted",
			wall_top = {-0.5, 0.49, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.49, 0.5},
			wall_side = {-0.5, -0.5, -0.5, -0.49, 0.5, 0.5},
		},
	})
