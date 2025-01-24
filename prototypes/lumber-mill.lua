---@diagnostic disable: assign-type-mismatch
-- item
local lumberMill_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
lumberMill_item.name = "lumber-mill"
lumberMill_item.icon = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-icon.png"
lumberMill_item.icon_size = 64
lumberMill_item.place_result = lumberMill_item.name
lumberMill_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size


-- move wood creation in its own category for the lumbermill
data:extend{
  {
    type = "recipe-category",
    name = "ms-lumber-mill",
  },
}
LSlib.recipe.setCraftingCategory("wood-creator","ms-lumber-mill")

-- entity
local lumberMill = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
lumberMill.name = "lumber-mill"
lumberMill.icon = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-icon.png"
lumberMill.minable.result = lumberMill.name
lumberMill.next_upgrade = nil
lumberMill.module_slots = 4
lumberMill.crafting_speed = 1

lumberMill.effect_receiver = {
  base_effect = {
    speed = 0.20,
    consumption = 0.30,
    pollution = 0.50
  }
}

lumberMill.crafting_categories = { "ms-lumber-mill" }
lumberMill.collision_box = { { -3.8, -3.8 }, { 3.8, 3.8 } }
lumberMill.selection_box = { { -4, -4 }, { 4, 4} }

lumberMill.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-hr-shadow.png",
        priority = "high",
        size = { 800,700 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 80,
        draw_as_shadow = true,
        animation_speed = 0.4,
      },
      {
        size = { 525, 557 },
        shift = { 0, 0 },
        scale = 0.5,
        -- line_length = 8,
        frame_count = 80,
        animation_speed = 0.4,
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-hr-animation-2.png",
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
        size = { 525, 557 },
        shift = { 0, 0 },
        frame_count = 80,
        animation_speed = 0.4,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/lumber-mill/lumber-mill-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 2,
          },
        },
      },
    },
  },

}
lumberMill.fluid_boxes_off_when_no_fluid_recipe=false

lumberMill.fluid_boxes =
{
  -- {
  --   production_type = "output",
  --   pipe_picture = assembler2pipepictures(),
  --   pipe_covers = pipecoverspictures(),
  --   volume = 100,
  --   pipe_connections = { { flow_direction = "output", direction = defines.direction.north, position = { 2, -2 } } },
  --   secondary_draw_orders = { north = -1 }
  -- },
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
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { 3, 3 } } },
    secondary_draw_orders = { north = -1 },
  },
}


local lumberMillRecipe = util.table.deepcopy(data.raw.recipe["wood-plantation"])
lumberMillRecipe.name = "lumber-mill"
lumberMillRecipe.enabled = false
lumberMillRecipe.results = { { type = "item", name = "lumber-mill", amount = 1 } }

data:extend { lumberMill_item, lumberMill, lumberMillRecipe }

LSlib.technology.addRecipeUnlock("wood-plantation", "lumber-mill")
