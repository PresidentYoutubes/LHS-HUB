-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

-- Target win position
local targetPos = Vector3.new(-85, 353, 223)

-- States
local toggled = false
local teleporting = false
local spamTrollEnabled = false

-- Create the window
local Window = Rayfield:CreateWindow({
    Name = "Anime Tower [UPDATE 1.5]",
    LoadingTitle = "Anime Tower [UPDATE 1.5]",
    LoadingSubtitle = "Made By President 444 YT",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AnimeTowerUI",
        FileName = "MainConfig"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
local WinsCategory = MainTab:CreateSection("Wins")

-- Win Farm Toggle (already before Tp End)
local WinFarm = MainTab:CreateToggle({
    Name = "Win Farm",
    CurrentValue = false,
    Flag = "WinFarmToggle",
    Callback = function(Value)
        toggled = Value
        if toggled and not teleporting then
            teleporting = true
            task.spawn(function()
                while toggled do
                    local char = Player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char:PivotTo(CFrame.new(targetPos))
                    end
                    RunService.Heartbeat:Wait()
                end
                teleporting = false
            end)
        end
    end
})

-- Tp End Button
local TpEnd = MainTab:CreateButton({
    Name = "Tp End",
    Callback = function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char:PivotTo(CFrame.new(targetPos))
        end
    end
})

-- Unlock Tab
local UnlockTab = Window:CreateTab("Unlock", 4483362458)
local CharactersCategory = UnlockTab:CreateSection("Characters")

-- Okarun Button
local Okarun = UnlockTab:CreateButton({
    Name = "Okarun",
    Callback = function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local oldCFrame = char.HumanoidRootPart.CFrame
            char:PivotTo(CFrame.new(Vector3.new(-22, 158, -408)))
            task.wait(1)
            char:PivotTo(oldCFrame)
        end
    end
})

-- Others Button
local Others = UnlockTab:CreateButton({
    Name = "Others",
    Callback = function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local oldCFrame = char.HumanoidRootPart.CFrame
            char:PivotTo(CFrame.new(Vector3.new(-136, 258, -348)))
            task.wait(1)
            char:PivotTo(oldCFrame)
        end
    end
})

-- Trolls Tab
local TrollsTab = Window:CreateTab("Trolls", 4483362458)

-- Spam Trolls Category
local SpamCategory = TrollsTab:CreateSection("Spam Trolls")

local SpamToggle = TrollsTab:CreateToggle({
    Name = "Spam Troll Buttons", -- fixed name (plural)
    CurrentValue = false,
    Flag = "SpamTrollToggle",
    Callback = function(Value)
        spamTrollEnabled = Value
        if spamTrollEnabled then
Rayfield:Notify({
    Title = "We Are Fixing That In A Moment.",
    Content = "Broken Feature",
    Duration = 1,
    Image = 4483362458
})
            task.spawn(function()
                while spamTrollEnabled do
                    local char = Player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        for _, obj in ipairs(workspace.Map["Floor 4"]:GetDescendants()) do
                            if obj:IsA("TouchTransmitter") then
                                local parent = obj.Parent
                                if parent and parent:IsA("BasePart") then
                                    firetouchinterest(char.HumanoidRootPart, parent, 0)
                                    firetouchinterest(char.HumanoidRootPart, parent, 1)
                                end
                            end
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
})

-- Teleports Category
local TeleportsCategory = TrollsTab:CreateSection("Teleports")

local TpTrollPlace = TrollsTab:CreateButton({
    Name = "Teleport to troll place",
    Callback = function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char:PivotTo(CFrame.new(Vector3.new(-51, 153, -6)))
        end
    end
})

local TpNearTroll = TrollsTab:CreateButton({
    Name = "Teleport near troll button",
    Callback = function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char:PivotTo(CFrame.new(Vector3.new(-53, 153, -70)))
        end
    end
})
