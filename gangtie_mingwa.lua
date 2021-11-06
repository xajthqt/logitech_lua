evt_btns = {left=1, mid=3, right=2, changdpi=6, sidebtn1=4, sidebtn2=5}
press_btns= {left=1, mid=2, right=3}
bEnabled = false
mana_interval=10 * 60 * 1000  -- 10min
pull_interval=30000 -- ms
mana_time = mana_interval
pull_time = 0

function IsWorking()
    return IsKeyLockOn("scrolllock")
end


function fLesson2()
    --PressAndReleaseKey("2")
    if(mana_time >= mana_interval)
    then
        PressAndReleaseKey("F5")
        Sleep(500)
        mana_time = 0
    end

    mana_time = mana_time + pull_interval
    
    PressAndReleaseKey("1")
    Sleep(pull_interval)
end

function active1(event, arg)
    return event == "G_RELEASED" and arg == 1 and bEnabled == false
end

function active2(event, arg)
    return event == "MOUSE_BUTTON_PRESSED" and arg == evt_btns.changdpi and bEnabled == false
end


function OnEvent(event, arg)
    --OutputLogMessage("Event: "..event.." Arg: "..arg.."\n");
    --if (event == "MOUSE_BUTTON_PRESSED" and arg == evt_btns.mid and bEnabled == false and IsKeyLockOn("numlock")) then
    if (active1(event, arg) == true or active2(event, arg) == true ) then
        bEnabled = true
        while 1 do
            if (IsWorking() == false) then
                break
            end
            fLesson2()
        end

        bEnabled = false
    end
end