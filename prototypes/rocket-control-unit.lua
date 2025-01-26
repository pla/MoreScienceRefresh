data:extend({
  {
    type = "item",
    name = "rocket-control-unit",
    icon = "__MoreScienceRefresh__/graphics/rocket-control-unit/rocket-control-unit.png",
    subgroup = "intermediate-product",
    stack_size = 10,
  },
  {
    type = "recipe",
    name = "rocket-control-unit",
    enabled = false,
    ingredients =
    {
      { type = "item", name = "processing-unit", amount = 1 },
      { type = "item", name = "speed-module", amount = 1 }
    },
    results = { { type = "item", name = "rocket-control-unit", amount = 1 } },
    category = "crafting",
    energy_required = 30.0,
    allow_productivity = true,
    order = "d[rocket-parts]-c[rocket-control-unit]"
  }
})

-- recipes back to rocket-control-unit

for _,recipe in pairs{
  "rocketpart-hull-component",
  "rocketpart-ion-thruster"  ,
  "rocketpart-ion-booster"   ,
  "rocketpart-fusion-reactor",
  "rocketpart-shield-array"  ,
  "rocketpart-laser-array"   ,
  "advanced-logistic-science-fluid"
} do
  LSlib.recipe.editIngredient(recipe,"processing-unit","rocket-control-unit")
end

LSlib.technology.addRecipeUnlock("rocket","rocket-control-unit")
