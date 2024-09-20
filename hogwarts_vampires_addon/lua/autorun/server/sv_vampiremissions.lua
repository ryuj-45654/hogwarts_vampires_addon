-- Archivo: lua/vampire_hogwarts/server/sv_vampiremissions.lua

if SERVER then
    -- Almacenar misiones
    VampireMissions = {}

    function CreateVampireMission(title, description, reward, xp)
        table.insert(VampireMissions, {
            title = title,
            description = description,
            reward = reward,
            xp = xp
        })
    end

    function AssignVampireMission(ply)
        if not ply:IsVampire() then return end -- Solo los vampiros pueden recibir estas misiones

        local mission = VampireMissions[math.random(#VampireMissions)]
        ply:ChatPrint("Has recibido una misión: " .. mission.title)
        ply:ChatPrint(mission.description)
        ply:SetNWString("CurrentMission", mission.title)
    end

    hook.Add("PlayerSay", "VampireMissionCommand", function(ply, text)
        if string.lower(text) == "!vampiremission" then
            AssignVampireMission(ply)
            return ""
        end
    end)
end