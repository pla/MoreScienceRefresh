-- item
local purifier_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
purifier_item.name = "purifier"
purifier_item.icon = "__MoreScienceRefresh__/graphics/purifier/purifier-icon.png"
purifier_item.icon_size = 64
purifier_item.place_result = purifier_item.name
purifier_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size

-- Change crafting category so we can use water purification in this machine
data:extend{
  {
    type = "recipe-category",
    name = "ms-water-treatment",
  },
}

data.raw["recipe"]["purified-water"].category = "ms-water-treatment"

-- entity
local purifier = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
purifier.name = "purifier"
purifier.icon = "__MoreScienceRefresh__/graphics/purifier/purifier-icon.png"
purifier.minable.result = purifier.name
purifier.next_upgrade = nil
purifier.module_slots = 3
purifier.forced_symmetry = "horizontal"

purifier.effect_receiver = {
  base_effect = {
    speed = 0.10,
    consumption = 0.30,
  }
}

purifier.crafting_categories = { "ms-water-treatment" }
purifier.collision_box = { { -1.8, -1.8 }, { 1.8, 1.8 } }
purifier.selection_box = { { -2, -2 }, { 2, 2 } }

purifier.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/purifier/purifier-hr-shadow.png",
        priority = "high",
        size = { 600, 400 },
        shift = { 0, -1 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 60,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        filename = "__MoreScienceRefresh__/graphics/purifier/purifier-hr-animation.png",
        size = { 320, 370 },
        shift = { 0, -1 },
        scale = 0.5,
        line_length = 8,
        frame_count = 60,
        animation_speed = 0.5,

      },
    },
  },
  -- working_visualisations = {
  --   {
  --     fadeout = true,
  --     animation = {
  --       filename = "__MoreScienceRefresh__/graphics/purifier/chemical-stager-hr-emission-1.png",
  --       priority = "high",
  --       size = { 400, 400 },
  --       shift = { 0, 0 },
  --       line_length = 8,
  --       frame_count = 60,
  --       animation_speed = 0.5,
  --       scale = 0.5,
  --       draw_as_glow = true,
  --       blend_mode = "additive",
  --     },
  --   },
  -- },

}

-- myChemPlant.graphics_set.working_visualisations[2].north_position = {1.22,-4}
-- myChemPlant.graphics_set.working_visualisations[2].east_position = nil
-- myChemPlant.graphics_set.working_visualisations[2].south_position = nil
-- myChemPlant.graphics_set.working_visualisations[2].west_position = nil

-- myChemPlant.graphics_set.working_visualisations[3].north_position = {1.22,-4}
-- myChemPlant.graphics_set.working_visualisations[3].east_position = nil
-- myChemPlant.graphics_set.working_visualisations[3].south_position = nil
-- myChemPlant.graphics_set.working_visualisations[3].west_position = nil

purifier.fluid_boxes =
{
  {
    production_type = "output",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "output", direction = defines.direction.north--[[@as data.Direction]], position = { 1.5, -1.5 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { -1.5, 1.5 } } },
    secondary_draw_orders = { north = -1 }
  },
}


local purifierRecipe = util.table.deepcopy(data.raw.recipe["chemical-plant"])
purifierRecipe.name = "purifier"
purifierRecipe.enabled = false
purifierRecipe.results = { { type = "item", name = "purifier", amount = 1 } }

data:extend { purifier_item, purifier, purifierRecipe }

LSlib.technology.addRecipeUnlock("purification-research", "purifier")
