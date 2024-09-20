-- Configuración del HUD para vampiros
HUDConfig = {}

-- Posición del HUD (Esquina inferior izquierda)
HUDConfig.HealthBarPos = {x = 50, y = ScrH() - 100}
HUDConfig.EnergyBarPos = {x = 50, y = ScrH() - 130}

-- Tamaño de las barras
HUDConfig.BarWidth = 200
HUDConfig.BarHeight = 20

-- Colores de las barras
HUDConfig.HealthBarColor = Color(200, 0, 0, 255)  -- Rojo para la salud
HUDConfig.EnergyBarColor = Color(0, 0, 200, 255)  -- Azul para la energía

-- Texto en el HUD
HUDConfig.TextColor = Color(255, 255, 255, 255)
HUDConfig.Font = "Trebuchet24"