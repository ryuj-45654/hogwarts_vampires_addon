-- Definición de eventos especiales para vampiros

local VampireEvents = {}

-- Crear un evento vampírico
function CreateVampireEvent(name, description, reward)
    table.insert(VampireEvents, {
        name = name,
        description = description,
        reward = reward
    })
end

-- Ejemplo de eventos vampíricos
CreateVampireEvent("Cacería Nocturna", "Participa en la cacería y elimina a los enemigos de los vampiros.", 750)
CreateVampireEvent("Batalla de Clanes", "Lucha contra otro clan de vampiros y demuestra tu poder.", 1500)

-- Asignar un evento al jugador vampiro
function StartVampireEvent(ply)
    if not ply:IsVampire() then return end

    local event = table.Random(VampireEvents)
    ply:ChatPrint("Nuevo evento: " .. event.name .. " - " .. event.description)

    -- Iniciar el evento
    ply:SetNWBool("InEvent", true)
    ply:SetNWString("CurrentEvent", event.name)
end

-- Completar el evento
function CompleteVampireEvent(ply)
    if not ply:IsVampire() or not ply:GetNWBool("InEvent") then return end

    local eventName = ply:GetNWString("CurrentEvent")
    for _, event in pairs(VampireEvents) do
        if event.name == eventName then
            ply:ChatPrint("Has completado el evento: " .. eventName)
            ply:AddMoney(event.reward)  -- Recompensa de dinero
            ply:SetNWBool("InEvent", false)
            break
        end
    end
end

-- Comandos para iniciar y completar eventos
hook.Add("PlayerSay", "VampireEventCommands", function(ply, text)
    if text == "!startevent" then
        StartVampireEvent(ply)
        return ""
    elseif text == "!completeevent" then
        CompleteVampireEvent(ply)
        return ""
    end
end)