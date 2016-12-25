SellOrnateItems = {}
SellOrnateItems.name = "SellOrnateItems"
 
function SellOrnateItems:Initialize()
	EVENT_MANAGER:RegisterForEvent(self.name, EVENT_OPEN_STORE, self.OnVendorOpen)
end
 
function SellOrnateItems.OnAddOnLoaded(event, addonName)
  if addonName == SellOrnateItems.name then
    SellOrnateItems:Initialize()
  end
end
 
function SellOrnateItems.OnVendorOpen(event)

end
 
EVENT_MANAGER:RegisterForEvent(SellOrnateItems.name, EVENT_ADD_ON_LOADED, SellOrnateItems.OnAddOnLoaded)