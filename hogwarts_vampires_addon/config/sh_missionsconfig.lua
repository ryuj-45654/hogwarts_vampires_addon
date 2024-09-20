-- Configuraci�n de misiones para vampiros
MissionConfig = {}

-- Misi�n de iniciaci�n vamp�rica
MissionConfig.Initiation = {
    Name = "Ritual de Iniciaci�n",
    Description = "Realiza tu primer vuelo y drena la energ�a de un enemigo.",
    Rewards = {
        XP = 100,  -- Experiencia obtenida
        Items = {"Poci�n de sangre"}
    },
    Objectives = {
        Fly = true,  -- Debes volar
        DrainHealth = true  -- Debes chupar la vida de otro jugador o NPC
    }
}