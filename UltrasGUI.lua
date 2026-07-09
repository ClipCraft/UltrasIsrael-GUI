-- Ultras Israel Commands GUI by Grok
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "UltrasCommands"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 500)
frame.Position = UDim2.new(0.5, -210, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
title.Text = "🔥 Ultras Israel Commands GUI"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Parent = frame

local function createButton(text, y, command)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Parent = frame
    
    btn.MouseButton1Click:Connect(function()
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(command, "All")
        print("Executed: " .. command)
    end)
end

-- פקודות Setup
createButton("🔰 Setup 1 (7 players)", 60, ":unteam me | :massbring %gr 7 | :rtools %gr | :copychar %gr me | :give me me")
createButton("🔰 Setup 2 (Team Ult)", 110, ":unteam me | :massbring %GR 7 | :team me ult | :copychar %gr me")
createButton("🔰 Setup 3 (5 players)", 160, ":unteam me | :massbring %gr 5 | :rtools %gr | :copychar %gr me")

-- אבוקות ורימונים
createButton("🟢 אבוקה ירוקה F", 220, ":give %gr GREEN F")
createButton("🟢 אבוקה ירוקה B", 260, ":give %gr green b")
createButton("⚪ אבוקה לבנה", 300, ":give %gr white f")
createButton("🔴 אבוקה אדומה", 340, ":give %gr red f")
createButton("💥 Double Green", 380, ":give %gr double green")
createButton("🟢 Green Apes", 420, ":GIVE %GR GREEN APES")

-- פקודות נוספות
createButton("🛠️ Give Tools", 470, ":rtools | :give me me")
createButton("🔢 Count Group", 510, ":count %gr")
createButton("♻️ Refresh Group", 550, ":re %gr")

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.new(1,0,0)
close.Parent = frame
close.MouseButton1Click:Connect(function() gui:Destroy() end)

print("Ultras Israel GUI Loaded! 💙🤍")
