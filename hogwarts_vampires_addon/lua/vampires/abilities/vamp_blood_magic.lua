if SERVER then
    util.AddNetworkString("VampireFeed")
    
    function FeedOnTarget(ply, target)
        if ply:IsVampire() and target:IsPlayer() or target:IsNPC() then
            local bloodAmount = 50
            target:SetHealth(target:Health() - bloodAmount)
            ply:SetNWInt("VampireBlood", math.min(ply:GetNWInt("VampireBlood", 100) + bloodAmount, 100))
            ply:ChatPrint("Te has alimentado de " .. target:GetName() .. ". Sangre: +" .. bloodAmount)
            target:ChatPrint("¡Un vampiro te ha atacado y ha bebido tu sangre!")
        end
    end

    hook.Add("PlayerSay", "VampFeedCommand", function(ply, text)
        if text == "!feed" then
            local tr = ply:GetEyeTrace()
            local target = tr.Entity
            if IsValid(target) and target:IsPlayer() or target:IsNPC() then
                FeedOnTarget(ply, target)
            else
                ply:ChatPrint("No hay ningún objetivo válido para alimentarse.")
            end
            return ""
        end
    end)
end