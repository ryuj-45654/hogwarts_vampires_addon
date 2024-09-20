-- Definición de hechizos y habilidades vampíricas avanzadas

-- Hechizo de invisibilidad vampírica
function CastInvisibility(ply)
    if not ply:IsVampire() then return end
    
    ply:SetNoDraw(true)  -- El jugador se vuelve invisible
    ply:ChatPrint("Has activado el hechizo de invisibilidad.")

    -- Duración de la invisibilidad
    timer.Create("VampInvisibility", 30, 1, function()
        ply:SetNoDraw(false)
        ply:ChatPrint("El hechizo de invisibilidad se ha desactivado.")
    end)
end

-- Hechizo de vuelo vampírico
function CastFlight(ply)
    if not ply:IsVampire() then return end

    ply:SetMoveType(MOVETYPE_NOCLIP)  -- Activa el modo vuelo
    ply:ChatPrint("Has activado el vuelo vampírico.")

    -- Desactivar vuelo al presionar la tecla de nuevo
    hook.Add("KeyPress", "DisableFlight", function(ply, key)
        if key == IN_JUMP then
            ply:SetMoveType(MOVETYPE_WALK)
            ply:ChatPrint("El vuelo vampírico se ha desactivado.")
            hook.Remove("KeyPress", "DisableFlight")
        end
    end)
end

-- Aumento de velocidad vampírica
function CastSpeedBoost(ply)
    if not ply:IsVampire() then return end

    local originalSpeed = ply:GetWalkSpeed()
    ply:SetWalkSpeed(originalSpeed * 2)  -- Duplica la velocidad
    ply:ChatPrint("Has activado el aumento de velocidad.")

    -- Duración de la velocidad aumentada
    timer.Create("VampSpeedBoost", 20, 1, function()
        ply:SetWalkSpeed(originalSpeed)
        ply:ChatPrint("El aumento de velocidad se ha desactivado.")
    end)
end

-- Asignación de teclas para activar habilidades
hook.Add("PlayerButtonDown", "VampireSpells", function(ply, button)
    if button == KEY_V then
        CastInvisibility(ply)
    elseif button == KEY_F then
        CastFlight(ply)
    elseif button == KEY_R then
        CastSpeedBoost(ply)
    end
end)