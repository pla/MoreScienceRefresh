local rocketParts = require ("prototypes/settings").rocketParts

--------------------------------------------------------------------------------
----- Rocket-MK1                                                           -----
--------------------------------------------------------------------------------
data.raw["recipe"]["rocket-part"].energy_required = data.raw["recipe"]["rocket-part"].energy_required * 100
data.raw["recipe"]["rocket-part"].hidden = nil
data.raw["recipe"]["rocket-part"].ingredients =
{
  {type = "item",name = rocketParts.hull   ,amount = 30},
  {type = "item",name = rocketParts.engine1,amount = 05},
  {type = "item",name = rocketParts.engine2,amount = 01},
  {type = "item",name = rocketParts.power  ,amount = 02},
  {type = "item",name = rocketParts.defence,amount = 03},
  {type = "item",name = rocketParts.attack ,amount = 03},
}
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 1
