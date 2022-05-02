local display = false


RegisterNUICallback("HideIdCard", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("confirm", function(data)
    -- body
    SetDisplay(false)
    TriggerServerEvent("darrk-bunker:server:CheckIfHaveMoney", data)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        status = bool,
        Lang = Config.Languages[Config.Lang]
    })
end