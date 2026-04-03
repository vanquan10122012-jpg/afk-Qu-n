-- AFK GUI Script
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local AFK = false

-- Anti AFK
player.Idled:Connect(function()
    if AFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)

-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,200,0,120)
Frame.Position = UDim2.new(0.5,-100,0.5,-60)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

Button.Parent = Frame
Button.Size = UDim2.new(0,160,0,40)
Button.Position = UDim2.new(0,20,0,20)
Button.Text = "BẬT AFK"
Button.BackgroundColor3 = Color3.fromRGB(0,170,0)

Status.Parent = Frame
Status.Size = UDim2.new(0,160,0,30)
Status.Position = UDim2.new(0,20,0,70)
Status.Text = "Trạng thái: OFF"
Status.TextColor3 = Color3.fromRGB(255,255,255)
Status.BackgroundTransparency = 1

-- Nút bật/tắt
Button.MouseButton1Click:Connect(function()
    AFK = not AFK
    
    if AFK then
        Button.Text = "TẮT AFK"
        Button.BackgroundColor3 = Color3.fromRGB(170,0,0)
        Status.Text = "Trạng thái: ON"
    else
        Button.Text = "BẬT AFK"
        Button.BackgroundColor3 = Color3.fromRGB(0,170,0)
        Status.Text = "Trạng thái: OFF"
    end
end)
