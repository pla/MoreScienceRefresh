--------------------------------------------------------------------------------
----- hand-saw                                                             -----
--------------------------------------------------------------------------------
local handSaw = {
  type = "recipe",
  name = "hand-saw",
  energy_required = 2,
  enabled = false,
  ingredients = {
    { type = "item", name = "iron-plate", amount = 2 },
    { type = "item", name = "iron-stick", amount = 1 },
    { type = "item", name = "wood", amount = 1 },
  },
  results = { { type = "item", name = "hand-saw", amount = 1 } },
}

--------------------------------------------------------------------------------
----- seed-extractor                                                       -----
--------------------------------------------------------------------------------
local seedExtractor = {
  type = "recipe",
  name = "seed-extractor",
  energy_required = 25,
  enabled = false,
  ingredients = {
    { type = "item", name = "chemical-plant", amount = 1 },
    { type = "item", name = handSaw.name, amount = 1 },
    { type = "item", name = "wood", amount = data.raw["item"]["wood"].stack_size / 2 },
  },
  results = {
    { type = "item", name = "seed-extractor", amount = 1 },
  },
}

--------------------------------------------------------------------------------
----- wood-plantation                                                      -----
--------------------------------------------------------------------------------
local woodPlantation = {
  type = "recipe",
  name = "wood-plantation",
  energy_required = seedExtractor.energy_required,
  enabled = false,
  ingredients = {
    { type = "item", name = "assembling-machine-2", amount = 1 },
    { type = "item", name = "sand", amount = data.raw["item"]["sand"].stack_size },
    { type = "item", name = "landfill", amount = data.raw["item"]["sand"].stack_size },
    { type = "item", name = "wood", amount = data.raw["item"]["wood"].stack_size },
    { type = "item", name = handSaw.name, amount = data.raw["item"]["hand-saw"].stack_size },
  },
  results = {
    { type = "item", name = "wood-plantation", amount = 1 },
  },
}

--------------------------------------------------------------------------------
----- tree                                                                 -----
--------------------------------------------------------------------------------
local organicTree = {
  type = "recipe",
  name = "organic-tree",
  energy_required = 60 * 5,
  enabled = false,
  categories = { "ms-wood-plantation" },
  ingredients = {
    { type = "item", name = "tree-seed", amount = 1 },
  },
  results = { { type = "item", name = "organic-tree", amount = 1 } },
}

--------------------------------------------------------------------------------
----- tree-seed                                                            -----
--------------------------------------------------------------------------------
local treeSeed = {
  type = "recipe",
  name = "tree-seed",
  localised_name = util.table.deepcopy(data.raw["item"]["tree-seed"].localised_name),
  energy_required = 60,
  enabled = false,
  categories = { "ms-seed-extractor" },
  ingredients = {
    { type = "item", name = organicTree.results[1].name, amount = 1 },
  },
  results = {
    { type = "item", name = "tree-seed", amount = 5 },
  },
}

local treeSeedCreator = {
  type = "recipe",
  name = treeSeed.name .. "-creator",
  localised_name = util.table.deepcopy(data.raw["item"][treeSeed.name].localised_name),
  icon = data.raw["item"][treeSeed.name].icon,
  icon_size = data.raw["item"][treeSeed.name].icon_size,
  subgroup = data.raw["item"][treeSeed.name].subgroup,
  energy_required = treeSeed.energy_required / 2,
  enabled = treeSeed.enabled,
  category = treeSeed.category,
  ingredients = {
    { type = "item", name = "wood", amount = 100 },
    { type = "item", name = "sand", amount = 10 },
  },
  results = {
    { type = "item", name = "sand", amount = 5 },
    { type = "item", name = treeSeed.results[1].name, amount = 1, independent_probability = 0.025 },
  },
  main_product = treeSeed.results[1].name,
}

--------------------------------------------------------------------------------
----- tree-seed                                                            -----
--------------------------------------------------------------------------------
local rawWoodProduction = {
  type = "recipe",
  name = "wood-creator",
  localised_name = { "item-name.wood" },
  energy_required = organicTree.energy_required / 2,
  enabled = false,
  categories = { "advanced-crafting" },
  ingredients = {
    { type = "item", name = organicTree.results[1].name, amount = 1 },
    { type = "item", name = handSaw.name, amount = 1 },
  },
  results = { { type = "item", name = "wood", amount = 50 } },
}

data:extend({
  handSaw,

  seedExtractor,
  treeSeedCreator,
  treeSeed,

  woodPlantation,
  organicTree,

  rawWoodProduction,
})
