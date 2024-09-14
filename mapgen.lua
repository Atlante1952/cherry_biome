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

minetest.register_biome({
	name = "sakura_plains",
	node_top = "cherry_biome:dirt_with_cherry_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 1,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 31000,
	y_min = 6,
    heat_point = 60,
    humidity_point = 40,
})

minetest.register_biome({
	name = "cherry_dunes",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 5,
	y_min = 4,
    heat_point = 60,
    humidity_point = 40,
})

minetest.register_biome({
	name = "cherry_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3,
	y_min = -255,
    heat_point = 60,
    humidity_point = 40,
})

minetest.register_biome({
	name = "cherry_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
    heat_point = 60,
    humidity_point = 40,
})


minetest.register_decoration({
    name = "sakura_tree_1",
    deco_type = "schematic",
    place_on = {"cherry_biome:dirt_with_cherry_grass"},
    sidelen = 16,
    noise_params = {
        offset = 0.003,
        scale = 0.00000003/3,
        spread = {x = 150, y = 150, z = 150},
        seed = 2,
        octaves = 1,
        persist = 0.06
    },
    biomes = {"cherry_forest"},
    y_max = 31000,
    y_min = 4,
    schematic = minetest.get_modpath("default_mtg_biome_reworked").."/schematics/sakura_tree_1.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

minetest.register_decoration({
    name = "sakura_tree_2",
    deco_type = "schematic",
    place_on = {"cherry_biome:dirt_with_cherry_grass"},
    sidelen = 16,
    noise_params = {
        offset = 0.003,
        scale = 0.00000003/3,
        spread = {x = 150, y = 150, z = 150},
        seed = 3,
        octaves = 1,
        persist = 0.06
    },
    biomes = {"cherry_forest"},
    y_max = 31000,
    y_min = 4,
    schematic = minetest.get_modpath("default_mtg_biome_reworked").."/schematics/sakura_tree_2.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

minetest.register_decoration({
    name = "aspen_tree",
    deco_type = "schematic",
    place_on = {"cherry_biome:dirt_with_cherry_grass"},
    sidelen = 16,
    noise_params = {
        offset = 0.003,
        scale = 0.00000003/2,
        spread = {x = 150, y = 150, z = 150},
        seed = 2,
        octaves = 1,
        persist = 0.06
    },
    biomes = {"cherry_forest"},
    y_max = 31000,
    y_min = 4,
    schematic = minetest.get_modpath("default").."/schematics/aspen_tree.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

minetest.register_decoration({
    name = "bush_1",
    deco_type = "schematic",
    place_on = {"cherry_biome:dirt_with_cherry_grass"},
    sidelen = 16,
    noise_params = {
        offset = 0.003,
        scale = 0.00000003/3,
        spread = {x = 150, y = 150, z = 150},
        seed = 2,
        octaves = 1,
        persist = 0.06
    },
    biomes = {"cherry_forest"},
    y_max = 31000,
    y_min = 4,
    place_offset_y = 1,
    schematic = minetest.get_modpath("default_mtg_biome_reworked").."/schematics/bush_1.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

minetest.register_decoration({
    name = "log_1",
    deco_type = "schematic",
    place_on = {"cherry_biome:dirt_with_cherry_grass"},
    place_offset_y = 1,
    sidelen = 80,
    fill_ratio = 0.0009,
    biomes = {"cherry_forest"},
    y_max = 31000,
    y_min = 4,
    schematic = minetest.get_modpath("default_mtg_biome_reworked") .. "/schematics/log_1.mts",
    flags = "place_center_x",
    rotation = "random",
    spawn_by = {"cherry_biome:dirt_with_cherry_grass"},
    num_spawn_by = 8,
})

local function register_boulder(name, schematic)
    minetest.register_decoration({
        name = name,
        deco_type = "schematic",
        place_on = {"cherry_biome:dirt_with_cherry_grass",},
        place_offset_y = -2,
        sidelen = 16,
        fill_ratio = 0.001875/3,
        biomes = {"sakura_plains"},
        y_max = 31000,
        y_min = 5,
        schematic = minetest.get_modpath("default_mtg_biome_reworked").."/schematics/"..schematic,
        flags = "place_center_x, place_center_z",
        rotation = "random",
    })
end

register_boulder("boulder_1", "boulder_1.mts")
register_boulder("boulder_2", "boulder_2.mts")

local decorations = {
    {name = "7", decoration = "flowers:rose", fill_ratio = 0.025/2, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
    {name = "6", decoration = "cherry_biome:sakura_leaves_on_the_ground", fill_ratio = 0.05*2, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
    {name = "5", decoration = "default:grass_5", fill_ratio = 0.05*2, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
	{name = "4", decoration = "default:grass_4", fill_ratio = 0.05*1.75, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
	{name = "3", decoration = "default:grass_3", fill_ratio = 0.05*1.5, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
	{name = "2", decoration = "default:grass_2", fill_ratio = 0.05, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
	{name = "1", decoration = "default:grass_1", fill_ratio = 0.05, biome = {"cherry_forest"}, place_on = {"cherry_biome:dirt_with_cherry_grass"}},
}

for _, deco in ipairs(decorations) do
    minetest.register_decoration({
        name = deco.name,
        deco_type = "simple",
        place_on = deco.place_on,
        sidelen = 16,
        fill_ratio = deco.fill_ratio,
        biomes = deco.biome,
        decoration = deco.decoration
    })
end