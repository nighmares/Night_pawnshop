

RegisterServerEvent("Night:pawnserver")
AddEventHandler("Night:pawnserver", function(itemName, amount, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(itemName)
	local locationItem = Config.shop[least]
    local amount = tonumber(amount)

	if amount <= 20 then
		if price * amount > Config.totalselling then

			if Config.usingdiscordhook then
				local pawnshop = {
					['Player'] = xPlayer.source, 
					['Log'] = 'default', 
					['Title'] = 'Pawnshop', 
					['Message'] = ''.. GetPlayerName(xPlayer.source) ..' tried to exploit pawnshop trigger!!', 
					['Color'] = 'blue' 
				}
			
				TriggerEvent('Boost-Logs:SendLog', pawnshop)
				return
	
				DropPlayer(source, 'try again later bud')
			else
				return
				DropPlayer(source, 'try again later bud')
			end
			
	
		end	
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant sell more than 20 items'})
	end	



	

	if (item.count < amount) then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you dont have enought of this item bud!'})
	elseif amount <= 20 then
		xPlayer.removeInventoryItem(item.name, amount)
		xPlayer.addAccountMoney('black_money', price * amount)	
	
	end

end)