-- new sand recipe with water and its own category
data:extend( {
  {
    type = "recipe-category",
    name = "ms-sand-crafting",
  },
  {
    type = "recipe",
    name = "sand",
    energy_required = 25,
    category = "ms-sand-crafting",
    ingredients =
    {
      { type = "item",  name = "stone", amount = 2 },
      { type = "fluid", name = "water", amount = 30 }
    },
    results = { { type = "item", name = "sand", amount = 4 } },
    allow_productivity = true,
    enabled = false,
  },
})

if mods["advanced-chemical-plant"] then
  -- use chemical plant for sand washing
  LSlib.entity.addCraftingCategory("assembling-machine", "chemical-plant", "ms-sand-crafting")

  -- crafting speed 8 is way too much
  data.raw["assembling-machine"]["kr-advanced-chemical-plant"].crafting_speed = 2
  ---@diagnostic disable-next-line: undefined-field
  data.raw["assembling-machine"]["kr-advanced-chemical-plant"].working_sound.sound.volume = 0.25
-- else
--   for _, assemblingName in pairs {
--     "assembling-machine-1",
--     "assembling-machine-2",
--     "assembling-machine-3",
--   } do
--     LSlib.entity.addCraftingCategory("assembling-machine", assemblingName, "ms-sand-crafting")
--   end
end
