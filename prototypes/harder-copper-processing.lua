-- Requirement: --
require "prototypes.bigger-furnaces"
require "prototypes.dirt"
require "prototypes.gravel"
require "prototypes.crusher"
require "prototypes.pulverizer"

-- Minable ressources: --
data.raw["resource"]["copper-ore"].minable.result = nil
data.raw["resource"]["copper-ore"].minable.results = {
	ressourceItemMinMaxProb("copper-ore",   1, 1, 0.75), -- 1 item at percentage 0.75 --
	ressourceItemMinMaxProb("gravel",       1, 1, 0.5),
	ressourceItemMinMaxProb("copper-sludge",1, 1, 0.4),
	ressourceItemMinMaxProb("dirt",         1, 1, 0.2)
}

-- Item groups: --
data:extend({
  {
    type = "item-subgroup",
    name = "copper",
    group = "intermediate-products",
    order = "b3"
  }
})

-- Items: --
data.raw.item["copper-ore"].subgroup = "copper"
addItem("copper-sulfat","copper","f[copper-ore]4",50)
addItem("copper-dust","copper","f[copper-ore]3",50)
addItem("copper-sludge","copper","f[copper-ore]2",50)

addItem("sulfur-dust","raw-material","f2[sulfur]",50)

-- Calculate ore->plate factor for Recipes
local c = data.raw["recipe"]["copper-plate"]

local function searchOreAmount(tableOfIngredients,nameToSearch)
	for _,t in pairs(tableOfIngredients) do
		if t[1] == nameToSearch then return t[2] end
	end
	return 0
end

local resultingCount = c.result_count
if not resultingCount then resultingCount=1 end
local copperOreToPlateFactor = resultingCount / searchOreAmount(c.ingredients,"copper-ore")
logging.info("1x Copper-ore = "..tostring(copperOreToPlateFactor).."x copper-plate")

local function c(amount)
	return math.ceil(amount*copperOreToPlateFactor)
end

-- Recipes: --
data.raw["recipe"]["copper-plate"] = nil
--       item Name     category   subgroup     time    ingredients     			products		order
-- Tier1
addRecipe("copper-plate","smelting","copper",6,{{"copper-ore",3}},					{{"copper-plate",c(1)},{"copper-sludge",2}},"a")

-- Tier2
addRecipe("copper-sludge","crusher","copper",4,{{"copper-sludge",2}},			{{"copper-dust",1},{"gravel",1}},"b")
data.raw["recipe"]["copper-sludge"].icon = "__factoryfloor__/graphics/icons/sludge-processing.png"
addTechnologyUnlocksRecipe("crusher","copper-sludge")
addRecipe("copper-plate|dust","smelting","copper",1.75,{{"copper-dust",1}},	{{"copper-plate",c(1)}},"c")
addTechnologyUnlocksRecipe("crusher","copper-plate|dust")

-- Tier3
addRecipe("copper-dust","pulverizer","copper",6,{{"copper-ore",4},{"gravel",3}},{{"copper-dust",4},{"sulfur-dust",2}},"d")
addTechnologyUnlocksRecipe("pulverizer","copper-dust")
addRecipe("sulfur|dust","crafting","raw-material",2,{{"sulfur-dust",10}},{{"sulfur",1}},"f3[sulfur]")
addTechnologyUnlocksRecipe("pulverizer","sulfur|dust")

addRecipe("sulfur-dust","pulverizer","raw-material",2,{{"sulfur",1}},{{"sulfur-dust",8}},"f2[sulfur]")
addTechnologyUnlocksRecipe("pulverizer","sulfur-dust")

-- Tier4
addRecipe("copper-sulfat","crafting","copper",2,{{"copper-dust",9},{"sulfur-dust",5}},{{"copper-sulfat",10}},"f")
addTechnologyUnlocksRecipe("oil-processing","copper-sulfat")
addRecipe("copper-plate|sulfat","chemistry","copper",2,
	{{type="item",name="copper-sulfat",amount=6},{type="fluid",name="water",amount=1}},
	{{"copper-plate",c(7)},{"sulfuric-acid",0.5},{"gravel",1}},"g")
addTechnologyUnlocksRecipe("oil-processing","copper-plate|sulfat")