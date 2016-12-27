SellOrnateItems = {}
SellOrnateItems.name = "SellOrnateItems"
 
function SellOrnateItems:Initialize()
    EVENT_MANAGER:RegisterForEvent(self.name, EVENT_OPEN_STORE, self.OnVendorOpen)
    EVENT_MANAGER:RegisterForEvent(self.name, EVENT_CLOSE_STORE, self.OnVendorClose)
end
 
function SellOrnateItems.OnAddOnLoaded(event, addonName)
    if addonName == SellOrnateItems.name then
        SellOrnateItems:Initialize()
        SellOrnateItemsIndicator:SetHidden(true)
     end
end
 
function SellOrnateItems.OnVendorOpen(event)
    SellOrnateItemsIndicator:SetHidden(false)
end

function SellOrnateItems.OnVendorClose(event)
    SellOrnateItemsIndicator:SetHidden(true)
end

function SellOrnateItems.SellTrash()
    local slotId = 0
    local bagsize = GetBagSize(1)
    local totalAmount = 0
    local itemCount = 0
    for slotId = 0,bagsize do
        if GetItemTrait(1,slotId)==ITEM_TRAIT_TYPE_ARMOR_ORNATE or GetItemTrait(1,slotId)==ITEM_TRAIT_TYPE_WEAPON_ORNATE or GetString("SI_ITEMTRAITTYPE",GetItemTrait(1,slotId))=="Ornate" then
            SellInventoryItem(1,slotId,1)
            local value = GetItemSellValueWithBonuses(1,slotId)
            totalAmount = totalAmount + value
            itemCount = itemCount + 1
            d("Sold: " .. GetItemLink(1,slotId,1) .. " for " .. value .. " gold")
        end 
    end
    d("Sold " .. itemCount .. " items for a total of " .. totalAmount .. " gold")
end

EVENT_MANAGER:RegisterForEvent(SellOrnateItems.name, EVENT_ADD_ON_LOADED, SellOrnateItems.OnAddOnLoaded)
