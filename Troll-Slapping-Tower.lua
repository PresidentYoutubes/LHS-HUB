-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

-- Window Setup
local Window = Rayfield:CreateWindow({
    Name = "Troll Slapping Tower",
    LoadingTitle = "Troll Slapping Tower",
    LoadingSubtitle = "by President 444 YT",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Main Tab
local MainTab = Window:CreateTab("Main", nil)

-- Get Time Stop Slap Button
MainTab:CreateButton({
    Name = "Get Time Stop Slap",
    Callback = function()
        local args = { [1] = "God's Hand" }
        ReplicatedStorage.EquipSlapEvent:FireServer(unpack(args))
    end,
})

-- Rejoin Same Server Button
MainTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
})

-- Farm Tab
local FarmTab = Window:CreateTab("Farm", nil)

-- Auto Slap Everyone Toggle
local AutoSlapAll = false

FarmTab:CreateToggle({
    Name = "Auto Slap Everyone (Equip TimeStop Hand)",
    CurrentValue = false,
    Callback = function(Value)
        AutoSlapAll = Value

        if Value then
            -- Equip God's Hand
            ReplicatedStorage.EquipSlapEvent:FireServer("God's Hand")
        end

        task.spawn(function()
            while AutoSlapAll do
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local args = {
                            [1] = "slash",
                            [2] = player.Character,
                            [3] = Vector3.new(0, 0, 0)
                        }

                        local tool = LocalPlayer.Character:FindFirstChild("God's Hand")
                        if tool and tool:FindFirstChild("Event") then
                            tool.Event:FireServer(unpack(args))
                        end
                    end
                end
                task.wait()
            end
        end)
    end
})
