local hiluxModel = nil
local currentVehicle = nil

function LoadHiluxModel()
    local modelHash = GetHashKey(Config.Vehicle.model)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end
    return modelHash
end

function SpawnHilux(x, y, z, heading)
    local modelHash = LoadHiluxModel()

    if currentVehicle ~= nil then
        TriggerEvent('chat:addMessage', {
                                  color = {255, 0, 0},
                                  multiline = true,
                                  args = {"تنبيه", "السيارة موجودة بالفعل!"}
                              })
        return
    end

    currentVehicle = CreateVehicle(modelHash, x, y, z, heading, true, false)
    SetVehicleOnGroundProperly(currentVehicle)
    ApplyDefaultSettings(currentVehicle)
    TaskWarpPedIntoVehicle(PlayerPedId(), currentVehicle, -1)

    TriggerEvent('chat:addMessage', {
                          color = {0, 255, 0},
                          multiline = true,
                          args = {"تويوتا هايلوكس", "تم استدعاء السيارة بنجاح! ✓"}
                      })
end

function ApplyDefaultSettings(vehicle)
    SetVehicleColours(vehicle, 0, 0)
    SmashVehicleWindow(vehicle, 0)
    SmashVehicleWindow(vehicle, 1)
    SmashVehicleWindow(vehicle, 2)
    SmashVehicleWindow(vehicle, 3)
    SetVehicleEngineHealth(vehicle, 1000)
    SetVehicleBodyHealth(vehicle, 1000)
end

function CustomizeColor(colorId)
    if currentVehicle == nil then
        TriggerEvent('chat:addMessage', {args = {"خطأ", "لا توجد سيارة مستدعاة"}})
        return
    end

    local color = Config.Colors[colorId]
    if color then
        SetVehicleColours(currentVehicle, color.primary, color.secondary)
        TriggerEvent('chat:addMessage', {
                                  color = {0, 255, 0},
                                  multiline = true,
                                  args = {"تخصيص", "تم تغيير اللون إلى: " .. color.name}
                              })
    end
end

function ShowVehicleInfo()
    local info = Config.Vehicle
    TriggerEvent('chat:addMessage', {
                          color = {0, 150, 255},
                          multiline = true,
                          args = {
                              "معلومات هايلوكس 2025",
                              "الاسم: " .. info.displayName .. "\nالنوع: " .. info.category .. "\nالسعر: $" .. info.price .. "\nالسرعة القصوى: " .. info.topSpeed .. " كم/س"
                          }
                      })
end

function FixVehicle()
    if currentVehicle == nil then
        TriggerEvent('chat:addMessage', {args = {"خطأ", "لا توجد سيارة مستدعاة"}})
        return
    end

    ApplyDefaultSettings(currentVehicle)
    TriggerEvent('chat:addMessage', {
                          color = {0, 255, 0},
                          multiline = true,
                          args = {"إصلاح", "تم إصلاح السيارة بنجاح! ✓"}
                      })
end

RegisterCommand('spawhhilux', function(source, args, rawCommand)
                     local ped = PlayerPedId()
                     local x, y, z = table.unpack(GetEntityCoords(ped))
                     SpawnHilux(x, y + 5, z, 0.0)
                 end, false)

RegisterCommand('customhilux', function(source, args, rawCommand)
                     if args[1] then
        CustomizeColor(tonumber(args[1]))
    end
end, false)

RegisterCommand('hiluxinfo', function(source, args, rawCommand)
                     ShowVehicleInfo()
                 end, false)

RegisterCommand('fixhilux', function(source, args, rawCommand)
                     FixVehicle()
                 end, false)

AddEventHandler('onClientResourceStart', function(resourceName)
                     if GetCurrentResourceName() == resourceName then
                         print("^2[Toyota Hilux 2025] Script Loaded Successfully!^7")
                     end
                 end)
