-- Archivo: lua/vampire_hogwarts/server/sv_lifedrain.lua

if SERVER then
    util.AddNetworkString("VampireLifeDrain")

    local function DrainLife(ply, target)
        if not IsValid(target) or not target:IsPlayer() then return end

        local drainAmount = 10 -- Cantidad de vida que se drenará
        local healAmount = drainAmount * 0.5 -- Cantidad de vida que el vampiro recuperará

        target:SetHealth(target:Health() - drainAmount) -- Quitar vida al objetivo
        ply:SetHealth(math.min(ply:Health() + healAmount, ply:GetMaxHealth())) -- Curar al vampiro

        ply:ChatPrint("Has drenado vida de " .. target:Nick() .. " y te has curado " .. healAmount .. " puntos de salud.")
        target:ChatPrint("¡Te han drenado vida!")
    end

    hook.Add("PlayerSay", "VampireLifeDrainCommand", function(ply, text)
        if string.lower(text) == "!drainlife" then
            local target = ply:GetEyeTrace().Entity

            if IsValid(target) and target:IsPlayer() then
                DrainLife(ply, target)
            else
                ply:ChatPrint("No estás mirando a un objetivo válido.")
            end

            return ""
        end
    end)
end