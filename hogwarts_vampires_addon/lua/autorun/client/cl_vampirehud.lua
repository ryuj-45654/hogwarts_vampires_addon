-- Archivo: lua/vampire_hogwarts/client/cl_vampirehud.lua

if CLIENT then
    -- Definir los colores del HUD
    local healthBarColor = Color(200, 0, 0, 180)  -- Rojo oscuro para la barra de salud
    local energyBarColor = Color(128, 0, 128, 180)  -- Morado para la barra de energía
    local backgroundColor = Color(50, 50, 50, 200)  -- Fondo de las barras

    -- Función para dibujar el HUD
    local function DrawVampireHUD()
        local ply = LocalPlayer()
        
        -- Solo mostramos el HUD si el jugador es un vampiro
        if not ply:IsVampire() then return end

        -- Obtenemos la salud y el estado del jugador
        local health = ply:Health()
        local maxHealth = ply:GetMaxHealth()
        local vampireEnergy = ply:GetNWInt("VampireEnergy", 100)  -- Barra de energía (sangre)
        local isFlying = ply:GetNWBool("IsFlying", false)  -- Estado de vuelo

        -- Dimensiones de la pantalla
        local scrW, scrH = ScrW(), ScrH()

        -- Dibujar la barra de salud
        draw.RoundedBox(10, 50, scrH - 130, 300, 30, backgroundColor)  -- Fondo
        draw.RoundedBox(10, 50, scrH - 130, math.Clamp(health / maxHealth * 300, 0, 300), 30, healthBarColor)  -- Barra de salud

        -- Texto de la salud
        draw.SimpleText("Salud: " .. health .. " / " .. maxHealth, "Trebuchet24", 60, scrH - 125, Color(255, 255, 255, 255))

        -- Dibujar la barra de energía vampírica (sangre)
        draw.RoundedBox(10, 50, scrH - 90, 300, 30, backgroundColor)  -- Fondo
        draw.RoundedBox(10, 50, scrH - 90, math.Clamp(vampireEnergy / 100 * 300, 0, 300), 30, energyBarColor)  -- Barra de energía

        -- Texto de la energía
        draw.SimpleText("Energía Vampírica: " .. vampireEnergy .. " / 100", "Trebuchet24", 60, scrH - 85, Color(255, 255, 255, 255))

        -- Mostrar el estado de vuelo
        if isFlying then
            draw.SimpleText("Modo Vuelo Activado", "Trebuchet24", scrW - 200, scrH - 130, Color(0, 255, 0, 255))  -- Texto verde si está volando
        else
            draw.SimpleText("Modo Vuelo Desactivado", "Trebuchet24", scrW - 200, scrH - 130, Color(255, 0, 0, 255))  -- Texto rojo si no está volando
        end
    end

    -- Hook para dibujar el HUD en cada frame
    hook.Add("HUDPaint", "DrawVampireHUD", DrawVampireHUD)

    -- Ocultar partes del HUD predeterminado
    local hideElements = {
        ["CHudHealth"] = true,
        ["CHudBattery"] = true,
    }

    hook.Add("HUDShouldDraw", "HideDefaultHUD", function(name)
        if hideElements[name] then
            return false
        end
    end)
end