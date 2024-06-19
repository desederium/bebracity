

getgenv().main = "Zeavi0196"
getgenv().alt = "Tosslenozzle8670"

-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TeleportService  = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LOBBY_PLACE_ID = 1730877806

local part = Instance.new("Part")
part.Anchored = true
part.Size = Vector3.new(20,1,20)
part.Parent = workspace
part.Position = Vector3.new(-3237.42627, 260.014404, 4506.54053)

local part = Instance.new("Part")
part.Anchored = true
part.Size = Vector3.new(100,1,100)
part.Parent = workspace
part.Position = Vector3.new(-3237.42627, 280.014404, 4506.54053)

local part = Instance.new("Part")
part.Anchored = true
part.Size = Vector3.new(10,1,10)
part.Parent = workspace
part.Position = Vector3.new(-3239.97119, 260.9758129, 4360.7793)

local part = Instance.new("Part")
part.Anchored = true
part.Size = Vector3.new(20,1,20)
part.Parent = workspace
part.Position = Vector3.new(-3239.97119, 275.9758129, 4360.7793)

local teleport_table = {
    location1 = Vector3.new(-3237.42627, 265.014404, 4506.54053), -- your desired position
    location3 = Vector3.new(-3693.83105, 225.1677666, 433.253265), -- your desired position
    location2 = Vector3.new(-283.545013, 315.395447, 1660.81482), -- your desired position
    location4 = Vector3.new(-3239.97119, 270.9758129, 4360.7793),
}

local tween_s = game:GetService('TweenService')
local lp = game.Players.LocalPlayer

local function bypass_teleport(v,time)
    local tweeninfo = TweenInfo.new(time,Enum.EasingStyle.Linear)
    if lp.Character and 
    lp.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(v)
        local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
        a.Completed:Wait()
        print('Teleporting Done!')
    end
end

local function Handle(Item)
    while not LocalPlayer.Character:FindFirstChild(Item) do task.wait(1)
        pcall(function()
            LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack[Item])
        end)
    end
end


local function Kill()

    ready = false

    repeat task.wait()
        pcall(function()
            if Workspace.PlayerCharacters[getgenv().alt]:FindFirstChild("Melee") then
                ready == true
            end
        end)
    end
    until ready == true

    bypass_teleport(teleport_table.location1, 90)

    local args = {
        [1] = "true"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ShipEvents"):WaitForChild("Spawn"):InvokeServer(unpack(args))

    task.spawn(function()
        while true do task.wait()
            bypass_teleport(teleport_table.location4, 5)
        end
    end)

    repeat task.wait() until lp.PlayerGui.BossHP.Main:FindFirstChild("Kraken")

    repeat task.wait()
        Handle("Pika-Pika")
        task.wait(3)
    until LocalPlayer.Character:FindFirstChild("Pika-Pika")

    while lp.PlayerGui.BossHP.Main:FindFirstChild("Kraken") do task.wait(1)
        VirtualInputManager:SendKeyEvent(true,"Z",false,game)
    end
end

local function Anchor()

    task.spawn(function()

        task.wait(10)

        while not Players:FindFirstChild(getgenv().main) do task.wait() end

        while Players:FindFirstChild(getgenv().main) do task.wait() end
            
        TeleportService:Teleport(LOBBY_PLACE_ID) 
    end)

    repeat task.wait() until Players:FindFirstChild(getgenv().main)

    repeat task.wait() until Workspace.PlayerCharacters[getgenv().main]:FindFirstChild("HumanoidRootPart")

    task.spawn(function()
        while true do task.wait()
            bypass_teleport(teleport_table.location1, 90)
        end
    end)

    task.wait(30)

    Handle("Melee")
end

if LocalPlayer.Name == getgenv().alt then
    Anchor()
else
    Kill()
end
