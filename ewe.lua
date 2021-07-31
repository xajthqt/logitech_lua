evt_btns = {left=1, mid=3, right=2, changdpi=6, sidebtn1=4, sidebtn2=5}
press_btns= {left=1, mid=2, right=3}
bEnabled = false 


function IsWorking()
    return IsKeyLockOn("scrolllock")
end


function fLesson2()
    --PressAndReleaseKey("2")
    
    PressAndReleaseKey("E")
    PressKey("W")
    Sleep(400)
    PressAndReleaseKey("E")
    --Sleep(100)
    ReleaseKey("W")


end

function active1(event, arg)
    return event == "G_RELEASED" and arg == 1 and bEnabled == false
end

function active2(event, arg)
    return event == "MOUSE_BUTTON_PRESSED" and arg == evt_btns.sidebtn2 and bEnabled == false
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
            break
        end

        bEnabled = false
    end
end