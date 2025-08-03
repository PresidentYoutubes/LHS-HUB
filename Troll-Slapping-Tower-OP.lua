-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Config
local OwnerKey = "owner"
local LootKey = "1day"
local OwnerUsernames = {
	["game_creator270"] = true,
	["President444TSB"] = true,
	["h4kerone"] = true
}

local saveFile = "lootkey_activated.txt"

local function isLootKeyStillValid()
	if isfile(saveFile) then
		local timestamp = tonumber(readfile(saveFile))
		if timestamp and os.time() <= timestamp then
			return true
		end
	end
	return false
end

local function activateLootKey()
	local expire = os.time() + 24 * 60 * 60
	writefile(saveFile, tostring(expire))
end

local function isKeyValid(key)
	if key == OwnerKey then
		if OwnerUsernames[LocalPlayer.Name] then
			return true
		else
			Rayfield:Notify({
				Title = "Key Check",
				Content = "You Are Not Allowed To Use This Key.",
				Duration = 5,
				Image = 4483362458,
			})
			return false
		end
	end

	if key == LootKey then
		return isLootKeyStillValid()
	end

	return false
end

local Window = Rayfield:CreateWindow({
	Name = "Troll Slapping Tower Key System",
	LoadingTitle = "Troll Slapping Tower Keysystem",
	LoadingSubtitle = "by President 444 YT",
	ConfigurationSaving = { Enabled = false },
	KeySystem = false,
})

local KeyTab = Window:CreateTab("Key", 4483362458)

local UserKey = ""
KeyTab:CreateInput({
	Name = "Enter Key",
	PlaceholderText = "Enter your key here...",
	RemoveTextAfterFocusLost = false,
	Callback = function(Value) UserKey = Value end,
})

KeyTab:CreateButton({
	Name = "Check Key",
	Callback = function()
		if isKeyValid(UserKey) then
			Rayfield:Notify({
				Title = "Key Success",
				Content = "Key is valid! Access granted.",
				Duration = 3,
				Image = 4483362458,
			})
			task.wait(0.5)
			Rayfield:Destroy()

			local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
			local Window = Rayfield:CreateWindow({
				Name = "Troll Slapping Tower",
				LoadingTitle = "Troll Slapping Tower",
				LoadingSubtitle = "by President 444 YT",
				ConfigurationSaving = { Enabled = false },
				KeySystem = false,
			})

			local MainTab = Window:CreateTab("Main", nil)

			MainTab:CreateButton({
				Name = "Get Time Stop Slap",
				Callback = function()
					ReplicatedStorage.EquipSlapEvent:FireServer("God's Hand")
				end,
			})

			MainTab:CreateButton({
				Name = "Get Lucky Block",
				Callback = function()
					local function press1()
						VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game)
						task.wait(0.1)
						VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game)
					end

					-- Equip LuckySlap
					ReplicatedStorage.EquipSlapEvent:FireServer("LuckySlap")
					task.wait(1)

					-- Press 1 to equip tool
					press1()
					task.wait(0.5)

					-- Fire ability
					local args = {
						[1] = "ability"
					}
					game:GetService("Players").LocalPlayer.Character.LuckySlap.Event:FireServer(unpack(args))

					-- Press 1 again
					task.wait(0.5)
					press1()
					task.wait(0.5)

					-- Re-equip God’s Hand
					ReplicatedStorage.EquipSlapEvent:FireServer("God's Hand")
				end,
			})

			MainTab:CreateButton({
				Name = "Rejoin",
				Callback = function()
					TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
				end,
			})

			local FarmTab = Window:CreateTab("Farm", nil)
			local AutoSlapAll = false

			FarmTab:CreateToggle({
				Name = "Auto Slap Everyone (Equip TimeStop Hand)",
				CurrentValue = false,
				Callback = function(Value)
					AutoSlapAll = Value

					if Value then
						ReplicatedStorage.EquipSlapEvent:FireServer("God's Hand")
					end

					task.spawn(function()
						while AutoSlapAll do
							for _, player in pairs(Players:GetPlayers()) do
								if player ~= LocalPlayer and player.Character then
									local args = { "slash", player.Character, Vector3.new(0, 0, 0) }
									local tool = LocalPlayer.Character:FindFirstChild("God's Hand")
									if tool and tool:FindFirstChild("Event") then
										tool.Event:FireServer(unpack(args))
									end
								end
							end
							task.wait()
						end
					end)
				end,
			})
		else
			Rayfield:Notify({
				Title = "Invalid Key",
				Content = "The key is invalid or expired.",
				Duration = 4,
				Image = 4483362458,
			})
		end
	end,
})

KeyTab:CreateButton({
	Name = "Get Key (24hr Loot Link)",
	Callback = function()
		setclipboard("https://lootdest.org/s?ZIFSITnl")
		activateLootKey()
		Rayfield:Notify({
			Title = "Link Copied",
			Content = "https://lootdest.org/s?ZIFSITnl",
			Duration = 6,
			Image = 4483362458,
		})
	end,
})
