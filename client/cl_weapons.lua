local show = false

if Config.Debug then
    RegisterCommand("gui", function(source, args)
        Show(not show)
    end)
end

RegisterNUICallback("exit", function()
    Show(false)
end)

RegisterNUICallback('buyweapon', function(data)
    if data == nil then
        SendNUIMessage({
            type = "notify",
            msg = Config.Languages[Config.Lang].Error,
        })
    else
        TriggerServerEvent('darrk-bunker:server:buyweapon', data)
    end
end)

RegisterNUICallback('StartMission', function(data)
    local mission = data.mission
    local btc   = data.btc
    -- print(mission)
    -- print(btc)

    if mission == "lab" then
        local stlab = true

        if stlab then
            TriggerServerEvent('darrk-bunker:server:missionBt', data)
        else
            QBCore.Functions.Notify(Config.Languages[Config.Lang].Error, 'info')
        end
    elseif mission == "ship" then
        local stlab = true

        if stlab then
            TriggerServerEvent('darrk-bunker:server:missionBt', data)
        else
            QBCore.Functions.Notify(Config.Languages[Config.Lang].Error, 'info')
        end
    elseif mission == "cia" then
        local stlab = true

        if stlab then
            TriggerServerEvent('darrk-bunker:server:missionBt', data)
        else
            QBCore.Functions.Notify(Config.Languages[Config.Lang].Error, 'info')
        end
    end
end)

RegisterNUICallback('RefreshUi', function()
    Show(false)
    Citizen.Wait(100)
    Show(not show)
end)

RegisterNetEvent('darrk-bunker:client:RefreshUi')
AddEventHandler('darrk-bunker:client:RefreshUi', function()
    Show(false)
    Citizen.Wait(100)
    Show(not show)
end)

RegisterNetEvent('darrk-bunker:client:ShowNotify')
AddEventHandler('darrk-bunker:client:ShowNotify', function(msg)
    -- print(msg)
    SendNUIMessage({
        type = "notify",
        msg = msg,
    })
end)

function Show(bool)
    local Player = QBCore.Functions.GetPlayerData()
    show = bool
    SetNuiFocus(bool, bool)
    if Player.metadata['bunkerxp'] == nil then
        exp = 0
    else
        exp = Player.metadata['bunkerxp']
    end
    SendNUIMessage({
        type = "ui",
        status = bool,
        fname  = Player.charinfo.firstname,
        lname = Player.charinfo.lastname,
        balance = Player.money.crypto,
        exp = exp,
        Lang = Config.Languages[Config.Lang],
        ll = Config.Lang
    })
end

Citizen.CreateThread(function()
    while show do
        Citizen.Wait(0)
        DisableControlAction(0, 1, show)
        DisableControlAction(0, 2, show)
        DisableControlAction(0, 142, show)
        DisableControlAction(0, 18, show)
        DisableControlAction(0, 322, show)
        DisableControlAction(0, 106, show)
    end

    while display do
        Citizen.Wait(0)
        
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

RegisterNUICallback('getweapons', function(data, cb)
    cb({weapons = table.clone(Config.Weapons), lang = Config.Languages[Config.Lang]})
end)