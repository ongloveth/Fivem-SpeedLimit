ESX = nil 

CreateThread(function()
    while ESX == nil do
        ESX = exports.es_extended:getSharedObject()
        Wait(100)
    end
end)

CreateThread(function()
    while true do 
        -- Draw Every Frame
		Wait(0)
        -- Get the table config from Config/zones.config.lua
        for _, zone in ipairs(Config.zones) do 
            -- Using Modules to draw the marker
            Modules.DrawMarker(28, zone.coords, zone.radius, zone.markerColor)
        end
    end
end)

CreateThread(function()
    
    local playerPed = PlayerPedId()

    while true do 
        -- Draw Every Frame
		Wait(0)

        -- Get Vehicle from Ped (false = currentVehicle | true = lastVehicle)
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        -- Get the table config from Config/zones.config.lua
        for _, zone in ipairs(Config.zones) do 
            -- Collect the playerCoords by using GetEntityCoords Native
            local playerCoords = GetEntityCoords(playerPed)
            -- Collect the distance from length in table
            local distance = #(playerCoords - zone.coords)
            -- Checking distance between radius and check Ped is in vehicle or not?
            -- if return 0 then Ped is not in any Vehicle
            while distance < zone.radius and vehicle ~= 0 do 
                -- Draw Every Frame
                Citizen.Wait(0)
                -- Set the max speed to current vehicle by using the value from table in Config.zones.limit
                SetVehicleMaxSpeed(vehicle, zone.limit)
                playerCoords = GetEntityCoords(playerPed)
                distance = #(playerCoords - zone.coords)
                vehicle = GetVehiclePedIsIn(playerPed, false)
                print('on zone -> ', zone.limit * 3.6)
            end 
            -- Reset the max speed of the current vehicle using SetVehicleMaxSpeedS Native (0.0 = Reset)
            SetVehicleMaxSpeed(vehicle, 0.0)
        end
    end
end)
