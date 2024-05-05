


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

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui




task.spawn(function()
    local fuckingskipbug = true
    if fuckingskipbug then 
        wait(30)
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") then
            game:GetService("TeleportService"):Teleport(2809202155, game:GetService("Players").LocalPlayer)
            fuckingskipbug = false
        end
    end
end)

task.spawn(function()
    local IAMGOINGINSANEFROMYOU = true
    while IAMGOINGINSANEFROMYOU do task.wait(1)
        for _,v in pairs(game.LogService:GetLogHistory()) do
            if string.find(v["message"], "BEGAN") or string.find(v["message"], "bruh") then
                game:GetService("TeleportService"):Teleport(2809202155, game:GetService("Players").LocalPlayer)
                IAMGOINGINSANEFROMYOU = false
            end
        end
    end
end)

repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer.Character
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("RemoteEvent")


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

task.wait(1)

 
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

local function Hop()
    local t = {}

    local Got = false
    local Url = "https://games.roblox.com/v1/games/2809202155/servers/Public?sortOrder=Desc&limit=100" 
    local Server = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2809202155/servers/Public?sortOrder=Desc&limit=100")) 

    AscServer = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2809202155/servers/Public?sortOrder=Asc&limit=100")) 
    if AscServer.data then 
        for i , server2 in pairs(AscServer.data) do
            t[#t+1] = server2.id
        end 
    end 
    task.wait(0.1) 

    local ID = t[math.random(1,#t)]

    local TeleportService = game:GetService("TeleportService")
    TeleportService:TeleportToPlaceInstance(MAIN_GAME_PLACE_ID, ID)
end


local function GetHamon()

    local function CheckHamon()
        HaveHamon = false
        for i, v in pairs(LocalPlayer:WaitForChild("PlayerStats"):GetChildren()) do
            if v.Value == "Haaamon (Jonathan Joestar)" then
                HaveHamon = true
            end
        end
    end

    CheckHamon()

    local function FarmHeadband()

        local function CheckItems()
            CheckHamon()
            while HaveHamon == false do 
                CheckHamon()
    
                Stay = false
    
                for i, v in pairs(Workspace:GetChildren()) do
                    if v.Name == "ProximityPrompt" and v.ObjectText == "Lucky Arrow" then
                        if v then
                            Stay = true
                            print("Zeppelin")
                        end
                    end
                end

                task.spawn(function()
                    wait(40)
                    Hop()   
                end)
                

                if Stay == true then
                    bypass()
                    wait(7)
                    
                    for i,v in next, Workspace.Item_Spawns.Items:GetChildren() do 
                        if v:IsA("Model") and v:FindFirstChild("MeshPart") and v.ProximityPrompt.ObjectText == "Lucky Arrow" then 
                            if v then 
                                pcall(function()                          
                                    while v.MeshPart:FindFirstChild("PointLight") do task.wait() 
                                        print(v.MeshPart.CFrame) 
                                        task.spawn(function() 
                                            while true do task.wait() 
                                                LocalPlayer.Character.HumanoidRootPart.CFrame = v.MeshPart.CFrame + Vector3.new(0,0,0) 
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
                else
                    Hop()
                end
            end
        end
        CheckItems()
    end
    FarmHeadband()
end


task.spawn(function()

    getgenv().shit = {
        render = true,
        fpscap = 15,
        Webhook = 'https://discord.com/api/webhooks/1223767987966709912/p-2wpnvC4CupPHTR0VUtqIyM8AxzdbJ530gpwZx9gMzcmHFfQxVzpnvU1nubf3ZLuKWd',
        alts = {
            "AccountName1",
            "AccountName2"
        }
    }

    function getArrows()
		local arrows = 0
		for i,v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.Name == 'Lucky Arrow' then
				arrows = arrows + 1
			end
		end
		return tostring(arrows)
	end


    function webhook(text,url)
        request({
            Url = url,
            Method = "POST",
            Headers = {["content-type"] = "application/json" },
            Body = game:GetService('HttpService'):JSONEncode({
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = text,
                    ["description"] = "",
                    ["type"] = "rich",
                    ["color"] = tonumber(0xA1C3A9),
                    ["fields"] = {
                        {
                            ["name"] = "Account:",
                            ["value"] = game.Players.LocalPlayer.Name,
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Arrows:",
                            ["value"] = getArrows(),
                            ["inline"] = false
                        },
                        {
                            ["name"] = "Players:",
                            ["value"]= #game:GetService("Players"):GetPlayers(),
                            ["inline"] = false,
                        },
                    },
                }}
            })
        })
    end


    game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
        if child.Name == "Lucky Arrow" then
            webhook("**"..child.Name.." found!**",shit.Webhook)
        end
    end)
end)

skipScreen()
GetHamon()






















