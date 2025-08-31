local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

---------------------------------------------------------
-- Script #1 : Delta Warning UI
---------------------------------------------------------
local screenGui1 = Instance.new("ScreenGui")
screenGui1.Name = "DeltaWarningUI"
screenGui1.ResetOnSpawn = false
screenGui1.Parent = playerGui

local frame1 = Instance.new("Frame")
frame1.Size = UDim2.new(0, 400, 0, 220)
frame1.Position = UDim2.new(0.5, -200, 0.5, -110)
frame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame1.BorderSizePixel = 0
frame1.Active = true
frame1.Draggable = true
frame1.Parent = screenGui1

local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(0, 12)
corner1.Parent = frame1

local title1 = Instance.new("TextLabel")
title1.Size = UDim2.new(1, -20, 0, 40)
title1.Position = UDim2.new(0, 10, 0, 10)
title1.BackgroundTransparency = 1
title1.Text = "⚠️ Turn off all on Delta settings ⚠️"
title1.TextColor3 = Color3.fromRGB(255, 0, 0)
title1.Font = Enum.Font.GothamBold
title1.TextSize = 20
title1.Parent = frame1

local instructions1 = Instance.new("TextLabel")
instructions1.Size = UDim2.new(1, -20, 0, 100)
instructions1.Position = UDim2.new(0, 10, 0, 50)
instructions1.BackgroundTransparency = 1
instructions1.TextXAlignment = Enum.TextXAlignment.Left
instructions1.TextYAlignment = Enum.TextYAlignment.Top
instructions1.Text = [[
1. Disable Anti-AFK
2. Disable Verify Teleport
3. Disable Anti-Scam

✅ After disabling, press OK to continue.
]]
instructions1.TextColor3 = Color3.fromRGB(255, 255, 255)
instructions1.Font = Enum.Font.Gotham
instructions1.TextSize = 16
instructions1.Parent = frame1

local okayBtn = Instance.new("TextButton")
okayBtn.Size = UDim2.new(0, 200, 0, 40)
okayBtn.Position = UDim2.new(0.5, -100, 1, -60)
okayBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
okayBtn.Text = "Okay"
okayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
okayBtn.Font = Enum.Font.GothamBold
okayBtn.TextSize = 20
okayBtn.Parent = frame1

local btnCorner1 = Instance.new("UICorner")
btnCorner1.CornerRadius = UDim.new(0, 8)
btnCorner1.Parent = okayBtn


---------------------------------------------------------
-- Script #2 : TOCHIPYRO UI (Hidden at first)
---------------------------------------------------------
local rainbowSpeed = 0.5

-- Function to make rainbow text 
local function updateRainbowColor(textLabel)
	local t = 0
	while textLabel and textLabel.Parent do
		local r = math.sin(t) * 127 + 128
		local g = math.sin(t + 2) * 127 + 128
		local b = math.sin(t + 4) * 127 + 128
		textLabel.TextColor3 = Color3.fromRGB(r, g, b)
		t = t + rainbowSpeed
		task.wait(0.1)
	end
end

-- ScreenGui hidden first
local screenGui2 = Instance.new("ScreenGui")
screenGui2.Name = "TOCHIPYRO_UI"
screenGui2.ResetOnSpawn = false
screenGui2.Enabled = false
screenGui2.Parent = playerGui

-- Main UI Frame
local mainFrame = Instance.new("Frame", screenGui2)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Name = "MainUI"
mainFrame.ClipsDescendants = true

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -30, 0, 30)
title.Position = UDim2.new(0, 5, 0, 5)
title.Text = "TOCHIPYRO Script"
title.TextScaled = true
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
task.spawn(function() updateRainbowColor(title) end)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton", mainFrame)
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(1, -30, 0, 5)
minimizeBtn.Text = "_"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextScaled = true
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
minimizeBtn.TextColor3 = Color3.new(1,1,1)
local miniCorner = Instance.new("UICorner", minimizeBtn)
miniCorner.CornerRadius = UDim.new(1, 0)

local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _, child in ipairs(mainFrame:GetChildren()) do
		if child:IsA("TextButton") or child:IsA("TextLabel") then
			if child ~= title and child ~= minimizeBtn then
				child.Visible = not minimized
			end
		end
	end
end)

-- Buttons
local function createButton(text, posY, parent)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0.8, 0, 0, 30)
	btn.Position = UDim2.new(0.1, 0, 0, posY)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
	btn.TextColor3 = Color3.new(1,1,1)
	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(1, 0)
	return btn
end

local tradeBtn = createButton("Open Trade Panel", 50, mainFrame)
local bypassBtn = createButton("Bypass", 90, mainFrame)
local closeBtn = createButton("Close UI", 130, mainFrame)

closeBtn.MouseButton1Click:Connect(function()
	mainFrame:Destroy()
end)

-- Trade Panel
local tradePanel = Instance.new("Frame", screenGui2)
tradePanel.Size = UDim2.new(0, 300, 0, 220)
tradePanel.Position = UDim2.new(0.5, 160, 0.4, 0)
tradePanel.BackgroundTransparency = 0.5
tradePanel.BackgroundColor3 = Color3.fromRGB(90, 0, 150)
tradePanel.Visible = false
tradePanel.Active = true
tradePanel.Draggable = true
local tradeCorner = Instance.new("UICorner", tradePanel)
tradeCorner.CornerRadius = UDim.new(0, 12)

local tradeTitle = Instance.new("TextLabel", tradePanel)
tradeTitle.Size = UDim2.new(1, 0, 0, 30)
tradeTitle.Position = UDim2.new(0, 0, 0, 5)
tradeTitle.Text = "Trade Panel"
tradeTitle.TextScaled = true
tradeTitle.BackgroundTransparency = 1
tradeTitle.Font = Enum.Font.GothamBold
tradeTitle.TextColor3 = Color3.new(1,1,1)
task.spawn(function() updateRainbowColor(tradeTitle) end)

-- Trade Panel Buttons
local freezeBtn = createButton("Freeze Trade", 50, tradePanel)
local autoAcceptBtn = createButton("Auto Accept", 90, tradePanel)
local closeTradeBtn = createButton("Close Panel", 130, tradePanel)

tradeBtn.MouseButton1Click:Connect(function()
	tradePanel.Visible = true
end)

closeTradeBtn.MouseButton1Click:Connect(function()
	tradePanel.Visible = false
end)

-- Toggle logic
local freezeOn = false
freezeBtn.MouseButton1Click:Connect(function()
	freezeOn = not freezeOn
	freezeBtn.Text = "Freeze Trade: " .. (freezeOn and "ON" or "OFF")
end)

local autoOn = false
autoAcceptBtn.MouseButton1Click:Connect(function()
	autoOn = not autoOn
	autoAcceptBtn.Text = "Auto Accept: " .. (autoOn and "ON" or "OFF")
end)


---------------------------------------------------------
-- Link Script #1 → Script #2
---------------------------------------------------------
okayBtn.MouseButton1Click:Connect(function()
	screenGui1:Destroy()      -- remove warning
	screenGui2.Enabled = true -- show rainbow UI
end)
