
    local Player = game.Players.LocalPlayer
    local functions = {}
    local NPCS = {}

    local DevilFruits = {
        "Suke Suke no mi";
        "Bomu Bomu no mi";
        "Yomi Yomi no mi";
        "Zushi Zushi no mi";
        "Mera Mera no mi";
        "Tori Tori no mi";
        "Pika Pika no mi";
        "Moku Moku no mi";
        "Suna Suna no mi";
        "Gura Gura no mi";
        "Guru Guru no mi";
        "Hie Hie no mi";
        "Soru Soru no mi";
        "Bisu Bisu no mi";
        "Bari Bari no mi";
        "Goro Goro no mi";
        "Mochi Mochi no mi";
        "Yami Yami no mi";
        "Magu Magu no mi";
    }

    local properties = {
        AutoEquip = false;
        Quest = "None";
        mobFarm = false;
        walkSpeed = false;
        DFFarm = false;
        DFSniper = false;
        bringAllPlayers = false;
    }
    local Tools = {}

    local Quests = {}

    local AutoFarmNPCSOn = false
    getgenv().CurrentNPC = "None"
    getgenv().CurrentTool = "None"
    getgenv().CurrentQuest = "None"
    getgenv().DFFocused = "None"
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
    local venyx = library.new("Emperor's Hub", 5013109572)


    local farmNPCS = {}
    local Parts = {}

 for i = 1,15 do
            
            
    local dots =  {["NPC"] = "Bandit [Lv:5]"; ["Quest"] = "BanditClick";}

    table.insert(farmNPCS,i, dots)
 end;
 
 for i = 15,30 do 
    
    local dots =  {["NPC"] = "Pirates [Lv:15]"; ["Quest"] = "PiratesClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 30,50 do 
    
    local dots =  {["NPC"] = "BagyPirates"; ["Quest"] = "BagyPirates";}

    table.insert(farmNPCS,i, dots)
end;

for i = 50,100 do 
    
    local dots =  {["NPC"] = "Revolutionary Troop [Lv:50]"; ["Quest"] = "TroopClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 100,150 do 
    
    local dots =  {["NPC"] = "Marines [Lv:100]"; ["Quest"] = "MarineClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 150,200 do       
    
    local dots =  {["NPC"] = "Marines [Lv:100]"; ["Quest"] = "MarineClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 200,250 do 
    
    local dots =  {["NPC"] = "Desert Bandit [Lv:200]"; ["Quest"] = "DesertBanditClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 250,300 do 
    
    local dots =  {["NPC"] = "Desert Bandit [Lv:200]"; ["Quest"] = "DesertBanditClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 300,370 do 
    
    local dots =  {["NPC"] = "Cyborg [Lv:300]"; ["Quest"] = "CyborgClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 370,400 do 
    
    local dots =  {["NPC"] = "Rear Admiral [Lv:370]"; ["Quest"] = "RearAdmiralClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 400,450 do 
    
    local dots =  {["NPC"] = "Rear Admiral [Lv:370]"; ["Quest"] = "RearAdmiralClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 450,570 do 
    
    local dots =  {["NPC"] = "fishman [Lv:450]"; ["Quest"] = "FishmanClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 570,600 do 
    
    local dots =  {["NPC"] = "SharkMan [Lv:570]"; ["Quest"] = "SharkManClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 600,700 do 
    
    local dots =  {["NPC"] = "SkypieanBandit [Lv:600]"; ["Quest"] = "SkypieanBanditClick";}

    table.insert(farmNPCS,i, dots)
end;

for i = 700,850 do 
    
    local dots =  {["NPC"] = "Castle Guardian [Lv:700]"; ["Quest"] = "CastleGuardianClick";}

    table.insert(farmNPCS,i, dots)
end;

    local setCFrame = false  
    local AutoFarmPage = venyx:addPage("Auto Farm", 5012544693)
    local NPCSFarmSection = AutoFarmPage:addSection("NPCS Farm")
    local PlayerPage = venyx:addPage("Player", 5012544693)
    local MiscPage = venyx:addPage("Misc", 5012544693)
    local LocalSection = PlayerPage:addSection("Local")
    local DevilFruitSection = MiscPage:addSection("Devil Fruits")
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
            wait()
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
                wait()
                getgenv().CurrentTool = str
                print(getgenv().CurrentTool)
            end)
        end

    end
    wait()
    functions.mobFarm = function()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if properties.mobFarm then
                    
                    pcall(function()
                        print("Auto Farm Off")

                        for i, v in pairs(Player.Character.HumanoidRootPart:GetChildren()) do
                            if v:IsA("AlignPosition") then
                                v:Destroy()
                            end
                        end
                        Player.Character.Humanoid.WalkSpeed = 16
                        Player.Character.Humanoid.JumpPower = 60
                        AutoFarmNPCSOn = false
                        
                        setCFrame = false
                     
                   
                    local Character = Player.Character
                    local HRP = Character.HumanoidRootPart

                    setsimulationradius(math.huge)
                    local npcs = workspace:GetChildren()    
                        
                
                       coroutine.wrap(function()
                        while wait() do 
                            if properties.mobFarm then
                            if Player.Quest.Doing.Value == "None" then
                        for i,v in pairs(workspace:GetDescendants()) do 
                     
                               
                            if v.Name == getgenv().CurrentQuest and Player.Quest.Doing.Value == "None" then
                                
                                Player.Character.HumanoidRootPart.CFrame = v.CFrame
                               for i,prox in pairs(v:GetChildren()) do
                                if prox:IsA("ProximityPrompt") then
                                  
                                   
                                    setCFrame = false
                                    fireproximityprompt(prox)
                                    print("of a7")
                                   end
                                end
                           
                            end
                        end
                    end
                else
                    break
                end
                        end
                       end)()
                   
                    repeat wait() until Player.Quest.Doing.Value ~= "None"
             local Level = Player.PlayerStats.Level
                for i = 1, #npcs do 
                    if npcs[i] ~= nil then
                        if npcs[i].Name == getgenv().CurrentNPC then
                          
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

    functions.autoFarmNPCS = function()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if AutoFarmNPCSOn then
                    
               wait()
                    getgenv().CurrentNPC = farmNPCS[Player.PlayerStats.Level.Value].NPC
                    getgenv().CurrentQuest = farmNPCS[Player.PlayerStats.Level.Value].Quest
                   
                    pcall(function()
                        
                     
                   
                    local Character = Player.Character
                    local HRP = Character.HumanoidRootPart

                    setsimulationradius(math.huge)
                    local npcs = workspace:GetChildren()    
                        
                
                       coroutine.wrap(function()
                        while wait() do 
                            if AutoFarmNPCSOn then
                            if Player.Quest.Doing.Value == "None" then
                        for i,v in pairs(workspace:GetDescendants()) do 
                     
                               
                            if v.Name == farmNPCS[Player.PlayerStats.Level.Value].Quest and Player.Quest.Doing.Value == "None" then
                                
                                Player.Character.HumanoidRootPart.CFrame = v.CFrame
                               for i,prox in pairs(v:GetChildren()) do
                                if prox:IsA("ProximityPrompt") then
                                  
                                   
                                    setCFrame = false
                                    fireproximityprompt(prox)
                                    print("of a7")
                                   end
                                end
                           
                            end
                        end
                    end
                else
                    break
                        end
                    end
                       end)()
                   
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

    functions.bringAllPlayers = function()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if properties.bringAllPlayers then
                for i,target in pairs(workspace:GetChildren()) do
                    if game.Players:FindFirstChild(target.Name) and target.Name ~= Player.Name then
                        wait()
                        setsimulationradius(math.huge)

                    end
                end
            else
                break
            end
            end
        end))
    end

    functions.DFFarms = function()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if properties.DFFarm then
                    wait()
                   if Player ~= nil then
                    if Player.PlayerStats.Money.Value >= 250000 then
                        for i,v in pairs(workspace:GetDescendants()) do
                            if v.Name == "RandomDFCilck" then
                               fireclickdetector(v.ClickDetector)
                              repeat wait() until Player.PlayerGui:FindFirstChild("RandomFruitGui")
                             for a,b in pairs(Player.PlayerGui.RandomFruitGui:GetChildren()) do
                                    if b:IsA("TextButton") and b:FindFirstChild("TextLabel") and b:FindFirstChild("TextLabel").Text == "Random Devil Fruit $:250,000" then

                                        mousemoveabs(b.Position.X,b.Position.Y)
                                        virtualUser:CaptureController()
                                        virtualUser:ClickButton1(Vector2.new(Mouse.x,Mouse.y))
                                         print("omak yousef mkna")
                                         
                                    end
                                end
                                
                            end
                        end
                   end
                end
                    for i,v in pairs(workspace:GetChildren()) do
                        if v:FindFirstChild("DF") then
                            wait()
                            setsimulationradius(math.huge)
                            

                            Player.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                        end
                    end

                else
                    break
                end
            end
        end))
    end

    functions.DFSnipe = function()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if properties.DFSniper then
                   pcall(function()
                     local DF = Player.Character:FindFirstChild(getgenv().DFFocused) or Player.Backpack:FindFirstChild(getgenv().DFFocused)
                      wait()
                     if DF then
                        wait()
                        DF.Parent = Player.Character
                        game.ReplicatedStorage.DF:FireServer("Eat")
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
            wait()
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
                wait()
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

    functions.refreshQuests = function(value)
        if value == "Add" then
            for i, npc in pairs(workspace:GetDescendants()) do
                if npc~=nil and npc:FindFirstChild("Proximity") then
                        
                    if not Quests[npc.Name] then
                        local name = string.gsub(npc.Name, "Click", "")
                      table.insert(Quests,i, name)
                    end
                end
            end
    
            QuestsDropdown = NPCSFarmSection:addDropdown("Quests", Quests, function(str)
                wait()
                if properties.mobFarm then
                    properties.mobFarm = false
                    str=str.."Click"
                    getgenv().CurrentQuest = str
                  print(getgenv().CurrentQuest)
                wait(1)
                properties.mobFarm = true
                setCFrame = false
                else
                    str=str.."Click"
                    getgenv().CurrentQuest = str
                    print(getgenv().CurrentQuest)
                end
            end)
            elseif value == "Update" then
                for i, npc in pairs(workspace:GetDescendants()) do
                    if npc~=nil and npc:FindFirstChild("Proximity") then
                            
                        if not Quests[npc.Name] then
                            local name = string.gsub(npc.Name, "Click", "")
                          table.insert(Quests,i, name)
                        end
                    end
                end
    
                NPCSFarmSection:updateDropdown(QuestsDropdown, "Quests", Quests, function(str)
                    wait()
                    if properties.mobFarm then
                        properties.mobFarm = false
                        for i, v in pairs(Player.Character.HumanoidRootPart:GetChildren()) do
                        if v:IsA("BodyPosition") then
                            v:Destroy()
                        end
                        end
                        str=str.."Click"
                        getgenv().CurrentQuest = str
                        print(getgenv().CurrentQuest)
                        wait(1)
                        properties.mobFarm = true
                        setCFrame = false
                    else
                        str=str.."Click"
                        getgenv().CurrentQuest = str
                        print(getgenv().CurrentQuest)
                    end
                end)
            end
        end

    NPCSFarmSection:addToggle("Auto Farm", nil, function(value)
        wait()
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
        setCFrame = false
    end
    end)

    NPCSFarmSection:addToggle("Mob Farm", nil, function(value)
        wait()
        if value then
            wait(1)
            print("Mob Farm On")
            properties.mobFarm = true
            
            functions.mobFarm()
        else
        print("Auto Farm Off")

        for i, v in pairs(Player.Character.HumanoidRootPart:GetChildren()) do
            if v:IsA("AlignPosition") then
                v:Destroy()
            end
        end
        Player.Character.Humanoid.WalkSpeed = 16
        Player.Character.Humanoid.JumpPower = 60
        properties.mobFarm = false
        AutoFarmNPCSOn = false
        wait(1)
        setCFrame = false
    end
    end)

    DevilFruitSection:addToggle("Devil Fruit Farm", nil, function(value)
        wait()
        if value then
            wait()
            print("Devil Fruit Farm On")
            functions.DFFarms()
            properties.DFFarm = true
        else
            wait()
            print("Devil Fruit Farm Off")
            properties.DFFarm = false
        end
    end)

    DevilFruitSection:addToggle("Devil Fruit Sniper", nil, function(value)
        wait()
        if value then
           
            print("Devil Fruit Sniper On")
            functions.DFSnipe()
            properties.DFSniper = true
        else
            
            print("Devil Fruit Sniper Off")
            properties.DFSniper = false
        end
    end)


    DevilFruitSection:addDropdown("Devil Fruit", DevilFruits, function(string)
        wait()
        getgenv().DFFocused = string
    end)

    functions.refreshNPCS("Add")
    NPCSFarmSection:addButton("Refresh NPCS", function()
        wait()
    functions.refreshNPCS("Update")
    end)

    functions.refreshQuests("Add")  
    wait()  
         NPCSFarmSection:addButton("Refresh Quests", function()
         functions.refreshQuests("Update")
    end)

    functions.refreshTools("Add")
    NPCSFarmSection:addButton("Refresh Tools", function()
        wait()
        functions.refreshTools("Update")
    end)

    NPCSFarmSection:addToggle("Auto Equip", nil, function(value)
        wait()
        if value then
            print("Auto Equip On")
            properties.AutoEquip = true
        else
            print("Auto Equip Off")
            properties.AutoEquip = false
    end
    end)

    LocalSection:addButton("Inf HP (YOU CANT ATTACK WHILE USING THIS)", function()
        wait()
        if Player.Character then
            game.Players.LocalPlayer.Character.Humanoid.Name = 1
            local l = game.Players.LocalPlayer.Character["1"]:Clone()
            l.Parent = game.Players.LocalPlayer.Character
            l.Name = "Humanoid"
            wait()
            game.Players.LocalPlayer.Character["1"]:Destroy()
            game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            wait()
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
            wait(4.85)
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(.4)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            workspace.CurrentCamera.CameraType = Enum.CameraType.Track

            l.Died:Connect(function()
                wait()
                xos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                workspace.CurrentCamera.CameraType = Enum.CameraType.Track
                wait(.4)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = xos
            end)
        end
    end)
  
    LocalSection:addSlider("Set Walkspeed", 16, 16, 500, function(val)
        wait()
        coroutine.resume(coroutine.create(function()
            while wait() do
                if properties.walkSpeed then
                    Player.Character.Humanoid.WalkSpeed = val
                end
            end
        end))
    end)

    LocalSection:addToggle("Walkspeed", nil, function(value)
        if value then
            wait()
            print("WalkSpeed On")
            properties.walkSpeed = true
        else
            wait()  
            print("WalkSpeed Off")
            properties.walkSpeed = false
            wait(1)
        end
    end)