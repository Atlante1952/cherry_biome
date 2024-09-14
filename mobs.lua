if minetest.get_modpath("mobs_monster") then

	mobs:spawn({
		name = "mobs_monster:dirt_monster",
		nodes = {"cherry_biome:dirt_with_cherry_grass"},
		min_light = 0,
		max_light = 7,
		chance = 6000,
		active_object_count = 2,
		min_height = 0,
		day_toggle = false,
	})

	mobs:spawn({
		name = "mobs_monster:tree_monster",
		nodes = {"cherry_biome:dirt_with_cherry_grass"}, 
		max_light = 7,
		chance = 7000,
		min_height = 0,
		day_toggle = false,
	})
end


if minetest.get_modpath("mobs_animal") then

	mobs:spawn({
		name = "mobs_animal:cow",
		nodes = {"cherry_biome:dirt_with_cherry_grass"},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 5,
		max_height = 200,
		day_toggle = true,
	})

	mobs:spawn({
		name = "mobs_animal:sheep_white",
		nodes = {"cherry_biome:dirt_with_cherry_grass"},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 8000,
		min_height = 0,
		max_height = 200,
		day_toggle = true,
	})

	mobs:spawn({
		name = "mobs_animal:bunny",
		nodes = {"cherry_biome:dirt_with_cherry_grass"},
--		neighbors = {"group:grass"},
		min_light = 12,
		interval = 60,
		chance = 1600,
		min_height = 5,
		max_height = 200,
		day_toggle = true,
	})
end


if minetest.get_modpath("mob_horse") then
	mobs:spawn({
		name = "mob_horse:horse",
		nodes = {"cherry_biome:dirt_with_cherry_grass"},
		min_light = 14,
		interval = 60,
		chance = 16000,
		min_height = 10,
		max_height = 31000,
		day_toggle = true
	})
end
