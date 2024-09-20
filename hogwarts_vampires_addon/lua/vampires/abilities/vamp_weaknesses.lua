if SERVER then
    hook.Add("Think", "VampireBloodDrain", function()
        for _, ply in ipairs(player.GetAll()) do
            if ply:IsVampire() then
                local blood = ply:GetNWInt("VampireBlood", 100)
                if blood <= 0 then
                    ply:SetHealth(math.max(ply:Health() - 1, 1))
                    ply:ChatPrint("Estás débil. Necesitas alimentarte.")
                else
                    ply:SetNWInt("VampireBlood", blood - 0.1)
                end
            end
        end
    end)
end