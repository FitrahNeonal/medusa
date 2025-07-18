if game.PlaceId == 108533757090220 then
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

    -- 🕹️ Choose Speed
    AutoToolsTab:CreateDropdown({
        Name = "Choose Speed",
        Options = {"Normal", "2x Speed", "3x Speed"},
        CurrentOption = "Normal",
        Flag = "SpeedChoice",
        Callback = function(Option)
            local remote = game:GetService("ReplicatedStorage")
                :WaitForChild("RemoteFunctions")
                :FindFirstChild("ChangeTickSpeed")

            if remote then
                if Option == "2x Speed" then
                    remote:InvokeServer(2)
                elseif Option == "3x Speed" then
                    remote:InvokeServer(3)
                else
                    remote:InvokeServer(1)
                end
            end
        end,
    })
end
