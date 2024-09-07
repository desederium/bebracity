repeat task.wait() until game:IsLoaded()


-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TeleportService  = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService('VirtualInputManager')
local RunService = game:GetService("RunService")

--// Place Id's
LOBBY_PLACE_ID = 1730877806
MAIN_GAME_PLACE_ID = 7465136166
IMPEL_PLACE_ID = 11424731604

--// Player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

--MAIN FUNCTIONS

local function Tween_Target(target,wait,high)

    repeat task.wait() until game.Players.LocalPlayer.Character

    repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")	

    local dest

    if typeof(target) == "Vector3" then
        dest = target
    elseif typeof(target) == "Instance" and target.Position or typeof(target) == "CFrame" and target.Position then
        dest = target.Position
    else
        return
    end
    if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart) 
        bv.velocity = Vector3.new(0,0,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    end

    local speed = tonumber((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    local time = speed/getgenv().speedvalue
    local Tween_info = TweenInfo.new(time, Enum.EasingStyle.Linear)

    local tween

    if high and high > 1 then
        tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, Tween_info, {CFrame = CFrame.new(Vector3.new(target.Position.X, target.Position.Y+high, target.Position.Z))})
    elseif high and high == 0 then
        local dis = tonumber((Vector3.new(target.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, target.Position.Z) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
        local t = dis/getgenv().speedvalue
        tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(t, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(target.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, target.Position.Z))})
    elseif not high then
        tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, Tween_info, {CFrame = CFrame.new(Vector3.new(target.Position.X, target.Position.Y, target.Position.Z))})
    end

    tween.Name = ("teleport")
    tween.Parent = fold

    DoTween = true

    tween:Play()

    if wait == true and not high then
        task.wait(Tween_info.Time)
    elseif high and high == 0 then
        local dis = tonumber((Vector3.new(target.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, target.Position.Z) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
        local t = dis/getgenv().speedvalue
        task.wait(t)
    elseif wait == true and high and high ~= 0 then
        task.wait(Tween_info.Time)
    end
end


local function Impel()

    --Impel functions

    local function dash()
        local args = {[1] = 6,[2] = "dash"}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("takestam"):FireServer(unpack(args))
    end

    --Tp Bypass

    local function bypass()
        while true do task.wait(6)
            pcall(function()
                local args = {
                    [1] = "Concasser",
                    [2] = {
                        ["char"] = game:GetService("Players").LocalPlayer.Character,
                        ["t"] = 1,
                        ["en2"] = LocalPlayer.Character.PrimaryPart.CFrame,
                        ["x0"] = LocalPlayer.Character.PrimaryPart.CFrame,
                        ["v0"] = LocalPlayer.Character.PrimaryPart.CFrame,
                        ["nt"] = 0,
                        ["g"] = LocalPlayer.Character.PrimaryPart.CFrame
                    }
                }
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
            end)
        end
    end

    --NoClip Camera

    local function NoClipCam()
        local sc = (debug and debug.setconstant) or setconstant
        local gc = (debug and debug.getconstants) or getconstants
        local pop = LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
        for _, v in pairs(getgc()) do
            if type(v) == 'function' and getfenv(v).script == pop then
                for i, v1 in pairs(gc(v)) do
                    if tonumber(v1) == .25 then
                        sc(v, i, 0)
                    elseif tonumber(v1) == 0 then
                        sc(v, i, .25)
                    end
                end
            end
        end
    end

    --Levers

    local function LeverStage2()
        pcall(function()

            task.wait(2)

            while workspace.Islands["Impel Base - Floor 2"].Interactables.BossGateLever:FindFirstChild("Highlight") do task.wait()

                while (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Islands["Impel Base - Floor 2"].Interactables.BossGateLever["Meshes/Lev_Cube"].Position).Magnitude > 10 do task.wait()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3198.75391, 2341.22852, -20531.5645)
                end

                fireproximityprompt(game:GetService("Workspace").Islands["Impel Base - Floor 2"].Interactables.BossGateLever.Lever["Meshes/Lev_Cube.004"].ProximityPrompt)

            end
        end)
    end

    local function LeverStage3f()
        pcall(function()

            task.wait(2)

            while workspace.Islands["Impel Base - Floor 3"].Interactables.LeftAreaLever:FindFirstChild("Highlight") do task.wait() 

                while (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Islands["Impel Base - Floor 3"].Interactables.LeftAreaLever["Meshes/Lev_Cube"].Position).Magnitude > 10 do task.wait()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4701.71826, 2306.33008, -20720.9902)
                end

                fireproximityprompt(game:GetService("Workspace").Islands["Impel Base - Floor 3"]:WaitForChild("Interactables"):WaitForChild("LeftAreaLever"):WaitForChild("Lever"):WaitForChild("Meshes/Lev_Cube.004"):WaitForChild("ProximityPrompt"))

            end
        end)
    end


    local function LeverStage3s()
        pcall(function()

            task.wait(2)

            while workspace.Islands["Impel Base - Floor 3"].Interactables.RightAreaLever:FindFirstChild("Highlight") do task.wait() 

                while (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Islands["Impel Base - Floor 3"].Interactables.RightAreaLever["Meshes/Lev_Cube"].Position).Magnitude > 10 do task.wait()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5160.68213, 2306.33081, -20797.4258)
                end

                fireproximityprompt(game:GetService("Workspace").Islands["Impel Base - Floor 3"]:WaitForChild("Interactables"):WaitForChild("RightAreaLever"):WaitForChild("Lever"):WaitForChild("Meshes/Lev_Cube.004"):WaitForChild("ProximityPrompt")) 

            end
        end)
    end

    --Kill functions

    local function M1()
        local args = {
            [1] = {[1] = "swingsfx",[2] = "Sword",[3] = 4,[4] = "Ground",[5] = false,
                [6] = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("SwordHandle"):WaitForChild("Swords"):WaitForChild("BuddhaMode"):WaitForChild("Slashes"):WaitForChild("GroundSlash5"),
                [7] = 2.2333333492279053,[8] = 5}
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CombatRegister"):InvokeServer(unpack(args))
    end


    CanAttack = false
    
    task.spawn(function()
        while true do task.wait(1)
            pcall(function()
                if tonumber(game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name]:WaitForChild("Stamina").Value) > 60 then
                    local args = {[1] = "Judgement Impact",[2] = {["cf"] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args)) 
                    task.wait(16)
                end
            end)
        end
    end)


    task.spawn(function()
        while true do task.wait(1)
            pcall(function()
                if tonumber(game:GetService("ReplicatedStorage")["Stats"..game.Players.LocalPlayer.Name]:WaitForChild("Stamina").Value) > 60 then
                    local args = {[1] = "Palm Strike",[2] = {["cf"] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args)) 
                    task.wait(13)
                end
            end)
        end
    end)

    local function UltFarm(targetfunc,palm) task.wait(0.1)
        
        Judg = false
        Palm = false

        pcall(function()
            for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
                if string.find(v.Name, "Impact") then
                    Judg = true
                end
            end

            if Judg == true then
                pcall(function()
                    local args = {[1] = targetfunc.HumanoidRootPart.CFrame}
                    game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."|ServerScriptService.Skills.Skills.SkillContainer.Buddha-Buddha.Judgement Impact"]:FireServer(unpack(args))
                end)
            end

            if palm ~= false then
                local function PalmInfo()
                    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if string.find(v.Name, "Palm") then
                            Palm = true
                        end
                    end
                end

                PalmInfo()

                if Palm == true then
                    CanAttack = true
                    pcall(function()
                        
                        task.spawn(function()
                            while CanAttack == true and Palm == true do task.wait()
                                pcall(function()
                                    PalmInfo()
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetfunc.HumanoidRootPart.CFrame + Vector3.new(0,20,0) 
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(LocalPlayer.Character.HumanoidRootPart.Position,targetfunc.HumanoidRootPart.Position)
                                end)
                            end
                        end)

                        task.wait(1) 
                        local args = {[1] = targetfunc.HumanoidRootPart.CFrame}
                        game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."|ServerScriptService.Skills.Skills.SkillContainer.Buddha-Buddha.Palm Strike.Base"]:FireServer(unpack(args))
                    end)

                    task.wait(0.5)
                end

                CanAttack = false
            end
        end)
    end

    local function unBuddha()
        while game.Players.LocalPlayer.Character:GetAttribute("FormType") == "Beast" do task.wait(0.2)
            --pcall(function()
                local args = {[1] = "Buddha Transformation",[2] = {[1] = false,[2] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args)) 
            --end)
        end
    end

    Positions = {}

    local function Kill()
        while #Workspace.NPCs:GetChildren() ~= 0 do task.wait()
            for _, target in pairs(Workspace.NPCs:GetChildren()) do

                --Fruit Fucker
                for _, target in pairs(Workspace.NPCs:GetChildren()) do
                    pcall(function()
                        if target.Name == "Impel Guard" or target.Name == "Impel Prisoner" then

                            if game.Players.LocalPlayer.Character:GetAttribute("FormType") == "Beast" then task.wait()
                                unBuddha()
                            end
        
                            if target.Info:FindFirstChild("DevilFruit") then
                                pcall(function()
                                    target.Name = "Boss"
            
                                    task.spawn(function()
                                        while Workspace.NPCs:FindFirstChild("Boss") do task.wait(0.1)
                                            pcall(function()
                                                LocalPlayer.Character.HumanoidRootPart.CFrame = Positions[1] + Vector3.new(0,80,0)
                                            end)
                                        end
                                    end)
            
                                    while Workspace.NPCs:FindFirstChild("Boss") do task.wait(0.1)
                                        pcall(function()
                                            local args = {[1] = target.HumanoidRootPart.CFrame}
                                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha-Buddha").stomp:FireServer(unpack(args))
                                        end)
                                    end
                                end)
                            end
                        end
                    end)
                end

                if target.Name == "Impel Guard" or target.Name == "Impel Prisoner" or target.Name == "Snow Wolf" then
                    if game.Players.LocalPlayer.Character:GetAttribute("FormType") == "Beast" then task.wait() print("UNBUDDHA")
                        unBuddha()
                    end

                    target.Name = "Boss"

                    task.spawn(function()
                        while Workspace.NPCs:FindFirstChild("Boss") do task.wait()
                            pcall(function()
                                if CanAttack == false then
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,40,0)
                                end
                            end)
                        end
                    end)

                    while Workspace.NPCs:FindFirstChild("Boss") do task.wait(0.1)
                        pcall(function()
                            if game.Players.LocalPlayer.Character:GetAttribute("buddhaDamage") < 1900 then print("ATTACKING")
                                UltFarm(target)
                                print("NOPE")
                            end
    
                            if game.Players.LocalPlayer.Character:GetAttribute("buddhaDamage") >= 1900 then task.wait(0.1)
                                pcall(function()
                                    local args = {[1] = target.HumanoidRootPart.CFrame }
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha-Buddha").stomp:FireServer(unpack(args))
                                end)
                            end
                        end)
                    end
                end

                if target.Name ~= "Impel Guard" and target.Name ~= "Impel Prisoner" and target.Name ~= "Snow Wolf" then
                    target.Name = "Boss"

                    while workspace.NPCs:FindFirstChild("Boss") do task.wait(0.1)

                        while game.Players.LocalPlayer.Character:GetAttribute("buddhaDamage") >= 1700 and game.Players.LocalPlayer.Character:GetAttribute("FormType") ~= "Beast" do task.wait(0.1)
                            pcall(function()
                                LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,60,0)
                                local args = {[1] = "Buddha Transformation",[2] = {[1] = true,[2] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args)) 
                            end)
                        end

                        if game.Players.LocalPlayer.Character:GetAttribute("FormType") == "Beast" then

                            print("Boss KIll Buddha Form")

                            task.spawn(function()
                                while Workspace.NPCs:FindFirstChild("Boss") and game.Players.LocalPlayer.Character:GetAttribute("FormType") == "Beast" do task.wait()
                                    pcall(function()
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,30,0)
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(LocalPlayer.Character.HumanoidRootPart.Position,target.HumanoidRootPart.Position)
                                    end)
                                end
                            end)

                            task.spawn(function()
                                pcall(function()
                                    while Workspace.NPCs:FindFirstChild("Boss") do task.wait(0.1)
                                        if not target.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                            local args = {[1] = target.HumanoidRootPart.CFrame }
                                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha-Buddha").stomp:FireServer(unpack(args))
                                        end
                                    end
                                end)
                            end)


                            while Workspace.NPCs:FindFirstChild("Boss") and game.Players.LocalPlayer.Character:GetAttribute("FormType") == "Beast" do task.wait()
                                pcall(function()
                                    if not target.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                        M1()
                                    end
                                end)
                            end
                        end

                         if game.Players.LocalPlayer.Character:GetAttribute("buddhaDamage") < 1700 and game.Players.LocalPlayer.Character:GetAttribute("FormType") ~= "Beast" then
                            task.spawn(function()
                                pcall(function()
                                    if not target.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                        local args = {[1] = target.HumanoidRootPart.CFrame }
                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha-Buddha").stomp:FireServer(unpack(args))
                                    end
                                end)
                            end)

                            task.spawn(function()
                                while Workspace.NPCs:FindFirstChild("Boss") and game.Players.LocalPlayer.Character:GetAttribute("FormType") ~= "Beast" do task.wait()
                                    pcall(function()
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,80,0)
                                    end)
                                end
                            end)

                            while game.Players.LocalPlayer.Character:GetAttribute("buddhaDamage") < 1700 and  Workspace.NPCs:FindFirstChild("Boss") do task.wait(0.1)
                                pcall(function()
                                    if not target.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                        UltFarm(target,false)
                                    end
                                end)
                            end
                         end
                    end
                end
            end
        end
    end


    NightmarePlus = false
        
    local function ImpelVote()


        task.spawn(function()
            repeat task.wait(1) until game.Players.LocalPlayer.PlayerGui:FindFirstChild("DiffChooser") 
            task.wait(5)
            if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("DiffChooser") then
                NightmarePlus = true
            end
        end) 


        repeat task.wait(1) until game.Players.LocalPlayer.PlayerGui:FindFirstChild("DiffChooser") 
        firesignal(game.Players.LocalPlayer.PlayerGui.DiffChooser.Frame.ScrollingFrame.Nightmare.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("525") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Defense.Add.MouseButton1Click)

        task.wait(5)
    end

    local function Drop()

        while not LocalPlayer.Backpack:FindFirstChild("Buddha") do task.wait(1)
            pcall(function()
                local args = {[1] = "equip",[2] = "Buddha"}
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Tools"):InvokeServer(unpack(args))
            end)
        end

        while not LocalPlayer.Character:FindFirstChild("Buddha") do task.wait(1)
            pcall(function()
                LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack.Buddha)
            end)
        end

        while not workspace:FindFirstChild("Buddha") do task.wait(1)
            VirtualInputManager:SendKeyEvent(true,"Backspace",false,game)
            VirtualInputManager:SendKeyEvent(false,"Backspace",false,game)
        end 

    end

    task.spawn(function()
        while true do task.wait(1)
            pcall(function()
                local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart) 
                bv.velocity = Vector3.new(0,0,0) 
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            end)
        end
    end)

    local function PBuddha()
        while not workspace.NPCs:FindFirstChild("Vera") do task.wait() end


        while not LocalPlayer.Backpack:FindFirstChild("Buddha") do task.wait(1)
            pcall(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Vera.HumanoidRootPart.CFrame + Vector3.new(0,100,0)
                local args = {[1] = "equip",[2] = "Buddha"}
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Tools"):InvokeServer(unpack(args))
            end)
        end


        while not LocalPlayer.Character:FindFirstChild("Buddha") do task.wait(1)
            pcall(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Vera.HumanoidRootPart.CFrame + Vector3.new(0,100,0)
                LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack.Buddha)
            end)
        end

        repeat task.wait(1)
            LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Vera.HumanoidRootPart.CFrame + Vector3.new(0,100,0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, true, game, 0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, false, game, 0)
        until LocalPlayer.Backpack:FindFirstChild("Buddha-Buddha") or LocalPlayer.Character:FindFirstChild("Buddha-Buddha")

        task.spawn(function()
            while workspace.NPCs:FindFirstChild("Vera") do task.wait(1)
                LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Buddha-Buddha"])
            end
        end)

        task.wait(10)
        
        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("25") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.FightingStyleMastery.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("300") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Stamina.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("875") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.DevilFruitMastery.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("525") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Defense.Add.MouseButton1Click)
    end

    local function KillWardenPlus()
        while not workspace.NPCs:FindFirstChild("Vera") do task.wait() end

        while workspace.NPCs:FindFirstChild("Vera") do task.wait() 
            pcall(function()
                local args = {[1] = workspace.NPCs.Vera.HumanoidRootPart.CFrame}
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha-Buddha").stomp:FireServer(unpack(args))
            end)
        end
    end

    local function KillWarden()

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("1000") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Strength.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("700") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Defense.Add.MouseButton1Click)

        while not workspace.NPCs:FindFirstChild("Vera") do task.wait() end

        task.wait(10)

        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack.BlackLeg)

        while workspace.NPCs:FindFirstChild("Vera") do task.wait()
            pcall(function()
                task.spawn(function()
                    while workspace.NPCs:FindFirstChild("Vera") do task.wait()
                        pcall(function()
                            LocalPlayer.Character.HumanoidRootPart.CFrame =  workspace.NPCs.Vera.HumanoidRootPart.CFrame
                        end)
                    end
                end)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, false, game, 0)
            end)
        end

    end

    local function GetKey()

        repeat task.wait(1) until Workspace.Effects:FindFirstChild("Key")

        task.wait(10)

        if NightmarePlus == false then
            local args = {[1] = "BlackLeg"}
            game:GetService("ReplicatedStorage").Events.learnStyle:FireServer(unpack(args))
        end

        getgenv().speedvalue = 35 
        
        NoClipCam()

        GotKey = false
        repeat task.wait(1)
            pcall(function()
                Tween_Target(Workspace.Effects.Key.Key,true,5)
                task.spawn(function()
                    while GotKey == false do task.wait()
                        pcall(function()
                            workspace.CurrentCamera.CFrame = CFrame.lookAt(LocalPlayer.Character.HumanoidRootPart.Position,Workspace.Effects.Key.Key.Position)
                        end)
                    end
                end)
                
                if Workspace.Effects.Key:FindFirstChild("highlightPrompt") then
                    fireproximityprompt(Workspace.Effects.Key.Key.ProximityPrompt)
                end
        
                task.wait(2)
                LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Effects.Key.Key.CFrame + Vector3.new(0,5,0)
            end)
        until not Workspace.Effects:FindFirstChild("Key")
        GotKey = true

        if NightmarePlus == false then
            PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("25") task.wait(1)
            firesignal(PlayerGui.Statistics.Main.Stats.FightingStyleMastery.Add.MouseButton1Click)
        end

        while game.Players.LocalPlayer.Character:GetAttribute("SpeedBypass") < 999 do task.wait() end

    end

    local function DeleteNPCs()
        for _,npc in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            pcall(function()
                if tonumber((LocalPlayer.Character.PrimaryPart.Position - npc.HumanoidRootPart.Position).Magnitude) > 130 then
                    npc:Destroy()
                end
            end)
        end
    end

    local function GetSp()

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("750") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Defense.Add.MouseButton1Click)

        local DeleteUseless = Workspace.Effects.DescendantAdded:Connect(function(item)
            if item:FindFirstChild("Part") and item.Name ~= "SP Reset Essence" then
                item:Destroy()
            end
        end)

        while not workspace:FindFirstChild("ChestCheck") do task.wait(1)
            pcall(function()
                local part = Instance.new("Part")
                part.Anchored = true
                part.Parent = workspace
                part.CFrame = CFrame.new(2933.84399, 2050.44531, -13474.677)
                part.Name = "ChestCheck"
                part.Size = Vector3.new(1,1,1)
                task.wait(5)
            end)
        end
        
        local function chest()
            for _, v in pairs(game:GetService("Workspace").Effects:GetChildren()) do
                if v:FindFirstChild("Top") and v:FindFirstChild("Lock") and v:FindFirstChild("Bottom") and not game:GetService("Workspace").Effects:FindFirstChild("SP Reset Essence") then
                    for _, chest in pairs(v:GetChildren()) do
                        if chest.Name ~= "Top" and chest.Name ~= "Lock" and chest.Name ~= "Bottom" and chest.Name ~= "highlightPrompt" and 
                        (workspace.ChestCheck.Position - chest.Position).Magnitude < 600 then 
                            LocalPlayer.Character.PrimaryPart.CFrame = chest.CFrame + Vector3.new(0,3.5,0)
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(true,"E",false,game)
                            task.wait(3)
                            VirtualInputManager:SendKeyEvent(false,"E",false,game)
                        end
                    end
                end
            end
        end

        chest()
        
        DeleteUseless:Disconnect()

        if not workspace.Effects:FindFirstChild("SP Reset Essence") then
            game:GetService("TeleportService"):Teleport(1730877806, game:GetService("Players").LocalPlayer)
        end
        
        repeat task.wait()
            pcall(function()
        
                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Effects["SP Reset Essence"].Part.CFrame
                task.wait(1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game)
                task.wait(2)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"E",false,game)
                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Effects["SP Reset Essence"].Part.CFrame + Vector3.new(0,5,0)
                task.wait(2)
        
            end)
        until LocalPlayer.Backpack:FindFirstChild("SP Reset Essence")

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2933.84399, 2090.44531, -13474.677)

        
    end

    local function UseSp()
        print("i am here")
        repeat task.wait()
            pcall(function()
                if LocalPlayer.Backpack:FindFirstChild("SP Reset Essence") then
                    LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["SP Reset Essence"])
                end 
            end)
        until LocalPlayer.Character:FindFirstChild("SP Reset Essence")

        print("Now here")
        repeat task.wait(1)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, true, game, 0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, false, game, 0)
        until not PlayerGui:FindFirstChild("ConfirmationPrompt")

        while not PlayerGui:FindFirstChild("ConfirmationPrompt") do task.wait() end

        while PlayerGui:FindFirstChild("ConfirmationPrompt") do task.wait()
            pcall(function()
                firesignal(PlayerGui.ConfirmationPrompt.Main.OptionsFrame.Accept.MouseButton1Click)
            end)
        end

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("25") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.FightingStyleMastery.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("200") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Stamina.Add.MouseButton1Click)
    end


    local function GetFruit()

        pcall(function()
            LocalPlayer.Character.FallDamage.Disabled = true
        end)

        while game.Players.LocalPlayer.Character:GetAttribute("SpeedBypass") < 2999 do task.wait() end

        getgenv().speedvalue = 1200

        while not workspace:FindFirstChild("BuddhaIsland") do task.wait(1)
            pcall(function()
                local part = Instance.new("Part")
                part.Anchored = true
                part.Parent = workspace
                part.CFrame = CFrame.new(20000, 25.836013793945312, 0)
                part.Name = "BuddhaIsland"
                part.Size = Vector3.new(1,1,1)
                task.wait(5)
            end)
        end

        while (LocalPlayer.Character.HumanoidRootPart.Position - workspace.BuddhaIsland.Position).Magnitude > 10 do task.wait()
            Tween_Target(CFrame.new(20000, 25.836013793945312, 0),true)
        end

        dash() wait(1)

        repeat task.wait() until workspace:FindFirstChild("Buddha") 

        dash() wait(1)

        while not LocalPlayer.Backpack:FindFirstChild("Buddha") do task.wait(1)
            pcall(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Buddha.FruitModel.Part1.CFrame task.wait(2)
                VirtualInputManager:SendKeyEvent(true,"E",false,game) wait(2)
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,10,0)
            end)
        end

        print("Got buddha")

        repeat task.wait(1)
            pcall(function()
                LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack.Buddha)
            end)
        until LocalPlayer.Character:FindFirstChild("Buddha")

        task.wait(1)

        repeat task.wait(1)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, true, game, 0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, false, game, 0)
        until LocalPlayer.Backpack:FindFirstChild("Buddha-Buddha") or LocalPlayer.Character:FindFirstChild("Buddha-Buddha")

        while game.Players.LocalPlayer.Character:GetAttribute("SpeedBypass") < 2999 do task.wait() end

        getgenv().speedvalue = 1200

        while not workspace:FindFirstChild("Stage1Spawn") do task.wait(1)
            pcall(function()
                local part = Instance.new("Part")
                part.Anchored = true
                part.Parent = workspace
                part.CFrame = CFrame.new(2933.84399, 2100.44531, -13474.677)
                part.Name = "Stage1Spawn"
                part.Size = Vector3.new(1,1,1)
                task.wait(5)
            end)
        end

        while (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Stage1Spawn.Position).Magnitude > 10 do task.wait()
            Tween_Target(CFrame.new(2933.84399, 2100.44531, -13474.677),true) 
        end

        dash() wait(1)

        Tween_Target(CFrame.new(2933.84399, 2100.44531, -13474.677),true) task.wait(2)

        dash() wait(1)

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2933.84399, 2090.44531, -13474.677)


        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("1000") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.DevilFruitMastery.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("500") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.Defense.Add.MouseButton1Click)

        PlayerGui.Statistics.Main.TopOptions.Base.Input.Text = ("25") task.wait(1)
        firesignal(PlayerGui.Statistics.Main.Stats.FightingStyleMastery.Add.MouseButton1Click)
    end

    local function teleport(cframe,high,wait)

        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end)

        pcall(function()
            if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart) 
                bv.velocity = Vector3.new(0,0,0) 
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            end
        end)

        while #workspace.NPCs:GetChildren() == 0 do task.wait()
            LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        end

        if #workspace.NPCs:GetChildren() ~= 0 then 
            task.wait(2)
        end

        while #workspace.NPCs:GetChildren() == 0 do task.wait()
            LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        end

        if #Workspace.NPCs:GetChildren() ~= 0 then
            LocalPlayer.Character.HumanoidRootPart.CFrame = cframe + Vector3.new(0,high,0) 
        end

        Kill()

        while #workspace.NPCs:GetChildren() ~= 0 do task.wait() end

        task.wait(1)
    end

    local function EqBuddha()
        while true do task.wait(5)
            pcall(function()
                LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Buddha-Buddha"])
            end)
        end
    end


    local function NpcNearby()
        repeat task.wait()
            pcall(function()
                for _, guard in pairs(workspace.NPCs:GetChildren()) do
                    if (LocalPlayer.Character.HumanoidRootPart.Position - guard.HumanoidRootPart.Position).Magnitude < 30 then
                        Got = true
                    end
                end
            end)
        until Got == true
    end

    local function Stage1Kill()
        while #Workspace.NPCs:GetChildren() ~= 0 do task.wait() DeleteNPCs()
            pcall(function()
                for _, target in pairs(Workspace.NPCs:GetChildren()) do
                    if target.Name == "Impel Guard" or target.Name == "Impel Prisoner" then

                        target.Name = "Boss"

                        if target.Info.CombatType.Value == "Gun" then

                            task.spawn(function()
                                while Workspace.NPCs:FindFirstChild("Boss") do task.wait()
                                    pcall(function()
                                        if CanAttack == false then
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,40,0)
                                        end
                                    end)
                                end
                            end)

                            while Workspace.NPCs:FindFirstChild("Boss") do task.wait()
                                pcall(function()
                                    UltFarm(target)
                                end)
                            end
                        else
                            task.spawn(function()
                                while Workspace.NPCs:FindFirstChild("Boss") do task.wait()
                                    pcall(function()
                                        if CanAttack == false then
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame + Vector3.new(0,40,0)
                                        end
                                    end)
                                end
                            end)

                            while Workspace.NPCs:FindFirstChild("Boss") and not target:FindFirstChild("VenomDemonModel") do task.wait()
                                pcall(function()
                                    UltFarm(target)
                                end)
                            end
                        end
                    end
                end
            end)
        end
    end


    local function NotNpcNearby()
        repeat task.wait()
            pcall(function()
                for _, guard in pairs(workspace.NPCs:GetChildren()) do
                    if (LocalPlayer.Character.HumanoidRootPart.Position - guard.HumanoidRootPart.Position).Magnitude > 50 then
                        Got = true
                    end
                end
            end)
        until Got == true
    end

    local function Stage1()

        LeverCam = false


        task.spawn(function()
            while true do task.wait()
                if LeverCam == false then
                    pcall(function()
                        CamDist(300)
                        --game:GetService("VirtualInputManager"):SendMouseWheelEvent(1, 1, false, game) 
                    end)
                end
            end
        end)

        task.spawn(EqBuddha)
        getgenv().speedvalue = 80
        Tween_Target(CFrame.new(2947.86377, 2075.44531, -13913.877), true)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2951.50098, 2096.74585, -13977.2422)
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy() 
        end)
        NpcNearby()
        DeleteNPCs()
        Stage1Kill()
        --NotNpcNearby() 
        task.wait(5)

        while not workspace:FindFirstChild("Stage1CheckEnd") do task.wait(1)
            pcall(function()
                local part = Instance.new("Part")
                part.Anchored = true
                part.Parent = workspace
                part.CFrame = CFrame.new(2680.07764, 2075.70874, -15511.675)
                part.Name = "Stage1CheckEnd"
                part.Size = Vector3.new(1,1,1)
                task.wait(5)
            end)
        end
        
        while (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Stage1CheckEnd.Position).Magnitude > 10 do task.wait()
            for i = 1, 10, 1 do task.wait(0.1) dash()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2680.07764, 2075.70874, -15511.675)
            end
        end

        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy() 
        end)
        NpcNearby()
        DeleteNPCs() 
        Stage1Kill()
    end

    
    local function unBuddha()
        pcall(function()
            if LocalPlayer.Character:FindFirstChild("Aura") then
                local args = {[1] = "Buddha Transformation",[2] = {[1] = false,[2] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
            end
        end)
    end





    --[[

    STAGES

    ]]--


    local function teleport(cframe,value)


        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end)

        pcall(function()
            if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart) 
                bv.velocity = Vector3.new(0,0,0) 
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            end
        end)

        if value ~= true then

            while game.Players.LocalPlayer.PlayerGui:FindFirstChild("Combo") do task.wait(1) end
    
            while #workspace.NPCs:GetChildren() == 0 do task.wait(1)
                pcall(function()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
                end)
            end
        
            Damaged = false

            task.spawn(function()
                while Damaged == false do task.wait()
                    pcall(function()
                        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Combo") then
                            Damaged = true 
                        end
                    end)
                end
            end)
    
            while Damaged == false do task.wait()
                Kill()
            end
    
            while #workspace.NPCs:GetChildren() ~= 0 do task.wait() end
    
            while game.Players.LocalPlayer.PlayerGui:FindFirstChild("Combo") do task.wait(1) end

            task.wait(1)

        end
        
        pcall(function()
            table.remove(Positions, 1)
        end)


        table.insert(Positions, cframe)
    end
    

    local function Stage2()
        repeat task.wait(1) until PlayerGui.ImpelDownUI.Info.Timers:FindFirstChild("Floor 2: Wild Hell")

        while not workspace.Effects:WaitForChild("Zones"):FindFirstChild("End") do task.wait() end


        while #workspace.Effects.Zones.End:GetChildren() == 0 do task.wait()
            teleport(CFrame.new(3205.22607, 2385.43091, -20264.2969))
            teleport(CFrame.new(3194, 2378.35571, -20399.3477))
            teleport(CFrame.new(3422.55078, 2378.35571, -20391.873))
            teleport(CFrame.new(3461.38135, 2378.35571, -20599.3379))
            unBuddha()
            LeverStage2()
            teleport(CFrame.new(3201.28174, 2378.35571, -20398.4316))
            teleport(CFrame.new(3202.94678, 2378.3064, -20596.6445))
            teleport(CFrame.new(3201.86279, 2375.40576, -20791.3066))
            task.wait(2)
        end

        unBuddha()

        for i=1,5,1 do task.wait(0.5)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3197.65088, 2378.30566, -21077.2031)
        end

        --[[
        while not PlayerGui.ImpelDownUI.Info.Timers:FindFirstChild("Floor 3: Starvation Hell") do task.wait(1)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3197.65088, 2378.30566, -21077.2031)
        end
        ]]--
    end



    local function Stage3()

        repeat task.wait(1) until PlayerGui.ImpelDownUI.Info.Timers:FindFirstChild("Floor 3: Starvation Hell")

        while not workspace.Effects:WaitForChild("Zones"):FindFirstChild("End") do task.wait() end

        while #workspace.Effects.Zones.End:GetChildren() == 0 do task.wait()
            teleport(CFrame.new(4972.52148, 2306.5542, -20737.1582))
            teleport(CFrame.new(4770.34717, 2306.33057, -20750.0742))
            unBuddha()
            LeverStage3f()
            teleport(CFrame.new(5095.00781, 2306.33032, -20774.3438))
            unBuddha()
            LeverStage3s() 
            getgenv().speedvalue = 70
            task.wait(2)
            Tween_Target(CFrame.new(5031.95752, 2310.33008, -20736.0859),true)
            Tween_Target(CFrame.new(4983.3877, 2310.33008, -20729.9062),true)
            Tween_Target(CFrame.new(4983.21, 2310.33, -20861.1),true)
            Tween_Target(CFrame.new(4983.21, 2380.33, -20861.1),true)
            Tween_Target(CFrame.new(4896.3501, 2373.33008, -20986.9375),true)
            teleport(CFrame.new(4896.3501, 2368.33008, -20986.9375))
            teleport(CFrame.new(4784.11816, 2395.83008, -20789.7695))
            teleport(CFrame.new(5231.13184, 2398.05469, -20804.8047))
            teleport(CFrame.new(5540.67041, 2405.75562, -20817.0996))
            teleport(CFrame.new(5610.43115, 2499.75537, -20967.459))
            teleport(CFrame.new(5667.92041, 2490.29883, -20474.9883))
            task.wait(2)
        end

        unBuddha()

        --while not PlayerGui.ImpelDownUI.Info.Timers:FindFirstChild("Floor 4: Freezing Hell") do task.wait(1)
        for i=1,5,1 do task.wait(0.5)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5667.70654, 2489.33032, -20263.0645)
        end
        --end
    end

    End = false

    local function ZoneChecker()
        pcall(function()
            if #workspace.Effects.Zones.End:GetChildren() ~= 0 then
                End = true
            end
        end)
    end

    local function Stage4()

        repeat task.wait(1) until PlayerGui.ImpelDownUI.Info.Timers:FindFirstChild("Floor 4: Freezing Hell")


        while End == false do task.wait()
            ZoneChecker()
            teleport(CFrame.new(10404.6172, 1613.54639, -18944.644), true) 
            teleport(CFrame.new(9999.86, 1596.55, -19148.5))
            teleport(CFrame.new(10024.8, 1628.55, -19616.6))
            teleport(CFrame.new(9759.37, 1629.21, -19717.3))
            teleport(CFrame.new(9689.49, 1628.55, -20243.1))
            teleport(CFrame.new(10112.8389, 1628.55359, -20331.4004))
            teleport(CFrame.new(10586.3, 1628.55, -20353.1))
            teleport(CFrame.new(10946.6, 1628.55, -20482.5))
            teleport(CFrame.new(10921.3, 1628.55, -20951.6))
            teleport(CFrame.new(10576.9, 1628.55, -20995))
            teleport(CFrame.new(9980.47, 1695.55, -21812.8))
             ZoneChecker()
            task.wait(5)
            ZoneChecker()
            task.wait(2)
        end

        unBuddha()

        for i=1,5,1 do task.wait(0.5)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9980.50488, 1657.55347, -22129.7656)
        end
    end

    local function Stage5()
        repeat task.wait(1) until PlayerGui.ImpelDownUI.Info.Timers:FindFirstChild("Floor 5: Blazing Hell")


        VeraEnd = false

        local function Stage5Checker()
            pcall(function()
                while true do task.wait()
                    pcall(function()
                        if Workspace.NPCs.Boss:FindFirstChild("Vera's WhipSword") then
                            VeraEnd = true
                        end
                    end)
                end
            end)
        end

        task.spawn(Stage5Checker)

        task.spawn(function()
            while true do task.wait()
                pcall(function()
                    if Workspace.NPCs.Boss:FindFirstChild("Vera's WhipSword") then
                        task.spawn(function()
                            while workspace.NPCs:FindFirstChild("Boss") do task.wait() end
                            pcall(function()
                                while LocalPlayer.Character:FindFirstChild("Aura") do task.wait()
                                    local args = {[1] = "Buddha Transformation",[2] = {[1] = false,[2] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                                    game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
                                end
                            end)
                        end)
                    end
                end)
            end
        end)

        while VeraEnd == false do task.wait()

            teleport(CFrame.new(9153.61328, 579.418457, -27839.3438), true)
            teleport(CFrame.new(9395.74414, 575.974915, -27935.1113), 30)
            teleport(CFrame.new(10161.5645, 575.21991, -27360.8066), 30)
            teleport(CFrame.new(10652.2861, 545.719849, -27470.3145), 30)
            teleport(CFrame.new(10639.7588, 503.359619, -28374.9824), 30)
            teleport(CFrame.new(10226.7, 465.72, -28456.7),30) 
            teleport(CFrame.new(9689.45605, 514.640869, -28463.6191),30)
            teleport(CFrame.new(9639.34863, 455.031464, -27557.9043),50)
            task.wait(10)
        end

        print(555)
    end

    local function unBuddha()
        pcall(function()
            if LocalPlayer.Character:FindFirstChild("Aura") then
                local args = {[1] = "Buddha Transformation",[2] = {[1] = false,[2] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
            end
        end)
    end


    local function ImpelFunc()

        

        task.spawn(bypass)
        ImpelVote()

        if NightmarePlus == true then
            print(111)
            PBuddha()
            print(11111111)
            KillWardenPlus()
            GetKey()
        else
            Drop()
            KillWarden()
            GetKey()
            GetSp()
            UseSp()
            GetFruit() 
        end


        task.spawn(function()
            while true do task.wait(1)
                pcall(function()
                    for _, effect in pairs(workspace:GetDescendants()) do
                        if effect.Name == "Base" or effect.Name == "Buildings" or effect.Name == "Tree" then
                            effect:Destroy()
                        end
                    end
                end)
            end
        end)



        task.spawn(function()
            while true do task.wait(0.1)
                pcall(function()
                    local args = {[1] = true,[2] = "Melee",[3] = true}
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Block"):InvokeServer(unpack(args))
                end)
            end
        end)

        CanAttack = false

        task.spawn(function()
            while true do task.wait(1)
                pcall(function()
                    local args = {[1] = "Judgement Impact",[2] = {["cf"] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args)) 
                    task.wait(16)
                end)
            end
        end)


        task.spawn(function()
            while true do task.wait(1)
                pcall(function()
                    local args = {[1] = "Palm Strike",[2] = {["cf"] = LocalPlayer.Character.HumanoidRootPart.CFrame}}
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args)) 
                    task.wait(13)
                end)
            end
        end)



        task.spawn(function()
            while true do task.wait()
                pcall(function()
                    for _, effect in pairs(workspace.Terrain:GetChildren()) do
                        effect:Destroy()
                    end
                end)
            
                pcall(function()
                    for _, effect in pairs(workspace.Camera:GetChildren()) do
                        effect:Destroy()
                    end
                end)
            
            
                pcall(function()
                    for _, effect in pairs(game:GetService("Lighting"):GetChildren()) do
                        effect:Destroy()
                    end
                end)
            
                pcall(function()
                    if workspace.Effects:FindFirstChild("Right") then
                        workspace.Effects.Right:Destroy()
                    end
                end)
            end
        end)

        

        Stage1()
        Stage2()
        Stage3() 

        task.spawn(function()
            while true do task.wait(1)
                pcall(function()
                    for _, effect in pairs(workspace:GetDescendants()) do
                        if effect.Name == "Buildings" then 
                            effect:Destroy()
                        end
                    end
                end)
            end
        end)

        Stage4()
        Stage5() 
        task.wait(30)
        Tween_Target(CFrame.new(6392.69043, 653.702942, -27930.8418), true)  
    end

    ImpelFunc()
    task.wait(10)
end

Impel()

local connection = game:GetService("Workspace").Effects.ChildAdded:Connect(function(descendant)
    pcall(function()
        if descendant.Name == ("exploson") then task.wait()
            task.spawn(function()
                descendant:Destroy()
            end)
        end
    end)
end)
