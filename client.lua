local blips = {
	{ name = 'Bath Tub', sprite = 662885764, x=-1812.73, y=-374.0, z=166.51 },
}
local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9 }
local pressTime = 0
local pressLeft = 0

 
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



local function DisplayHelp( _message, x, y, w, h, enableShadow, col1, col2, col3, a, centre )

    local str = CreateVarString(10, "LITERAL_STRING", _message, Citizen.ResultAsLong())

    SetTextScale(w, h)
    SetTextColor(col1, col2, col3, a)

    SetTextCentre(centre)

    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end

    Citizen.InvokeNative(0xADA9255D, 10);

    if IsPedUsingAnyScenario(PlayerPedId()) then

    else
        DisplayText(str, x, y)
    end

end



Citizen.CreateThread(function()

    local player = PlayerPedId()
    while true do
    Wait(10)
        local IsZone, IdZone = IsNearZone( Config.Coords )
 
        if IsZone then
            DisplayHelp(Config.bathtext, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            
            if IsControlJustPressed(0, keys['E']) then
                    DoScreenFadeOut(10)
                    SetEntityCoords(player,  -1812.1,-373.21, 166.51, true, true, true, false)
                    SetEntityHeading(PlayerPedId(), 92.58)
                    Citizen.Wait(1000)
                    DoScreenFadeIn(10)
                    SetCinematicModeActive(true)


            end

        end
 
    end
 
end)


RegisterCommand("anim", function(source, args)
                    Citizen.CreateThread(function()
                        local player = PlayerPedId()
                        SetEntityCoords(player,  -1812.1,-373.21, 166.51, true, true, true, false)
                    SetEntityHeading(PlayerPedId(), 92.58)
                        local dict = "mini_games@bathing@regular@arthur"
                        RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do
                                print('failed')
                                Citizen.Wait(0)
                            end
                        TaskPlayAnim(player, dict, "right_leg_scrub_medium", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(5000)       
                        TaskPlayAnim(player, dict, "right_leg_finish", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(1500)
                        TaskPlayAnim(player, dict, "bathing_idle_02", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(8000)  
                        TaskPlayAnim(player, dict, "left_leg_scrub_medium", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(5000)  
                        TaskPlayAnim(player, dict, "left_leg_finish", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(2000)  
                        TaskPlayAnim(player, dict, "bathing_idle_02", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(8000)        
                        TaskPlayAnim(player, dict, "left_arm_scrub_slow", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(5000)       
                        TaskPlayAnim(player, dict, "left_arm_finish", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(2000)
                        TaskPlayAnim(player, dict, "bathing_idle_02", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(8000)                           
                        TaskPlayAnim(player, dict, "head_scrub_slow_loop", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(5000)  
                        TaskPlayAnim(player, dict, "head_scrub_exit", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(1000)  
                        TaskPlayAnim(player, dict, "bathing_idle_01", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(10000)
                        ClearPedTasks(player)
                    end)

                end)






