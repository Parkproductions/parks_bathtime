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

local group
local AddGangPrompt
function AddGang()
    Citizen.CreateThread(function()
        local str = 'Take a Bath'
        AddGangPrompt = PromptRegisterBegin()
        PromptSetControlAction(AddGangPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(AddGangPrompt, str)
        PromptSetEnabled(AddGangPrompt, true)
        PromptSetVisible(AddGangPrompt, true)
        PromptSetHoldMode(AddGangPrompt, true)
        PromptSetGroup(AddGangPrompt, group)
        PromptRegisterEnd(AddGangPrompt)
 
    end)
end
 
local target = 0
local active = false
Citizen.CreateThread(function()
    while true do
        Wait(10)
        local id, id2 = GetPlayerTargetEntity(PlayerId())
        if id2 ~= 0 and id2 ~= nil then
            target = id2
            if active == false and IsPedAPlayer(target) and your_gang ~= nil and your_grade >=10 then
                group = PromptGetGroupIdForTargetEntity(target)
                AddGang()
                active = true
                print(group)
            end
            if PromptHasHoldModeCompleted(AddGangPrompt) then
                local playerHandle = NetworkGetPlayerIndexFromPed(target)
                if NetworkIsPlayerActive(playerHandle) then
                    print("ADD")
                    print(playerHandle)
                    TriggerServerEvent('tor_gang:AddToGang', GetPlayerServerId(playerHandle) , your_gang)
                    PromptDelete(AddGangPrompt)
                end
            end
        else
            Wait(200)
            PromptDelete(AddGangPrompt)
            active = false
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