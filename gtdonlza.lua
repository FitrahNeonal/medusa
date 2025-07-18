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

-- 🌟 Auto Win Fast And Easy (versi lengkap)
AutoToolsTab:CreateToggle({
    Name = "Auto Win Fast And Easy",
    CurrentValue = false,
    Flag = "AutoWin",
    Callback = function(Value)
        _G.AutoWin = Value

        if _G.AutoWin then
            -- Langkah 1: Meletakkan unit
            local placeArgs = {
                "unit_pineapple",
                {
                    Valid = true,
                    Rotation = 180,
                    CF = CFrame.new(-332.525, 62.845, -117.645, -1, 0, 0, 0, 1, 0, 0, 0, -1),
                    Position = Vector3.new(-332.525, 62.845, -117.645)
                }
            }
            local placeRemote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceUnit")
            placeRemote:InvokeServer(unpack(placeArgs))

            -- Tunggu unit muncul
            task.wait(1.5)

            -- Langkah 2: Cari ID dari unit yang baru diletakkan
            local function getFirstPineappleID()
                local entities = workspace:WaitForChild("Map"):WaitForChild("Entities")
                for _, unit in pairs(entities:GetChildren()) do
                    if unit:IsA("Model") and unit.Name == "unit_pineapple" then
                        local id = unit:GetAttribute("ID")
                        if id then
                            return id
                        end
                    end
                end
                return nil
            end

            local unitID = getFirstPineappleID()
            if not unitID then
                warn("Gagal mendapatkan ID unit.")
                return
            end

            -- Langkah 3: Loop upgrade unit tiap 10 detik
            while _G.AutoWin and task.wait(10) do
                local upgradeRemote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("UpgradeUnit")
                upgradeRemote:InvokeServer(unitID)
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

-- 🌿 Misc Tab Kosong
