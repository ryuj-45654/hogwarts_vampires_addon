if SERVER then
    VampMissions = {}

    function StartVampireMission(ply, missionName)
        if ply:IsVampire() then
            ply:ChatPrint("Has comenzado la misión: " .. missionName)
            VampMissions[ply:SteamID()] = missionName
        end
    end

    function CompleteVampireMission(ply)
        if VampMissions[ply:SteamID()] then
            ply:ChatPrint("Has completado la misión: " .. VampMissions[ply:SteamID()])
            VampMissions[ply:SteamID()] = nil
        end
    end
end