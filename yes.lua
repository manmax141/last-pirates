repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

getgenv().StandWanted = {"None"}

local properties = {
    autoStand = false,
    usingArrow = false,
    ateRoka = false,
    shinyFarm = false
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

local MainUI = UILibrary.Load("Mos Hub")
local StandsPage = MainUI.AddPage("Stands",true)

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

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

events.autoStand = function()
    spawn(function()
   while wait() do
        wait()
    if properties.autoStand then
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local StandValue = Player.PlayerStats.Stand

        for i,v in pairs(getgenv().StandWanted) do

            if StandValue.Value == v then
        else
          
            if properties.usingArrow then
                functions.useArrow()
                functions.addWorthiness()
    
                
                wait(10)
                properties.usingArrow = false
                properties.ateRoka = false
            else
               
                if StandValue.Value == "None" then  
                    properties.usingArrow = true 
                else
                  
                   
                if not properties.ateRoka then
                 if properties.shinyFarm then
                    if Character.StandMorph.StandSkin.Value == "" then
                        properties.usingArrow = true
                        properties.ateRoka = true
                        functions.eatRoka()
                    end
                else
                    properties.usingArrow = true
                    properties.ateRoka = true
                    functions.eatRoka()
                 end
                   
                    
                end
                    properties.usingArrow = true
                    properties.ateRoka = true
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

local autoStandToggle = StandsPage.AddToggle("Auto Stand", false, function(Value)
  if Value then
        properties.autoStand = true
        
        events.autoStand()
        print("Auto Stand on")
    else
        properties.autoStand = false
        print("Auto Stand off")
    end
end)

local shinyFarmToggle = StandsPage.AddToggle("Shiny Farm", false, function(Value)
    if Value then
          properties.shinyFarm = true
          
          print("Shiny Farm on")
      else
          properties.shinyFarm = false
          print("Shiny Farm off")
      end
  end)

local StandsLabel = StandsPage.AddLabel("Stands")

for i = 1,#Stands do
    local standToggle = StandsPage.AddToggle(Stands[i], false, function(Value)
        if Value then
            table.insert(getgenv().StandWanted, Stands[i])
        else
            table.remove(getgenv().StandWanted, i) 
        end
    end)
end
