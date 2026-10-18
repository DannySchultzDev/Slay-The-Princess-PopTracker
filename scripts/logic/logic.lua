local princess_dict = {
    ["Razor"] = "razor_toggle",
    ["Adversary"] = "adversary_toggle",
    ["Tower"] = "tower_toggle",
    ["Spectre"] = "spectre_toggle",
    ["Nightmare"] = "nightmare_toggle",
    ["Stranger"] = "stranger_toggle",
    ["Beast"] = "beast_toggle",
    ["Witch"] = "witch_toggle",
    ["Prisoner"] = "prisoner_toggle",
    ["Damsel"] = "damsel_toggle",
    ["Needle"] = "needle_toggle",
    ["Fury"] = "fury_toggle",
    ["Apotheosis"] = "apotheosis_toggle",
    ["Dragon"] = "dragon_toggle",
    ["Wraith"] = "wraith_toggle",
    ["Clarity"] = "clarity_toggle",
    ["Den"] = "den_toggle",
    ["Wild"] = "wild_toggle",
    ["Thorn"] = "thorn_toggle",
    ["Cage"] = "cage_toggle",
    ["Grey"] = "grey_toggle",
    ["Happy"] = "happy_toggle",
    ["Shifting Mound"] = "shifting_mound_toggle",
}

function has_princess(princess)
    if Tracker:FindObjectForCode("chapter_access_rando").CurrentStage % 2 == 0 then
        return true
    else
        return Tracker:FindObjectForCode(princess_dict[princess]).Active
    end
end

local voice_dict = {
    ["Cheated"] = "cheated_toggle",
    ["Stubborn"] = "stubborn_toggle",
    ["Broken"] = "broken_toggle",
    ["Cold"] = "cold_toggle",
    ["Paranoid"] = "paranoid_toggle",
    ["Contrarian"] = "contrarian_toggle",
    ["Hunted"] = "hunted_toggle",
    ["Opportunist"] = "opportunist_toggle",
    ["Skeptic"] = "skeptic_toggle",
    ["Smitten"] = "smitten_toggle",
}

function has_voice(voice)
    if Tracker:FindObjectForCode("chapter_access_rando").CurrentStage < 2 then
        return true
    else
        return Tracker:FindObjectForCode(voice_dict[voice]).Active
    end
end

function has_all_voices()
    return has_voice("Cheated") and has_voice("Stubborn") and has_voice("Broken") and has_voice("Cold") and has_voice("Paranoid") and has_voice("Contrarian") and has_voice("Hunted") and has_voice("Opportunist") and has_voice("Skeptic") and has_voice("Smitten")
end

local blade_chapter_dict = {
    ["Princess"] = "pristine_blade_chapter_1",
    ["Razor"] = "pristine_blade_chapter_2",
    ["Adversary"] = "pristine_blade_chapter_2",
    ["Tower"] = "pristine_blade_chapter_2",
    ["Spectre"] = "pristine_blade_chapter_2",
    ["Nightmare"] = "pristine_blade_chapter_2",
    ["Stranger"] = "pristine_blade_chapter_2",
    ["Beast"] = "pristine_blade_chapter_2",
    ["Witch"] = "pristine_blade_chapter_2",
    ["Prisoner"] = "pristine_blade_chapter_2",
    ["Damsel"] = "pristine_blade_chapter_2",
    ["Needle"] = "pristine_blade_chapter_3",
    ["Fury"] = "pristine_blade_chapter_3",
    ["Apotheosis"] = "pristine_blade_chapter_3",
    ["Dragon"] = "pristine_blade_chapter_3",
    ["Clarity"] = "pristine_blade_chapter_3",
    ["Den"] = "pristine_blade_chapter_3",
    ["Wild"] = "pristine_blade_chapter_3",
    ["Thorn"] = "pristine_blade_chapter_3",
    ["Cage"] = "pristine_blade_chapter_3",
    ["Grey"] = "pristine_blade_chapter_3",
    ["Happy"] = "pristine_blade_chapter_3",
    ["Shifting Mound"] = "pristine_blade_chapter_4",
}

local blade_princess_dict = {
    ["Princess"] = "pristine_blade_princess",
    ["Razor"] = "pristine_blade_razor",
    ["Adversary"] = "pristine_blade_adversary",
    ["Tower"] = "pristine_blade_tower",
    ["Spectre"] = "pristine_blade_spectre",
    ["Nightmare"] = "pristine_blade_nightmare",
    ["Stranger"] = "pristine_blade_stranger",
    ["Beast"] = "pristine_blade_beast",
    ["Witch"] = "pristine_blade_witch",
    ["Prisoner"] = "pristine_blade_prisoner",
    ["Damsel"] = "pristine_blade_damsel",
    ["Needle"] = "pristine_blade_needle",
    ["Fury"] = "pristine_blade_fury",
    ["Apotheosis"] = "pristine_blade_apotheosis",
    ["Dragon"] = "pristine_blade_dragon",
    ["Clarity"] = "pristine_blade_clarity",
    ["Den"] = "pristine_blade_den",
    ["Wild"] = "pristine_blade_wild",
    ["Thorn"] = "pristine_blade_thorn",
    ["Cage"] = "pristine_blade_cage",
    ["Grey"] = "pristine_blade_grey",
    ["Happy"] = "pristine_blade_happy",
    ["Shifting Mound"] = "pristine_blade_shifting_mound",
}

function has_blade(princess)
    if Tracker:FindObjectForCode("pristine_blade_rando").CurrentStage == 0 then
        return true
    elseif Tracker:FindObjectForCode("pristine_blade_rando").CurrentStage == 1 then
        return Tracker:FindObjectForCode("pristine_blade_toggle").Active
    elseif Tracker:FindObjectForCode("pristine_blade_rando").CurrentStage == 2 then
        return Tracker:FindObjectForCode(blade_chapter_dict[princess]).Active
    else
        return Tracker:FindObjectForCode(blade_princess_dict[princess]).Active
    end
end

function has_sword()
    if Tracker:FindObjectForCode("pristine_sword_rando").Active then
        return Tracker:FindObjectForCode("pristine_sword").Active
    else
        return true
    end
end

local generic_princess_reqs = {
    ["Razor"] = function() 
        return has_princess("Razor") and has_voice("Cheated") and has_blade("Princess") 
    end,
    ["Adversary"] = function()
        return has_princess("Adversary") and has_voice("Stubborn") and has_blade("Princess")
    end,
    ["Tower"] = function()
        return has_princess("Tower") and has_voice("Broken") and has_blade("Princess")
    end,
    ["Spectre"] = function()
        return has_princess("Spectre") and has_voice("Cold") and has_blade("Princess")
    end,
    ["Nightmare"] = function()
        return has_princess("Nightmare") and has_voice("Paranoid")
    end,
    ["Stranger"] = function()
        return has_princess("Stranger") and has_voice("Contrarian")
    end,
    ["Beast"] = function()
        return has_princess("Beast") and has_voice("Hunted") and has_blade("Princess")
    end,
    ["Witch"] = function()
        return has_princess("Witch") and has_voice("Opportunist") and has_blade("Princess")
    end,
    ["Prisoner"] = function()
        return has_princess("Prisoner") and has_voice("Skeptic") and has_blade("Princess")
    end,
    ["Damsel"] = function()
        return has_princess("Damsel") and has_voice("Smitten")
    end,
    ["Needle"] = function()
        return has_princess("Needle") and has_access_to_generic_princess("Adversary") and (has_voice("Skeptic") or has_voice("Hunted")) and has_blade("Adversary")
    end,
    ["Fury"] = function()
        return has_princess("Fury") and ((has_access_to_generic_princess("Adversary") and (has_voice("Contrarian") or has_voice("Cold") or has_voice("Broken"))) or (has_access_to_generic_princess("Tower") and has_voice("Stubborn") and has_voice("Cold") and has_voice("Smitten") and has_voice("Hunted") and has_voice("Cheated") and has_blade("Tower")))
    end,
    ["Apotheosis"] = function()
        return has_princess("Apotheosis") and has_access_to_generic_princess("Tower") and (has_voice("Paranoid") or (has_voice("Contrarian") and has_blade("Tower")))
    end,
    ["Dragon"] = function()
        return has_princess("Dragon") and has_access_to_generic_princess("Spectre") and has_voice("Opportunist") and has_blade("Spectre")
    end,
    ["Wraith"] = function()
        return has_princess("Wraith") and ((has_access_to_generic_princess("Spectre") and (has_voice("Paranoid") or has_voice("Cheated"))) or (has_access_to_generic_princess("Nightmare") and (has_voice("Cold") or has_voice("Opportunist")) and has_blade("Nightmare")))
    end,
    ["Clarity"] = function()
        return has_princess("Clarity") and has_access_to_generic_princess("Nightmare") and has_all_voices()
    end,
    ["Den"] = function()
        return has_princess("Den") and has_access_to_generic_princess("Beast") and (has_voice("Skeptic") or (has_voice("Stubborn") and has_blade("Beast")))
    end,
    ["Wild"] = function()
        return has_princess("Wild") and ((has_access_to_generic_princess("Beast") and (has_voice("Broken") or has_voice("Contrarian") or ((has_voice("Stubborn") or has_voice("Opportunist")) and has_blade("Beast")))) or (has_access_to_generic_princess("Witch") and (has_voice("Paranoid") or ((has_voice("Stubborn") or has_voice("Cheated")) and has_blade("Witch")))))
    end,
    ["Thorn"] = function()
        return has_princess("Thorn") and has_access_to_generic_princess("Witch") and (has_voice("Cheated") or has_voice("Smitten")) and has_blade("Witch")
    end,
    ["Cage"] = function()
        return has_princess("Cage") and has_access_to_generic_princess("Prisoner") and (has_voice("Cheated") or has_voice("Broken") or (has_voice("Paranoid") and has_blade("Prisoner")))
    end,
    ["Grey"] = function()
        return has_princess("Grey") and ((has_access_to_generic_princess("Prisoner") and has_voice("Cold") and has_blade("Prisoner")) or (has_access_to_generic_princess("Damsel") and has_voice("Cold") and has_blade("Damsel")))
    end,
    ["Happy"] = function()
        return has_princess("Happy") and has_access_to_generic_princess("Damsel") and (has_voice("Skeptic") or has_voice("Opportunist"))
    end,
}

function has_access_to_generic_princess(princess)
    return generic_princess_reqs[princess]()
end

local specific_princess_reqs_blade = {
    ["Needle|Skeptic|Adversary"] = true,
    ["Needle|Hunted|Adversary"] = true,
    ["Fury|Contrarian|Adversary"] = false,
    ["Fury|Cold|Adversary"] = false,
    ["Fury|Broken|Adversary"] = false,
    ["Fury|Stubborn|Tower"] = true,
    ["Apotheosis|Contrarian|Tower"] = true,
    ["Apotheosis|Paranoid|Tower"] = false,
    ["Dragon|Opportunist|Spectre"] = true,
    ["Wraith|Paranoid|Spectre"] = false,
    ["Wraith|Cheated|Spectre"] = false,
    ["Wraith|Cold|Nightmare"] = true,
    ["Wraith|Opportunist|Nightmare"] = true,
    ["Den|Skeptic|Beast"] = false,
    ["Den|Stubborn|Beast"] = true,
    ["Wild|Broken|Beast"] = false,
    ["Wild|Contrarian|Beast"] = false,
    ["Wild|Stubborn|Beast"] = true,
    ["Wild|Opportunist|Beast"] = true,
    ["Wild|Paranoid|Witch"] = false,
    ["Wild|Cheated|Witch"] = true,
    ["Wild|Stubborn|Witch"] = true,
    ["Cage|Cheated|Prisoner"] = false,
    ["Cage|Broken|Prisoner"] = false,
    ["Cage|Paranoid|Prisoner"] = true,
    ["Grey|Cold|Prisoner"] = true,
    ["Grey|Cold|Damsel"] = true,
    ["Happy|Skeptic|Damsel"] = false,
    ["Happy|Opportunist|Damsel"] = false
}

function has_access_to_specific_princess(princess, voice, prev_princess)
    if princess == "Fury" and prev_princess == "Tower" then
        return has_princess("Fury") and has_voice("Stubborn") and has_voice("Cold") and has_voice("Smitten") and has_voice("Hunted") and has_voice("Cheated") and has_access_to_generic_princess("Tower") and has_blade("Tower")
    else
        return has_princess(princess) and has_voice(voice) and has_access_to_generic_princess(prev_princess) and (has_blade(prev_princess) or not specific_princess_reqs_blade[princess .. "|" .. voice .. "|" .. prev_princess])
    end
end

function has_access_to_the_shifting_mound()
    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 0 then
        return true
    end
    return Tracker:FindObjectForCode("gifts").AcquiredCount > 0
end

function accessible_gifts()

    possible_gifts = 0
    if has_access_to_generic_princess("Razor") and has_all_voices() then
        possible_gifts = possible_gifts + 1
    end
    if (has_access_to_generic_princess("Adversary") and has_blade("Adversary")) or has_access_to_specific_princess("Fury", "Contrarian", "Adversary") or has_access_to_specific_princess("Fury", "Cold", "Adversary") or has_access_to_specific_princess("Fury", "Broken", "Adversary") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Tower") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Spectre") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Nightmare") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Stranger") and has_blade("Stranger") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Beast") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Witch") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Prisoner") then
        possible_gifts = possible_gifts + 1
    end
    if has_access_to_generic_princess("Damsel") then
        possible_gifts = possible_gifts + 1
    end

    return possible_gifts

end

function has_access_to_the_end_of_everything()

    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 5 then
        return false
    end
    if Tracker:FindObjectForCode("narrator_rando").Active and not Tracker:FindObjectForCode("narrator").Active then
        return false
    end

    return accessible_gifts() >= 5

end

function has_access_to_first_mirror()

    return accessible_gifts() >= 1

end

function has_access_to_second_mirror()

    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 1 then
        return false
    end

    return accessible_gifts() >= 2

end

function has_access_to_third_mirror()

    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 2 then
        return false
    end

    return accessible_gifts() >= 3

end

function has_access_to_fourth_mirror()

    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 3 then
        return false
    end

    return accessible_gifts() >= 4

end

function has_access_to_fifth_mirror()

    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 4 then
        return false
    end

    return accessible_gifts() >= 5

end

function has_access_to_the_narrator_mirror()

    if Tracker:FindObjectForCode("narrator_rando").Active and not Tracker:FindObjectForCode("narrator").Active then
        return false
    end

    return has_access_to_fifth_mirror()

end

function can_bring_first_gift()
    if not has_princess("Shifting Mound") then
        return false
    end
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 1 then
        return false
    end

    return has_access_to_first_mirror()

end

function can_bring_second_gift()
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 2 then
        return false
    end

    return has_access_to_second_mirror()
    
end

function can_bring_third_gift()
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 3 then
        return false
    end

    return has_access_to_third_mirror()
    
end

function can_bring_fourth_gift()
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 4 then
        return false
    end

    return has_access_to_fourth_mirror()
    
end

function can_bring_fifth_gift()
    if Tracker:FindObjectForCode("gift_rando").CurrentStage % 2 == 1 and Tracker:FindObjectForCode("gifts").AcquiredCount < 5 then
        return false
    end

    return has_access_to_the_narrator_mirror()
    
end

function accessible_oblivion()

    possible_oblivion = 0
    if has_access_to_generic_princess("Razor") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Adversary") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Tower") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Spectre") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Nightmare") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Beast") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Witch") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Prisoner") then
        possible_oblivion = possible_oblivion + 1
    end
    if has_access_to_generic_princess("Damsel") then
        possible_oblivion = possible_oblivion + 1
    end

    return possible_oblivion

end

function has_access_to_denial()

    return accessible_oblivion() > 0

end

function has_access_to_anger()

    return accessible_oblivion() > 1

end

function has_access_to_bargaining()

    return accessible_oblivion() > 2

end

function has_access_to_depression()

    return accessible_oblivion() > 3

end

function has_access_to_acceptance()

    return accessible_oblivion() > 4

end

function has_access_to_oblivion()

    return accessible_oblivion() > 5

end

function has_access_to_your_new_world()

    if not has_access_to_the_end_of_everything() then
        return false
    end

    red_princesses = 0

    if has_access_to_generic_princess("Stranger") and has_blade("Stranger") then
        red_princesses = red_princesses + 1
    end

    if has_access_to_generic_princess("Razor") and has_all_voices() then
        red_princesses = red_princesses + 1
    end

    if has_access_to_specific_princess("Needle", "Hunted", "Adversary") and has_blade("Needle") then
        red_princesses = red_princesses + 1
        
        if has_access_to_specific_princess("Fury", "Stubborn", "Tower") and has_blade("Fury") then
            red_princesses = red_princesses + 1
        elseif has_access_to_generic_princess("Apotheosis") then
            red_princesses = red_princesses + 1
        end
    elseif has_access_to_generic_princess("Apotheosis") then
        red_princesses = red_princesses + 1

        if has_access_to_specific_princess("Fury", "Contrarian", "Adversary") or has_access_to_specific_princess("Fury", "Cold", "Adversary") or has_access_to_specific_princess("Fury", "Broken", "Adversary") then
            red_princesses = red_princesses + 1
        end
    elseif (has_access_to_specific_princess("Fury", "Stubborn", "Tower") and has_blade("Fury")) or has_access_to_specific_princess("Fury", "Contrarian, Adversary") or has_access_to_specific_princess("Fury", "Cold", "Adversary") or has_access_to_specific_princess("Fury", "Broken", "Adversary") then
        red_princesses = red_princesses + 1
    end
    
    if has_access_to_generic_princess("Dragon") then
        red_princesses = red_princesses + 1

        if has_access_to_specific_princess("Wraith", "Cold", "Nightmare") or has_access_to_specific_princess("Wraith", "Opportunist", "Nightmare") then
            red_princesses = red_princesses + 1
        end
    elseif has_access_to_generic_princess("Wraith") then
        red_princesses = red_princesses + 1
    end

    if has_access_to_generic_princess("Den") and has_blade("Den") then
        red_princesses = red_princesses + 1

        if (has_access_to_specific_princess("Wild", "Paranoid", "Witch") or has_access_to_specific_princess("Wild", "Cheated", "Witch") or has_access_to_specific_princess("Wild", "Stubborn", "Witch")) and has_blade("Wild") then
            red_princesses = red_princesses + 1
        end
    elseif has_access_to_generic_princess("Wild") and has_blade("Wild") then
        red_princesses = red_princesses + 1
    end

    if has_access_to_specific_princess("Cage", "Cheated", "Prisoner") or has_access_to_specific_princess("Cage", "Broken", "Prisoner") or (has_access_to_specific_princess("Cage", "Paranoid", "Prisoner") and has_blade("Cage")) then
        red_princesses = red_princesses + 1
    elseif has_access_to_specific_princess("Grey", "Cold", "Prisoner") then
        red_princesses = red_princesses + 1
    end

    if has_access_to_generic_princess("Damsel") then
        red_princesses = red_princesses + 1
    end

    return red_princesses > 4

end

function can_goal()
   
    if Tracker:FindObjectForCode("memories_rec").AcquiredCount < Tracker:FindObjectForCode("memories_req").AcquiredCount then
        return false
    end

    if goal_our_song() then
        return has_access_to_the_end_of_everything()
    elseif goal_your_new_world() then
        return has_access_to_your_new_world()
    elseif goal_oblivion() then
        return has_access_to_oblivion()
    end

    return false

end

function show_princess_chapters()
    return Tracker:FindObjectForCode("chapter_sanity").CurrentStage % 2 == 1
end

function show_global_chapters()
    return Tracker:FindObjectForCode("chapter_sanity").CurrentStage > 1
end

function show_hearts()
    return Tracker:FindObjectForCode("heart_sanity").CurrentStage > 0
end

function show_specific_hearts()
    return Tracker:FindObjectForCode("heart_sanity").CurrentStage == 1
end

function show_vessel_hearts()
    return Tracker:FindObjectForCode("heart_sanity").CurrentStage == 2
end

function show_voices()
    return Tracker:FindObjectForCode("voice_sanity").Active
end

function show_spaces_mirror()
    return Tracker:FindObjectForCode("mirror_sanity").CurrentStage % 2 == 1
end

function show_chapter_mirror()
    return Tracker:FindObjectForCode("mirror_sanity").CurrentStage > 1
end

function show_oblivion()
    return Tracker:FindObjectForCode("oblivion_sanity").Active
end

function show_gifts()
    return Tracker:FindObjectForCode("gift_rando").CurrentStage > 1
end

function show_memories()
    return Tracker:FindObjectForCode("memories_sanity").CurrentStage > 0
end

function goal_our_song()
    return Tracker:FindObjectForCode("goal").CurrentStage == 0
end

function goal_your_new_world()
    return Tracker:FindObjectForCode("goal").CurrentStage == 1
end

function goal_oblivion()
    return Tracker: FindObjectForCode("goal").CurrentStage == 2
end