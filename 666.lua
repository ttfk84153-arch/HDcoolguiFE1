-- 创建一个用于学习的UI示例
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 创建主界面
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LearningGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- 创建主框架
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- 标题栏
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "脚本学习工具"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

-- 关闭按钮
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- 创建你想要的按钮
local killButton = Instance.new("TextButton")
killButton.Size = UDim2.new(0, 200, 0, 50)
killButton.Position = UDim2.new(0.5, -100, 0.5, -25)
killButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
killButton.Text = "KILL"
killButton.TextColor3 = Color3.fromRGB(255, 255, 255)
killButton.TextScaled = true
killButton.Font = Enum.Font.GothamBold
killButton.Parent = mainFrame

-- 按钮点击事件（包含安全检查）
killButton.MouseButton1Click:Connect(function()
    -- 安全检查：确保玩家和角色存在
    if player and player.Character and player.Character.Humanoid then
        -- 尝试执行你提供的代码
        local success, error = pcall(function()
            -- 注意：这行代码在大多数游戏中不会工作，或者会导致错误
            local replicatedStorage = game:GetService('ReplicatedStorage')
            local acsEngine = replicatedStorage:FindFirstChild('ACS_Engine')
            
            if acsEngine then
                local eventos = acsEngine:FindFirstChild('Eventos')
                if eventos then
                    local damage = eventos:FindFirstChild('Damage')
                    if damage then
                        -- 警告：这通常是远程事件，在大多数游戏中不可用
                        damage:FireServer(player.Character.Humanoid, math.huge, 0, 0)
                        print("尝试执行远程事件")
                    else
                        warn("未找到Damage事件")
                    end
                else
                    warn("未找到Eventos文件夹")
                end
            else
                warn("未找到ACS_Engine")
            end
        end)
        
        if not success then
            warn("执行失败: " .. tostring(error))
        end
    end
end)

-- 添加信息标签
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -20, 0, 40)
infoLabel.Position = UDim2.new(0, 10, 0, 120)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "⚠️ 这是一个学习示例，实际使用可能导致封号"
infoLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
infoLabel.TextWrapped = true
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 14
infoLabel.Parent = mainFrame
