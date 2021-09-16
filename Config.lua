Config = {}

Config.usingdiscordhook = false  ---- if using boost's discord weebhook
Config.totalselling = 2000  --- this is the total amount a player can get from selling 20 items it has to match with the most expensive item in your shop * 20

Config.ubicacion = {
    {Cordenadas = vector3(-42.5,-1473.92, 30.82), h = 23.64}  ---- npc spawn location
}

Config.shop = {

   {label = 'oro', name = 'gold', price = 50},
   {label = 'hierro', name = 'iron', price = 100},  --- example this is the most expensive item so 100 * 20 = 2000 if a players tries to exploit the resource it will drop the player


}    

