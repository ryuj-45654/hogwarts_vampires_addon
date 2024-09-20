-- Configuración de misiones para vampiros
MissionConfig = {}

-- Misión de iniciación vampírica
MissionConfig.Initiation = {
    Name = "Ritual de Iniciación",
    Description = "Realiza tu primer vuelo y drena la energía de un enemigo.",
    Rewards = {
        XP = 100,  -- Experiencia obtenida
        Items = {"Poción de sangre"}
    },
    Objectives = {
        Fly = true,  -- Debes volar
        DrainHealth = true  -- Debes chupar la vida de otro jugador o NPC
    }
}