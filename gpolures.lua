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

local VirtualInputManager = game:GetService("VirtualInputManager")
VirtualInputManager:SendKeyEvent(true,"Four",false,game)


while lp.PlayerGui.BossHP.Main:FindFirstChild("Kraken") do task.wait(1)
    VirtualInputManager:SendKeyEvent(true,"Z",false,game)
end
