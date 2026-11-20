-- SkulinHub.lua
-- Interface demonstrativa para Roblox Studio.
-- Contém apenas a interface: não dispara RemoteEvents, não altera moedas,
-- não concede invocações e não automatiza ataques ou movimentação.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("SkulinHub")
if old then
    old:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "SkulinHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.fromOffset(230, 300)
frame.Position = UDim2.new(0, 16, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 9)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundColor3 = Color3.fromRGB(30, 20, 20)
title.Text = "SkulinHub"
title.TextColor3 = Color3.fromRGB(235, 65, 65)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 9)
titleCorner.Parent = title

local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.9, 0, 0, 34)
status.Position = UDim2.new(0.05, 0, 0, 48)
status.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
status.Text = "Interface carregada"
status.TextColor3 = Color3.fromRGB(210, 210, 210)
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.Parent = frame

local function makeButton(label, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 32)
    button.Position = UDim2.new(0.05, 0, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(105, 35, 35)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = label
    button.Font = Enum.Font.Gotham
    button.TextSize = 12
    button.Parent = frame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = button

    button.MouseButton1Click:Connect(callback)
    return button
end

local toggles = {
    ["Attack Bosses"] = false,
    ["Auto Tokens"] = false,
    ["Auto Summon"] = false,
    ["Auto Dodge"] = false,
    ["Fly to Boss"] = false,
}

local y = 94
for name in pairs(toggles) do
    local button
    button = makeButton("OFF  |  " .. name, y, function()
        toggles[name] = not toggles[name]
        button.Text = (toggles[name] and "ON   |  " or "OFF  |  ") .. name
        button.BackgroundColor3 = toggles[name]
            and Color3.fromRGB(40, 125, 70)
            or Color3.fromRGB(105, 35, 35)
        status.Text = name .. (toggles[name] and ": ligado (visual)" or ": desligado")
    end)
    y = y + 38
end

local targets = Instance.new("TextLabel")
targets.Size = UDim2.new(0.9, 0, 0, 38)
targets.Position = UDim2.new(0.05, 0, 0, 258)
targets.BackgroundTransparency = 1
targets.Text = "Painel visual • SkulinHub"
targets.TextColor3 = Color3.fromRGB(150, 150, 150)
targets.Font = Enum.Font.Gotham
targets.TextSize = 10
targets.Parent = frame
