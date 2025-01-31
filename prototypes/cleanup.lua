-- cleanup tech tree
local scienceNames    = require("__MoreScience__/prototypes/settings").scienceNames

-- rocket cauldron


if settings.startup["msr-early-fluid-wagon"].value == true then
  LSlib.technology.removeIngredient("fluid-wagon",string.format(scienceNames.cyan, "pack"))
  LSlib.technology.removeIngredient("fluid-wagon",string.format(scienceNames.blue, "pack"))

  LSlib.technology.removePrerequisite("fluid-wagon", "fluid-handling-3")
  LSlib.technology.addPrerequisite("fluid-wagon", "fluid-handling-2")

  
  -- LSlib.technology.removeIngredient("automated-rail-transportation",string.format(scienceNames.orange, "pack"))
  -- LSlib.technology.removePrerequisite("automated-rail-transportation", string.format(scienceNames.orange, "pack"))

  -- LSlib.technology.addPrerequisite("braking-force-1", string.format(scienceNames.orange, "pack"))

end