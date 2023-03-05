local showUi = false

Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
        if IsControlJustReleased(0, 288) then
            if showUi == false then
                SetNuiFocus(true, true)
                SendNUIMessage({type = "enable"})
                showUi = true;
            end
        end
        Citizen.Wait(1)
    end
end)

RegisterNUICallback('NUIFocusOff', function()
    if showUi == true then
        SetNuiFocus(false, false)
        SendNUIMessage({type = "disable"})
        showUi = false
    end
end)