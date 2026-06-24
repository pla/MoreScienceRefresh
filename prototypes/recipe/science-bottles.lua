data:extend({
  {
    type = "recipe",
    name = "sand",
    energy_required = 25,
    categories = { "ms-advanced-crafting" },
    ingredients = {
      { type = "item", name = "stone", amount = 2 },
    },
    results = { { type = "item", name = "sand", amount = 4 } },
    enabled = false,
  },

  {
    type = "recipe",
    name = "cork",
    energy_required = 2,
    ingredients = {
      { type = "item", name = "wood", amount = 1 },
    },
    results = { { type = "item", name = "cork", amount = 5 } },
    enabled = false,
  },

  {
    type = "recipe",
    name = "glass",
    energy_required = 3.5,
    categories = { "smelting" },
    ingredients = {
      { type = "item", name = "sand", amount = 2 },
    },
    results = { { type = "item", name = "glass", amount = 1 } },
    enabled = false,
  },

  {
    type = "recipe",
    name = "empty-bottle",
    energy_required = 5,
    categories = { "ms-advanced-crafting" },
    ingredients = {
      { type = "item", name = "cork", amount = 1 },
      { type = "item", name = "glass", amount = 3 },
    },
    results = {
      { type = "item", name = "empty-bottle", amount = 1 },
    },
    enabled = false,
  },

  {
    type = "recipe",
    name = "purified-water",
    categories = { "ms-chemical-crafting" },
    icon = "__MoreScienceRefresh__/graphics/icons/fluid/fluid-00.png",
    icon_size = 32,
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "water", amount = 20 },
    },
    results = {
      { type = "fluid", name = "purified-water", amount = 10 },
      { type = "item", name = "sand", amount = 1, probability = 0.5 },
    },
    main_product = "purified-water",
    crafting_machine_tint = {
      primary = { r = 0.331, g = 0.075, b = 0.510, a = 0.000 }, -- #54138200
      secondary = { r = 0.589, g = 0.540, b = 0.615, a = 0.361 }, -- #96899c5c
      tertiary = { r = 0.469, g = 0.145, b = 0.695, a = 0.000 }, -- #7724b100
    },
  },
})
