local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('slrp-peds:client:SetPedModel', function(model)
    local pedModel = GetHashKey(model)
    if IsModelValid(pedModel) then
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(100)
        end
        SetPlayerModel(PlayerId(), pedModel)
        SetModelAsNoLongerNeeded(pedModel)
    else
        print("^1Invalid model name or ID.")
    end
end)

