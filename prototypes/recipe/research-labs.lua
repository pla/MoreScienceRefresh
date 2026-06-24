local scienceNames = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = util.table.deepcopy(data.raw["recipe"]["lab"])
labMK0.name = "lab-mk0"
labMK0.enabled = false
data:extend({ labMK0 })
LSlib.recipe.removeIngredient(labMK0.name, "transport-belt")
LSlib.recipe.addIngredient(labMK0.name, "boiler", 1)
LSlib.recipe.editResult(labMK0.name, "lab", labMK0.name, 1)
LSlib.technology.addRecipeUnlock("electronics", labMK0.name)
data.raw["technology"]["automation-science-pack"].research_trigger = {
  type = "craft-item",
  item = labMK0.name,
}

--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
data.raw["recipe"]["lab"].ingredients = {
  { type = "item", name = "lab-mk0", amount = 1 },
  { type = "item", name = "transport-belt", amount = 4 },
}
LSlib.recipe.setEngergyRequired("lab", 5 * LSlib.recipe.getEngergyRequired("lab"))

LSlib.technology.removeRecipeUnlock("electronics", data.raw["recipe"]["lab"].name)

--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = util.table.deepcopy(data.raw["recipe"]["lab"])
labMK2.name = "lab-mk2"
labMK2.categories = { "ms-advanced-crafting" }
labMK2.energy_required = 120
labMK2.ingredients = {
  { type = "item", name = "lab", amount = 1 },
  { type = "item", name = "fission-reactor-equipment", amount = 1 },
  { type = "fluid", name = string.format(scienceNames.white, "fluid"), amount = 250 },
}
labMK2.results = { { type = "item", name = "lab-mk2", amount = 1 } }
labMK2.enabled = false
data:extend({ labMK2 })
