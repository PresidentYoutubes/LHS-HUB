-- 🔥 Slap Battles 🔥 — Yes its open source you idiotic sense of nature gooner of skid

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Create the window
local Window = Rayfield:CreateWindow({
    Name = "🔥 Slap Battles 🔥",
    LoadingTitle = "🔥 Slap Battles 🔥",
    LoadingSubtitle = "Made By President 444 YT",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false }
})

-- Create the tab
local Main = Window:CreateTab("🔥Main🔥")

-- 1) 🔥 Stone Block Ability ( No Cooldown ) 🔥 — prints "hello"
Main:CreateButton({
    Name = "🔥 Stone Block Ability ( No Cooldown ) 🔥",
    Callback = function()
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local gui = CoreGui:FindFirstChild("AbilityExplel") or Player.PlayerGui:FindFirstChild("AbilityExplel")
if gui then
    gui:Destroy()
end

        local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AbilityExplel = Instance.new("ScreenGui")
local GainStreak = Instance.new("ImageButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")

AbilityExplel.Name = "AbilityExplel"
AbilityExplel.Parent = Player.PlayerGui
AbilityExplel.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AbilityExplel.DisplayOrder = 10
AbilityExplel.ResetOnSpawn = false

GainStreak.Name = "GainStreak"
GainStreak.Parent = AbilityExplel
GainStreak.AnchorPoint = Vector2.new(0.5, 0.5)
GainStreak.BackgroundColor3 = Color3.new(1, 1, 1)
GainStreak.BorderColor3 = Color3.new(0, 0, 0)
GainStreak.BorderSizePixel = 0
GainStreak.Position = UDim2.new(0.5, 0, 0.699999988, 0)
GainStreak.Size = UDim2.new(0.125, 0, 0.125, 0)
GainStreak.Image = "rbxassetid://18983743675"

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Thickness = 3
UIStroke.Transparency = 0.25
UIStroke.Parent = GainStreak

UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(64, 32, 16)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(192, 16, 0))
})
UIGradient.Parent = GainStreak

UIAspectRatioConstraint.Parent = GainStreak
UICorner.Parent = GainStreak
GainStreak.Draggable = true

-- Button function
local function SayHello()
	game:GetService("ReplicatedStorage").Rockmode:FireServer()
end

GainStreak.MouseButton1Click:Connect(SayHello)
GainStreak.TouchTap:Connect(SayHello)
    end
})

-- 2) 🔥 Delete Stone Block Ability Button 🔥 — prints "hi"
Main:CreateButton({
    Name = "🔥 Delete Stone Block Ability Button 🔥",
    Callback = function()
        local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local gui = CoreGui:FindFirstChild("AbilityExplel") or Player.PlayerGui:FindFirstChild("AbilityExplel")
if gui then
    gui:Destroy()
end
    end
})

-- 3) 🔥 Auto Farm Killstreak ( You have to click manually) 🔥 — prints "yo"
Main:CreateButton({
    Name = "🔥 Auto Farm Killstreak ( You have to click manually)🔥",
    Callback = function()
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local gui = CoreGui:FindFirstChild("Killstreak") or Player.PlayerGui:FindFirstChild("Killstreak")
if gui then
    gui:Destroy()
end

        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

local Killstreak = Instance.new("ScreenGui")
local GainStreak = Instance.new("ImageButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")

Killstreak.Name = "Killstreak"
Killstreak.Parent = game.Players.LocalPlayer.PlayerGui
Killstreak.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Killstreak.DisplayOrder = 10
Killstreak.ResetOnSpawn = false

GainStreak.Name = "GainStreak"
GainStreak.Parent = Killstreak
GainStreak.AnchorPoint = Vector2.new(0.5, 0.5)
GainStreak.BackgroundColor3 = Color3.new(1, 1, 1)
GainStreak.BorderColor3 = Color3.new(0, 0, 0)
GainStreak.BorderSizePixel = 0
GainStreak.Position = UDim2.new(0.5, 0, 0.699999988, 0)
GainStreak.Size = UDim2.new(0.125, 0, 0.125, 0)
GainStreak.Image = "rbxassetid://18983743675"

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Thickness = 3
UIStroke.Transparency = 0.25
UIStroke.Parent = GainStreak

UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(64, 32, 16)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 128, 0)) -- Dark green instead of red
})
UIGradient.Parent = GainStreak

UIAspectRatioConstraint.Parent = GainStreak

UICorner.Parent = GainStreak
GainStreak.Draggable = true

local HitRemote = game:GetService("ReplicatedStorage").KSHit
local Cooldown = false

local function Check()
	local Status = false
	if Player.Character then
		local Humanoid = Player.Character:FindFirstChild("Humanoid")
		if Humanoid then
			if Humanoid.Health > 0 and not Player.Character:FindFirstChild("InLobby") then
				Status = true
			end
		end
	end
	return Status
end

local function GetTarget()
	local Target = nil
	local MinimumDistance = math.huge
	for i, v in ipairs(Players:GetPlayers()) do
		if v.Character and v ~= Player then
			local Humanoid = v.Character:FindFirstChild("Humanoid")
			if Humanoid and Humanoid.Health > 0 then
				local Distance = (Player.Character:FindFirstChildWhichIsA("Humanoid").RootPart.Position-(Humanoid.RootPart.Position+Humanoid.RootPart.AssemblyLinearVelocity*0.5)).Magnitude
				local NotInLobby = not v.Character:FindFirstChild("InLobby")
				local Visible = v.Character.Torso.Transparency == 0
				if Distance < MinimumDistance then
					MinimumDistance = Distance
					Target = v.Character
				end
			end
		end
	end
	return Target
end

local Kill = workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Position

local SpawnCFrame = CFrame.new(Vector3.zero)

local function Gain()
	local Check = Check()
	local Target = GetTarget()
	if Check == true and Cooldown == false and Target then
		Cooldown = true
		local LocalRoot = Player.Character:FindFirstChildWhichIsA("Humanoid").RootPart
		local TargetRoot = Target:FindFirstChildWhichIsA("Humanoid").RootPart
		local Start = tick()
		local TargetRootLastPosition = TargetRoot.Position
		local Offset = Vector3.zero
		workspace.Gravity = 50
		local Finished = false
		local Connection = RunService.Heartbeat:Connect(function()
			LocalRoot.CFrame = CFrame.lookAt(TargetRoot.Position+Offset+Vector3.yAxis*6 ,Kill)
			LocalRoot.AssemblyLinearVelocity = Vector3.zero
		end)
		task.spawn(function()
			while task.wait(0.1) do
				if Finished == true then
					break
				end
				Offset = (TargetRoot.Position-TargetRootLastPosition)*(Player:GetNetworkPing()*20)
				TargetRootLastPosition = TargetRoot.Position
			end
		end)
		repeat
			HitRemote:FireServer(TargetRoot)
			task.wait(0.58)
		until tick()-Start >= 50 or TargetRoot.Parent:FindFirstChildWhichIsA("Humanoid").Health == 0 or LocalRoot.Parent:FindFirstChildWhichIsA("Humanoid").Health == 0 or not Players:FindFirstChild(Target.Name)
		Finished = true
		Connection:Disconnect()
		LocalRoot.AssemblyLinearVelocity = Vector3.zero
		LocalRoot.CFrame = SpawnCFrame
		Cooldown = false
		workspace.Gravity = 180
	end
end

local KillParts = {"DEATHBARRIER", "DEATHBARRIER2", "AntiDefaultArena", "the cube of death(i heard it kills)"}

for i, v in ipairs(workspace:GetDescendants()) do
	if v:IsA("Part") and table.find(KillParts, v.Name) then
		v.CanTouch = false
	end
end

GainStreak.MouseButton1Click:Connect(Gain)
GainStreak.TouchTap:Connect(Gain)
    end
})

-- 4) 🔥 Delete Auto Farm Killstreak Button 🔥 — prints "wsg"
Main:CreateButton({
    Name = "🔥 Delete Auto Farm Killstreak Button 🔥",
    Callback = function()
        local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local gui = CoreGui:FindFirstChild("Killstreak") or Player.PlayerGui:FindFirstChild("Killstreak")
if gui then
    gui:Destroy()
end
    end
})
