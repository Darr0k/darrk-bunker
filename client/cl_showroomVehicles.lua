local ShowRoomZone = PolyZone:Create({
    vector2(903.0848, -3236.04),
    vector2(917.1352, -3234.58),
    vector2(917.1477, -3230.04),
    vector2(915.8321, -3228.22),
    vector2(914.5506, -3226.91),
    vector2(914.7515, -3224.45),
    vector2(915.5888, -3223.90),
    vector2(915.4087, -3220.12),
    vector2(915.8368, -3216.84),
    vector2(915.7257, -3211.79),
    vector2(916.4261, -3194.06), 
    vector2(944.6971, -3191.27), 
    vector2(945.3767, -3195.40), 
    vector2(946.6948, -3198.91), 
    vector2(949.7288, -3198.74), 
    vector2(950.4964, -3203.90), 
    vector2(950.9472, -3237.84), 
    vector2(947.3923, -3240.94), 
    vector2(927.6962, -3241.07), 
    vector2(925.5183, -3239.80), 
    vector2(902.3650, -3238.80), 
    }, {
        debugPoly = false,
        name="pdm",
        minZ = -99.29,
        maxZ = 1
    })

local ShowRoomVehiclesSpawned = false
ShowRoomZone:onPlayerInOut(function(isPointInside)
    if isPointInside then
        if not ShowRoomVehiclesSpawned then
            ShowRoomVehiclesSpawned = true
            SpawnShowRoomVeh()
        end
    else
        ShowRoomVehiclesSpawned = false
        DeSpawnShowRoomVeh()
    end
end)

function SpawnShowRoomVeh()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    inRange = false

    for i = 1, #Config.Vehicles.ShowRoom do
        inRange = true
        local model = GetHashKey(Config.Vehicles.ShowRoom[i].defaultVehicle)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
        local veh = CreateVehicle(model, Config.Vehicles.ShowRoom[i].coords.x, Config.Vehicles.ShowRoom[i].coords.y, Config.Vehicles.ShowRoom[i].coords.z, false, false)
        SetModelAsNoLongerNeeded(model)
        SetEntityAsMissionEntity(veh, true, true)
        SetVehicleOnGroundProperly(veh)
        SetEntityInvincible(veh,true)
        SetVehicleDirtLevel(veh, 0.0)
        SetVehicleDoorsLocked(veh, 3)
        SetEntityHeading(veh, Config.Vehicles.ShowRoom[i].coords.w)
        FreezeEntityPosition(veh, true)
        SetVehicleNumberPlateText(veh, 'Darrk')
    end
end

function DeSpawnShowRoomVeh()
    for i = 1, #Config.Vehicles.ShowRoom do
        QBCore.Functions.DeleteVehicle(GetClosestVehicle(Config.Vehicles.ShowRoom[i].coords.x, Config.Vehicles.ShowRoom[i].coords.y, Config.Vehicles.ShowRoom[i].coords.z, 3.0, 0, 70))
    end
end

Citizen.CreateThread(function()
    while true do
        if ShowRoomVehiclesSpawned then
            for i = 1, #Config.Vehicles.ShowRoom do
                local ped = GetPlayerPed(-1)
                local pos = GetEntityCoords(ped)
                if GetDistanceBetweenCoords(pos, Config.Vehicles.ShowRoom[i].coords.x, Config.Vehicles.ShowRoom[i].coords.y, Config.Vehicles.ShowRoom[i].coords.z, true) < 3.5 then
                    DrawText3D(Config.Vehicles.ShowRoom[i].coords.x, Config.Vehicles.ShowRoom[i].coords.y, Config.Vehicles.ShowRoom[i].coords.z + 0.8, '~g~E~w~ - ~w~Rent Vehicle For~g~ $'..Config.Vehicles.ShowRoom[i].price)
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('darrk-bunker:client:spawnCar')
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

local ClosestVehicle = 1
local inTestDrive = false
RegisterNetEvent('darrk-bunker:client:spawnCar', function()
    for i = 1, #Config.Vehicles.ShowRoom do
            inTestDrive = true
            local prevCoords = GetEntityCoords(PlayerPedId())
            QBCore.Functions.SpawnVehicle(GetClosestVehicle(Config.Vehicles.ShowRoom[i].coords.x, Config.Vehicles.ShowRoom[i].coords.y, Config.Vehicles.ShowRoom[i].coords.z, 3.0, 0, 70), function(veh)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['qb-mainscripts']:SetFuel(veh, 100)
                SetVehicleNumberPlateText(veh, 'BUNKER')
                SetEntityAsMissionEntity(veh, true, true)
                SetEntityHeading(veh, -98.27)
                TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(veh))
                TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
                testDriveVeh = veh
                -- SetTimeout(Config.Shops[ClosestShop]["TestDriveTimeLimit"] * 60000, function()
                --     if testDriveVeh ~= 0 then
                --         testDriveVeh = 0
                --         inTestDrive = false
                --         QBCore.Functions.DeleteVehicle(veh)
                --         SetEntityCoords(PlayerPedId(), prevCoords)
                --     end
                -- end)
            end, vector4(886.5, -3246.03, -98.28, 274.05), false)
            -- createTestDriveReturn()
            startTestDriveTimer(1 * 60000)
    end
end)

function startTestDriveTimer(testDriveTime)
    local gameTimer = GetGameTimer()
    CreateThread(function()
        while inTestDrive do
            Wait(1)
            if GetGameTimer() < gameTimer+tonumber(1000*testDriveTime) then
                local secondsLeft = GetGameTimer() - gameTimer
                drawTxt('Test Drive Time Remaining: '..math.ceil(testDriveTime - secondsLeft/1000),4,0.5,0.93,0.50,255,255,255,180)
            end
        end
    end)
end

function drawTxt(text, font, x, y, scale, r, g, b, a)
	RegisterFontFile(Config.Font.FirstFont)
	fontId = RegisterFontId(Config.Font.FontTwo)
	SetTextFont(fontId)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end