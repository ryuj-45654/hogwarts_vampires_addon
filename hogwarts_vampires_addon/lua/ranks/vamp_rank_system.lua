if SERVER then
    VampRanks = {
        [1] = "Aprendiz",
        [2] = "Vampiro",
        [3] = "Maestro Vampírico",
        [4] = "Señor Oscuro"
    }

    function GetVampireRank(ply)
        return VampRanks[ply:GetNWInt("VampireRank", 1)]
    end

    function LevelUpVampire(ply)
        local rank = ply:GetNWInt("VampireRank", 1)
        if rank < #VampRanks then
            ply:SetNWInt("VampireRank", rank + 1)
            ply:ChatPrint("¡Has subido de rango a " .. VampRanks[rank + 1] .. "!")
        end
    end
end