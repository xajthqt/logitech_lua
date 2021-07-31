bEnabled = false


msBt = {L = 1, R = 2, M = 3, B = 4, F = 5, D = 6}


function OnEvent(event, arg, family)
    local x1, y1, x2, y2, t1, t2


    if(event == "MOUSE_BUTTON_PRESSED" and bEnabled == false and IsKeyLockOn("scrolllock") == false)
    then
        t1 = GetRunningTime()
        bEnabled = true


        if arg == msBt.M
        then
            x1, y1 = GetMousePosition()
            while(true)
            do
                Sleep(20)
                if(not IsModifierPressed("rctrl"))
                then
                    t2 = GetRunningTime()
                    break
                end
            end
            if((t2 - t1) < 2000)
            then
                x2, y2 = GetMousePosition()
                if(math.abs(x1 - x2) < math.abs(y1 - y2) and y1 > y2 and math.abs(y1 - y2) >= 10)
                then
                    if(IsModifierPressed("ctrl") and IsModifierPressed("alt"))
                    then
                        --
                    elseif IsModifierPressed("ctrl")
                    then
                        noModifierPressKey({"equal", "s", "u", "m", "enter"})
                    elseif IsModifierPressed("alt")
                    then
                        --
                    else
                        pressKeyboard({"c"}, {"lctrl"})
                    end
                elseif(math.abs(x1 - x2) < math.abs(y1 - y2) and y1 < y2 and math.abs(y1 - y2) >= 10)
                then
                    if(IsModifierPressed("ctrl") and IsModifierPressed("alt"))
                    then
                        --
                    elseif IsModifierPressed("ctrl")
                    then
                        noModifierPressKey({"equal", "s", "u", "m", "p", "r", "o", "d", "u", "c", "t", "enter"})
                    elseif IsModifierPressed("alt")
                    then
                        --
                    else
                        pressKeyboard({"v"}, {"lctrl"})
                    end
                elseif(math.abs(x1 - x2) > math.abs(y1 - y2) and x1 > x2 and math.abs(x1 - x2) >= 10)
                then
                    if(IsModifierPressed("ctrl") and IsModifierPressed("alt"))
                    then
                        --
                    elseif IsModifierPressed("ctrl")
                    then
                        noModifierPressKey({"equal", "r", "o","u", "n", "d", "enter"})
                    elseif IsModifierPressed("alt")
                    then
                        --
                    else
                        pressKeyboard({"z"}, {"lctrl"})
                    end
                elseif(math.abs(x1 - x2) > math.abs(y1 - y2) and x1 < x2 and math.abs(x1 - x2) >= 10)
                then
                    if(IsModifierPressed("ctrl") and IsModifierPressed("alt"))
                    then
                        --
                    elseif IsModifierPressed("ctrl")
                    then
                        noModifierPressKey({"equal", "c", "o", "u","n", "t", "i", "f", "enter"})
                    elseif IsModifierPressed("alt")
                    then
                        --
                    else
                        pressKeyboard({"f"}, {"lctrl"})
                    end
                else
                    if(IsModifierPressed("ctrl") and IsModifierPressed("alt"))
                    then
                        --
                    elseif IsModifierPressed("ctrl")
                    then
                        noModifierPressKey({"equal", "v", "l", "o", "o", "k", "u", "p", "enter"})
                    elseif IsModifierPressed("alt")
                    then
                        noModifierPressKey({"lalt", "d", "p"})
                    else
                        pressKeyboard({"a"}, {"lctrl"})
                    end
                end
            else
                PressAndReleaseKey("scrolllock")
            end


        elseif arg == msBt.D
        then
            while(true)
            do
                Sleep(20)
                t2 = GetRunningTime()
                if((t2 - t1) < 500)
                then
                    if(not IsModifierPressed("rctrl"))
                    then
                        break
                    end 
                else
                    break
                end
            end
            if ((t2 - t1) >= 500)
            then
                PressKey("lalt")
                while(true)
                do
                    if(IsModifierPressed("rctrl"))
                    then
                        PressAndReleaseKey("tab")
                    else
                        ReleaseKey("lalt")
                        PressAndReleaseKey("enter")
                        break
                    end
                    Sleep(500)
                end
            else
                pressKeyboard({"tab"}, {"lctrl"})
            end


        elseif arg == msBt.F
        then
            while(true)
            do
                Sleep(20)
                if(not IsModifierPressed("rctrl"))
                then
                    t2 = GetRunningTime()
                    break
                end
            end
            if ((t2 - t1) < 300)
            then
                pressKeyboard({"pageup"}, {"lctrl"})
            else
                pressKeyboard({"home"}, {"lctrl"})
            end


        elseif arg == msBt.B
        then
            while(true)
            do
                Sleep(20)
                if(not IsModifierPressed("rctrl"))
                then
                    t2 = GetRunningTime()
                    break
                end
            end
            if ((t2 - t1) < 300)
            then
                pressKeyboard({"pagedown"}, {"lctrl"})
            else
                pressKeyboard({"end"}, {"lctrl"})
            end
        end


        bEnabled = false


    elseif(event == "MOUSE_BUTTON_PRESSED" and bEnabled == false and IsKeyLockOn("scrolllock") == true)
    then
        t1 = GetRunningTime()
        bEnabled = true
        if arg == msBt.M
        then
            --
        elseif arg ==msBt.F
        then
            --
        elseif arg ==msBt.B
        then
            --
        elseif arg ==msBt.D
        then
            --
        end
        bEnabled = false
    end
end


function pressKeyboard(pressR, pressH)
    local i
    local element
    if(pressH)
    then
        for i, element in ipairs(pressH)
        do
            PressKey(element)
        end
    end
    if(IsKeyLockOn("capslock"))
    then
        PressAndReleaseKey("capslock")
    end
    for i, element in ipairs(pressR)
    do
        if(string.len(element) == 1 and string.lower(element) ~= element)
        then
            Sleep(5)
            PressAndReleaseKey("capslock")
            PressAndReleaseKey(string.lower(element))
            PressAndReleaseKey("capslock")
        else
            Sleep(5)
            PressAndReleaseKey(element)
        end
    end
    if(pressH)
    then
        for i, element in ipairs(pressH)
        do
            ReleaseKey(element)
        end
    end
end


function noModifierPressKey(key)
    while(true)
    do
        if ((not IsModifierPressed("ctrl")) and (not IsModifierPressed("alt")))
        then
            Sleep(5)
            pressKeyboard(key)
            break
        end
    end
end