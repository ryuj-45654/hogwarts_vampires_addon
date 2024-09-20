if SERVER then
    AddCSLuaFile()

    include("vampires/vampires_init.lua")
    include("creatures/vampiric_creatures.lua")
    include("missions/hogwarts_missions.lua")
    include("factions/vampire_clans.lua")
    include("ranks/vamp_rank_system.lua")
    include("spells/vamp_blood_spells.lua")
else
    include("hud/vamp_hud.lua")
end