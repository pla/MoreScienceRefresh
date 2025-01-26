---@diagnostic disable: assign-type-mismatch
-- item
local convector_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
convector_item.name = "convector"
convector_item.icon = "__MoreScienceRefresh__/graphics/convector/convector-icon.png"
convector_item.icon_size = 64
convector_item.place_result = convector_item.name
convector_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size

data:extend {
  {
    type = "recipe-category",
    name = "msr-bottle-crafting",
  }
}

-- entity
local convector = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
convector.name = "convector"
convector.icon = "__MoreScienceRefresh__/graphics/convector/convector-icon.png"
convector.minable.result = convector.name
convector.next_upgrade = nil
convector.forced_symmetry = "horizontal"

convector.effect_receiver = {
  base_effect = {
    speed = 0.20,
    consumption = 0.30,
    pollution = 0.50
  }
}

convector.crafting_categories = { "msr-bottle-crafting" }
convector.collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } }
convector.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

convector.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/convector/convector-hr-shadow.png",
        priority = "high",
        size = { 600, 500 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 80,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        size = { 360, 350 },
        shift = { 0, 0 },
        scale = 0.5,
        -- line_length = 8,
        frame_count = 80,
        animation_speed = 0.5,
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/convector/convector-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/convector/convector-hr-animation-2.png",
            width_in_frames = 8,
            height_in_frames = 2,
          },
        },
      },
    },
  },
  working_visualisations = {
    {
      fadeout = true,
      animation = {
        priority = "high",
        size = { 360, 350 },
        shift = { 0, 0 },
        frame_count = 80,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/convector/convector-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/convector/convector-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 2,
          },
        },
      },
    },
  },

}

convector.fluid_boxes =
{
  {
    production_type = "output",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "output", direction = defines.direction.north, position = { 2, -2 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { -2, 2 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { 2, 2 } } },
    secondary_draw_orders = { north = -1 }
  },
}


local thermalPlantRecipe = util.table.deepcopy(data.raw.recipe["chemical-plant"])
thermalPlantRecipe.name = "convector"
thermalPlantRecipe.enabled = false
thermalPlantRecipe.results = { { type = "item", name = "convector", amount = 1 } }

data:extend { convector_item, convector, thermalPlantRecipe }

-- LSlib.recipe.editIngredient("convector","electronic-circuit","advanced-circuit")

LSlib.technology.addRecipeUnlock("purification-research", "convector")
