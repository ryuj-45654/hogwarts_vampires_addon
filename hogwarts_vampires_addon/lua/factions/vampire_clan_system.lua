if SERVER then
    util.AddNetworkString("ClanWar")

    VampireClans = {}

    function CreateClan(ply, clanName)
        if ply:IsVampire() then
            VampireClans[clanName] = {
                leader = ply:SteamID(),
                members = {ply:SteamID()},
                territory = {} -- Inicializamos el territorio vacío
            }
            ply:ChatPrint("Has creado el clan vampírico: " .. clanName)
        end
    end

    function ClaimTerritory(ply, areaName)
        local clan = FindClanByLeader(ply)
        if clan then
            table.insert(clan.territory, areaName)
            ply:ChatPrint("Has reclamado el territorio: " .. areaName)
        else
            ply:ChatPrint("No lideras ningún clan.")
        end
    end

    function StartClanWar(ply, enemyClan)
        local clan = FindClanByLeader(ply)
        if clan then
            ply:ChatPrint("Has declarado la guerra al clan: " .. enemyClan)
            -- Añade lógica para las batallas y recompensas
        else
            ply:ChatPrint("No lideras ningún clan.")
        end
    end
end