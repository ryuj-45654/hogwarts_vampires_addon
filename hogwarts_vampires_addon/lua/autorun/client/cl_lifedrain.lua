-- Archivo: lua/vampire_hogwarts/client/cl_lifedrain.lua

if CLIENT then
    net.Receive("VampireLifeDrain", function()
        local effectData = EffectData()
        effectData:SetOrigin(LocalPlayer():GetPos())
        util.Effect("BloodImpact", effectData) -- Muestra el efecto de sangre al drenar vida
    end)
end