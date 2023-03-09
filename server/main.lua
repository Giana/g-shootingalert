local QBCore = exports['qb-core']:GetCoreObject()

local alertCooldown = {}

-- Functions --

function startCooldown(locationIndex)
    Wait(Config.MonitoredLocations[locationIndex].alertCooldown * 1000)
    alertCooldown[locationIndex] = nil
end

-- Events ---

-- Credit: qb-policejob
RegisterNetEvent('g-shootingalert:server:policeAlert', function(locationIndex, text)
    if alertCooldown[locationIndex] then
        return
    end
    alertCooldown[locationIndex] = true
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
            local alertData = { title = 'New Call', coords = { x = coords.x, y = coords.y, z = coords.z }, description = text }
            TriggerClientEvent('qb-phone:client:addPoliceAlert', v.PlayerData.source, alertData)
            TriggerClientEvent('g-shootingalert:client:policeAlert', v.PlayerData.source, coords, text)
        end
    end
    startCooldown(locationIndex)
end)