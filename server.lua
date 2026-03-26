-- Server-side script for Toyota Hilux 2025
-- Handles ownership, data persistence, and server events

RegisterServerEvent('hilux:checkOwnership')
AddEventHandler('hilux:checkOwnership', function(vehicleData)
    print("^3[Hilux Server] Vehicle ownership check completed^7")
    end)

    RegisterServerEvent('hilux:saveVehicleData')
    AddEventHandler('hilux:saveVehicleData', function(vehicleData)
        print("^3[Hilux Server] Saving vehicle data:^7")
            print("  - Model: " .. vehicleData.model)
                print("  - Color: " .. vehicleData.color)
                    print("  - Condition: " .. vehicleData.condition)
                    end)

                    RegisterServerEvent('hilux:priceCheck')
                    AddEventHandler('hilux:priceCheck', function()
                        TriggerClientEvent('chat:addMessage', -1, {
                                args = {"معلومات السعر", "سعر تويوتا هايلوكس 2025: $85,000"}
                                    })
                                    end)

                                    RegisterServerEvent('hilux:getInfo')
                                    AddEventHandler('hilux:getInfo', function()
                                        local info = {
                                                model = "hilux25",
                                                        displayName = "Toyota Hilux 2025",
                                                                price = 85000,
                                                                        topSpeed = 180
                                                                            }
                                                                                TriggerClientEvent('hilux:infoResponse', source, info)
                                                                                end)

                                                                                print("^2[Hilux Server] Script Initialized!^7")
