if SERVER then
    util.AddNetworkString("AdvancedBloodSpell")

    function CastAdvancedBloodSpell(ply)
        if ply:IsVampire() and ply:GetNWInt("VampireBlood", 100) >= 50 then
            ply:SetNWInt("VampireBlood", ply:GetNWInt("VampireBlood") - 50)
            ply:ChatPrint("Has lanzado un poderoso hechizo vampírico.")
            -- Lógica del hechizo aquí, como explosiones de sangre o invocar criaturas oscuras
            net.Start("AdvancedBloodSpell")
            net.Send(ply)
        else
            ply:ChatPrint("No tienes suficiente sangre para lanzar este hechizo.")
        end
    end

    hook.Add("PlayerSay", "AdvancedBloodSpellCommand", function(ply, text)
        if text == "!advbloodspell" then
            CastAdvancedBloodSpell(ply)
            return ""
        end
    end)
end