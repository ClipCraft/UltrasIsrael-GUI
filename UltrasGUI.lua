-- Ultras Israel Modern GUI v5
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "UltrasModernGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 550)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -275)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Modern Title
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 90, 200)
titleBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 ULTRAS ISRAEL"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = titleBar

-- Close Button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 35, 0, 35)
close.Position = UDim2.new(1, -40, 0, 7)
close.BackgroundTransparency = 1
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextScaled = true
close.Parent = titleBar
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local function sendCommand(cmd)
    local replicated = game:GetService("ReplicatedStorage")
    local chatEvent = replicated:FindFirstChild("DefaultChatSystemChatEvents")
    
    if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
        chatEvent.SayMessageRequest:FireServer(cmd, "All")
    else
        -- Fallback methods
        game:GetService("Players"):Chat(cmd)
        game:GetService("ReplicatedStorage"):FindFirstChild("Chat") or game:GetService("Players"):Chat(cmd)
    end
end

local function createModernButton(text, yOffset, command)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92, 0, 0, 52)
    btn.Position = UDim2.new(0.04, 0, 0, yOffset)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = mainFrame

    -- Hover + Click Animation
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0, 120, 255)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(30, 30, 45)}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        sendCommand(command)
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 200, 100)}):Play()
        wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 120, 255)}):Play()
    end)
end

-- כפתורים
createModernButton("Setup 1 (7 Players)", 70, ":unteam me | :massbring %gr 7 | :rtools %gr | :copychar %gr me | :give me me")
createModernButton("Setup 2 (Team Ult)", 130, ":unteam me | :massbring %GR 7 | :team me ult | :copychar %gr me")
createModernButton("Setup 3 (5 Players)", 190, ":unteam me | :massbring %gr 5 | :rtools %gr | :copychar %gr me")

createModernButton("🟢 אבוקה ירוקה F", 260, ":give %gr GREEN F")
createModernButton("🟢 אבוקה ירוקה B", 315, ":give %gr green b")
createModernButton("⚪ אבוקה לבנה", 370, ":give %gr white f")
createModernButton("🔴 אבוקה אדומה", 425, ":give %gr red f")
createModernButton("✨ Double Green", 480, ":give %gr double green")

print("✅ Ultras Israel Modern GUI Loaded!")
