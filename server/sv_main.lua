RegisterNetEvent('darrk-bunker:server:changeFingerPrint')
AddEventHandler('darrk-bunker:server:changeFingerPrint', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    local OldFingerPrint = Player.PlayerData.metadata['fingerprint']
    local luck = math.random(10, 50)

    local fingerprint = MySQL.Sync.fetchAll('SELECT * FROM darrkbunker_fingerprint LIMIT 1')
    if fingerprint ~= nil then
        if OldFingerPrint ~= '' then
            if luck >= 2 then
                exports.oxmysql:insert('INSERT INTO darrkbunker_fingerprint (citizenid, oldfingerprint, newfingerprint) VALUES (?, ?, ?)', {Player.PlayerData.citizenid, OldFingerPrint, fingerprint[1].oldfingerprint})
                TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].ChangeFingerPrintDone, 'info')
                Player.Functions.SetMetaData('fingerprint', fingerprint[1].newfingerprint)
                Player.Functions.RemoveMoney('crypto', Config.FingerPrint.price)
            else
                Player.Functions.SetMetaData('fingerprint', '')
                TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].ChangeFingerPrintF, 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Config.Languages[Config.Lang].NoFingerPrint, 'error')
        end
    else
        if OldFingerPrint ~= '' then
            if luck >= 2 then
                local fp = QBCore.Player.CreateFingerId()
                exports.oxmysql:insert('INSERT INTO darrkbunker_fingerprint (citizenid, oldfingerprint, newfingerprint) VALUES (?, ?, ?)', {Player.PlayerData.citizenid, OldFingerPrint, fp})
                TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].ChangeFingerPrintDone, 'info')
                Player.Functions.SetMetaData('fingerprint', fp)
                Player.Functions.RemoveMoney('crypto', Config.FingerPrint.price)
            else
                Player.Functions.SetMetaData('fingerprint', '')
                TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].ChangeFingerPrintF, 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].NoFingerPrint, 'error')
        end
    end
end)

RegisterNetEvent('darrk-bunker:server:bandagebuy')
AddEventHandler('darrk-bunker:server:bandagebuy', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source

    if Player ~= nil then
        if Player.PlayerData.money.crypto >= Config.Bandage.price then
            Player.Functions.RemoveMoney('crypto', Config.FingerPrint.price, 'شراء باندج')
            Player.Functions.AddItem(Config.Bandage.item, Config.Bandage.amount)
        else
            TriggerClientEvent('QBCore:Notify', src, Config.Languages[Config.Lang].NoCrypto, 'error')
        end
    end
end)

QBCore.Commands.Add('givebunkerperm', "",  {{id = 'id', help = 'هوية الاعب'}}, false, function(source, args)
    local Admin = QBCore.Functions.GetPlayer(source)
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local src = source

    if Player ~= nil then
        exports.oxmysql:insert('INSERT INTO darrkbunker_permissions (citizenid) VALUES (?)', {Player.PlayerData.citizenid})
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source,  Config.Languages[Config.Lang].RecivePerm)
        TriggerClientEvent('QBCore:Notify', Admin.PlayerData.source,  Config.Languages[Config.Lang].GivePerm)
    else
        TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].NoPlayer)
    end
end, "god")

QBCore.Commands.Add('removebunkerperm', "",  {{id = 'id', help = 'هوية الاعب'}}, false, function(source, args)
    local Admin = QBCore.Functions.GetPlayer(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))

    if Player ~= nil then
        exports.oxmysql:insert('DELETE FROM darrkbunker_permissions WHERE citizenid = ?', {Player.PlayerData.citizenid})
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source,  Config.Languages[Config.Lang].RemovedPerm)
        TriggerClientEvent('QBCore:Notify', Admin.PlayerData.source,  Config.Languages[Config.Lang].RemovePerm)
    else
        TriggerClientEvent('QBCore:Notify', src,  Config.Languages[Config.Lang].NoPlayer)
    end
end, "god")

QBCore.Functions.CreateCallback('darrk-bunker:server:hasperm', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
    local hasperm = MySQL.Sync.fetchAll('SELECT * FROM darrkbunker_permissions WHERE citizenid = ?', {Player.PlayerData.citizenid})
    
    if hasperm[1] ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- QBCore.Commands.Add('resetfingerprint', '', {}, false, function(source, args)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local fp = QBCore.Player.CreateFingerId()

--     Player.Functions.SetMetaData('fingerprint', fp)
--     print(fp, Player.PlayerData.metadata['fingerprint'])
-- end)