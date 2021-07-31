evt_btns = {left=1, mid=3, right=2, changdpi=6}
press_btns= {left=1, mid=2, right=3}
bEnabled = false 


function IsWorking()
    return IsKeyLockOn("scrolllock")
end


function fLesson2()
    --PressAndReleaseKey("2")
    
    PressAndReleaseKey("comma", "period")
    
    Sleep(200)


end


function OnEvent(event, arg)
    --OutputLogMessage("Event: "..event.." Arg: "..arg.."\n");
    --if (event == "MOUSE_BUTTON_PRESSED" and arg == evt_btns.mid and bEnabled == false and IsKeyLockOn("numlock")) then
    if (event == "MOUSE_BUTTON_PRESSED" and arg == evt_btns.changdpi and bEnabled == false ) then
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


