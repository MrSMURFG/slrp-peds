<!-- @format -->

Clientside file
-- RegisterNetEvent('slrp-peds:client:SetPedModel')
-- This event is triggered when the server sends a request to set the player's ped model.
-- It takes a single parameter, 'model', which is the name or ID of the ped model to set.

-- AddEventHandler('slrp-peds:client:SetPedModel', function(model)
-- This event handler is called when the 'slrp-peds:client:SetPedModel' event is triggered.
-- It receives the 'model' parameter, which is the name or ID of the ped model to set.

-- local pedModel = GetHashKey(model)
-- This line retrieves the hash key of the ped model based on the provided 'model' parameter.

-- if IsModelValid(pedModel) then
-- This condition checks if the ped model is valid.

-- RequestModel(pedModel)
-- This function requests the ped model to be loaded.

-- while not HasModelLoaded(pedModel) do
-- This loop waits until the ped model is loaded.

-- SetPlayerModel(PlayerId(), pedModel)
-- This function sets the player's model to the loaded ped model.

-- SetModelAsNoLongerNeeded(pedModel)
-- This function marks the ped model as no longer needed, freeing up memory.

-- else
-- If the ped model is not valid, this block is executed.

-- print("^1Invalid model name or ID.")
-- This line prints an error message indicating that the provided model name or ID is invalid.

Serverside file
-- This script allows players with admin permissions to change the ped model of other players.
-- It provides a command "/setped" that takes a player ID and a ped model name as arguments.
-- The script also includes event handlers to set the ped model on the server and client side.

-- Event to set a ped model
RegisterNetEvent('slrp-peds:server:SetPedModel')
AddEventHandler('slrp-peds:server:SetPedModel', function(playerId, model)
-- Code to set the ped model on the server side
end)

-- Event handler on the client side to actually set the ped model
RegisterNetEvent('slrp-peds:client:SetPedModel')
AddEventHandler('slrp-peds:client:SetPedModel', function(model)
-- Code to set the ped model on the client side
end)

-- Command to set the ped model
QBCore.Commands.Add('setped', "Change player ped model", {{name = "playerId", help = "Player ID"}, {name = "model", help = "Ped model name"}}, true, function(source, args)
-- Code to handle the "/setped" command
end, 'admin')
