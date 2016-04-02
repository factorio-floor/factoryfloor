data:extend(
{
  {
    type = "item",
    name = "cement",
    icon = "__factoryfloor__/graphics/icons/cement.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "a[items]-b[cement]",
    stack_size = 40
  },
}
)

addRecipe(
    "cement",                        -- item Name
    "crafting",                      -- category
    "raw-resource",                  -- subgroup
    1.4,                             -- time
    {{"limestone", 1}, {"clay", 1}}, -- ingredients
    {{"cement", 2}},                 -- products
    "g3[other]"                      -- menu location
)
