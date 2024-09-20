if SERVER then
    function AssignAdvancedMission(ply)
        if ply:IsVampire() then
            local mission = {
                title = "El Ritual de Sangre",
                description = "Recoge sangre de tres estudiantes para completar el ritual.",
                completed = false
            }

            ply:SetNWString("ActiveMission", mission.title)
            ply:ChatPrint("Has comenzado la misión: " .. mission.title)
            ply:ChatPrint(mission.description)
        end
    end

    hook.Add("PlayerSay", "AdvancedMissionCommand", function(ply, text)
        if text == "!advmission" then
            AssignAdvancedMission(ply)
            return ""
        end
    end)
end