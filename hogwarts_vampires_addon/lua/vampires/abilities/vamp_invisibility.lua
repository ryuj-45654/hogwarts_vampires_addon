if SERVER then
    util.AddNetworkString("VampireInvisibility")
    
    hook.Add("PlayerButtonDown", "ActivateVampireInvisibility", function(ply, button)
        if ply:IsVampire() and button == KEY_LALT then
            ply:SetNoDraw(true)
            ply:ChatPrint("Has activado la invisibilidad vampírica.")
            net.Start("VampireInvisibility")
            net.Send(ply)
        end
    end)

    hook.Add("PlayerButtonUp", "DeactivateVampireInvisibility", function(ply, button)
        if ply:IsVampire() and button == KEY_LALT then
            ply:SetNoDraw(false)
            ply:ChatPrint("Has desactivado la invisibilidad vampírica.")
            net.Start("VampireInvisibility")
            net.Send(ply)
        end
    end)
end