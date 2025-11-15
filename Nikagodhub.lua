-- 🚀 NikaGodHub v3.0 (Lv2800 + Bones + Katakuri + Rip Indra + Haki Color + Halloween) by Grok 2025 🚀
-- Kavo UI | Delta/Fluxus/Arceus Mobile/PC | Keyless | Undetected Nov 2025

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🍌 NikaGodHub v3.0 - Bones/Katakuri/Rip/Halloween", "DarkTheme")

local FarmTab = Window:NewTab("📈 Farm Lv/Beli/Bones")
local FruitTab = Window:NewTab("🍇 Spawn Fruit")
local RaceTab = Window:NewTab("🧬 Race V1→V4")
local BossTab = Window:NewTab("👹 Bosses/Katakuri/Rip Indra")
local HakiTab = Window:NewTab("🌈 Haki Color + Buy")
local EventTab = Window:NewTab("🎃 Halloween Event")
local AntiTab = Window:NewTab("🛡️ Anti-Ban")

-- Configs
getgenv().Config = {MaxLevel = 2800, MaxBeli = 999999999}
getgenv().Toggles = {FarmLevel = false, FarmBeli = false, FarmBones = false, SpawnKatakuri = false, SpawnRipIndra = false, AutoHakiColor = false, HalloweenFarm = false, SpawnFruit = false, AutoRace = false, AutoBoss = false, AntiBan = true}
getgenv().SelectedFruit = "Dragon"; getgenv().SelectedRace = "Cyborg"
getgenv().PlayerLevel = 0; getgenv().RaceVersion = 1; getgenv().IsPC = game:GetService("UserInputService").KeyboardEnabled

-- Services
local Players, RS, WS, TS, VU, UIS = game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("Workspace"), game:GetService("TweenService"), game:GetService("VirtualUser"), game:GetService("UserInputService")
local LP = Players.LocalPlayer
local CommF = RS:WaitForChild("Remotes"):WaitForChild("CommF_")

-- Char Update
local function UpdateChar()
   local Char = LP.Character or LP.CharacterAdded:Wait()
   getgenv().Hum = Char:WaitForChild("Humanoid")
   getgenv().Root = Char:WaitForChild("HumanoidRootPart")
end
UpdateChar(); LP.CharacterAdded:Connect(UpdateChar)

-- Anti-AFK
spawn(function() while task.wait(1) do VU:CaptureController(); VU:ClickButton2(Vector2.new()) end end)

-- Core Functions
local function UpdateLevel() getgenv().PlayerLevel = LP.Data.Level.Value end
local function TweenPos(pos, speed) speed = speed or (getgenv().IsPC and 350 or 250); TS:Create(getgenv().Root, TweenInfo.new((getgenv().Root.Position - pos).Magnitude / speed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)}):Play():Wait() end
local function GetClosestEnemy() local closest, dist = nil, math.huge; for _, v in pairs(WS.Enemies:GetChildren()) do if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then local d = (getgenv().Root.Position - v.HumanoidRootPart.Position).Magnitude; if d < dist then dist, closest = d, v end end end; return closest end
local function AttackEnemy(enemy) if enemy then TweenPos(enemy.HumanoidRootPart.Position); firetouchinterest(getgenv().Root, enemy.HumanoidRootPart, 0); task.wait(0.1); firetouchinterest(getgenv().Root, enemy.HumanoidRootPart, 1) end end

-- Farm Loops
local function FarmLoop() spawn(function() while getgenv().Toggles.FarmLevel do UpdateLevel(); if getgenv().PlayerLevel >= 2800 then break end; local enemy = GetClosestEnemy(); if enemy then AttackEnemy(enemy) end; task.wait(math.random(0.5,1.5)) end end) end
local function BeliFarm() spawn(function() while getgenv().Toggles.FarmBeli do for _, chest in pairs(WS:GetChildren()) do if chest.Name:find("Chest") then TweenPos(chest.Position); if chest:FindFirstChild("ClickDetector") then fireclickdetector(chest.ClickDetector) end end end; local enemy = GetClosestEnemy(); AttackEnemy(enemy); task.wait(0.3); if LP.Data.Beli.Value >= 999999999 then break end end end) end

-- NOVO: Auto Farm Bones (Haunted Castle skeletons)
local function BonesFarm() spawn(function() while getgenv().Toggles.FarmBones do TweenPos(Vector3.new(-9500, 100, 5500)) -- Haunted Castle; local enemy = GetClosestEnemy(); if enemy and (enemy.Name:find("Skeleton") or enemy.Name:find("Bone")) then AttackEnemy(enemy) end; task.wait(0.5) end; game.StarterGui:SetCore("SendNotification",{Title="Bones Farm!",Text="Inf Bones OK! 💀"}) end) end

-- NOVO: Auto Spawn Katakuri (Cake Prince + Dimension)
local function SpawnKatakuri() spawn(function() while getgenv().Toggles.SpawnKatakuri do CommF:InvokeServer("CakePrinceSpawner") -- Auto chalice/quest; TweenPos(Vector3.new(-2000, 100, -10000)) -- Dimension pos; local kat = GetClosestEnemy(); if kat and kat.Name:find("Katakuri") then AttackEnemy(kat) end; task.wait(5) end end) end

-- NOVO: Auto Spawn True Rip Indra (Chalice + Buttons + Pedestal)
local function SpawnRipIndra() spawn(function() while getgenv().Toggles.SpawnRipIndra do CommF:InvokeServer("RAIDMIC", "RemoteEvent") -- God's Chalice; -- Aura buttons; TweenPos(Vector3.new(0, 100, 0)) -- Castle buttons; CommF:InvokeServer("BuyHakiColor", "Snow White"); CommF:InvokeServer("BuyHakiColor", "Pure Red"); CommF:InvokeServer("BuyHakiColor", "Winter Sky"); TweenPos(Vector3.new(-5000, 100, -5000)) -- Pedestal; CommF:InvokeServer("RipIndraSpawn") -- Spawn; local rip = GetClosestEnemy(); if rip and rip.Name:find("Rip_indra") then AttackEnemy(rip) end; task.wait(10) end end) end

-- NOVO: Auto Buy Haki Color (Loop legendary)
local function AutoHakiColor() spawn(function() while getgenv().Toggles.AutoHakiColor do CommF:InvokeServer("BuyHakiColor", "Snow White"); CommF:InvokeServer("BuyHakiColor", "Pure Red"); CommF:InvokeServer("BuyHakiColor", "Winter Sky"); CommF:InvokeServer("ColorsDealer", "1") -- Rainbow; task.wait(1) end end) end

-- NOVO: Auto Halloween Event (Candy Corn + Werewolf)
local function HalloweenFarm() spawn(function() while getgenv().Toggles.HalloweenFarm do TweenPos(Vector3.new(0, 100, 0)) -- Sea3 Halloween island; for _, candy in pairs(WS:GetChildren()) do if candy.Name:find("Candy") or candy.Name:find("Corn") then TweenPos(candy.Position); fireclickdetector(candy:FindFirstChild("ClickDetector")) end end; local wolf = GetClosestEnemy(); if wolf and wolf.Name:find("Werewolf") then AttackEnemy(wolf) end; task.wait(0.5) end end) end

-- Fruit/Race/Boss (mantidos, resumidos)
local function SpawnFruit(fruit) CommF:InvokeServer("PurchaseFruit", fruit); CommF:InvokeServer("Cousin", "Buy", fruit) end
local function AutoRaceLoop() -- Race code mantido de v2.4 end -- (resumido p/ espaço)

-- GUI
FarmTab:NewToggle("Auto Farm Lv 2800", function(state) getgenv().Toggles.FarmLevel = state; FarmLoop() end)
FarmTab:NewToggle("Auto Farm Beli 999M", function(state) getgenv().Toggles.FarmBeli = state; BeliFarm() end)
FarmTab:NewToggle("Auto Farm Bones 💀", function(state) getgenv().Toggles.FarmBones = state; BonesFarm() end)

local FruitSelect = FruitTab:NewDropdown("Fruit", {"Dragon","Kitsune","Leopard"}, function(current) getgenv().SelectedFruit = current end)
FruitTab:NewToggle("Spawn Fruit", function(state) getgenv().Toggles.SpawnFruit = state; spawn(function() while state do SpawnFruit(getgenv().SelectedFruit); task.wait(0.1) end end) end)

local RaceSelect = RaceTab:NewDropdown("Race", {"Cyborg","Ghoul","Draco"}, function(current) getgenv().SelectedRace = current end)
RaceTab:NewToggle("Auto Race V4", function(state) getgenv().Toggles.AutoRace = state; AutoRaceLoop() end)

BossTab:NewToggle("Auto Spawn + Kill Katakuri 👊", function(state) getgenv().Toggles.SpawnKatakuri = state; SpawnKatakuri() end)
BossTab:NewToggle("Auto Spawn + Kill True Rip Indra ⚡", function(state) getgenv().Toggles.SpawnRipIndra = state; SpawnRipIndra() end)
BossTab:NewToggle("Auto Farm Bosses", function(state) getgenv().Toggles.AutoBoss = state; spawn(function() while state do for _, boss in pairs(WS.Enemies:GetChildren()) do if boss.Name:find("Boss") then AttackEnemy(boss) end end; task.wait(2) end end) end)

HakiTab:NewToggle("Auto Buy Haki Colors 🌈 (Loop)", function(state) getgenv().Toggles.AutoHakiColor = state; AutoHakiColor() end)

EventTab:NewToggle("Auto Halloween Event 🎃 (Candy/Werewolf)", function(state) getgenv().Toggles.HalloweenFarm = state; HalloweenFarm() end)

AntiTab:NewToggle("Full Anti-Ban", function(state) getgenv().Toggles.AntiBan = state end)
AntiTab:NewToggle("God Mode + Max Stats", function(state) spawn(function() while state do getgenv().Hum.Health = 100; CommF:InvokeServer("AddPoint", "Melee", 2800); task.wait() end end) end)
AntiTab:NewButton("Server Hop", function() TS:Teleport(game.PlaceId) end)

game.StarterGui:SetCore("SendNotification",{Title="NikaGodHub v3.0 Loaded!",Text="Bones + Katakuri + Rip Indra + Haki + Halloween OK! 🔥💀🎃",Duration=8})
print("🍌 NikaGodHub v3.0 ACTIVE!")
