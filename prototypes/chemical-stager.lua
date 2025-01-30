-- item
local chemicalStager_item = util.table.deepcopy(data.raw["item"]["pumpjack"])
chemicalStager_item.name = "chemical-stager"
chemicalStager_item.icon = "__MoreScienceRefresh__/graphics/chemical-stager/chemical-stager-icon.png"
chemicalStager_item.icon_size = 64
chemicalStager_item.place_result = chemicalStager_item.name
chemicalStager_item.stack_size = data.raw["item"]["assembling-machine-1"].stack_size
chemicalStager_item.order = "z-f[".. chemicalStager_item.name .."]"

-- entity
local chemicalStager = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
chemicalStager.name = "chemical-stager"
chemicalStager.icon = "__MoreScienceRefresh__/graphics/chemical-stager/chemical-stager-icon.png"
chemicalStager.minable.result = chemicalStager.name
chemicalStager.next_upgrade = nil

chemicalStager.module_slots = 3

chemicalStager.effect_receiver = {
  base_effect = {
    productivity = 0.10,
    consumption = 0.30,
    pollution = 0.50
  }
}

chemicalStager.crafting_categories = { "ms-chemical-crafting","ms-science-cauldron" }
chemicalStager.collision_box = { { -2.8, -2.8 }, { 2.8, 2.8 } }
chemicalStager.selection_box = { { -3, -3 }, { 3, 3 } }

chemicalStager.graphics_set = {
  animation = {
    layers = {
      {
        filename = "__MoreScienceRefresh__/graphics/chemical-stager/chemical-stager-hr-shadow.png",
        priority = "high",
        size = { 800, 600 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 1,
        repeat_count = 60,
        draw_as_shadow = true,
        animation_speed = 0.5,
      },
      {
        filename = "__MoreScienceRefresh__/graphics/chemical-stager/chemical-stager-hr-animation-1.png",
        size = { 400, 400 },
        shift = { 0, 0 },
        scale = 0.5,
        line_length = 8,
        frame_count = 60,
        animation_speed = 0.5,

      },
    },
  },
  working_visualisations = {
    {
      fadeout = true,
      animation = {
        filename = "__MoreScienceRefresh__/graphics/chemical-stager/chemical-stager-hr-emission-1.png",
        priority = "high",
        size = { 400, 400 },
        shift = { 0, 0 },
        line_length = 8,
        frame_count = 60,
        animation_speed = 0.5,
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
      },
    },
    -- chemWorkVis[3],
    -- chemWorkVis[4],
  },

}

-- myChemPlant.graphics_set.working_visualisations[2].north_position = {1.22,-4}
-- myChemPlant.graphics_set.working_visualisations[2].east_position = nil
-- myChemPlant.graphics_set.working_visualisations[2].south_position = nil
-- myChemPlant.graphics_set.working_visualisations[2].west_position = nil

-- myChemPlant.graphics_set.working_visualisations[3].north_position = {1.22,-4}
-- myChemPlant.graphics_set.working_visualisations[3].east_position = nil
-- myChemPlant.graphics_set.working_visualisations[3].south_position = nil
-- myChemPlant.graphics_set.working_visualisations[3].west_position = nil

chemicalStager.fluid_boxes =
{
  {
    production_type = "output",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "output", direction = defines.direction.north--[[@as data.Direction]], position = { 1.5, -2.5 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.north--[[@as data.Direction]], position = { -1.5, -2.5 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { -1.5, 2.5 } } },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_picture = assembler2pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.south--[[@as data.Direction]], position = { 1.5, 2.5 } } },
    secondary_draw_orders = { north = -1 }
  },
}


local chemicalStagerRecipe = util.table.deepcopy(data.raw.recipe["chemical-plant"])
chemicalStagerRecipe.name = "chemical-stager"
chemicalStagerRecipe.enabled = false
chemicalStagerRecipe.results = { { type = "item", name = "chemical-stager", amount = 1 } }

data:extend { chemicalStager_item, chemicalStager, chemicalStagerRecipe }

LSlib.recipe.editIngredient("chemical-stager","electronic-circuit","processing-unit")
LSlib.recipe.setSubgroup("chemical-stager","msr-crafting")


data:extend({
  {
    type = "technology",
    name = "ms-advanced-chemical",
    icons = {
      {
        icon = "__MoreScienceRefresh__/graphics/chemical-stager/chemical-stager-icon-big.png",
        icon_size = 320,
        scale = 0.8
      }
    },
    prerequisites = {"efficiency-module-3",},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chemical-stager"
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

  LSlib.technology.addPrerequisite("rainbow-science-pack","ms-advanced-chemical")
  LSlib.technology.removeRecipeUnlock("rainbow-science-pack","science-cauldron")

  