local PlayerData = {}
local inbunker = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerData.gang = GangInfo
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

function EnterBunker()
    inbunker = true
    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
            
    local name = QBCore.Functions.GetPlayerData().charinfo.firstname.. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname
    QBCore.Functions.Notify(Config.Languages[Config.Lang].EnterBunker.. ' ' ..name.. '', "info")
            
    SetEntityCoords(PlayerPedId(), 857.3017, -3250.10, -98.32, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), 353.50)
            
    Wait(900)
            
    DoScreenFadeIn(1000)
end

function LeaveBunker()
    if Config.enableUsePermisson then
        QBCore.Functions.TriggerCallback('darrk-bunker:server:hasperm', function(hasperm)
            if hasperm then
                inbunker = false
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                DoScreenFadeOut(500)
                while not IsScreenFadedOut() do
                    Wait(10)
                end
            
                SetEntityCoords(PlayerPedId(), 1236.986, -2948.40, 9.3192, 0, 0, 0, false)
                SetEntityHeading(PlayerPedId(), 178.61)
            
                Wait(900)
            
                DoScreenFadeIn(1000)
            end
        end, QBCore.Functions.GetPlayerData().citizenid)
    else
        inbunker = false
        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end
        SetEntityCoords(PlayerPedId(), 1236.986, -2948.40, 9.3192, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 178.61)
        Wait(900)
        DoScreenFadeIn(1000)
    end
end

function LeaveBunkerWithVeh()
    if Config.enableUsePermisson then
        QBCore.Functions.TriggerCallback('darrk-bunker:server:hasperm', function(hasperm)
            if hasperm then
                inbunker = false
                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                DoScreenFadeOut(500)
                while not IsScreenFadedOut() do
                    Wait(10)
                end
            
                SetPedCoordsKeepVehicle(PlayerPedId(), 1169.608, -2971.05, 5.9020, 0, 0, 0, false)
                SetEntityHeading(PlayerPedId(), 268.23)
            
                Wait(900)
            
                DoScreenFadeIn(1000)
            end
        end, QBCore.Functions.GetPlayerData().citizenid)
    else
        inbunker = false
        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end
    
        SetPedCoordsKeepVehicle(PlayerPedId(), 1169.608, -2971.05, 5.9020, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 268.23)
    
        Wait(900)
    
        DoScreenFadeIn(1000)
    end
end

function OpenWeaponsMenu()
    if Config.enableUsePermisson then
        QBCore.Functions.TriggerCallback('darrk-bunker:server:hasperm', function(hasperm)
            if hasperm then
                Show(not show)
            end
        end, QBCore.Functions.GetPlayerData().citizenid)
    else
        Show(not show)
    end
end

function ChangeFingerPrint()
    if Config.enableUsePermisson then
        QBCore.Functions.TriggerCallback('darrk-bunker:server:hasperm', function(hasperm)
            if hasperm then
                local Player = QBCore.Functions.GetPlayerData()
	            crypto = QBCore.Functions.GetPlayerData().money.crypto

                if crypto >= Config.FingerPrint.price then
                    DoScreenFadeOut(500)
                    QBCore.Functions.Progressbar('name_here', Config.Languages[Config.Lang].FingerPrint, Config.FingerPrint.Time, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = Config.FingerPrint.animDict,
                        anim = Config.FingerPrint.anim,
                        flags = 16,
                    }, {}, {}, function() -- Play When Done
                        DoScreenFadeIn(1000)
                        TriggerServerEvent('darrk-bunker:server:changeFingerPrint')
                    end)
                else
                    QBCore.Functions.Notify(Config.Languages[Config.Lang].NoCrypto, "error")
                end
            end
        end, QBCore.Functions.GetPlayerData().citizenid)
    else
        local Player = QBCore.Functions.GetPlayerData()
        crypto = QBCore.Functions.GetPlayerData().money.crypto

        if crypto >= Config.FingerPrint.price then
            DoScreenFadeOut(500)
            QBCore.Functions.Progressbar('name_here', Config.Languages[Config.Lang].FingerPrint, Config.FingerPrint.Time, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = Config.FingerPrint.animDict,
                anim = Config.FingerPrint.anim,
                flags = 16,
            }, {}, {}, function() -- Play When Done
                DoScreenFadeIn(1000)
                TriggerServerEvent('darrk-bunker:server:changeFingerPrint')
            end)
        else
            QBCore.Functions.Notify(Config.Languages[Config.Lang].NoCrypto, "error")
        end
    end
end

function OpenIdCardMenu()
    if Config.enableUsePermisson then
        QBCore.Functions.TriggerCallback('darrk-bunker:server:hasperm', function(hasperm)
            if hasperm then
                SetDisplay(not display)
            end
        end, QBCore.Functions.GetPlayerData().citizenid)
    else
        SetDisplay(not display)
    end
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
	RegisterFontFile(Config.Font.FirstFont)
	fontId = RegisterFontId(Config.Font.FontTwo)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(215, 215, 215, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function CreateNPC(type,model,anim,dict,pos,help,key,range,start,finish)
    Citizen.CreateThread(function()
        if Config.ShowNpc then
            local hash = GetHashKey(model)
            local talking = false

            RequestModel(hash)
            while not HasModelLoaded(hash) do
              Wait(1)
            end

            RequestAnimDict(anim)
            while not HasAnimDictLoaded(anim) do
              Wait(1)
            end

            local ped = CreatePed(type, hash, pos.x, pos.y, pos.z - 1, pos.h, false, true)
            SetEntityHeading(ped, pos.h)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            TaskPlayAnim(ped,anim,dict, 8.0, 0.0, -1, 1, 0, 0, 0, 0)

            if model == 's_m_m_chemsec_01' then
                GiveWeaponToPed(ped, GetHashKey('weapon_asaultrifle'), 300, false, true)
            end
        end
    end)
end

RegisterNetEvent('darrk-bunker:client:FingerPrint#049827yb239d')
AddEventHandler('darrk-bunker:client:FingerPrint#049827yb239d', function()
    ChangeFingerPrint()
end)

RegisterNetEvent('darrk-bunker:client:IdCard#049827yb239d')
AddEventHandler('darrk-bunker:client:IdCard#049827yb239d', function()
    OpenIdCardMenu()
end)

RegisterNetEvent('darrk-bunker:client:Weapons#049827yb239d')
AddEventHandler('darrk-bunker:client:Weapons#049827yb239d', function()
    OpenWeaponsMenu()
end)

RegisterCommand('changelan', function(rows, args)
    Config.Lang = args[1]
    print(args)
end)