
data:extend({
	{
		type = "tile",
		name = "concrete-marker",
		needs_correction = false,
		minable = {hardness = 0.2, mining_time = 0.1, result = "concrete"},
		mined_sound = { filename = "__base__/sound/walking/concrete-02.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = concrete_walking_speed_modifier,
		layer = 59,
		decorative_removal_probability = 0.6,
		variants =
		{
			main =
			{
				{
					picture = "__factoryfloor__/graphics/terrain/concrete/concrete1.png",
					count = 22,
					size = 1,
					weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045, 0.005, 0.005, 0.005, 0.005, 0.003, 0.005 }
				},
				{
					picture = "__factoryfloor__/graphics/terrain/concrete/concrete2.png",
					count = 30,
					size = 2,
					probability = 1,
					weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027, 0.022, 0.032, 0.020, 0.020, 0.030, 0.005, 0.010, 0.002, 0.013, 0.007, 0.007, 0.010, 0.030, 0.030 }
				},
				{
					picture = "__factoryfloor__/graphics/terrain/concrete/concrete4.png",
					count = 21,
					line_length = 11,
					size = 4,
					probability = 1,
					weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070, 0.070, 0.050, 0.050, 0.050, 0.050 }
				}
			},
			inner_corner =
			{
				picture = "__factoryfloor__/graphics/terrain/concrete/concrete-inner-corner.png",
				count = 8
			},
			outer_corner =
			{
				picture = "__factoryfloor__/graphics/terrain/concrete/concrete-outer-corner.png",
				count = 8
			},
			side =
			{
				picture = "__factoryfloor__/graphics/terrain/concrete/concrete-side.png",
				count = 8
			},
			o_transition =
			{
				picture = "__factoryfloor__/graphics/terrain/concrete/concrete-o.png",
				count = 1
			},
			u_transition =
			{
				picture = "__factoryfloor__/graphics/terrain/concrete/concrete-u.png",
				count = 8
			}

		},
		walking_sound =
		{
			{
				filename = "__base__/sound/walking/concrete-02.ogg",
				volume = 0.8
			},
			{
				filename = "__base__/sound/walking/concrete-03.ogg",
				volume = 0.8
			},
			{
				filename = "__base__/sound/walking/concrete-04.ogg",
				volume = 0.8
			}
		},
		map_color={r=92, g=50, b=17},
		ageing=0,
		vehicle_friction_modifier = concrete_vehicle_speed_modifier
	}
})
