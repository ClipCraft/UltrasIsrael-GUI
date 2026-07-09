-- Ultras Israel GUI v4 - עם Debug Mode
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "UltrasIsraelGUI_Debug"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 480, 0, 620)
frame.Position = UDim2.new(0.5, -240, 0.5, -310)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundColor3 = Color3.fromRGB(0, 80, 180)
title.Text = "🔥 אולטרס ישראל GUI - Debug Mode"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Debug Label
local debugLabel = Instance.new("TextLabel")
debugLabel.Size = UDim2.new(0.95, 0, 0, 30)
debugLabel.Position = UDim2.new(0.025, 0, 1, -40)
debugLabel.BackgroundTransparency = 1
debugLabel.Text = "Debug: מוכן"
debugLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
debugLabel.TextScaled = true
debugLabel.Font = Enum.Font.Code
debugLabel.Parent = frame

local function log(message, color)
    debugLabel.Text = "Debug: " .. message
    debugLabel.TextColor3 = color or Color3.fromRGB(0, 255, 100)
    print("[Ultras Debug] " .. message)
end

local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad)

local function createButton(text, posY, command)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 48)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = frame

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(20, 20, 50)}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        log("שולח: " .. command, Color3.fromRGB(255, 200, 0))
        
        local success = false
        local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(command, "All")
            success = true
        else
            -- Fallback
            game:GetService("Players"):Chat(command)
            success = true
        end
        
        if success then
            log("✅ הפקודה נשלחה בהצלחה!", Color3.fromRGB(0, 255, 100))
        else
            log("❌ שגיאה בשליחה", Color3.fromRGB(255, 50, 50))
        end
    end)
end

-- כפתורים
createButton("🔰 Setup מלא (7 שחקנים)", 70, ":unteam me | :massbring %gr 7 | :rtools %gr | :copychar %gr me | :give me me")
createButton("🔰 Setup Team Ult", 125, ":unteam me | :massbring %GR 7 | :team me ult | :copychar %gr me")
createButton("🔰 Setup קצר", 180, ":unteam me | :massbring %gr 5 | :rtools %gr | :copychar %gr me")

createButton("🟢 אבוקה ירוקה F", 245, ":give %gr GREEN F")
createButton("🟢 אבוקה ירוקה B", 295, ":give %gr green b")
createButton("⚪ אבוקה לבנה", 345, ":give %gr white f")
createButton("🔴 אבוקה אדומה", 395, ":give %gr red f")
createButton("💥 Double Green", 445, ":give %gr double green")
createButton("🛠️ כלים + Give Me", 495, ":rtools | :give me me")

-- Close
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

log("GUI נטען בהצלחה - Debug Mode פעיל", Color3.fromRGB(0, 255, 150))
