-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations
    Tracker:AddLocations("locations/locations.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/princess/princess_static.jsonc")
Tracker:AddLayouts("layouts/voice/voice_static.jsonc")
Tracker:AddLayouts("layouts/blade/blade_none.jsonc")
Tracker:AddLayouts("layouts/misc/sword_off.jsonc")
Tracker:AddLayouts("layouts/misc/gift_off.jsonc")
Tracker:AddLayouts("layouts/misc/narrator_off.jsonc")
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")
Tracker:AddLayouts("layouts/settings.jsonc")


function UpdatePrincess()
    if Tracker:FindObjectForCode("chapter_access_rando").CurrentStage % 2 == 1 then
        Tracker:AddLayouts("layouts/princess/princess_toggle.jsonc")
    else
        Tracker:AddLayouts("layouts/princess/princess_static.jsonc")
    end
end

UpdatePrincess()
ScriptHost:AddWatchForCode("chapter_access_rando_princess", "chapter_access_rando_princess", UpdatePrincess)

function UpdateVoice()
    if Tracker:FindObjectForCode("chapter_access_rando").CurrentStage > 1 then
        Tracker:AddLayouts("layouts/voice/voice_toggle.jsonc")
    else
        Tracker:AddLayouts("layouts/voice/voice_static.jsonc")
    end
end

UpdateVoice()
ScriptHost:AddWatchForCode("chapter_access_rando_voice", "chapter_access_rando_voice", UpdateVoice)

function UpdateBlade()
    if Tracker:FindObjectForCode("pristine_blade_rando").CurrentStage == 0 then
        Tracker:AddLayouts("layouts/blade/blade_none.jsonc")
    elseif Tracker:FindObjectForCode("pristine_blade_rando").CurrentStage == 1 then
        Tracker:AddLayouts("layouts/blade/blade_single.jsonc")
    elseif Tracker:FindObjectForCode("pristine_blade_rando").CurrentStage == 2 then
        Tracker:AddLayouts("layouts/blade/blade_chapter.jsonc")
    else
        Tracker:AddLayouts("layouts/blade/blade_princess.jsonc")        
    end
end

UpdateBlade()
ScriptHost:AddWatchForCode("pristine_blade_rando", "pristine_blade_rando", UpdateBlade)

function UpdateSword()
    if Tracker:FindObjectForCode("pristine_sword_rando").Active then
        Tracker:AddLayouts("layouts/misc/sword_toggle.jsonc")
    else
        Tracker:AddLayouts("layouts/misc/sword_off.jsonc")
    end
end

UpdateSword()
ScriptHost:AddWatchForCode("pristine_sword_rando", "pristine_sword_rando", UpdateSword)

function UpdateGifts()
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 then
        Tracker:AddLayouts("layouts/misc/gift_consumable.jsonc")
    else
        Tracker:AddLayouts("layouts/misc/gift_off.jsonc")
    end
end

UpdateGifts()
ScriptHost:AddWatchForCode("gift_rando", "gift_rando", UpdateGifts)

function UpdateNarrator()
    if Tracker:FindObjectForCode("narrator_rando").Active then
        Tracker:AddLayouts("layouts/misc/narrator_toggle.jsonc")
    else
        Tracker:AddLayouts("layouts/misc/narrator_off.jsonc")
    end
end

UpdateNarrator()
ScriptHost:AddWatchForCode("narrator_rando", "narrator_rando", UpdateNarrator)

function UpdateMemories()
    if Tracker:FindObjectForCode("memories_sanity").CurrentStage == 2 then
        Tracker:AddLayouts("layouts/misc/memory_hunt_consumable.jsonc")
    else
        Tracker:AddLayouts("layouts/misc/memory_hunt_off.jsonc")
    end
end

UpdateMemories()
ScriptHost:AddWatchForCode("memories_sanity", "memories_sanity", UpdateMemories)

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end