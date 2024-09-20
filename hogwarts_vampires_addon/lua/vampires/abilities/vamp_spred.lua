if SERVER then
    util.AddNetworkString("VampireSpeed")
    
    hook.Add("PlayerButtonDown", "ActivateVampireSpeed", function(ply, button)
        if ply:IsVampire() and button == KEY_LSHIFT then
            ply:SetRunSpeed(600)
            ply:ChatPrint("Has activado tu velocidad vampírica.")
            net.Start("VampireSpeed")
            net.Send(ply)
        end
    end)

    hook.Add("PlayerButtonUp", "DeactivateVampireSpeed", function(ply, button)
        if ply:IsVampire() and button == KEY_LSHIFT then
            ply:SetRunSpeed(300)
            ply:ChatPrint("Has desactivado tu velocidad vampírica.")
            net.Start("VampireSpeed")
            net.Send(ply)
        end
    end)
end