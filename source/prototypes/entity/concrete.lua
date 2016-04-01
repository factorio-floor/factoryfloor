
data:extend(
{
  {
    type = "item",
    name = "concrete",
    icon = "__factoryfloor__/graphics/icons/concrete.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "a[items]-b[concrete]",
    stack_size = 200
  }
}
)

addRecipe(
    "concrete",                      -- item Name
    "advanced-crafting",             -- category
    "raw-resource",                  -- subgroup
    3,                               -- time
    {{"cement", 4}, {"gravel", 8}, {"sand", 2}, {["type"] = "fluid", ["name"] = "water", ["amount"] = 2}}, -- ingredients
    {{"concrete", 4}},               -- products
    "g3[other]"                      -- menu location
)

-- Place as tile: --
data.raw["item"]["concrete"].place_as_tile = {
    result = "concrete-marker",
    condition_size = 3,
    condition = { "water-tile" }
}
