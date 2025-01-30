----@diagnostic disable: assign-type-mismatch
-- item
local arcFurnace_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
arcFurnace_item.name = "arc-furnace"
arcFurnace_item.icon = "__MoreScienceRefresh__/graphics/arc-furnace/arc-furnace-icon.png"
arcFurnace_item.icon_size = 64
arcFurnace_item.place_result = arcFurnace_item.name
arcFurnace_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size
arcFurnace_item.order = "z-e[".. arcFurnace_item.name .."]"

-- entity
local arcFurnace = util.table.deepcopy(data.raw["furnace"]["electric-furnace"])
arcFurnace.name = "arc-furnace"
arcFurnace.icon = "__MoreScienceRefresh__/graphics/arc-furnace/arc-furnace-icon.png"
arcFurnace.minable.result = arcFurnace.name
arcFurnace.next_upgrade = nil

arcFurnace.module_slots = 3

arcFurnace.effect_receiver = {
  base_effect = {
    productivity = 0.20,
    consumption = 0.30,
    pollution = 6.0
  }
}

-- arcFurnace.crafting_categories = { "ms-chemical-crafting","ms-science-cauldron" }
arcFurnace.collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } }
arcFurnace.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

arcFurnace.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/arc-furnace/arc-furnace-hr-shadow.png",
        priority = "high",
        size = { 600, 400 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 50,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        filename = "__MoreScienceRefresh__/graphics/arc-furnace/arc-furnace-hr-animation-1.png",
        size = { 320, 320 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 8,
        frame_count = 50,
        animation_speed = 0.5,

      },
    },
  },
  working_visualisations = {
    {
      fadeout = true,
      animation = {
        filename = "__MoreScienceRefresh__/graphics/arc-furnace/arc-furnace-hr-emission-1.png",
        priority = "high",
        size = { 320, 320 },
        shift = { 0, 0 },
        line_length = 8,
        frame_count = 50,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
      },
    },
  },

}

-- arcFurnace.fluid_boxes =
-- {
--   {
--     production_type = "output",
--     pipe_picture = assembler2pipepictures(),
--     pipe_covers = pipecoverspictures(),
--     volume = 100,
--     pipe_connections = { { flow_direction = "output", direction = defines.direction.north, position = { 0, -2 } } },
--     secondary_draw_orders = { north = -1 }
--   },
--   {
--     production_type = "input",
--     pipe_picture = assembler2pipepictures(),
--     pipe_covers = pipecoverspictures(),
--     volume = 100,
--     pipe_connections = { { flow_direction = "output", direction = defines.direction.east, position = { 2, 0 } } },
--     secondary_draw_orders = { north = -1 }
--   },
--   {
--     production_type = "input",
--     pipe_picture = assembler2pipepictures(),
--     pipe_covers = pipecoverspictures(),
--     volume = 100,
--     pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { 0, 2} } },
--     secondary_draw_orders = { north = -1 }
--   },
--   {
--     production_type = "input",
--     pipe_picture = assembler2pipepictures(),
--     pipe_covers = pipecoverspictures(),
--     volume = 100,
--     pipe_connections = { { flow_direction = "input", direction = defines.direction.west, position = { -2, 0 } } },
--     secondary_draw_orders = { north = -1 }
--   },
-- }


local arcFurnaceRecipe = util.table.deepcopy(data.raw.recipe["electric-furnace"])
arcFurnaceRecipe.name = "arc-furnace"
arcFurnaceRecipe.enabled = false
arcFurnaceRecipe.results = { { type = "item", name = "arc-furnace", amount = 1 } }

data:extend { arcFurnace_item, arcFurnace, arcFurnaceRecipe }

LSlib.recipe.editIngredient("arc-furnace", "advanced-circuit", "processing-unit")
LSlib.recipe.setSubgroup("arc-furnace","msr-crafting")


data:extend({
{
  type = "technology",
  name = "ms-advanced-smelting",
  icons = {
    {
      icon = "__MoreScienceRefresh__/graphics/arc-furnace/arc-furnace-icon-big.png",
      icon_size = 640,
      scale = 0.4
    }
  },
  prerequisites = {"efficiency-module-3",},
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "arc-furnace"
    },
  },
  unit =
  {
    count = 300,
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

