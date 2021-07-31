-- 在OnEvent传递的参数里，123代表的值是左右中。 而在PressAndReleaseMouseButton函数里，123代表的是左中右。 
-- module(...) 

iStartButton = 2 --鼠标按键，左中右是123，接下来456...看你啥鼠标了; 
evt_btns = {left=1, mid=3, right=2, changdpi=6}
press_btns= {left=1, mid=2, right=3}
bEnabled = false 
shootNum = 0
movNum = 0
bNet = false

function GetRandomSeed()
    x, y = GetMousePosition();
    --OutputLogMessage("Mouse is at %d, %d\n", x, y);  
    strpos = string.format("%d%d", x, y)
    return GetDate("%S%M%H")..strpos
end
math.randomseed(GetRandomSeed())

function IsWorking()
    return IsKeyLockOn("capslock")
end

function MyPressKey(key)
    PressKey(key)
    Sleep(math.random(200))
    ReleaseKey(key)
    Sleep(math.random(800, 1200))
    --PressAndReleaseKey("enter")
end

function SwitchCommander()
    Sleep(math.random(1000, 1500))
    PressAndReleaseKey("5")
    Sleep(math.random(800, 1200))
    PressAndReleaseKey("5")
    Sleep(math.random(1000, 1500))
end

-- fang guaji
function MoveForwardAndBack()
    PressKey("S")
    Sleep(math.random(800, 1000))
    ReleaseKey("S")
    
    -- SwitchCommander()

    PressKey("W")
    -- Sleep(math.random(500, 1000))
    tryRevivePets()
    Sleep(math.random(500, 800))
    ReleaseKey("W")
    MyPressKey("4")
    --PressAndReleaseKey("enter")
end

-- main gun shoot
function shootMainGun()
    --PressMouseButton(press_btns.left)
    --Sleep(math.random(300, 700))
    --ReleaseMouseButton(press_btns.left)
    
    -- ferrox through
    -- PressAndReleaseKey("F")
    -- Sleep(2000)
    PressKey("J")
    -- Sleep(math.random(500, 1000))
    Sleep(1000)
    ReleaseKey("J")
    
end

-- RevivePets
function tryRevivePets()
    MyPressKey("2")
end

-- jituan 4
function ProbNet(probability)
    if (bNet == false) then
        if (math.random(100) <= probability) then
            MyPressKey("4")
            bNet = true
        end
    end
end

function fLesson()
    --MoveMouseRelative(0,10)
    local bMoved = false
    bNet = false
    
    movNum = (movNum + 1)%2
    for i = 1, 8 do
        if (IsWorking() == false) then
            return
        end
        MyPressKey("1")
        
        -- 20% 
        ProbNet(20)
        --if ( i == 5) then
        --    PressAndReleaseKey("F")
        --end
    end
    if (bNet == false) then
        MyPressKey("4")
    end


    bNet = false
    
    --shootMainGun()
    
    if (movNum == 1) then
        shootMainGun()
    end

    for i = 1, 8 do
        if (IsWorking() == false) then
            return
        end
        MyPressKey("1")
        -- 20% 
        if (bMoved == false and movNum == 0) then
            if (math.random(100) <= 20) then
                MoveForwardAndBack()
                bMoved = true
            end
        end
        
        -- 23% 4
        ProbNet(23)
        
        if ( bNet and bMoved) then
            break
        end
    end
    
    if (bNet == false) then
        MyPressKey("4")
        bNet = true
    end

    if (bMoved == false and movNum == 0) then
        MoveForwardAndBack()
        bMoved = true
    end

end

function MoveAheadAndNet()

    PressKey("W")
    MyPressKey("1")
    Sleep(math.random(100))
    MyPressKey("1")
    Sleep(math.random(100))
    MyPressKey("4")
    ReleaseKey("W")
    Sleep(math.random(100, 300))
    PressKey("S")
    tryRevivePets()
    MyPressKey("1")
    --MyPressKey("1")
    ReleaseKey("S")
    PressKey("W")
    Sleep(500)
    ReleaseKey("W")
    
    -- SwitchCommander()


end

function ProbNet2(probability)
    if (bNet == false) then
        if (math.random(100) <= probability) then
            MoveAheadAndNet()
            bNet = true
        end
    end
end

function fLesson2()
    local bMoved = false
    bNet = false
    
    PressAndReleaseKey("F")
    
    for i = 1, 8 do
        if (IsWorking() == false) then
            return
        end
        MyPressKey("1")
        
        -- 20% 
        ProbNet2(20)
    end
    if (bNet == false) then
        ProbNet2(100)
    end
    
    shootMainGun()
    --MoveAheadAndNet()

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


