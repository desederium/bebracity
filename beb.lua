repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer.Character

task.wait(30)


--am lazy bitch
task.spawn(function()
    while true do task.wait(30)
	    game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1, 0, true, game, 0)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1, 0, false, game, 0)
     end
end)


-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService  = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Player
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

-- // Constants
local LOBBY_PLACE_ID = 1730877806

task.spawn(function()
    while true do task.wait(800)
        pcall(function()
            if PlayerGui:FindFirstChild("BossHP") then
                PlayerGui.BossHP:Destroy()
            end
        end)
    end
end)

task.spawn(function()
    if LocalPlayer.Name == getgenv().main then
        while true do task.wait(20)
            pcall(function()
                for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Buddha" or v.Name == "Tori" or v.Name == "Ope" or v.Name == "Mochi" or v.Name == "Venom" then
                        wait(12)
                        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack[v.Name])
                        wait(12)
                        VirtualInputManager:SendKeyEvent(true,"Backspace",false,game)
                    end
                end
            end)
        end
    end
end)

if game.PlaceId == LOBBY_PLACE_ID then
    ZeroHub()
end

if game.PlaceId ~= LOBBY_PLACE_ID then
    if LocalPlayer.Name == getgenv().main then
        ZeroHub()
        while not LocalPlayer:FindFirstChild("Backpack") do task.wait(5) end
        wait(1)
        while not LocalPlayer.Character:FindFirstChild("Fruit Bag") do wait(5)
            LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Fruit Bag"])
        end
        wait(630)
        pcall(function()
	while LocalPlayer.Character:FindFirstChild("Fruit Bag") do task.wait(5)
            LocalPlayer.Character.Humanoid:UnequipTools()
	end
        end)
    end

    if LocalPlayer.Name ~= getgenv().main then
    
        task.spawn(function()

            task.wait(10)

            while not Players:FindFirstChild(getgenv().main) do task.wait() end

            while Players:FindFirstChild(getgenv().main) do task.wait() end
                
            TeleportService:Teleport(LOBBY_PLACE_ID) 
        end)

        DontDo = false
        while DontDo == false do task.wait(10)
            pcall(function()
                if Players:FindFirstChild(getgenv().main) then wait(120)
                    if Players:FindFirstChild(getgenv().main) then
                        while Workspace.PlayerCharacters[getgenv().main]:FindFirstChild("Fruit Bag") and Players:FindFirstChild(getgenv().main) do task.wait(10) end
                        DontDo = true 
                    end
                end
            end)   
        end
        ZeroHub()
    end
end
