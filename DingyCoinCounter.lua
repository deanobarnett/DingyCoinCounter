local ITEM_VALUE_MAP = {
	{ id = 112995, value = 2 },
	{ id = 112996, value = 3 },
	{ id = 112997, value = 4 },
	{ id = 113000, value = 4 },
	{ id = 112998, value = 5 },
	{ id = 113001, value = 6 },
	{ id = 112999, value = 6 },
	{ id = 113004, value = 6 },
	{ id = 113002, value = 8 },
	{ id = 113003, value = 10 },
	{ id = 113005, value = 12 },
	{ id = 113006, value = 18 },
	{ id = 113008, value = 20 },
	{ id = 113007, value = 20 },
	{ id = 127398, value = 40 },
	{ id = 127406, value = 40 },
	{ id = 127400, value = 50 },
	{ id = 127404, value = 50 },
	{ id = 127402, value = 60 },
	{ id = 127407, value = 60 },
	{ id = 127409, value = 250 }
}

local function CountPickPocketCoins()
	total = 0

	for index, item in pairs(ITEM_VALUE_MAP) do 
		total = total + (GetItemCount(item.id) * item.value) 
	end

	return total
end

local function PrettyCoinMessage(total)
	print("You have collected the value of" .. total .. "Dingy Coins")
end

local myButton = CreateFrame("Button", "DingyCoinButton", UIParent, 'UIPanelButtonTemplate')
myButton:SetMovable(true)
myButton:EnableMouse(true)
myButton:RegisterForDrag("LeftButton")
myButton:SetScript("OnDragStart", myButton.StartMoving)
myButton:SetScript("OnDragStop", myButton.StopMovingOrSizing)

myButton:SetSize(100,50)
myButton:SetPoint("CENTER",200,0)
myButton:SetText('Total Coins')
myButton:RegisterForClicks("LeftButtonUp")
myButton:SetScript("OnClick", function() print(CountPickPocketCoins()) end)
myButton:SetAlpha(0.2)
myButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
myButton:SetScript("OnLeave", function(self) self:SetAlpha(0.2) end)
