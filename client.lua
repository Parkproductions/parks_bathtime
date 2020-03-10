local blips = {
	{ name = 'Bath Tub', sprite = 662885764, x=-1712.73, y=-374.0, z=166.51 },
}
 
Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(662885764, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

local function IsNearZone ( location )

    local player = PlayerPedId()
    local playerloc = GetEntityCoords(player, 0)

    for i = 1, #location do
        if #(playerloc - location[i]) < 1.0 then
            return true, i
        end
    end

end

Citizen.CreateThread(function()
    while true do

        local IsZone, IdZone = IsNearZone( Config.Coords )

        if IsZone then
            DisplayHelp(Config.bathtext, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            
        end

    end

end)