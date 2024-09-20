-- Archivo: lua/vampire_hogwarts/server/sv_vampireflight.lua

if SERVER then
    util.AddNetworkString("VampireFlightToggle")

    local function ToggleFlight(ply)
        if not ply:IsVampire() then return end -- Solo vampiros pueden volar

        if ply:GetMoveType() == MOVETYPE_WALK then
            ply:SetMoveType(MOVETYPE_FLY)
            ply:ChatPrint("Modo vuelo activado.")
        else
            ply:SetMoveType(MOVETYPE_WALK)
            ply:ChatPrint("Modo vuelo desactivado.")
        end
    end

    hook.Add("PlayerSay", "VampireFlightCommand", function(ply, text)
        if string.lower(text) == "!fly" then
            ToggleFlight(ply)
            return ""
        end
    end)
end