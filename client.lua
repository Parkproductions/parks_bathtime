

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

local function DisplayHelp( _message, x, y, w, h, enableShadow, col1, col2, col3, a, centre )

    local str = CreateVarString(10, "LITERAL_STRING", _message, Citizen.ResultAsLong())

    SetTextScale(w, h)
    SetTextColor(col1, col2, col3, a)

    SetTextCentre(centre)

    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end

    Citizen.InvokeNative(0xADA9255D, 10);

    DisplayText(str, x, y)

end

Citizen.CreateThread(function()
    while true do

        local IsZone, IdZone = IsNearZone( Config.Coords )

        if IsZone then
            DisplayHelp(Config.bathtext, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            
        end

    end

end)