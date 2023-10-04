local QBCore = exports[Config.Core]:GetCoreObject()


exports[Config.Target]:AddBoxZone("hotdog", vector3(140.33, -992.28, 28.73), 2.5, 2.5, {
    name = "hotdog",
    heading = 30.0,
    debugPoly = false,
}, {
    options = {
        {
            type = "client",
            event = "A7-hotdog:shop",
            icon = "fas fa-box",
            label = "Buy Items",
            job = 'hot-dog',
        },
        {
            type = "client",
            event = "A7-hotdog:menu",
            icon = "fa-solid fa-mug-hot",
            label = "Make Drink",
            job = 'hot-dog',
        },
        {
            type = "client",
            event = "A7-hotdog:menu2",
            icon = "fa-solid fa-fire-burner",
            label = "Start cooking",
            job = 'hot-dog',
        },
        {
            type = "client",
            event = "A7-hotdog:menu3",
            icon = "fa-solid fa-fire-burner",
            label = "Make Fries",
            job = 'hot-dog',
        },
    },
    distance = 1.5
})

RegisterNetEvent('A7-hotdog:menu', function()
    SetEntityCoords(PlayerPedId(), 140.77, -991.91, 28.36)
    SetEntityHeading(PlayerPedId(), 163.13)
    exports[Config.Menu]:openMenu({
        {
            header = "Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Soda Drink",
            txt = "You Need:</p>1x Empty Cup",
            icon = "fa-solid fa-mug-hot",
            params = {
                event = "A7-hotdog:client:makeCokeSoda",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = ""
            }
        },
    })
end)


RegisterNetEvent('A7-hotdog:menu2', function()
    SetEntityCoords(PlayerPedId(), 140.17, -991.87, 28.36)
    SetEntityHeading(PlayerPedId(), 163.13)
    exports[Config.Menu]:openMenu({
        {
            header = "HotDog Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Hot Dog",
            txt = "You Need:</p>1x Bread |1x Sausage |1x Lettuce |1x Mustard",
            icon = "fa-solid fa-fire-burner",
            params = {
                event = "A7-hotdog:client:makesausage",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = ""
            }
        },
    })
end)


RegisterNetEvent('A7-hotdog:menu3', function()
    SetEntityCoords(PlayerPedId(), 140.46, -991.88, 28.36)
    SetEntityHeading(PlayerPedId(), 163.13)
    exports[Config.Menu]:openMenu({
        {
            header = "Fries Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Fries",
            txt = "You Need:</p>1x Potato ",
            icon = "fa-solid fa-fire-burner",
            params = {
                event = "A7-hotdog:client:Fries",
            }
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent('A7-hotdog:client:makesausage', function()
	local ingredients = QBCore.Functions.HasItem({'hotdog-bread', 'hotdog-sausage', 'hotdog-lettuce', 'hotdog-mustard'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("start1", "Make HotDog", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("A7-hotdog:server:makesausage")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-bread"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-lettuce"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-mustard"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-sausage"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('A7-hotdog:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('A7-hotdog:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

RegisterNetEvent('A7-hotdog:client:Fries', function()
	local ingredients = QBCore.Functions.HasItem('hotdog-potato')
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("start1", "Make Fries", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("A7-hotdog:server:Fries")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-potato"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-fries"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('A7-hotdog:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('A7-hotdog:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

RegisterNetEvent('A7-hotdog:client:makeCokeSoda', function()
	local ingredients = QBCore.Functions.HasItem("hotdog-emptycup")
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "deepfry", 0.02)
        QBCore.Functions.Progressbar("start2", "Make Drink", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("A7-hotdog:server:makeCokeSoda")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-emptycup"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hotdog-drink"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Done !!", "error")
            TriggerEvent('A7-hotdog:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)


local function a7md()
    local ShopItems = {}
    ShopItems.label = "Vending Machine"
    ShopItems.items = Config.VendingItem
    ShopItems.slots = #Config.VendingItem
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..math.random(1, 99), ShopItems)
end

    RegisterNetEvent('A7-hotdog:shop', function()
        a7md()
    end)



    local model = `prop_hotdogstand_01`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    obj = CreateObject(model, 140.3, -992.57, 28.36, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityHeading(obj, 343.16)
    SetEntityAsMissionEntity(obj)


    RegisterNetEvent('A7-hotdog:client:Eat', function(itemName)
        QBCore.Functions.AddProp(`prop_cs_hotdog_02`)
            QBCore.Functions.RequestAnimDict("mp_player_inteat@burger")
            TaskPlayAnim(PlayerPedId(), 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        local ItemData = QBCore.Shared.Items[itemName]
        QBCore.Functions.Progressbar("eat_something", "Eating "..ItemData.label.."", 5000, false, false, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
    

                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
                    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 25)
                    -- TriggerServerEvent('hud:server:RelieveStress', math.random(15, 25))
    
            QBCore.Functions.RemoveProp()
            exports['qb-anims']:Cancel()
            StopAnimTask(PlayerPedId(), 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 1.0)
        end)
    end)


    RegisterNetEvent('A7-hotdog:client:Drink', function(itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"soda"})
        QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 25)
            TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
        end)
    end)  