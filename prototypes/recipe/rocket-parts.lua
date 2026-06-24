local rocketParts = require ("prototypes/settings").rocketParts

local hullComponent =
{
  type = "recipe",
  name = rocketParts.hull,
  energy_required = 40,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="low-density-structure", amount=25},
    {type="item", name="processing-unit", amount=10},
  },
  results = {{type="item", name=rocketParts.hull, amount=1}},
}

local ionThruster =
{
  type = "recipe",
  name = rocketParts.engine1,
  energy_required = hullComponent.energy_required * 3,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="low-density-structure", amount=10},
    {type="item", name="rocket-fuel", amount=75},
    {type="item", name="processing-unit", amount=80},
  },
  results = {{type="item", name=rocketParts.engine1, amount=1}},
}

local ionBooster =
{
  type = "recipe",
  name = rocketParts.engine2,
  energy_required = ionThruster.energy_required * (5 + 5),
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="low-density-structure", amount=30},
    {type="item", name="rocketpart-ion-thruster", amount=5},
    {type="item", name="rocket-fuel", amount=150}, -- 1000 - (5+5)*75 - 100
    {type="item", name="processing-unit", amount=40},
  },
  results = {{type="item", name=rocketParts.engine2, amount=1}},
}

local fusionReactor =
{
  type = "recipe",
  name = rocketParts.power,
  energy_required = ionBooster.energy_required / 2,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="fission-reactor-equipment", amount=1},
    {type="item", name="processing-unit", amount=15},
    {type="item", name="nuclear-fuel", amount=50},
  },
  results = {{type="item", name=rocketParts.power, amount=1}},
}

local shieldArray =
{
  type = "recipe",
  name = rocketParts.defence,
  energy_required = ionBooster.energy_required / 3,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="low-density-structure", amount=20},
    {type="item", name="processing-unit", amount=50},
    {type="item", name="energy-shield-mk2-equipment", amount=5},
    {type="item", name="radar", amount=10},
  },
  results = {{type="item", name=rocketParts.defence, amount=1}},
}

local laserArray =
{
  type = "recipe",
  name = rocketParts.attack,
  energy_required = shieldArray.energy_required,
  enabled = false,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="low-density-structure", amount=20},
    {type="item", name="processing-unit", amount=50},
    {type="item", name="discharge-defense-equipment", amount=5},
    {type="item", name="radar", amount=10},
  },
  results = {{type="item", name=rocketParts.attack, amount=1}},
}

local payloadContainer =
{
  type = "recipe",
  name = string.format(rocketParts.container, "mk1"),
  energy_required = fusionReactor.energy_required / 2,
  category = rocketParts.category,
  ingredients =
  {
    {type="item", name="low-density-structure", amount=5},
    {type="item", name="flying-robot-frame", amount=1}
  },
  results = {{type="item", name=string.format(rocketParts.container, "mk1"), amount=1}},
  enabled = false,
}

-- Rocket MK1 calculation:
data:extend({    --      amount:   lds    rcu    rf
  hullComponent, --      30        25     1      0

  ionThruster  , --      5 (+5)    10     60     75
  ionBooster   , --      1         30     40     150

  fusionReactor, --      2         0      15     (50)

  shieldArray  , --      3         20     50     0
  laserArray   , --      3         20     50     0
                 --               ----    ----   ----
                 --     total:    1000    1000   1000

  payloadContainer,
})
