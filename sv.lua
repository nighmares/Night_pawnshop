

RegisterServerEvent("Night:pawnserver")
AddEventHandler("Night:pawnserver", function(itemName, amount, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(itemName)
    local amount = tonumber(amount)

	if item.count < amount then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you dont have enought of this item bud!'})
		return
	end

	price = ESX.Math.Round(price * amount)
	xPlayer.addAccountMoney('black_money', price)
	xPlayer.removeInventoryItem(item.name, amount)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = "You sold " .. amount .. " " .. item.label .. " for $" .. ESX.Math.GroupDigits(price)})

end)