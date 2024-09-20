if SERVER then
    util.AddNetworkString("VampireTransform")

    function TransformToBat(ply)
        if ply:IsVampire() then
            ply:SetModel("models/murcielago/murcielago.mdl") -- Debes tener un modelo de murciélago
            ply:SetNWBool("IsInBatForm", true)
            ply:ChatPrint("Te has transformado en un murciélago.")
            ply:SetMoveType(MOVETYPE_FLY)
            timer.Simple(30, function()
                TransformBack(ply)
            end)
        end
    end

    function TransformBack(ply)
        ply:SetModel("models/player/vampire.mdl") -- Vuelve al modelo original de vampiro
        ply:SetNWBool("IsInBatForm", false)
        ply:ChatPrint("Has vuelto a tu forma original.")
        ply:SetMoveType(MOVETYPE_WALK)
    end

    hook.Add("PlayerSay", "VampTransformCommand", function(ply, text)
        if text == "!transform" and not ply:GetNWBool("IsInBatForm", false) then
            TransformToBat(ply)
            return ""
        end
    end)
end