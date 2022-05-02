RegisterServerEvent('darrk-bunker:server:CheckIfHaveMoney')
AddEventHandler('darrk-bunker:server:CheckIfHaveMoney', function(data)
    local info = {}	
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.PlayerData.money.cash >= Config.IdCardPrice then
        local info = {
            citizenid = Config.CitizenID,
            firstname = data.firstname,
            lastname = data.lastname,
            birthdate = data.birthdate,
            gender = Player.PlayerData.charinfo.gender,
            nationality = data.nationality,
        }

        Player.Functions.RemoveMoney('cash', Config.IdCardPrice)
        Player.Functions.AddItem(Config.IDCardItemName, Config.ItemQ, false, info)
        TriggerClientEvent('QBCore:Notify', source, Config.Languages[Config.Lang].SuccessText, 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, Config.Languages[Config.Lang].NoCrypto, 'error')
    end
end)