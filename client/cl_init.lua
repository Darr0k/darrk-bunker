function showInteraction(text , type)
    -- print(text , type)
    SendNUIMessage({
        type = "open",
        text = text,
        color = type,
    })
end

function hideInteraction()
    -- print('1')
    SendNUIMessage({
        type = "close",
    })
end
local disableEnter = false
local disableLeave = false

local EnterZone = BoxZone:Create(vector3(1237.06, -2948.33, 9.32), 1.0, 1.55, {
    name="EnterBunker",
    heading=359,
    -- debugPoly=true,
    minZ=8.32,
    maxZ=10.72
})

EnterZone:onPlayerInOut(function(isPointInside)
    if isPointInside then
        if Config.enableUsePermisson then
            QBCore.Functions.TriggerCallback('darrk-bunker:server:hasperm', function(hasperm)
                if hasperm then
                    if not disableEnter then
                        disableLeave = true
                        EnterBunker()
                        Citizen.Wait(10000)
                        disableLeave = false
                    end
                end
            end, QBCore.Functions.GetPlayerData().citizenid)
        else
            disableLeave = true
            EnterBunker()
            Citizen.Wait(10000)
            disableLeave = false
        end
    end
end)

local ExitZone = BoxZone:Create(vector3(857.22, -3250.12, -98.3), 1.0, 2.3, {
    name="ExitBunker",
    heading=0,
    -- debugPoly=true,
    minZ=-99.3,
    maxZ=-96.05
})

ExitZone:onPlayerInOut(function(isPointInside)
    if isPointInside and not disableLeave then
        disableEnter = true
        LeaveBunker()
        print(disableEnter)
        Citizen.Wait(10000)
        disableEnter = false
    end
end)

local ExitZoneVeh = BoxZone:Create(vector3(892.94, -3246.01, -98.27), 4.0, 5.4, {
    name="ExitZoneVeh",
    heading=1,
    -- debugPoly=true,
    minZ=-99.27,
    maxZ=-95.27
  })

ExitZoneVeh:onPlayerInOut(function(isPointInside)
    if isPointInside then
        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
            LeaveBunkerWithVeh()
        end
    end
end)

