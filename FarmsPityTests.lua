getgenv().alt = "Rustgrind7081 "
getgenv().main = "j6v7y1d2t6f9z3"
getgenv().maintoken = "5EAA2299D87750890E2DDEC12767F3C6"

repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer.Character
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("RemoteEvent")

-- // Constants 
local MAIN_GAME_PLACE_ID = 2809202155 
local COLLESIUM_PLACE_ID = 5290908008 
local STEEL_BALL_RUN_ID = 4643697430 
 
-- // Services 
local Players = game:GetService("Players") 
local Workspace = game:GetService("Workspace") 
local VirtualInputManager = game:GetService("VirtualInputManager") 
local TeleportService  = game:GetService("TeleportService") 
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
 
-- // Player 
local LocalPlayer = Players.LocalPlayer 
local PlayerGui = LocalPlayer.PlayerGui 

-- BYPASSES
 
local function bypass()

    -- TP BYPASS

    local TPBypass 
    TPBypass = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(self, ...) 
    local args = {...} 
    if self.Name == "Returner" and args[1] == "idklolbrah2de"  then 
            return "  ___XP DE KEY" 
        end 
    return TPBypass(self, ...) 
    end)) 
 
    -- ITEM SPAWN BYPASS

    local repFirst = game.GetService(game, 'ReplicatedFirst'); 
    local itemSpawn = repFirst.ItemSpawn; 
 
    local vector3Metatable = getrawmetatable(Vector3.new()); 
    local oldIndex = rawget(vector3Metatable, '__index'); 
 
    setreadonly(vector3Metatable, false); do 
        vector3Metatable.__index = newcclosure(function(self, idx) 
            if(string.lower(idx) == 'magnitude' and getcallingscript() == itemSpawn) then 
                return 0; 
            end; 
            return oldIndex(self, idx); 
        end); 
    end; setreadonly(vector3Metatable, true); 
end 

bypass()
 
local function skipScreen() -- AUTOSKIP
    if not LocalPlayer.PlayerGui:FindFirstChild("HUD") then 
        local HUD = game.ReplicatedStorage.Objects.HUD:Clone() 
        HUD.Parent = LocalPlayer.PlayerGui 
    end 
 
    LocalPlayer.Character.RemoteEvent:FireServer("PressedPlay") 
 
    if LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") then 
        LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1"):Destroy() 
    end 
 
    if LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") then 
        LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen"):Destroy() 
    end 
end 

-- SKIDDED AUTOHOP (lazy to make my own)

local function Hop()

    if syn and syn.request then request = syn.request end
    local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport
    assert(typeof(request) and typeof(queueteleport) and typeof(isfile) and typeof(makefolder) and typeof(isfolder) and typeof(readfile) and typeof(writefile) == 'function',"Missing functions")

    local game = game
    local PlaceId = game.PlaceId
    local JobId = game.JobId
    local PlaceIdString = tostring(PlaceId)

    local folderpath = "ServerHopper"
    local PlaceFolder = folderpath.."\\"..PlaceIdString
    local JobIdStorage = PlaceFolder.."\\JobIdStorage.json"
    local CodeToExecute = PlaceFolder.."\\Code.lua"
    local data
    local code

    local Players = game:FindService("Players")
    local http = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")

    local function jsone(str) return http:JSONEncode(str) end
    local function jsond(str) return http:JSONDecode(str) end

    if not isfolder(folderpath) then
        makefolder(folderpath)
        print("Created Folder",folderpath)
    end

    if not isfolder(PlaceFolder) then
        makefolder(PlaceFolder)
        print("Created PlaceFolder",PlaceFolder)
    end

    if isfile(JobIdStorage) then
        data = jsond(readfile(JobIdStorage))
    else
        data = {
            JobIds = {}
        }
        writefile(JobIdStorage,jsone(data))
        print("Created JobIdStorage",JobIdStorage)
    end

    if not isfile(CodeToExecute) then
        writefile(CodeToExecute,"")
        print("Created CodeToExecute",CodeToExecute)
        return 
    end

    if not table.find(data['JobIds'],JobId) then
        table.insert(data['JobIds'],JobId)
    end

    writefile(JobIdStorage,jsone(data))

    repeat task.wait() until game:IsLoaded() and Players.LocalPlayer


    local lp = Players.LocalPlayer

    local servers = {}
    local cursor = ''

    while cursor and #servers <= 0 do
        local req = request({Url = ("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor%s"):format(PlaceId,cursor)})
        local body = jsond(req.Body)
        
        if body and body.data then
            coroutine.wrap(function()
                for i,v in next, body.data do
                    if typeof(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and not table.find(data['JobIds'],v.id) then
                        table.insert(servers,1,v.id)
                    end
                end
            end)()
            
            if body.nextPageCursor then
                cursor = body.nextPageCursor
            end
        end

        task.wait()
    end
    local succ,err = pcall(function()
        loadstring(readfile(CodeToExecute))()
    end)
    if not succ then
        rconsoleprint("An Error has occursed\nPlease Check: "..CodeToExecute.."\nError:\n"..err)
        return
    end


    while #servers > 0 do
        local random = servers[math.random(1,#servers)]
        
        TeleportService:TeleportToPlaceInstance(PlaceId,random,lp)
        task.wait(1)
    end
end


-- FARMS FOR ALT PLAYER


local function AltFarm()

    local function AltFarmCheck()

        local function joinMain()

            repeat 
                local Got = false
                local Url = "https://games.roblox.com/v1/games/2809202155/servers/Public?sortOrder=Desc&limit=100" 
                local Server = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2809202155/servers/Public?sortOrder=Desc&limit=100")) 
                AscServer = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2809202155/servers/Public?sortOrder=Asc&limit=100")) 
                if AscServer.data then 
                    for i , search in ipairs(AscServer.data) do 
                        for i , playerToken in ipairs(search.playerTokens) do 
                            if playerToken == getgenv().maintoken then 
                                print("Found2") 
                                ID = search.id
                                Got = true 
				                wait(1)
                                local TeleportService = game:GetService("TeleportService")
                                TeleportService:TeleportToPlaceInstance(MAIN_GAME_PLACE_ID, ID)    
                            end 
                        end 
                    end 
                end 
                wait(0.2) 
                while Server.nextPageCursor ~= nil do wait(0.5) 
                    print(Server.nextPageCursor) 
                    if Server.data then 
                        for i , search in ipairs(Server.data) do 
                            for i , playerToken in ipairs(search.playerTokens) do 
                                if playerToken == getgenv().maintoken then 
                                    print("Found") 
                                    ID = search.id
                                    Got = true 
				                    wait(1)
                                    local TeleportService = game:GetService("TeleportService")
                                    TeleportService:TeleportToPlaceInstance(MAIN_GAME_PLACE_ID, ID)    
                                end 
                            end 
                        end 
                    end 
                    Server = game:GetService("HttpService"):JSONDecode(game:HttpGet(Url.."&cursor="..tostring(Server.nextPageCursor))) 
                end 
                wait(0.3)
            until Got == true
        end

        local function CanServerHop()
            if not LocalPlayer.Backpack:FindFirstChild("Gold Coin") then
                wait(50)
                if not LocalPlayer.Backpack:FindFirstChild("Gold Coin") then
                    CanHop = true
                end
            elseif LocalPlayer.PlayerStats:WaitForChild("Money").Value < 1500 then
                wait(50)
                if LocalPlayer.PlayerStats:WaitForChild("Money").Value < 1500 then
                    CanHop = true
                end
            end
        end

        local function CheckTusks()
            FullTusk = false
            if LocalPlayer:WaitForChild("PlayerStats").Slot1.Value == "Tusk ACT 1" and 
            LocalPlayer:WaitForChild("PlayerStats").Slot2.Value == "Tusk ACT 1" and
            LocalPlayer:WaitForChild("PlayerStats").Slot3.Value == "Tusk ACT 1" and
            LocalPlayer:WaitForChild("PlayerStats").Stand.Value == "Tusk ACT 1" then
                FullTusk = true
            end
        end

        local function AltJoinFunc()

            if not Players:FindFirstChild(getgenv().main) then

                repeat
                    CanServerHop()
                    task.wait(1)
                until CanHop == true

                if CanHop == true then
                    CheckTusks()
                    if FullTusk == true then
                        joinMain()
                    else
                        print(FullTusk)
                        print(CanHop) 
                        while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                            pcall(function()
                                Hop()
                            end)
                        end
                    end
                end
            end
        end

        task.spawn(function()
            while game.PlaceId == MAIN_GAME_PLACE_ID do
                while not Players:FindFirstChild(getgenv().main) do
                    pcall(function()
                        AltJoinFunc()
                    end)
                    task.wait(5)
                end
                task.wait(15)
            end
        end)
    end

    local function AutoFarmAlt()

        local function Fings()
    
            local function Arcade()
                while not Players:FindFirstChild(getgenv().main) do 
                    pcall(function()
                        if not PlayerGui:FindFirstChild("Rolling Item") then
                            local args = {
                                [1] = "EndDialogue",
                                [2] = {
                                    ["NPC"] = "Item Machine",
                                    ["Option"] = "Option1",
                                    ["Dialogue"] = "Dialogue1"
                                }
                            }
                            game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
                        end
                        PlayerGui.RollingItem:Destroy()
                    end)
                    task.wait(2)
                end
            end
    
            local function sell()
                while not Players:FindFirstChild(getgenv().main) do task.wait(2)
                    pcall(function()
                        for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                            if v.Name ~= "Gold Coin" and v.Name ~= "Left Arm of The Saint's Corpse" and v.Name ~= "Pelvis of The Saint's Corpse" and v.Name ~= "Heart of The Saint's Corpse" and v.Name ~= "Rib Cage of The Saint's Corpse" then 
                                LocalPlayer.Character.Humanoid:EquipTool(v)
                                wait(2)
                                local dialogueToEnd = {
                                    ["NPC"] = "Merchant",
                                    ["Dialogue"] = "Dialogue5",
                                    ["Option"] = "Option2"
                                }
                                LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                LocalPlayer.Character.Humanoid:UnequipTools()
                                wait(2)
                            end
                        end
                    end)
                end
            end
    
            local function sellMaxCoins()
                while not Players:FindFirstChild(getgenv().main) do task.wait(2)
                    Coin = 0
                    pcall(function()
                        for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                            if v.Name == "Gold Coin" then
                                Coin += 1
                                if Coin == 45 then
                                    LocalPlayer.Character.Humanoid:EquipTool(v)
                                    local dialogueToEnd = {
                                        ["NPC"] = "Merchant",
                                        ["Dialogue"] = "Dialogue5",
                                        ["Option"] = "Option1"
                                    }
                                    LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                end
                            end
                        end
                    end)
                end
            end
    
            local function sellMaxRibs()
                while not Players:FindFirstChild(getgenv().main) do task.wait(2)
                    pcall(function()
                        Rib = 0
                        for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                            if v.Name == "Rib Cage of The Saint's Corpse" then
                                Rib += 1
                                if Rib == 10 then
                                    LocalPlayer.Character.Humanoid:EquipTool(v)
                                    local dialogueToEnd = {
                                        ["NPC"] = "Merchant",
                                        ["Dialogue"] = "Dialogue5",
                                        ["Option"] = "Option1"
                                    }
                                    LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                end
                            end
                        end
                    end)
                end
            end
    
    
            task.spawn(Arcade)
            task.spawn(sellMaxRibs)
            task.spawn(sellMaxCoins)
            task.spawn(sell)
    
        
        end
    
    
        local function TuskFarm()
            
            local function UseRib()
                if LocalPlayer.PlayerStats.Stand.Value ~= "Tusk ACT 1" then
                    LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill",{["Skill"] = "Worthiness V",["SkillTreeType"] = "Character"})
                    local args = {
                        [1] = "EndDialogue",
                        [2] = {
                            ["NPC"] = "Rib Cage of The Saint's Corpse",
                            ["Option"] = "Option1",
                            ["Dialogue"] = "Dialogue2"
                        }
                    }  
                    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
                end
            end
    
            local function ChangeTusk()
                if LocalPlayer.PlayerStats.Stand.Value == "Tusk ACT 1" then
                    for _, v in pairs(LocalPlayer.PlayerStats:GetChildren()) do
                        if v.Name == "Slot1" or v.Name == "Slot2" or v.Name == "Slot3" then
                            if v then
                                if v.Value ~= "Tusk ACT 1" then
                                    repeat task.wait()
                                        LocalPlayer.Character.RemoteEvent:FireServer("SwapStand", v.Name)
                                        LocalPlayer.PlayerGui.HUD.Main.DropMoney.Money.Text = "100"
                                    until LocalPlayer.Character.Humanoid.Health <= 5
                                end
                            end
                        end
                    end
                end
            end
    
            task.spawn(function()
                while not Players:FindFirstChild(getgenv().main) do
                    pcall(function()
                        ChangeTusk()
                        UseRib()
                    end)
                    task.wait(2)
                end
            end)
        end
    
    
        local function ItemFarm() 
            for i,v in next, Workspace.Item_Spawns.Items:GetChildren() do 
                if v:IsA("Model") and v:FindFirstChild("MeshPart") then 
                    if v then 
                        pcall(function() 
                            while v.MeshPart:FindFirstChild("PointLight") and not Players:FindFirstChild(getgenv().main) do task.wait() 
                                print(v.MeshPart.CFrame) 
                                v.ProximityPrompt.MaxActivationDistance = 50 
                                task.spawn(function() 
                                    while not Players:FindFirstChild(getgenv().alt) do task.wait() 
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.MeshPart.CFrame + Vector3.new(0,-10,0) 
                                    end 
                                end) 
                                wait(0.5) 
                                fireproximityprompt(v.ProximityPrompt) 
                                wait(0.5) 
                            end 
                        end) 
                    end 
                end
            end 
        end
    
        task.spawn(function()
            while not Players:FindFirstChild(getgenv().main) do wait(30)
    
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000,0,600)
    
            end
    
        end)
    
        task.spawn(ItemFarm)
        task.spawn(TuskFarm)
        task.spawn(Fings)
    end
    
    task.spawn(AutoFarmAlt)
    task.spawn(AltFarmCheck)
end

local function TradeAlt()

    local function PreTrade()

        local function armsCheck()
            MainArms = 0
            AltArms = 0
            if Players:FindFirstChild(getgenv().main) then
                for i, v in pairs(Players:GetChildren()) do
                    if v.Name == getgenv().main then
                        for i, Arms in pairs(v.Backpack:GetChildren()) do
                            if Arms.Name == "Left Arm of The Saint's Corpse" then
                                MainArms += 1
                            end
                        end
                    end
                end
    
                for i, Arms in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if Arms.Name == "Left Arm of The Saint's Corpse" then
                        AltArms += 1
                    end
                end
                    
                if AltArms + MainArms >= 4 then
                    Arms = true
                    print(AltArms + MainArms)
                else
                    print("Not full - HOP")
                    Hop()
                end
            end
        end

        local function TuskCheck()
            if Players:FindFirstChild(getgenv().main) then
                if LocalPlayer:WaitForChild("PlayerStats").Slot1.Value == "Tusk ACT 1" and 
                LocalPlayer:WaitForChild("PlayerStats").Slot2.Value == "Tusk ACT 1" and
                LocalPlayer:WaitForChild("PlayerStats").Slot3.Value == "Tusk ACT 1" and
                LocalPlayer:WaitForChild("PlayerStats").Stand.Value == "Tusk ACT 1" then
                    Tusk = true
                else
                    Hop()
                end
            end
        end

        local function TradeReady()
            while Players:FindFirstChild(getgenv().main) do 
                pcall(function()
                    if not PlayerGui:FindFirstChild("CosmeticTrade") then
                        TuskCheck()
                        armsCheck()
                        if Tusk == true and Arms == true then
                            local args = {
                                [1] = "InitiateCosmeticTrade",
                                [2] = getgenv().main
                            }
                            game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))  
                        end
                    end
                end)
            task.wait(5)
            end
        end

        task.spawn(TradeReady)
    end

    local function InTrade()

        while Players:FindFirstChild(getgenv().main) do task.wait(1)
            if PlayerGui:FindFirstChild("CosmeticTrade") then wait(1)

                pcall(function()

                    for i, v in pairs(PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame:GetChildren()) do
                        if v.Name ~= "Left Arm of The Saint's Corpse" then
                            v:Destroy()
                        end
                    end

                    if LocalPlayer:FindFirstChild("Backpack") then
                        LocalPlayer.Backpack:Destroy()
                    end

                    if PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame:FindFirstChild("Left Arm of The Saint's Corpse") then
                        while PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].Square.Quantity.Text ~= "x0" do task.wait(1)
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsolutePosition.X + 20 + PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsoluteSize.X / 2, PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsolutePosition.Y + PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsoluteSize.Y + 20, 0, true, game, 0)
                            task.wait(0.1)
                            game:GetService("VirtualInputManager"):SendMouseButtonEvent(PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsolutePosition.X + 20 + PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsoluteSize.X / 2, PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsolutePosition.Y + PlayerGui.CosmeticTrade.Main.Items.ScrollingFrame["Left Arm of The Saint's Corpse"].AbsoluteSize.Y + 20, 0, false, game, 0)
                        end                          
                    end

                    Stand = PlayerGui.CosmeticTrade.Main.Stands.ScrollingFrame.Stand
                    Slot1 = PlayerGui.CosmeticTrade.Main.Stands.ScrollingFrame.Slot1
                    Slot2 = PlayerGui.CosmeticTrade.Main.Stands.ScrollingFrame.Slot2
                    Slot3 = PlayerGui.CosmeticTrade.Main.Stands.ScrollingFrame.Slot3

                    while not PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Stand") and not PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot1") do task.wait(1)

                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Stand.AbsolutePosition.X + Stand.AbsoluteSize.X / 2, Stand.AbsolutePosition.Y + Stand.AbsoluteSize.Y + 20, 0, true, game, 0)
                        task.wait(0.1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Stand.AbsolutePosition.X + Stand.AbsoluteSize.X / 2, Stand.AbsolutePosition.Y + Stand.AbsoluteSize.Y + 20, 0, false, game, 0)
                        task.wait(1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Slot1.AbsolutePosition.X + Slot1.AbsoluteSize.X / 2, Slot1.AbsolutePosition.Y + Slot1.AbsoluteSize.Y + 20, 0, true, game, 0)
                        task.wait(0.1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Slot1.AbsolutePosition.X + Slot1.AbsoluteSize.X / 2, Slot1.AbsolutePosition.Y + Slot1.AbsoluteSize.Y + 20, 0, false, game, 0)

                    end

                    wait(3)
                    if PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Stand") and PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot1") then
                        Scroll = PlayerGui.CosmeticTrade.Main.Stands.ScrollingFrame
                    end

                    game:GetService("VirtualInputManager"):SendMouseWheelEvent(Scroll.AbsolutePosition.X + Scroll.AbsoluteSize.X / 2, Scroll.AbsolutePosition.Y + Scroll.AbsoluteSize.Y , false, game)

                    while not PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot2") and not PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot3") do task.wait(1)

                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Slot2.AbsolutePosition.X + Slot2.AbsoluteSize.X / 2, Slot2.AbsolutePosition.Y + Slot2.AbsoluteSize.Y + 20, 0, true, game, 0)
                        task.wait(0.1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Slot2.AbsolutePosition.X + Slot2.AbsoluteSize.X / 2, Slot2.AbsolutePosition.Y + Slot2.AbsoluteSize.Y + 20, 0, false, game, 0)
                        task.wait(1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Slot3.AbsolutePosition.X + Slot3.AbsoluteSize.X / 2, Slot3.AbsolutePosition.Y + Slot3.AbsoluteSize.Y + 20, 0, true, game, 0)
                        task.wait(0.1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(Slot3.AbsolutePosition.X + Slot3.AbsoluteSize.X / 2, Slot3.AbsolutePosition.Y + Slot3.AbsoluteSize.Y + 20, 0, false, game, 0)

                    end

                    wait(3)
                    while PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Stand") and 
                    PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot1") and
                    PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot2") and
                    PlayerGui.CosmeticTrade.Main.Offering.ScrollingFrame:FindFirstChild("Slot3") do task.wait(1)
                        print("FULL")
                        confirm = PlayerGui.CosmeticTrade.Main.Confirm
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(confirm.AbsolutePosition.X + confirm.AbsoluteSize.X / 2, confirm.AbsolutePosition.Y + confirm.AbsoluteSize.Y + 20, 0, true, game, 0)
                        task.wait(0.1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(confirm.AbsolutePosition.X + confirm.AbsoluteSize.X / 2, confirm.AbsolutePosition.Y + confirm.AbsoluteSize.Y + 20, 0, false, game, 0)
                    
                    end
                end)
            end
        end
    end

    task.spawn(PreTrade)
    task.spawn(InTrade)
end

local function MainFarm()

    local function MainFarmCheck()


        local function CanServerHop()
            if not LocalPlayer.Backpack:FindFirstChild("Gold Coin") then
                wait(50)
                if not LocalPlayer.Backpack:FindFirstChild("Gold Coin") then
                    CanHop = true
                end
            elseif LocalPlayer.PlayerStats:WaitForChild("Money").Value < 1500 then
                wait(50)
                if LocalPlayer.PlayerStats:WaitForChild("Money").Value < 1500 then
                    CanHop = true
                end
            end
        end


        local function MainJoinFunc()

            if not Players:FindFirstChild(getgenv().alt) then

                repeat
                    CanServerHop()
                    task.wait(1)
                until CanHop == true

                if CanHop == true then
                    Hop()
                end
            end
        end

        task.spawn(function()
            while game.PlaceId == MAIN_GAME_PLACE_ID do
                while not Players:FindFirstChild(getgenv().alt) do
                    pcall(function()
                        MainJoinFunc()
                    end)
                    task.wait(5)
                end
                task.wait(15)
            end
        end)
    end

    local function AutoFarmMain()

        local function Fings()
    
            local function Arcade()
                while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                    while not Players:FindFirstChild(getgenv().alt) do 
                        pcall(function()
                            if not PlayerGui:FindFirstChild("Rolling Item") then
                                local args = {
                                    [1] = "EndDialogue",
                                    [2] = {
                                        ["NPC"] = "Item Machine",
                                        ["Option"] = "Option1",
                                        ["Dialogue"] = "Dialogue1"
                                    }
                                }
                                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
                            end
                            PlayerGui.RollingItem:Destroy()
                        end)
                        task.wait(2)
                    end
                end
            end
    
            local function sell()
                while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                    while not Players:FindFirstChild(getgenv().alt) do task.wait(2)
                        pcall(function()
                            for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v.Name ~= "Gold Coin" and v.Name ~= "Left Arm of The Saint's Corpse" and v.Name ~= "Pelvis of The Saint's Corpse" and v.Name ~= "Heart of The Saint's Corpse" and v.Name ~= "Rokakaka" then 
                                    LocalPlayer.Character.Humanoid:EquipTool(v)
                                    wait(2)
                                    local dialogueToEnd = {
                                        ["NPC"] = "Merchant",
                                        ["Dialogue"] = "Dialogue5",
                                        ["Option"] = "Option2"
                                    }
                                    LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                    LocalPlayer.Character.Humanoid:UnequipTools()
                                    wait(2)
                                end
                            end
                        end)
                    end
                end
            end
    
            local function sellMaxCoins()
                while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                    while not Players:FindFirstChild(getgenv().alt) do task.wait(2)
                        Coin = 0
                        pcall(function()
                            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v.Name == "Gold Coin" then
                                    Coin += 1
                                    if Coin == 45 then
                                        LocalPlayer.Character.Humanoid:EquipTool(v)
                                        local dialogueToEnd = {
                                            ["NPC"] = "Merchant",
                                            ["Dialogue"] = "Dialogue5",
                                            ["Option"] = "Option1"
                                        }
                                        LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                    end
                                end
                            end
                        end)
                    end
                end
            end

            local function sellMaxRoka()
                while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                    while not Players:FindFirstChild(getgenv().alt) do task.wait(2)
                        Roka = 0
                        pcall(function()
                            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v.Name == "Rokakaka" then
                                    Roka += 1
                                    if Roka == 10 then
                                        LocalPlayer.Character.Humanoid:EquipTool(v)
                                        local dialogueToEnd = {
                                            ["NPC"] = "Merchant",
                                            ["Dialogue"] = "Dialogue5",
                                            ["Option"] = "Option1"
                                        }
                                        LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                    end
                                end
                            end
                        end)
                    end
                end
            end
    
            local function sellMaxRibs()
                while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                    while not Players:FindFirstChild(getgenv().alt) do task.wait(2)
                        pcall(function()
                            Rib = 0
                            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v.Name == "Rib Cage of The Saint's Corpse" then
                                    Rib += 1
                                    if Rib == 10 then
                                        LocalPlayer.Character.Humanoid:EquipTool(v)
                                        local dialogueToEnd = {
                                            ["NPC"] = "Merchant",
                                            ["Dialogue"] = "Dialogue5",
                                            ["Option"] = "Option1"
                                        }
                                        LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
                                    end
                                end
                            end
                        end)
                    end
                end
            end
    
            task.spawn(sellMaxRoka)
            task.spawn(Arcade)
            task.spawn(sellMaxRibs)
            task.spawn(sellMaxCoins)
            task.spawn(sell)
     
        end
    
        local function ItemFarm() 
            while game.PlaceId == MAIN_GAME_PLACE_ID do wait(1)
                for i,v in next, Workspace.Item_Spawns.Items:GetChildren() do 
                    if v:IsA("Model") and v:FindFirstChild("MeshPart") then 
                        if v then 
                            pcall(function() 
                                while v.MeshPart:FindFirstChild("PointLight") and not Players:FindFirstChild(getgenv().alt) do task.wait() 
                                    print(v.MeshPart.CFrame) 
                                    v.ProximityPrompt.MaxActivationDistance = 50 
                                    task.spawn(function() 
                                        while not Players:FindFirstChild(getgenv().alt) do task.wait() 
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.MeshPart.CFrame + Vector3.new(0,-10,0) 
                                        end 
                                    end) 
                                    wait(0.5) 
                                    fireproximityprompt(v.ProximityPrompt) 
                                    wait(0.5) 
                                end 
                            end) 
                        end 
                    end
                end 
            end
        end
    
        task.spawn(function()
            while game.PlaceId == MAIN_GAME_PLACE_ID do task.wait(20)
    
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000,0,600)
    
            end
    
        end)
    
        task.spawn(ItemFarm)
        task.spawn(Fings)
    end
    
    task.spawn(AutoFarmMain)
    task.spawn(MainFarmCheck)
end



local function mainTrade()

    while game.PlaceId == MAIN_GAME_PLACE_ID do task.wait(1)

        while Players:FindFirstChild(getgenv().alt) do task.wait(1)

            pcall(function()

                while not PlayerGui:FindFirstChild("CosmeticTrade") do
                    local args = {
                        [1] = "InitiateCosmeticTrade",
                        [2] = getgenv().alt
                    }
                    game:GetService("Players").LocalPlayer.Character.RemoteFunction:InvokeServer(unpack(args))  
                    task.wait(1)
                end

                while PlayerGui:FindFirstChild("CosmeticTrade") do task.wait()
                    wait(30)
                    confirm = PlayerGui.CosmeticTrade.Main.Confirm
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(confirm.AbsolutePosition.X + confirm.AbsoluteSize.X / 2, confirm.AbsolutePosition.Y + confirm.AbsoluteSize.Y + 20, 0, true, game, 0)
                    task.wait(0.1)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(confirm.AbsolutePosition.X + confirm.AbsoluteSize.X / 2, confirm.AbsolutePosition.Y + confirm.AbsoluteSize.Y + 20, 0, false, game, 0)
                end

            end)

        end
    end
end

skipScreen()
bypass()

if LocalPlayer.Name == getgenv().alt then
    wait(5)
    AltFarm()
    TradeAlt()
end

if LocalPlayer.Name == getgenv().main then
    wait(5)
    mainTrade()
    MainFarm()
end


                    
                






            





