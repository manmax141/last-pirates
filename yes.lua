repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

getgenv().StandWanted = {"None"}
getgenv().Items = {"None"}

local properties = {
    autoStand = false,
    usingArrow = false,
    ateRoka = false,
    shinyFarm = false,
    itemFarm = false
}

local Stands = {
    "Platinum Sun", 
    "White Poison", 
    "Violet Fog", 
    "Six Pistols", 
    "Airsmith", 
    "Scarlet King", 
    "Golden Spirit", 
    "Zipper Fingers", 
    "Ms. Vice President",
    "Ice Album",
    "Ocean Boy",
    "That Hand",
    "Shining Sapphire",
    "Deadly King",
    "Yellow Hot Chili Pepper",
    "Violet Vine",
    "Tentacle Green",
    "Grey Rapier",
    "Magician's Ember",
    "Void",
    "The Universe",
    "Anubiz"
}

local Items = {
    "Rokakaka",
    "Mysterious Arrow",
    "Lucky Arrow",
    "Rib Cage of Saint's Corpse",
    "Pure Rokakaka",
    "Steel Ball",
    "Quinton's Glove",
    "Zeppeli's Headband",
    "Ancient Scroll",
    "Stone Mask",
    "Gold Coin",
    "Diamond",
    "DEO's Diary"
}

local rokakakaEatTable = {
   ["NPC"] = "Rokakaka",
   ["Option"] = "Option1",
   ["Dialogue"] = "Dialogue2"
}

local useArrowTable = {
    ["NPC"] = "Mysterious Arrow",
    ["Option"] = "Option1",
    ["Dialogue"] = "Dialogue2"
}

local events = {}
local functions = {}

local venyx = library.new("Venyx", 5013109572)
local StandsPage = venyx:addPage("Stands", 5012544693)
local ItemsPage = venyx:addPage("Items", 5012544693)
local MiscPage = venyx:addPage("Misc", 5012544693)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local miscSection = MiscPage:addSection("Misc")
miscSection:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
    print("Activated Keybind")
    venyx:toggle()
    end, function()
    print("Changed Keybind")
end)

functions.addWorthiness = function()
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()


    -- Vitality
    Character.RemoteFunction:InvokeServer("LearnSkill", {["Skill"] = "Vitality I", ["SkillTreeType"] = "Character"})
    Character.RemoteFunction:InvokeServer("LearnSkill", {["Skill"] = "Vitality II", ["SkillTreeType"] = "Character"})
    Character.RemoteFunction:InvokeServer("LearnSkill", {["Skill"] = "Vitality III", ["SkillTreeType"] = "Character"})
    -- Worthiness
    Character.RemoteFunction:InvokeServer("LearnSkill", {["Skill"] = "Worthiness I", ["SkillTreeType"] = "Character"})
    Character.RemoteFunction:InvokeServer("LearnSkill", {["Skill"] = "Worthiness II", ["SkillTreeType"] = "Character"})
    Character.RemoteFunction:InvokeServer("LearnSkill", {["Skill"] = "Worthiness III", ["SkillTreeType"] = "Character"})
end

functions.eatRoka = function()
    local Character = Player.Character or Player.CharacterAdded:Wait()

    Character.RemoteEvent:FireServer("EndDialogue", rokakakaEatTable)
end

functions.useArrow = function()
    local Character = Player.Character or Player.CharacterAdded:Wait()

    Character.RemoteEvent:FireServer("EndDialogue", useArrowTable)
end

events.itemFarm = function()
    spawn(function()
        while wait() do
            wait()
            if properties.itemFarm then
                wait()
                local Player = game.Players.LocalPlayer
                local Character = Player.Character

                for i,v in pairs(workspace:GetChildren()) do wait()

                    if Items[v] then
                        wait(.65)
                        setsimulationradius(math.huge)
                        Character:MoveTo(v.Position)
                        fireclickdetector(v.ClickDetector)
                    end

                end
            else
                wait()
                break
            end

        end
    end)
end

events.autoStand = function()
    spawn(function()
   while wait() do
        wait()
    if properties.autoStand then
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local StandValue = Player.PlayerStats.Stand

            if getgenv().StandWanted[StandValue.Value] then
            else
                
            if properties.usingArrow then
            spawn(function()
                functions.useArrow()
                functions.addWorthiness()
    
                
                wait(10)
                properties.usingArrow = false
                properties.ateRoka = false
            end)
            else
               
                if StandValue.Value == "None" then  
                    properties.usingArrow = true 
                else
                  
                   
                if not properties.ateRoka then
                 if properties.shinyFarm then
                    if Character.StandMorph.StandSkin.Value == "" and not getgenv().StandWanted[StandValue.Value] then
                        properties.usingArrow = true
                        properties.ateRoka = true
                        functions.eatRoka()
                    end
                else
                   if not getgenv().StandWanted[StandValue.Value] then
                    properties.usingArrow = true
                    properties.ateRoka = true
                    functions.eatRoka()
                   end
                 end
                   
                    
                end
                 end
               
            end

           
    end
    else
        break
    end
end
end)
end

local AutoStandsSection = StandsPage:addSection("Auto Stand")

local autoStandToggle = AutoStandsSection:addToggle("Auto Stand", false, function(Value)
  if Value then
        properties.autoStand = true
        
        events.autoStand()
        print("Auto Stand on")
    else
        properties.autoStand = false
        print("Auto Stand off")
    end
end)

local shinyFarmToggle = AutoStandsSection:addToggle("Shiny Farm", false, function(Value)
    if Value then
          properties.shinyFarm = true
          
          print("Shiny Farm on")
      else
          properties.shinyFarm = false
          print("Shiny Farm off")
      end
  end)

local AutoItemSection = ItemsPage:addSection("Item's Farm")

local itemFarmToggle = AutoItemSection:addToggle("Item Farm", false, function(Value)
    if Value then
          properties.itemFarm = true
          
          events.itemFarm()
          print("Item Farm on")
      else
          properties.itemFarm = false
          print("Item Farm off")
     end
end)

local StandsSection = StandsPage:addSection("Stands")

for i = 1,#Stands do
    local standToggle = StandsSection:addToggle(Stands[i], false, function(Value)
        if Value then
            table.insert(getgenv().StandWanted, Stands[i])
        else
            table.remove(getgenv().StandWanted, i) 
        end
    end)
end

local ItemsSection = ItemsPage:addSection("Items")

for i = 1,#Items do
    local itemToggle = ItemsSection:addToggle(Items[i], false, function(value)
        if value then
            table.insert(getgenv().Items, Items[i])
        else
            table.remove(getgenv().Items, i)  
        end
    end)
end

venyx:SelectPage(venyx.pages[1], true)
