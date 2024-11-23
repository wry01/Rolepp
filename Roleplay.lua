-- Carregar Interface Gráfica (UI)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Buttons = {}

-- Configurações da Interface
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "RP_" .. math.random(1000, 9999)

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "Roleplay Helper"
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Criação de Botões e Funções
local function createButton(name, position, func)
    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Size = UDim2.new(0.8, 0, 0, 50)
    Button.Position = UDim2.new(0.1, 0, position, 0)
    Button.Text = name
    Button.TextScaled = true
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.MouseButton1Click:Connect(func)
    table.insert(Buttons, Button)
end

-- Função 1: Desalgemar
local function desalgemar()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Handcuffs") then
        char.Handcuffs:Destroy()
    end
end

-- Função 2: Ant Staff
local function antStaff()
    local badEvents = {"Kick", "Ban"}
    for _, v in pairs(game.ReplicatedStorage:GetDescendants()) do
        if table.find(badEvents, v.Name) then
            v:Destroy()
        end
    end
end

-- Função 3: Modo Velocidade
local function velocidade()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 100
    end
end

-- Função 4: Curar
local function curar()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.Health = char.Humanoid.MaxHealth
    end
end

-- Função 5: Teleporte
local function teleportar()
    local targetName = game.Players.LocalPlayer.PlayerGui:PromptInput("Nome do jogador:")
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end

-- Adicionando os Botões
createButton("Desalgemar", 0.2, desalgemar)
createButton("Ant Staff", 0.35, antStaff)
createButton("Modo Velocidade", 0.5, velocidade)
createButton("Curar Personagem", 0.65, curar)
createButton("Teleportar", 0.8, teleportar)
