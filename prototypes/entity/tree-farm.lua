local animationLayer = {}

--------------------------------------------------------------------------------
----- seed-extractor                                                       -----
--------------------------------------------------------------------------------
local seedExtractor = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
seedExtractor.name = "seed-extractor"
seedExtractor.icon = "__MoreScienceRefresh__/graphics/icons/seed-extractor.png"
seedExtractor.icon_size = 32
assert(seedExtractor.minable)
seedExtractor.minable.result = seedExtractor.name
seedExtractor.fast_replaceable_group = "ms-seed-extractor"
seedExtractor.next_upgrade = nil
seedExtractor.crafting_categories = {"ms-seed-extractor"}
seedExtractor.crafting_speed = 1
seedExtractor.ingredient_count = 2
seedExtractor.energy_usage = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].energy_usage)
---@diagnostic disable-next-line:need-check-nil
seedExtractor.graphics_set.animation.layers =  {}
---@diagnostic disable-next-line:need-check-nil
animationLayer = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].graphics_set.animation.layers[1]) or {}
animationLayer.filename = "__MoreScienceRefresh__/graphics/entity/seed-extractor/seed-extractor.png"
animationLayer.line_length = 5
animationLayer.frame_count = 5 * animationLayer.line_length
animationLayer.width = 800 / animationLayer.line_length
animationLayer.height = 800 / (animationLayer.frame_count / animationLayer.line_length)
animationLayer.shift = util.by_pixel(0, 2)
animationLayer.scale = .95
animationLayer.animation_speed = 0.25
animationLayer.repeat_count = nil
---@diagnostic disable-next-line:need-check-nil
table.insert(seedExtractor.graphics_set.animation.layers, util.table.deepcopy(animationLayer))

--------------------------------------------------------------------------------
----- wood-plantation                                                      -----
--------------------------------------------------------------------------------
local woodPlantation = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
woodPlantation.name = "wood-plantation"
woodPlantation.icon = "__MoreScienceRefresh__/graphics/icons/wood-plantation.png"
woodPlantation.icon_size = 32
assert(woodPlantation.minable)
woodPlantation.minable.result = woodPlantation.name
woodPlantation.fast_replaceable_group = "ms-wood-plantation"
woodPlantation.next_upgrade = nil
woodPlantation.crafting_categories = {"ms-wood-plantation"}
woodPlantation.crafting_speed = 1
woodPlantation.ingredient_count = 1
woodPlantation.energy_usage = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].energy_usage)
woodPlantation.selection_box = util.table.deepcopy(data.raw["assembling-machine"]["oil-refinery"].selection_box)
woodPlantation.collision_box = util.table.deepcopy(data.raw["assembling-machine"]["oil-refinery"].collision_box)
woodPlantation.fluid_boxes = nil
---@diagnostic disable-next-line:need-check-nil
woodPlantation.graphics_set.animation.layers = {}
animationLayer={}
---@diagnostic disable-next-line:need-check-nil, assign-type-mismatch
animationLayer = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].graphics_set.animation.layers[1])
assert(animationLayer ~= nil)
animationLayer.filename = "__MoreScienceRefresh__/graphics/entity/wood-plantation/wood-plantation.png"
animationLayer.line_length = 6
animationLayer.frame_count = 6 * animationLayer.line_length
animationLayer.width = 1344 / animationLayer.line_length
animationLayer.height = 1344 / (animationLayer.frame_count / animationLayer.line_length)
animationLayer.shift = util.by_pixel(0, 2)
animationLayer.scale = 1
---@diagnostic disable-next-line:need-check-nil
table.insert(woodPlantation.graphics_set.animation.layers, util.table.deepcopy(animationLayer))



data:extend{
  seedExtractor,
  woodPlantation,
}
