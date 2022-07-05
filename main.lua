local frame = CreateFrame("FRAME", "myFrame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_DEAD")
frame:RegisterEvent("PLAYER_UNGHOST")

musicEnabled = "0"

local function eventHandler(self, event, addonName)
    if event == "PLAYER_UNGHOST" then
        if (musicEnabled == "1") then
            SetCVar("Sound_EnableMusic",1)
            SetCVar("Sound_AmbienceVolume", 1)
        end
    elseif event == "PLAYER_DEAD" then
        musicEnabled = GetCVar("Sound_EnableMusic")
        SetCVar("Sound_EnableMusic",0)
        SetCVar("Sound_AmbienceVolume", 0)
    end
end
frame:SetScript("OnEvent", eventHandler);