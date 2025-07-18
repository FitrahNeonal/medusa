local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🌱 GTD | ONELLIZA 🌱",
    LoadingTitle = "GTD | onellizaa",
    LoadingSubtitle = "by neonal",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "GardenTD",
        FileName = "GTDConfig"
    },
    KeySystem = false,
})

local AutoToolsTab = Window:CreateTab("⚙️ Auto Tools", 4483362458)
local MiscTab = Window:CreateTab("🌿 Misc", 4483362458)

-- 🌟 Auto Pick Easy Mode
AutoToolsTab:CreateToggle({
    Name = "Auto Pick Easy Mode",
    CurrentValue = false,
    Flag = "AutoEasy",
    Callback = function(Value)
        _G.autoEasy = Value
        while _G.autoEasy and task.wait(1) do
            local remote = game:GetService("ReplicatedStorage")
                :WaitForChild("RemoteFunctions")
                :FindFirstChild("PlaceDifficultyVote")
            if remote then
                remote:InvokeServer("dif_easy")
            end
        end
    end,
})

-- ⏩ Auto Skip Wave
AutoToolsTab:CreateToggle({
    Name = "Auto Skip Wave",
    CurrentValue = false,
    Flag = "AutoSkip",
    Callback = function(Value)
        _G.autoSkip = Value
        while _G.autoSkip and task.wait(1.5) do
            local remote = game:GetService("ReplicatedStorage")
                :WaitForChild("RemoteFunctions")
                :FindFirstChild("SkipWave")
            if remote then
                remote:InvokeServer()
            end
        end
    end,
})

-- 💨 Speed Toggle System
_G.currentSpeed = 1

local function setSpeed(speed)
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteFunctions"):FindFirstChild("ChangeTickSpeed")
    if remote then
        remote:InvokeServer(speed)
        _G.currentSpeed = speed
        print("Speed set to:", speed)
    else
        warn("ChangeTickSpeed remote not found.")
    end
end

-- 🌟 Toggle Normal Speed (1x)
AutoToolsTab:CreateToggle({
    Name = "Normal Speed (1x)",
    CurrentValue = true,
    Flag = "Speed1x",
    Callback = function(Value)
        if Value then
            setSpeed(1)
            Rayfield.Flags["Speed2x"].Set(false)
            Rayfield.Flags["Speed3x"].Set(false)
        elseif _G.currentSpeed == 1 then
            Rayfield.Flags["Speed1x"].Set(true)
        end
    end,
})

-- 🌟 Toggle 2x Speed
AutoToolsTab:CreateToggle({
    Name = "2x Speed",
    CurrentValue = false,
    Flag = "Speed2x",
    Callback = function(Value)
        if Value then
            setSpeed(2)
            Rayfield.Flags["Speed1x"].Set(false)
            Rayfield.Flags["Speed3x"].Set(false)
        elseif _G.currentSpeed == 2 then
            Rayfield.Flags["Speed2x"].Set(true)
        end
    end,
})

-- 🌟 Toggle 3x Speed
AutoToolsTab:CreateToggle({
    Name = "3x Speed",
    CurrentValue = false,
    Flag = "Speed3x",
    Callback = function(Value)
        if Value then
            setSpeed(3)
            Rayfield.Flags["Speed1x"].Set(false)
            Rayfield.Flags["Speed2x"].Set(false)
        elseif _G.currentSpeed == 3 then
            Rayfield.Flags["Speed3x"].Set(true)
        end
    end,
})

-- 🌿 Misc Tab Kosong (bisa ditambah fitur lain nanti)
