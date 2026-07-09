-- Ultras Israel Modern Commands GUI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "UltrasCapoStyle"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 850, 0, 620)
main.Position = UDim2.new(0.5, -425, 0.5, -310)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70)
title.BackgroundColor3 = Color3.fromRGB(0, 70, 180)
title.Text = "🔥 ULTRAS ISRAEL CAPO"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -50, 0, 15)
close.BackgroundTransparency = 1
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 90, 90)
close.TextScaled = true
close.Parent = main
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local function send(cmd)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(cmd, "All")
end

local function createCard(text, command, x, y, color)
    local card = Instance.new("TextButton")
    card.Size = UDim2.new(0, 190, 0, 85)
    card.Position = UDim2.new(0, x, 0, y)
    card.BackgroundColor3 = color or Color3.fromRGB(30, 30, 45)
    card.Text = text
    card.TextColor3 = Color3.new(1,1,1)
    card.TextScaled = true
    card.Font = Enum.Font.GothamSemibold
    card.Parent = main

    card.MouseButton1Click:Connect(function()
        send(command)
    end)
end

-- Setup Cards
createCard("5 פתיחה", ":unteam me | :massbring %gr 5 | :rtools %gr | :copychar %gr me", 50, 100, Color3.fromRGB(40, 100, 60))
createCard("ULT פתיחה", ":unteam me | :massbring %GR 7 | :team me ult | :copychar %gr me", 270, 100, Color3.fromRGB(60, 60, 140))
createCard("פתיחה מלאה", ":unteam me | :massbring %gr 7 | :rtools %gr | :copychar %gr me | :give me me", 490, 100, Color3.fromRGB(30, 80, 160))

-- Flares
createCard("Green F", ":give %gr GREEN F", 50, 220, Color3.fromRGB(0, 140, 60))
createCard("Green B", ":give %gr green b", 270, 220, Color3.fromRGB(0, 140, 60))
createCard("White F", ":give %gr white f", 490, 220, Color3.fromRGB(200, 200, 200))
createCard("Red F", ":give %gr red f", 710, 220, Color3.fromRGB(180, 40, 40))

createCard("Double Green", ":give %gr double green", 50, 330, Color3.fromRGB(0, 160, 80))
createCard("Green + White B", ":give %gr GREEN B | :give %gr white b", 270, 330)
createCard("White T", ":give %gr white t", 490, 330)
createCard("Green Apes", ":GIVE %GR GREEN APES", 710, 330, Color3.fromRGB(0, 180, 100))

print("✅ Ultras Capo Style GUI Loaded!")
