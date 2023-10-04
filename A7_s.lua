local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent('A7-hotdog:server:makesausage', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("hotdog-bread", 1)
    Player.Functions.RemoveItem("hotdog-lettuce", 1)
    Player.Functions.RemoveItem("hotdog-mustard", 1)
    Player.Functions.RemoveItem("hotdog-sausage", 1)
    Player.Functions.AddItem("hotdog", 1)
end)

RegisterNetEvent('A7-hotdog:server:Fries', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("hotdog-potato", 1)
    Player.Functions.AddItem("hotdog-fries", 1)
end)

RegisterNetEvent('A7-hotdog:server:makeCokeSoda', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("hotdog-emptycup", 1)
    Player.Functions.AddItem("hotdog-drink", 1)
end)

QBCore.Functions.CreateUseableItem("hotdog", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("A7-hotdog:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hotdog-fries", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("A7-hotdog:client:Eat", source, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("hotdog-drink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("A7-hotdog:client:Drink", source, item.name)
    end
end)

-- ما اسامح اي شخص يحذف البرنت

print("^6A7 HotDog^7 - By : ^7A7store - ^6discord.gg/B6NbFj7dtV^7")


