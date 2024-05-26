local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('slrp-peds:client:SetPedMode', function(model)
    local ourModel = model
    local pedModel = joaat(ourModel)
    if not IsModelValid(pedModel) then return end
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(100)
    end
    SetPlayerModel(PlayerId(), pedModel)
    SetModelAsNoLongerNeeded(pedModel)
end)