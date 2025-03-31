
data:extend{{
  type = "recipe",
  name = "rocket-assembling-machine",
  energy_required = 25,
  category = "crafting",
  ingredients =
  {
    {type="item", name="assembling-machine-3", amount=1},
    {type="item", name="low-density-structure", amount=10},
    {type="item", name="processing-unit", amount=10},
  },
  results = {{type="item", name="rocket-assembling-machine", amount=1}},
  enabled = false,
}}

if settings.startup["MS-rocket-launching-extended"].value == true then

  data:extend{{
    type = "recipe",
    name = "science-cauldron",
    --energy_required = 25,
    category = "crafting",
    ingredients =
    {
      {type="item", name="storage-tank", amount=1},
      {type="item", name="electric-furnace", amount=1},
      {type="item", name="pipe-to-ground", amount=8},
    },
    results = {{type="item", name="science-cauldron", amount=1}},
    enabled = false,
  }}
  
end
