---@diagnostic disable: assign-type-mismatch
-- item
local grinder_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
grinder_item.name = "grinder"
grinder_item.icon = "__MoreScienceRefresh__/graphics/grinder/grinder-icon.png"
grinder_item.icon_size = 64
grinder_item.place_result = grinder_item.name
grinder_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size
grinder_item.order = "z-b[".. grinder_item.name .."]"

-- entity
local grinder = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
grinder.name = "grinder"
grinder.icon = "__MoreScienceRefresh__/graphics/grinder/grinder-icon.png"
grinder.minable.result = grinder.name
grinder.next_upgrade = nil
grinder.forced_symmetry = "horizontal"
grinder.module_slots = 4
grinder.crafting_speed = 2

-- grinder.effect_receiver = {
--   base_effect = {
--     speed = 0.20,
--     consumption = 0.30,
--     pollution = 0.50
--   }
-- }

grinder.crafting_categories = { "ms-sand-crafting" }
grinder.collision_box = { { -4.3, -4.3 }, { 4.3, 4.3 } }
grinder.selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } }

grinder.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/grinder/grinder-hr-shadow.png",
        priority = "high",
        size = { 1200, 700 },
        shift = { 0, -0.5 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 80,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        size = { 590, 640 },
        shift = { 0, -0.5 },
        scale = 0.5,
        -- line_length = 8,
        frame_count = 80,
        animation_speed = 0.5,
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/grinder/grinder-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/grinder/grinder-hr-animation-2.png",
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
        size = { 590, 640 },
        shift = { 0, -0.5 },
        frame_count = 80,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/grinder/grinder-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/grinder/grinder-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 2,
          },
        },
      },
    },
  },

}

-- grinder.graphics_set.working_visualisations[2].north_position = {1.22,-4}
-- grinder.graphics_set.working_visualisations[2].east_position = nil
-- grinder.graphics_set.working_visualisations[2].south_position = nil
-- grinder.graphics_set.working_visualisations[2].west_position = nil

-- grinder.graphics_set.working_visualisations[3].north_position = {1.22,-4}
-- grinder.graphics_set.working_visualisations[3].east_position = nil
-- grinder.graphics_set.working_visualisations[3].south_position = nil
-- grinder.graphics_set.working_visualisations[3].west_position = nil

grinder.fluid_boxes =
{
  {
    production_type = "output",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "output", direction = defines.direction.north, position = { 0, -4 } } },
    secondary_draw_orders = { north = -1 }
  },
  -- {
  --   production_type = "input",
  --   pipe_picture = assembler2pipepictures(),
  --   pipe_covers = pipecoverspictures(),
  --   volume = 100,
  --   pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { -2, 2 } } },
  --   secondary_draw_orders = { north = -1 }
  -- },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { 0, 4 } } },
    secondary_draw_orders = { north = -1 }
  },
}

grinder.working_sound = data.raw["mining-drill"]["burner-mining-drill"].working_sound


local grinderRecipe = util.table.deepcopy(data.raw.recipe["chemical-plant"])
grinderRecipe.name = "grinder"
grinderRecipe.enabled = false
grinderRecipe.results = { { type = "item", name = "grinder", amount = 1 } }
grinderRecipe.subgroup = "msr-crafting"

data:extend { grinder_item, grinder, grinderRecipe }

LSlib.recipe.editIngredient("grinder","electronic-circuit","processing-unit")

-- LSlib.technology.addRecipeUnlock("purification-research", "grinder")

data:extend({
  {
    type = "technology",
    name = "ms-advanced-grinding",
    icons = {
      {
        icon = "__MoreScienceRefresh__/graphics/grinder/grinder-icon-big.png",
        icon_size = 640,
        scale = 0.4
      }
    },
    prerequisites = {"production-science-pack",},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "grinder"
      },
    },
    unit =
    {
      count = 150,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"advanced-automation-science-pack", 1},
        {"electric-power-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 60
    },
  },
  })


