local blips = {
	{ name = 'Bath Tub', sprite = 662885764, x=-1812.73, y=-374.0, z=166.51 },
}



--------------------------------------------------------

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
            --[[if IsControlJustReleased(0, keys['E']) then
                WarMenu.OpenMenu('id_Horse')
                CurrentZoneActive = IdZone
            end--]]
        end

    end

end)


 


function DisplayHelp(_message, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
 local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", _message, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextCentre(centre)
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end