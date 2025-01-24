
-- item
local assembler_item = data.raw["item"]["rocket-assembling-machine"]
assembler_item.icon = "__MoreScienceRefresh__/graphics/assembler/assembler-icon.png"
assembler_item.icon_size = 64

-- entity
local assembler = data.raw["assembling-machine"]["rocket-assembling-machine"]
assembler.icon = "__MoreScienceRefresh__/graphics/assembler/assembler-icon.png"
assembler.next_upgrade = nil
-- assembler.forced_symmetry = "horizontal"

assembler.effect_receiver = {
  base_effect = {
    productivity = 0.10,
    consumption = 0.30,
  }
}

assembler.collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } }
assembler.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }

assembler.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/assembler/assembler-hr-shadow.png",
        priority = "high",
        size = { 520, 500 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 100,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        size = { 320, 320 },
        shift = { 0, 0 },
        scale = 0.5,
        -- line_length = 8,
        frame_count = 100,
        animation_speed = 0.5,
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/assembler/assembler-hr-animation-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/assembler/assembler-hr-animation-2.png",
            width_in_frames = 8,
            height_in_frames = 5,
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
        size = { 320, 320 },
        shift = { 0, 0 },
        frame_count = 100,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        stripes = {
          {
            filename = "__MoreScienceRefresh__/graphics/assembler/assembler-hr-emission-1.png",
            width_in_frames = 8,
            height_in_frames = 8,
          },
          {
            filename = "__MoreScienceRefresh__/graphics/assembler/assembler-hr-emission-2.png",
            width_in_frames = 8,
            height_in_frames = 5,
          },
        },
      },
    },
  },

}

-- assembler.fluid_boxes =
-- {
--   {
--     production_type = "input",
--     pipe_picture = assembler2pipepictures(),
--     pipe_covers = pipecoverspictures(),
--     volume = 100,
--     pipe_connections = { { flow_direction = "input", direction = defines.direction.north --[[@as data.Direction]], position = { 2, -2 } } },
--     secondary_draw_orders = { north = -1 }
--   },
--   {
--     production_type = "input",
--     pipe_picture = assembler2pipepictures(),
--     pipe_covers = pipecoverspictures(),
--     volume = 100,
--     pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { 0, 2 } } },
--     secondary_draw_orders = { north = -1 }
--   },
  -- {
  --   production_type = "input",
  --   pipe_picture = assembler2pipepictures(),
  --   pipe_covers = pipecoverspictures(),
  --   volume = 100,
  --   pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { 2, 2 } } },
  --   secondary_draw_orders = { north = -1 }
  -- },
-- }

-- adjust recipes to work in assembler
LSlib.recipe.setCraftingCategory("rocketpart-payload-mk1-rainbow-science-pack","ms-rocket-crafting")
LSlib.recipe.setSubgroup("rocketpart-payload-mk1-rainbow-science-pack","ms-science-rocket-parts")

LSlib.recipe.setCraftingCategory("rocketpart-payload-mk1-empty-bottle","ms-rocket-crafting")
LSlib.recipe.setSubgroup("rocketpart-payload-mk1-empty-bottle","ms-science-rocket-parts")

LSlib.recipe.setCraftingCategory("satellite","ms-rocket-crafting")
LSlib.recipe.setSubgroup("satellite","ms-science-rocket-parts")
