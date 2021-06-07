
    local Player = game.Players.LocalPlayer
    local functions = {}
    local NPCS = {}
    local properties = {
        AutoEquip = false;
        Quest = "None";
    }
    local Tools = {}

    local AutoFarmNPCSOn = false
    getgenv().CurrentNPC = "None"
    getgenv().CurrentTool = "None"
    getgenv().CurrentQuest = "None"
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
    local venyx = library.new("Emperor's Hub", 5013109572)

    local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(116, 195, 255),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(116, 195, 255)
    }
    local farmNPCS = {}

            
    coroutine.resume(coroutine.create(function()
        for i = 0,15 do wait()
            
            
            
               dots =  {["NPC"] = "Bandit [Lv:5]"; ["Quest"] = "BanditClick";}

               table.insert(farmNPCS,i, dots)
       
        end;

    end));
    local setCFrame = false  
    local AutoFarmPage = venyx:addPage("Auto Farm", 5012544693)
    local NPCSFarmSection = AutoFarmPage:addSection("NPCS Farm")
    local virtualUser = game:GetService("VirtualUser")
    local Mouse = Player:GetMouse()

    functions.refreshTools = function(value)
        if value == "Add" then
            for i,v in pairs(Player.Character:GetChildren()) do
                if v:IsA("Tool") then
                    table.insert(Tools, i, v.Name)
                end
            end
            for i,v in pairs(Player.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    table.insert(Tools, i, v.Name)
                end
            end
        
        ToolsDropdown = NPCSFarmSection:addDropdown("Equip Tool", Tools, function(string)
                getgenv().CurrentTool = string
                print(getgenv().CurrentTool)
            end)
        elseif value == "Update" then
            for i,v in pairs(Player.Character:GetChildren()) do
                if v:IsA("Tool") then
                    table.remove(Tools, i, v.Name)
                    table.insert(Tools, i, v.Name)
                end
            end
            for i,v in pairs(Player.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    table.remove(Tools, i, v.Name)
                    table.insert(Tools, i, v.Name)
                end
            end
        
            NPCSFarmSection:updateDropdown(ToolsDropdown, "Equip Tool", Tools, function(str)
                getgenv().CurrentTool = str
                print(getgenv().CurrentTool)
            end)
        end

    end

    functions.autoFarmNPCS = function()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if AutoFarmNPCSOn then
                    getgenv().CurrentNPC = farmNPCS[Player.PlayerStats.Level.Value].NPC
                    getgenv().CurrentQuest = farmNPCS[Player.PlayerStats.Level.Value].Quest
                    pcall(function()
                        
                        for i,v in pairs(workspace:GetDescendants()) do 
                            if string.match(v.Name, "Click") then
                               
                            if v.Name == farmNPCS[Player.PlayerStats.Level.Value].Quest and Player.Quest.Doing.Value == "None" then
                                wait()
                                Player.Character.HumanoidRootPart.CFrame = v.CFrame
                                fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
                            end
                        end
                        end
                --   Player.CharacterAdded:Wait()
                    local Character = Player.Character
                    local HRP = Character.HumanoidRootPart

                    setsimulationradius(math.huge)
                    local npcs = workspace:GetChildren()    
                        
                   
                    repeat wait() until Player.Quest.Doing.Value ~= "None"
             local Level = Player.PlayerStats.Level
                for i = 1, #npcs do 
                    if npcs[i] ~= nil then
                        if npcs[i].Name == farmNPCS[Level.Value].NPC then
                            local npcHRP = npcs[i].HumanoidRootPart
                            
                        Character.Humanoid.Died:Connect(function()
                            setCFrame = false
                        end)
                            if not setCFrame and Character.Humanoid.Health >= 1 then
                                setCFrame = true
                                HRP.CFrame = npcHRP.CFrame
                               
                            end
                            Character.Humanoid.WalkSpeed = 0
                            Character.Humanoid.JumpPower = 0
                            npcHRP.CFrame = HRP.CFrame* CFrame.new(0,0,-2)
                            local weld = Instance.new("AlignPosition")
                            weld.Responsiveness = 200
                            weld.RigidityEnabled = false
                            weld.Parent = HRP
                            weld.Attachment0 = HRP:FindFirstChildOfClass("Attachment")
                            weld.Attachment1 = npcHRP:FindFirstChildOfClass("Attachment")

                           
                            if properties.AutoEquip then
                                local tool = Player.Backpack:FindFirstChild(getgenv().CurrentTool) or Player.Character:FindFirstChild(getgenv().CurrentTool)
                        
                                tool.Parent = Player.Character
                            end
                            virtualUser:CaptureController()
                            virtualUser:ClickButton1(Vector2.new(Mouse.x,Mouse.y))
                            
                        if npcs[i].Humanoid.Health < npcs[i].Humanoid.MaxHealth then
                                npcs[i].Humanoid.Health = 0
                            end
                        end

                    end
                end
               end)
            else

                break
            end
            end
        end))
    end

    functions.refreshNPCS = function(value)
    if value == "Add" then
        for i, npc in pairs(workspace:GetChildren()) do
            if npc~=nil and npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("Following") then
                    
                if not NPCS[npc.Name] then
                            
                table.insert(NPCS,i, npc.Name)
                end
            end
        end

        NPCSdropDown = NPCSFarmSection:addDropdown("NPCS", NPCS, function(string)
            if AutoFarmNPCSOn then
            AutoFarmNPCSOn = false
            getgenv().CurrentNPC = string
            print(getgenv().CurrentNPC)
            wait(1)
            AutoFarmNPCSOn = true
            setCFrame = false
            else
                getgenv().CurrentNPC = string
                print(getgenv().CurrentNPC)
            end
        end)
        elseif value == "Update" then
            for i, npc in pairs(workspace:GetChildren()) do
                if npc~=nil and npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("Following") then
                    
                    if not NPCS[npc.Name] then
                            
                    table.insert(NPCS,i, npc.Name)
                end
                end
            end

            NPCSFarmSection:updateDropdown(NPCSdropDown, "NPCS", NPCS, function(string)
                if AutoFarmNPCSOn then
                    AutoFarmNPCSOn = false
                    for i, v in pairs(Player.Character.HumanoidRootPart:GetChildren()) do
                    if v:IsA("BodyPosition") then
                        v:Destroy()
                    end
                    end
                    getgenv().CurrentNPC = string
                    print(getgenv().CurrentNPC)
                    wait(1)
                    AutoFarmNPCSOn = true
                    setCFrame = false
                else
                    getgenv().CurrentNPC = string
                    print(getgenv().CurrentNPC)
                end
            end)
        end
    end

    NPCSFarmSection:addToggle("Auto Farm", nil, function(value)
        if value then
            wait(1)
            print("Auto Farm On")
            AutoFarmNPCSOn = true
            
            functions.autoFarmNPCS()
        else
        print("Auto Farm Off")

        for i, v in pairs(Player.Character.HumanoidRootPart:GetChildren()) do
            if v:IsA("AlignPosition") then
                v:Destroy()
            end
        end
        Player.Character.Humanoid.WalkSpeed = 16
        Player.Character.Humanoid.JumpPower = 60
        AutoFarmNPCSOn = false
        wait(1)
        setCFrame = false
    end
    end)

    functions.refreshNPCS("Add")
    NPCSFarmSection:addButton("Refresh NPCS", function()
    functions.refreshNPCS("Update")
    end)

    functions.refreshTools("Add")
    NPCSFarmSection:addButton("Refresh Tools", function()
        functions.refreshTools("Update")
    end)

    NPCSFarmSection:addToggle("Auto Equip", nil, function(value)
        if value then
            print("Auto Equip On")
            properties.AutoEquip = true
        else
            print("Auto Equip Off")
            properties.AutoEquip = false
    end
    end)



    local theme = venyx:addPage("Theme", 5012544693)
    local colors = theme:addSection("Colors")

    for theme, color in pairs(themes) do
        colors:addColorPicker(theme, color, function(color3)
            venyx:setTheme(theme, color3)
        end)
    end
    venyx:SelectPage(venyx.pages[1], true)