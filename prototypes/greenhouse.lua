-- adjust animation speed for seed extractor
-- local seedExtractor = data.raw["assembling-machine"]["seed-extractor"]
-- seedExtractor.graphics_set.animation.layers[1].animation_speed = 0.25

-- item
local greenhouse_item = data.raw["item"]["wood-plantation"]
greenhouse_item.icon = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-icon.png"
greenhouse_item.icon_size = 64

-- entity
local greenhouse = data.raw["assembling-machine"]["wood-plantation"]
greenhouse.icon = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-icon.png"
greenhouse.next_upgrade = nil
greenhouse.forced_symmetry = "horizontal"

-- consume pollution
greenhouse.effect_receiver = {
  base_effect = {
    -- consumption = 0.30,
    pollution = -1.50
  }
}

greenhouse.collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } }
greenhouse.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

greenhouse.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-hr-shadow.png",
        priority = "high",
        size = { 700, 500 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 128,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        size = { 340, 355 },
        shift = { 0, 0 },
        scale = 0.5,
        -- line_length = 8,
        frame_count = 128,
        animation_speed = 0.5,
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-hr-animation-2.png",
            width_in_frames = 8,
            height_in_frames = 8,
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
        size = { 340, 355 },
        shift = { 0, 0 },
        frame_count = 128,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
        },
      },
    },
  },

}

greenhouse.fluid_boxes =
{
  -- {
  --   production_type = "output",
  --   pipe_picture = assembler2pipepictures(),
  --   pipe_covers = pipecoverspictures(),
  --   volume = 100,
  --   pipe_connections = { { flow_direction = "output", direction = defines.direction.north --[[@as data.Direction]], position = { 2, -2 } } },
  --   secondary_draw_orders = { north = -1 }
  -- },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { -2, 2 } } },
    secondary_draw_orders = { north = -1 }
  },
  -- {
  --   production_type = "input",
  --   pipe_picture = assembler2pipepictures(),
  --   pipe_covers = pipecoverspictures(),
  --   volume = 100,
  --   pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { 2, 2 } } },
  --   secondary_draw_orders = { north = -1 }
  -- },
}


LSlib.recipe.addIngredient("organic-tree","water",10,"fluid")

local woodPlantation = data.raw["technology"]["wood-plantation"]
woodPlantation.icons[1] = {
  icon = "__MoreScienceRefresh__/graphics/greenhouse/greenhouse-icon-big.png",
  icon_size = 640,
  scale = 0.4
}