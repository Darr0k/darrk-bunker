local VehiclesZone = PolyZone:Create({
    vector2(872.3286, -3249.26),
    vector2(894.8578, -3249.18),
    vector2(894.7518, -3243.06),
    vector2(895.8265, -3235.07),
    vector2(886.7526, -3234.33),
    vector2(886.5797, -3235.38),
    vector2(886.5797, -3235.38),
    vector2(885.3412, -3235.23),
    vector2(885.3761, -3236.81),
    vector2(878.5768, -3236.49),
    vector2(878.4456, -3235.42),
    vector2(878.4456, -3235.42),
    vector2(865.3384, -3235.79),
    vector2(864.9132, -3243.66),
    vector2(862.7603, -3243.71),
    vector2(858.8367, -3243.56),
    vector2(857.2868, -3231.67),
    vector2(838.4993, -3226.00),
    vector2(826.2058, -3227.25),
    vector2(823.3684, -3236.05),
    vector2(826.4971, -3247.65),
    vector2(828.9695, -3248.03),
    vector2(849.9315, -3248.98),
    vector2(849.9261, -3249.52),
    vector2(856.1939, -3250.15),
    vector2(862.3636, -3250.16),
    }, {
    debugPoly = false,
    name="baseZone",
    minZ = -99.29,
    maxZ = 1
})

local VehiclesSpawned = false
VehiclesZone:onPlayerInOut(function(isPointInside)
    if isPointInside then
        if not VehiclesSpawned then
            VehiclesSpawned = true
            SpawnEnteryVeh()
        end
    else
        VehiclesSpawned = false
        DeSpawnEnteryVeh()
    end
end)

function SpawnEnteryVeh()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    inRange = false

    for i = 1, #Config.Vehicles.Entery do
        inRange = true
        local model = GetHashKey(Config.Vehicles.Entery[i].defaultVehicle)
        -- print(model)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
        local veh = CreateVehicle(model, Config.Vehicles.Entery[i].coords.x, Config.Vehicles.Entery[i].coords.y, Config.Vehicles.Entery[i].coords.z, false, false)
        SetModelAsNoLongerNeeded(model)
        SetEntityAsMissionEntity(veh, true, true)
        SetVehicleOnGroundProperly(veh)
        SetEntityInvincible(veh,true)
        SetVehicleDirtLevel(veh, 0.0)
        SetVehicleDoorsLocked(veh, 3)
        SetEntityHeading(veh, Config.Vehicles.Entery[i].coords.w)
        SetVehicleWheelYRotation(veh, -1, 101)
        FreezeEntityPosition(veh, true)
        if model == 'caddy3' then
            SetVehicleExtra(veh, 3, true)
        end
        if model == 'caddy2' then
            SetVehicleExtra(veh, 2, true)
        end
        SetVehicleNumberPlateText(veh, 'Darrk')
    end
end

function DeSpawnEnteryVeh()
    for i = 1, #Config.Vehicles.Entery do
        QBCore.Functions.DeleteVehicle(GetClosestVehicle(Config.Vehicles.Entery[i].coords.x, Config.Vehicles.Entery[i].coords.y, Config.Vehicles.Entery[i].coords.z, 3.0, 0, 70))
    end
end