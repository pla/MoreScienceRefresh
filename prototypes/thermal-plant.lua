---@diagnostic disable: assign-type-mismatch
-- item
local thermalPlant_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
thermalPlant_item.name = "thermal-plant"
thermalPlant_item.icon = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-icon.png"
thermalPlant_item.icon_size = 64
thermalPlant_item.place_result = thermalPlant_item.name
thermalPlant_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size

-- entity
local thermalPlant = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
thermalPlant.name = "thermal-plant"
thermalPlant.icon = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-icon.png"
thermalPlant.minable.result = thermalPlant.name
thermalPlant.next_upgrade = nil
thermalPlant.forced_symmetry = "horizontal"

thermalPlant.effect_receiver = {
  base_effect = {
    speed = 0.20,
    consumption = 0.30,
    pollution = 0.50
  }
}

thermalPlant.crafting_categories = { "ms-chemical-crafting" }
thermalPlant.collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } }
thermalPlant.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

---@type data.WorkingVisualisations for smoke
local chemWorkVis = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].graphics_set.working_visualisations)
thermalPlant.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-hr-shadow.png",
        priority = "high",
        size = { 900, 500 },
        shift = { 0, -1 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 80,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        size = { 330, 410 },
        shift = { 0, -1 },
        scale = 0.5,
        -- line_length = 8,
        frame_count = 80,
        animation_speed = 0.5,
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-hr-animation-2.png",
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
        size = { 330, 410 },
        shift = { 0, -1 },
        frame_count = 80,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/thermal-plant/thermal-plant-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 2,
          },
        },
      },
    },
    chemWorkVis[3],
    chemWorkVis[4],
  },

}

thermalPlant.graphics_set.working_visualisations[2].north_position = {1.22,-4}
thermalPlant.graphics_set.working_visualisations[2].east_position = nil
thermalPlant.graphics_set.working_visualisations[2].south_position = nil
thermalPlant.graphics_set.working_visualisations[2].west_position = nil

thermalPlant.graphics_set.working_visualisations[3].north_position = {1.22,-4}
thermalPlant.graphics_set.working_visualisations[3].east_position = nil
thermalPlant.graphics_set.working_visualisations[3].south_position = nil
thermalPlant.graphics_set.working_visualisations[3].west_position = nil

thermalPlant.fluid_boxes =
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
thermalPlantRecipe.name = "thermal-plant"
thermalPlantRecipe.enabled = false
thermalPlantRecipe.results = { { type = "item", name = "thermal-plant", amount = 1 } }

data:extend { thermalPlant_item, thermalPlant, thermalPlantRecipe }

LSlib.recipe.editIngredient("thermal-plant","electronic-circuit","advanced-circuit")

LSlib.technology.addRecipeUnlock("purification-research", "thermal-plant")
