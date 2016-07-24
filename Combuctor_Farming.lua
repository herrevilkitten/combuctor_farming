local CombuctorSet = Combuctor:GetModule("Sets")
local L={}
L["Combuctor_Type_Farming"] = "Farming"
L["Combuctor_Type_All"] = "All"
L["Combuctor_Type_Seeds"] = "Seeds"
L["Combuctor_Type_Tools"] = "Tools"
L["Combuctor_Type_Vegetable"] = "Crops"
L["Combuctor_Type_Special"] = "Special Ingredients"
L["Combuctor_Farming_Tool_Ids"] = {
	89880, -- Dented Shovel
	79104, -- Rusty Watering Can
	80513, -- Vintage Bug Sprayer
	89815, -- Plow
	-1
};
L["Combuctor_Farming_Vegetable_Ids"] = {
	74843, -- Scallions
	74844, -- Red Blossom Leek
	74850, -- White Turnip
	74849, -- Pink Turnip
	74842, -- Mogu Pumpkin
	74840, -- Green Cabbage
	74848, -- Striped Melon
	74846, -- Witchberries
	74841, -- Juicycrunch Carrots
	74847, -- Jade Squash
	91850, -- Orgrimmar Portal Shard
	91860, -- Stormwind Portal Shard
	91861, -- Thunder Bluff Portal Shard
	91862, -- Undercity Portal Shard
	91863, -- Silvermoon Portal Shard
	91864, -- Ironforge Portal Shard
	91865, -- Darnassus Portal Shard
	91866, -- Exodar Portal Shard
	
	-1
};
L["Combuctor_Farming_Seed_Ids"] = {
	80591, -- Scallions
	80593, -- Red Blossom Leek
	80595, -- White Turnip
	80594, -- Pink Turnip
	80592, -- Mogu Pumpkin
	79102, -- Green Cabbage
	89329, -- Striped Melon
	89326, -- Witchberries
	80590, -- Juicycrunch Carrots
	89328, -- Jade Squash
	85267, -- Autumn Blossom Sapling
	85268, -- Spring Blossom Sapling
	85269, -- Winter Blossom Sapling
	85216, -- Enigma Seed
	85217, -- Magebulb Seed
	89202, -- Raptorleaf Seed
	85215, -- Snakeroot Seed
	89197, -- Windshear Cactus Seed
	89233, -- Songbell Seed
	91806, -- Unstable Portal Shard
	-- Seed bags
	80809, -- Green Cabbage
	84782, -- Juicycrunch Carrots
	84783, -- Scallion
	85153, -- Mogu Pumpkin
	85158, -- Red Blossom Leeks
	85162, -- Pink Turnip
	85163, -- White Turnip
	89847, -- Witchberry
	89848, -- Jade Squash
	89849, -- Striped Melon
	95445, -- Songbell
	95447, -- Snakeroot
	95449, -- Enigma
	95451, -- Magebulb
	95454, -- Windshear Cactus
	95457, -- Raptorleaf
	-1
};
L["Combuctor_Farming_Special_Ids"] = {
	74853, -- 100 Year Soy Sauce
	74662, -- Rice Flour
	74661, -- Black Pepper
	-1
};

local function extractItemId(link)
	local tbl = { strsplit(":", strtrim(link, "|")) };
	return tonumber(tbl[2]);
end

local function isInTable(table, itemId)
	for _, id in pairs(table) do
		if ( id == -1 ) then
			break;
		end
		if ( id == itemId ) then
			return true;
		end
	end
	return false;
end

local function isSeed(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
    if ( name == nil or link == nil ) then
		return false;
	end
	return isInTable(L["Combuctor_Farming_Seed_Ids"], extractItemId(link));
end

local function isTool(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
    if ( name == nil or link == nil ) then
		return false;
	end
	return isInTable(L["Combuctor_Farming_Tool_Ids"], extractItemId(link));
end

local function isVegetable(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
    if ( name == nil or link == nil ) then
		return false;
	end
	return isInTable(L["Combuctor_Farming_Vegetable_Ids"], extractItemId(link));
end

local function isSpecial(player, bagType, name, link, quality, level, ilvl, type, subType, stackCount, equipLoc)
    if ( name == nil or link == nil ) then
		return false;
	end
	return isInTable(L["Combuctor_Farming_Special_Ids"], extractItemId(link));
end

local function isFarming(...)
	return (isSeed(...) or isTool(...) or isVegetable(...) or isSpecial(...));
end

CombuctorSet:Register(L["Combuctor_Type_Farming"], "Interface/Icons/INV_Misc_Plant_02", isFarming);
CombuctorSet:RegisterSubSet(L["Combuctor_Type_All"], L["Combuctor_Type_Farming"], nil, isFarming);
CombuctorSet:RegisterSubSet(L["Combuctor_Type_Seeds"], L["Combuctor_Type_Farming"], nil, isSeed);
CombuctorSet:RegisterSubSet(L["Combuctor_Type_Tools"], L["Combuctor_Type_Farming"], nil, isTool);
CombuctorSet:RegisterSubSet(L["Combuctor_Type_Vegetable"], L["Combuctor_Type_Farming"], nil, isVegetable);
CombuctorSet:RegisterSubSet(L["Combuctor_Type_Special"], L["Combuctor_Type_Farming"], nil, isSpecial);
