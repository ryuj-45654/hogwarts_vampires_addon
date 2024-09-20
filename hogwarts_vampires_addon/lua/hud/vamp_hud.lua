if CLIENT then
    hook.Add("HUDPaint", "VampireHUD", function()
        local ply = LocalPlayer()
        if ply:IsVampire() then
            -- Mostrar la barra de sangre en pantalla
            draw.RoundedBox(10, 50, ScrH() - 100, 200, 25, Color(255, 0, 0, 150))
            draw.SimpleText("Sangre: " .. ply:GetNWInt("VampireBlood", 100), "DermaLarge", 55, ScrH() - 95, Color(255, 255, 255))
        end
    end)
end