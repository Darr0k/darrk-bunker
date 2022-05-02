RegisterNetEvent('darrk-bunker:server:buyweapon')
AddEventHandler('darrk-bunker:server:buyweapon', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    local money  = Player.PlayerData.money.crypto
    local addxp  = math.random(2, 3)
    if money >= data.price then
        Player.Functions.RemoveMoney('crypto', data.price, 'Buy A weapon From Bunker')

        Player.Functions.AddItem(data.weapon, 1)
        TriggerClientEvent('darrk-bunker:client:ShowNotify', source, Config.Languages[Config.Lang].BuyWeapon)
        Player.Functions.SetMetaData('bunkerexp', Player.PlayerData.metadata['bunkerexp']+addxp)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[data.weapon], "add")
        TriggerClientEvent('darrk-bunker:client:RefreshUi')
    else
        TriggerClientEvent('darrk-bunker:client:ShowNotify', source, Config.Languages[Config.Lang].NoCrypto)
    end
end)

--[[
RegisterNetEvent('darrk-bunker:server:missionBt')
AddEventHandler('darrk-bunker:server:missionBt', function(data)
    local Player  = QBCore.Functions.GetPlayer(source)
    local mission = data.mission
    local btc     = data.btc
    local btcB    = Player.PlayerData.metadata["bunkerxp"]

    if Player.PlayerData.metadata["bunkerxp"] >= 75 then


    else
        local status = false
        TriggerClientEvent('QBCore:Notify', source, 'لا تمتلك الخبرات الكافية', 'error')
    end

    if mission == 'lab' then
       if Player.PlayerData.metadata["bunkerxp"] >= 75  then
           local status = true
           TriggerClientEvent('QBCore:Notify', source, '/inv لأرسال دعوة لمشاركة المهمة', 'info')
           TriggerEvent('darrk-bunker:server:enableINV', source, mission, status)
       else
           local status = false
           TriggerClientEvent('QBCore:Notify', source, 'لا تمتلك الخبرات الكافية', 'error')
       end
    elseif mission == 'ship' then
       if btcB >= btc then
           local status = true
           TriggerClientEvent('QBCore:Notify', source, '/inv لأرسال دعوة لمشاركة المهمة', 'info')
           TriggerEvent('darrk-bunker:server:enableINV', source, mission, status)
       else
           local status = false
           TriggerClientEvent('QBCore:Notify', source, 'لا تمتلك الخبرات الكافية', 'error')
       end
    elseif mission == 'cia' then
       if btcB >= btc then
           local status = true
           TriggerClientEvent('QBCore:Notify', source, '/inv لأرسال دعوة لمشاركة المهمة', 'info')
           TriggerEvent('darrk-bunker:server:enableINV', source, mission, status)
       else
           local status = false
           TriggerClientEvent('QBCore:Notify', source, 'لا تمتلك الخبرات الكافية', 'error')
       end
    end
end)

QBCore.Commands.Add('inv', 'لأرسال دعوة الى المهمة', {{name = "id", help = "هوية الاعب"}}, false, function(source, args)
    local Target = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local id     = tonumber(args[1])
    local mission = 'مهمة المختبر'


    if mission == "lab" then 
        mission = 'مهمة المختبر'
    elseif mission == "ship" then 
        mission = 'مهمة الميناء'
    elseif mission == "cia" then 
        mission = 'مهمة مركز الأستخبارات'
    end

    if Target ~= nil then
        TriggerClientEvent('QBCore:Notify', Target.PlayerData.source, 'تمت دعوتك الى  '..mission..' للقبول /accept للرفض /reject', 'info')
        local commmands = true
    else
        TriggerClientEvent('QBCore:Notify', source, 'الشخص غير موجود', 'error')
    end
end)

QBCore.Commands.Add('accept', 'لقبول مهمة', {}, false, function(source, args)
    if commmands then

        local commmands = false
    else
        TriggerClientEvent('QBCore:Notify', source, 'لم تتم دعوتك من قبل', 'error')
    end
end)

QBCore.Commands.Add('reject', 'لرفض مهمة', {}, false, function(source, args)
    if commmands then
        --TriggerClientEvent('darrk-', source, ...)
        local commmands = false
    else
        TriggerClientEvent('QBCore:Notify', source, 'لم تتم دعوتك من قبل', 'error')
    end
end)
]]--