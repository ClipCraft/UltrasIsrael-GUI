-- Ultras Israel GUI - Fix שליחה v6
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "UltrasFixGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 520)
frame.Position = UDim2.new(0.5, -210, 0.5, -260)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(0, 100, 220)
title.Text = "🔥 ULTRAS ISRAEL GUI"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Parent = frame

local function sendCommand(cmd)
    print("מנסה לשלוח: " .. cmd)
    
    -- שיטה 1
    local success = pcall(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(cmd, "All")
    end)
    
    -- שיטה 2
    if not success then
        pcall(function()
            game.Players:Chat(cmd)
        end)
    end
    
    -- שיטה 3
    if not success then
        pcall(function()
            game:GetService("Players").LocalPlayer:Chat(cmd)
        end)
    end
    
    -- שיטה 4 (TextService)
    pcall(function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(cmd)
    end)
end

local y = 70
local function addBtn(text, command)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 50)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Parent = frame
    
    btn.MouseButton1Click:Connect(function()
        sendCommand(command)
    end)
    
    y = y + 60
end

addBtn("Setup 1 (7)", ":unteam me | :massbring %gr 7 | :rtools %gr | :copychar %gr me | :give me me")
addBtn("Setup 2 (Ult)", ":unteam me | :massbring %GR 7 | :team me ult | :copychar %gr me")
addBtn("🟢 Green F", ":give %gr GREEN F")
addBtn("🟢 Green B", ":give %gr green b")
addBtn("⚪ White", ":give %gr white f")
addBtn("🔴 Red", ":give %gr red f")
addBtn("Double Green", ":give %gr double green")

print("GUI Loaded - בדוק את ה-Print ב-Output")
