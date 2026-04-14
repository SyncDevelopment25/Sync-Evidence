Framework = {}

if (GetResourceState('qbx_core') == "started" or GetResourceState('qb-core') == "started") then
    local QBCore = exports['qb-core']:GetCoreObject()

    function Framework.GetCID()
        local Player = QBCore.Functions.GetPlayerData()
        local CID = Player.citizenid
        return CID
    end
end