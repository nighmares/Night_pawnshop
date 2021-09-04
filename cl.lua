local pedspawneado = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.ubicacion) do
			local cordenadasped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cordenadas - cordenadasped)
			
			if dist < 11 and pedspawneado == false then
				TriggerEvent('spawn:pawnshop',v.Cordenadas,v.h)
				pedspawneado = true
			end
			if dist >= 10  then
				pedspawneado = false
				DeletePed(tunpc)
			end
		end
	end
end)

exports['qtarget']:AddBoxZone("Night:pawnshop", vector3(-42.5,-1473.92, 30.82), 0.60, 0.70, {
	name="Night:pawnshop",
	heading=23.64,
	debugPoly=false,
	minZ=29.67834,
	maxZ=32.57834,
	}, {
	options = {
		{
			event = "Night:pawnshop",
			icon = "fas fa-sign-in-alt",
			label = "Open Pawn Shop",
		},
	},
	distance = 3.5
})

RegisterNetEvent('spawn:pawnshop')
AddEventHandler('spawn:pawnshop',function(coords,heading)
	local hash = GetHashKey('a_m_o_beach_01')
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawneado = true
	tunpc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc, true)
    SetBlockingOfNonTemporaryEvents(tunpc, true)
end)

RegisterNetEvent('Night:pawnshop', function()

    for k,v in pairs(Config.shop) do
        local shop2 = {}
        table.insert(shop2, {
            id = k,
            header = v.label,
            txt = '',
            params = {
                event = 'Night:pawnshopsamount',
                args = {
                    name = v.name,
                    price = v.price
                }
            }
        })
        TriggerEvent('nh-context:sendMenu',shop2)

    end    

    
end)

RegisterNetEvent('Night:pawnshopsamount')
AddEventHandler('Night:pawnshopsamount', function(data)

    
    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Add Amount", 
        rows = {
            {
                id = 0, 
                txt = "Amount to sell"
            }
        }
    })
    if keyboard ~= nil then
        TriggerServerEvent('Night:pawnserver',data.name,keyboard[1].input,data.price)
    end   
end)   