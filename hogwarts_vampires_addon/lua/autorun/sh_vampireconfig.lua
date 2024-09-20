-- Configuración de vampiros en HogwartsRP
VampireConfig = {}

-- Velocidad de vuelo de vampiros
VampireConfig.FlightSpeed = 600  -- Ajusta la velocidad de vuelo

-- Regeneración de salud
VampireConfig.HealthRegenRate = 2  -- Cantidad de salud que se regenera por segundo

-- Máximo de energía vampírica
VampireConfig.MaxEnergy = 100

-- Consumo de energía por segundo cuando vuela
VampireConfig.FlightEnergyDrain = 5  -- Energía consumida cada segundo mientras se vuela

-- Tiempo de recarga de energía
VampireConfig.EnergyRechargeRate = 10  -- Energía recuperada por segundo cuando no se está usando

-- Habilidades vampíricas (Ejemplo: velocidad, visión nocturna)
VampireConfig.Abilities = {
    Speed = {
        Active = true,
        SpeedMultiplier = 1.5,  -- Multiplicador de la velocidad al activar
        EnergyCostPerSecond = 10  -- Energía usada al moverse rápido
    },
    NightVision = {
        Active = true,
        EnergyCost = 20,  -- Energía para activar la visión nocturna
    },
    MindControl = {
        Active = false,  -- Puedes activarlo si quieres agregar esta habilidad
        EnergyCost = 50,
    }
}