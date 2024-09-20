-- Configuraci�n de vampiros en HogwartsRP
VampireConfig = {}

-- Velocidad de vuelo de vampiros
VampireConfig.FlightSpeed = 600  -- Ajusta la velocidad de vuelo

-- Regeneraci�n de salud
VampireConfig.HealthRegenRate = 2  -- Cantidad de salud que se regenera por segundo

-- M�ximo de energ�a vamp�rica
VampireConfig.MaxEnergy = 100

-- Consumo de energ�a por segundo cuando vuela
VampireConfig.FlightEnergyDrain = 5  -- Energ�a consumida cada segundo mientras se vuela

-- Tiempo de recarga de energ�a
VampireConfig.EnergyRechargeRate = 10  -- Energ�a recuperada por segundo cuando no se est� usando

-- Habilidades vamp�ricas (Ejemplo: velocidad, visi�n nocturna)
VampireConfig.Abilities = {
    Speed = {
        Active = true,
        SpeedMultiplier = 1.5,  -- Multiplicador de la velocidad al activar
        EnergyCostPerSecond = 10  -- Energ�a usada al moverse r�pido
    },
    NightVision = {
        Active = true,
        EnergyCost = 20,  -- Energ�a para activar la visi�n nocturna
    },
    MindControl = {
        Active = false,  -- Puedes activarlo si quieres agregar esta habilidad
        EnergyCost = 50,
    }
}