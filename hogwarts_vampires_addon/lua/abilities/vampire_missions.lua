-- Definición de misiones vampíricas

local VampireMissions = {}

-- Crear una misión para los vampiros
function CreateVampireMission(name, description, reward)
    table.insert(VampireMissions, {
        name = name,
        description = description,
        reward = reward
    })
end

-- Ejemplo de una misión vampírica
CreateVampireMission("Cazar Lobos", "Elimina a 5 hombres lobo en el bosque prohibido.", 500)
CreateVampireMission("Recuperar la Reliquia", "Encuentra la reliquia oculta en la cueva oscura.", 1000)

-- Asignar una misión al jugador vampiro
function AssignVampireMission(ply)
    if not ply:IsVampire() then return end

    local mission = table.Random(VampireMissions)
    ply:ChatPrint("Nueva misión: " .. mission.name .. " - " .. mission.description)

    -- Verificación para completar la misión
    ply:SetNWBool("OnMission", true)
    ply:SetNWString("CurrentMission", mission.name)
end

-- Completar la misión
function CompleteVampireMission(ply)
    if not ply:IsVampire() or not ply:GetNWBool("OnMission") then return end

    local missionName = ply:GetNWString("CurrentMission")
    for _, mission in pairs(VampireMissions) do
        if mission.name == missionName then
            ply:ChatPrint("Has completado la misión: " .. missionName)
            ply:AddMoney(mission.reward)  -- Recompensa de dinero (si tienes un sistema de economía)
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