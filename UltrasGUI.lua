-- Ultras Israel - Clean Modern GUI
local TS = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "UltrasClean"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 900, 0, 580)
main.Position = UDim2.new(0.5, -450, 0.5, -290)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,65)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 60, 160)
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "ULTRAS ISRAEL"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-50,0,12)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,100,100)
closeBtn.TextScaled = true
closeBtn.Parent = titleBar
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

local function sendCommand(cmd)
    local methods = {
        function() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(cmd, "All") end,
        function() game.Players:Chat(cmd) end,
        function() player:Chat(cmd) end,
    }
    
    for _, method in ipairs(methods) do
        pcall(method)
    end
end

local function createCard(name, cmd, posX, posY, color)
    local card = Instance.new("TextButton")
    card.Size = UDim2.new(0, 200, 0, 90)
    card.Position = UDim2.new(0, posX, 0, posY)
    card.BackgroundColor3 = color or Color3.fromRGB(25, 25, 40)
    card.Text = name
    card.TextColor3 = Color3.new(1,1,1)
    card.TextScaled = true
    card.Font = Enum.Font.GothamSemibold
    card.Parent = main

    card.MouseEnter:Connect(function()
        TS:Create(card, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}):Play()
    end)
    card.MouseLeave:Connect(function()
        TS:Create(card, TweenInfo.new(0.2), {BackgroundColor3 = color or Color3.fromRGB(25, 25, 40)}):Play()
    end)

    card.MouseButton1Click:Connect(function()
        sendCommand(cmd)
    end)
end

-- Cards
createCard("Setup 7", ":unteam me | :massbring %gr 7 | :rtools %gr | :copychar %gr me | :give me me", 50, 90, Color3.fromRGB(40, 80, 140))
createCard("Setup ULT", ":unteam me | :massbring %GR 7 | :team me ult | :copychar %gr me", 270, 90, Color3.fromRGB(80, 60, 160))
createCard("Setup 5", ":unteam me | :massbring %gr 5 | :rtools %gr | :copychar %gr me", 490, 90)

createCard("Green F", ":give %gr GREEN F", 50, 210, Color3.fromRGB(0, 160, 80))
createCard("Green B", ":give %gr green b", 270, 210, Color3.fromRGB(0, 160, 80))
createCard("White F", ":give %gr white f", 490, 210, Color3.fromRGB(220, 220, 220))
createCard("Red F", ":give %gr red f", 710, 210, Color3.fromRGB(200, 50, 50))

createCard("Double Green", ":give %gr double green", 50, 330, Color3.fromRGB(0, 180, 100))
createCard("Green Apes", ":GIVE %GR GREEN APES", 270, 330, Color3.fromRGB(0, 200, 120))

print("Ultras Clean GUI Loaded - נסה ללחוץ")
