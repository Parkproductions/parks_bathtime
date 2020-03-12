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

YCD,C8A17841.ycd,mini_games@bathing@regular@arthur,
pack:/left_arm_one_scrub_return_to_idle_face.clip,
pack:/right_leg_finish_face.clip,
pack:/right_arm_scrub_fastest_face.clip,
pack:/left_leg_scrub_medium_face.clip,
pack:/left_arm_scrub_medium_face.clip,
pack:/left_leg_scrub_return_to_idle.clip,
pack:/head_scrub_return_to_idle_face.clip,
pack:/left_leg_scrub_return_to_idle_face.clip,
pack:/right_arm_scrub_medium.clip,
pack:/right_leg_scrub_fastest.clip,
pack:/enter_scrub_left_arm_face.clip,
pack:/head_scrub_return_to_idle.clip,
pack:/right_leg_scrub_fast_face.clip,
pack:/head_scrub_faster_loop_face.clip,
pack:/enter_scrub_right_arm_face.clip,
pack:/left_leg_scrub_slow_face.clip,
pack:/head_scrub_faster_loop.clip,
pack:/right_arm_scrub_return_to_idle_face.clip,
pack:/enter_scrub_right_arm.clip,
pack:/head_scrub_fast_loop_face.clip,
pack:/right_arm_finish_face.clip,
pack:/left_arm_scrub_slow_face.clip,
pack:/enter_scrub_left_leg_face.clip,
pack:/left_arm_scrub_fastest_face.clip,
pack:/left_leg_scrub_fastest.clip,
pack:/right_arm_scrub_medium_face.clip,
pack:/right_arm_scrub_fast_face.clip,
pack:/left_leg_scrub_fast_face.clip,
pack:/right_arm_scrub_fastest.clip,
pack:/right_arm_scrub_return_to_idle.clip,
pack:/left_arm_scrub_medium.clip,
pack:/exit_scrub_to_idle_face.clip,
pack:/right_arm_scrub_slow_face.clip,
pack:/enter_scrub_head_face.clip,
pack:/enter_scrub_right_leg_face.clip,
pack:/enter_scrub_right_leg.clip,
pack:/right_leg_scrub_fastest_face.clip,
pack:/right_leg_scrub_medium.clip,
pack:/left_arm_scrub_fastest.clip,
pack:/left_arm_scrub_fast_face.clip,
pack:/right_leg_scrub_medium_face.clip,
pack:/right_leg_scrub_return_to_idle.clip,
pack:/left_arm_one_scrub_return_to_idle.clip,
pack:/right_leg_scrub_return_to_idle_face.clip,
pack:/left_leg_scrub_fastest_face.clip,
pack:/left_leg_scrub_medium.clip,
pack:/right_leg_scrub_slow_face.clip,
pack:/head_scrub_slow_loop_face.clip,
pack:/cinematic_q5@biped@0_6.anim,
pack:/cinematic_q5@biped@0_1.anim,
pack:/cinematic_q5@biped@0_3.anim,
pack:/cinematic_q5@biped@0_8.anim,
pack:/cinematic_q5@biped@0_7.anim,
pack:/cinematic_q5@biped@0_5.anim,
pack:/cinematic_q5@biped@0_4.anim,
pack:/cinematic_q5@biped@0_2.anim,
pack:/cinematic_q5@biped@0_0.anim,
pack:/enter_scrub_left_leg.clip,
pack:/right_arm_scrub_slow.clip,
pack:/enter_scrub_left_arm.clip,
pack:/right_leg_finish.clip,
pack:/enter_scrub_head.clip,
pack:/left_leg_scrub_fast.clip,
pack:/enter_scrub_face.clip,
pack:/right_leg_scrub_fast.clip,
pack:/enter_scrub.clip,
pack:/bathing_idle_03.clip,
pack:/bathing_idle_02.clip,
pack:/bathing_idle_01.clip,
pack:/base_face.clip,
pack:/head_scrub_slow_loop.clip,
pack:/left_leg_finish_face.clip,
pack:/left_leg_scrub_slow.clip,
pack:/left_arm_scrub_fast.clip,
pack:/right_arm_finish.clip,
pack:/left_leg_finish.clip,
pack:/right_arm_scrub_fast.clip,
pack:/right_leg_scrub_slow.clip,
pack:/left_arm_finish_face.clip,
pack:/head_scrub_fast_loop.clip,
pack:/head_scrub_exit_face.clip,
pack:/head_scrub_exit.clip,
pack:/left_arm_scrub_slow.clip,
pack:/left_arm_finish.clip,
pack:/face_concentration.clip,
pack:/scrub_idle.clip,
pack:/scrub_idle_face.clip,
pack:/exit_scrub_to_idle.clip,
pack:/biped_q5@biped@0_7.anim,
pack:/biped_q5@biped@0_5.anim,
pack:/biped_q5@biped@0_0.anim,
pack:/biped_q5@biped@0_6.anim,
pack:/biped_q5@biped@0_4.anim,
pack:/biped_q5@biped@0_8.anim,
pack:/biped_q5@biped@0_2.anim,
pack:/biped_q5@biped@0_1.anim,
pack:/biped_q5@biped@0_3.anim,
pack:/biped_q5@biped@0_9.anim,
pack:/base.clip,

Citizen.CreateThread(function()

    local player = PlayerPedId()
    while true do
    Wait(10)
        local IsZone, IdZone = IsNearZone( Config.Coords )
 
        if IsZone then
            DisplayHelp(Config.bathtext, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
            
            if IsControlJustPressed(0, keys['E']) then
                
                
                    SetEntityCoords(player,  -1812.1,-373.21, 166.51, true, true, true, false)
                    SetEntityHeading(PlayerPedId(), 92.58)
                
                    local dict = "mini_games@bathing@regular@arthur"
                        RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do
                                Citizen.Wait(10)
                            end
                            TaskPlayAnim(player, dict, "bathing_idle_01", 1.0, 8.0, -1, 1, 0, false, false, false)
                            Citizen.Wait(10000)


            end

        end
 
    end
 
end)









