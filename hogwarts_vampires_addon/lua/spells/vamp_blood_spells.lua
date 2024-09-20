if SERVER then
    util.AddNetworkString("VampBloodSpell")

    function CastBloodSpell(ply)
        if ply:IsVampire() then
            -- Lógica del hechizo de sangre
            ply:ChatPrint("Has lanzado un hechizo de sangre.")
            net.Start("VampBloodSpell")
            net.Send(ply)
        end
    end

    hook.Add("PlayerSay", "BloodSpellCommand", function(ply, text)
        if text == "!bloodspell" then
            CastBloodSpell(ply)
            return ""
        end
    end)
end