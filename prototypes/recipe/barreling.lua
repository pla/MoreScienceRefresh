if settings.startup["MS-allow-empty-barrel-recycling"].value == true then
  local barrelRecycling = util.table.deepcopy(data.raw["recipe"]["barrel"])
  barrelRecycling.name = barrelRecycling.name .. "-recycling"

  barrelRecycling.icons = LSlib.item.getIcons("item", "barrel")
  table.insert(barrelRecycling.icons, {
    icon = "__MoreScienceRefresh__/graphics/icons/recycling.png",
    icon_size = 256,
    scale = 32 / 256 * 0.55,
    shift = { 8, -8 },
  })

  barrelRecycling.categories = { "smelting" }
  barrelRecycling.energy_required = 16
  barrelRecycling.ingredients = util.table.deepcopy(barrelRecycling.results)

  barrelRecycling.results = { { type = "item", name = "steel-plate", amount = 1, independent_probability = 0.8 } }
  barrelRecycling.allow_as_intermediate = false

  data:extend({ barrelRecycling })
end
