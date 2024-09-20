-- Definici�n de misiones vamp�ricas

local VampireMissions = {}

-- Crear una misi�n para los vampiros
function CreateVampireMission(name, description, reward)
    table.insert(VampireMissions, {
        name = name,
        description = description,
        reward = reward
    })
end

-- Ejemplo de una misi�n vamp�rica
CreateVampireMission("Cazar Lobos", "Elimina a 5 hombres lobo en el bosque prohibido.", 500)
CreateVampireMission("Recuperar la Reliquia", "Encuentra la reliquia oculta en la cueva oscura.", 1000)

-- Asignar una misi�n al jugador vampiro
function AssignVampireMission(ply)
    if not ply:IsVampire() then return end

    local mission = table.Random(VampireMissions)
    ply:ChatPrint("Nueva misi�n: " .. mission.name .. " - " .. mission.description)

    -- Verificaci�n para completar la misi�n
    ply:SetNWBool("OnMission", true)
    ply:SetNWString("CurrentMission", mission.name)
end

-- Completar la misi�n
function CompleteVampireMission(ply)
    if not ply:IsVampire() or not ply:GetNWBool("OnMission") then return end

    local missionName = ply:GetNWString("CurrentMission")
    for _, mission in pairs(VampireMissions) do
        if mission.name == missionName then
            ply:ChatPrint("Has completado la misi�n: " .. missionName)
            ply:AddMoney(mission.reward)  -- Recompensa de dinero (si tienes un sistema de econom�a)
            ply:SetNWBool("OnMission", false)
            break
        end
    end
end

-- Comandos para asignar y completar misiones
hook.Add("PlayerSay", "VampireMissionCommands", function(ply, text)
    if text == "!vampmission" then
        AssignVampireMission(ply)
        return ""
    elseif text == "!completemission" then
        CompleteVampireMission(ply)
        return ""
    end
end)