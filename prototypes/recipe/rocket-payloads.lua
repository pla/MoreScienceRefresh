local scienceNames = require("prototypes/settings").scienceNames
local rocketParts = require("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- space-science-packs from science experiment                          -----
--------------------------------------------------------------------------------
local ssp = {
  type = "recipe",
  name = string.format(scienceNames.white, "pack"),
  energy_required = 300,
  categories = { "ms-advanced-crafting" },
  ingredients = {
    {
      type = "item",
      name = string.format(rocketParts.payload, "mk1", string.format(scienceNames.white, "pack")),
      amount = 1,
    },
  },
  results = util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_products),
  main_product = string.format(scienceNames.white, "pack"),
  enabled = false,
}

table.insert(ssp.results, { type = "item", name = string.format(rocketParts.container, "mk1"), amount = 1 })
data:extend({ ssp })

if settings.startup["MS-rocket-launching-extended"].value == true then
  local rbs = {
    type = "recipe",
    name = string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")),
    energy_required = 300,
    categories = { "ms-advanced-crafting" },
    ingredients = util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_products),
    results = {
      {
        type = "item",
        name = string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")),
        amount = 1,
      },
    },
    enabled = false,
  }

  table.insert(rbs.ingredients, { type = "item", name = string.format(rocketParts.container, "mk1"), amount = 1 })
  data:extend({ rbs })

  LSlib.recipe.editIngredient(
    string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")),
    string.format(scienceNames.white, "pack"),
    string.format(scienceNames.mixing, "pack"),
    1
  )
  LSlib.recipe.addIngredient(
    "satellite",
    string.format(rocketParts.payload, "mk1", string.format(scienceNames.mixing, "pack")),
    1,
    "item"
  )
else
  local eb = {
    type = "recipe",
    name = string.format(rocketParts.payload, "mk1", "empty-bottle"),
    energy_required = 300,
    categories = { "ms-advanced-crafting" },
    ingredients = util.table.deepcopy(data.raw["item"]["satellite"].rocket_launch_products),
    results = { { type = "item", name = string.format(rocketParts.payload, "mk1", "empty-bottle"), amount = 1 } },
    enabled = false,
  }

  table.insert(eb.ingredients, { type = "item", name = string.format(rocketParts.container, "mk1"), amount = 1 })
  data:extend({ eb })

  LSlib.recipe.editIngredient(
    string.format(rocketParts.payload, "mk1", "empty-bottle"),
    string.format(scienceNames.white, "pack"),
    "empty-bottle",
    1
  )
  LSlib.recipe.addIngredient("satellite", string.format(rocketParts.payload, "mk1", "empty-bottle"), 1, "item")
end

data.raw["item"]["satellite"].rocket_launch_products =
  { data.raw["recipe"][string.format(scienceNames.white, "pack")].ingredients[1] }
