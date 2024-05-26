local QBCore = exports['qb-core']:GetCoreObject()

-- Event to set a ped model
RegisterNetEvent('slrp-peds:server:SetPedMode')
AddEventHandler('slrp-peds:server:SetPedMode', function(playerId, model)
    local src = source
    local player = QBCore.Functions.GetPlayer(playerId)
    local modelHash = GetHashKey(model)

    if not model or model == "" then
        TriggerClientEvent("chatMessage", src, "^1Model name cannot be empty.")
        print("Model name is empty")
        return
    end

    if not modelHash or modelHash == 0 then
        TriggerClientEvent("chatMessage", src, "^1Invalid model name or ID.")
        print("Invalid model name or ID: " .. tostring(model))
        return
    end

    if player then
        TriggerClientEvent("slrp-peds:client:SetPedMode", player.PlayerData.source, model)
    else
        TriggerClientEvent("chatMessage", src, "^1Player not found.")
        print("Player not found with ID: " .. tostring(playerId))
    end
end)

-- Event handler on the client side to actually set the ped model
RegisterNetEvent('slrp-peds:client:SetPedMode')
AddEventHandler('slrp-peds:client:SetPedMode', function(model)
    local modelHash = GetHashKey(model)

    if not model or model == "" then
        print("Client received empty model name")
        return
    end

    if not IsModelInCdimage(modelHash) or not IsModelValid(modelHash) then
        print("Invalid model: " .. tostring(model))
        return
    end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0)
    end

    if HasModelLoaded(modelHash) then
        SetPlayerModel(PlayerId(), modelHash)
        SetModelAsNoLongerNeeded(modelHash)
    else
        print("Failed to load model: " .. tostring(model))
    end
end)

-- Command to set the ped model
QBCore.Commands.Add('setped', "Change player ped model", {{name = "playerId", help = "Player ID"}, {name = "model", help = "Ped model name"}}, true, function(source, args)
    local src = source
    local playerId = tonumber(args[1])
    local model = args[2]

    if not QBCore.Functions.HasPermission(src, 'admin') then
        TriggerClientEvent("chatMessage", src, "^1You do not have permission to use this command.")
        print("Player without admin permissions tried to use /setped: " .. tostring(src))
        return
    end

    if not playerId or not model then
        TriggerClientEvent("chatMessage", src, "^1Invalid usage. Correct usage: /setped [playerId] [model]")
        print("Invalid usage of setped command. Arguments: " .. tostring(args[1]) .. ", " .. tostring(args[2]))
        return
    end

    if playerId <= 0 then
        TriggerClientEvent("chatMessage", src, "^1Invalid player ID.")
        print("Invalid player ID: " .. tostring(playerId))
        return
    end

    TriggerEvent("slrp-peds:server:SetPedMode", playerId, model)
end, 'admin')
