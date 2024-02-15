local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AfgMS/Astronite/main/AstroniteUI.lua", true))()
local CoreGui = game:WaitForChild("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = game.Players.LocalPlayer

--Panel
Library:CreateImportantUI()

--Navigation
local NavigationsTest1 = Library:CreateNavigations("Gui", 12203817423)
local NavigationsTest2 = Library:CreateNavigations("test", 12203817778)

--Pages
local Testing1 = NavigationsTest1:ToggleButton({
    Name = "Hello",
    callback = function(enabled)
        if enabled then
            print("Hello")
        else
            print("No")
        end
    end
})
local LibraryTesting = Testing1:Dropdown({
    Name = "HelloCutie",
    Default = "Heheha",
    List = {"Heheha", "Cun", "Six"},
    callback = function(selectedItem)
        print("Sex Methods is now", selectedItem)
    end
})
local MiniToggle1 = Testing1:MiniToggle({
    Name = "Ah~",
    callback = function(enabled)
        print("wsp")
    end
})
local Sliders1 = Testing1:Slider({
    Name = "Testing",
    min = 0,
    max = 5,
    callback = function(val)
        print("CurrentCum is now " .. val)
    end
})
local Testing2 = NavigationsTest1:ToggleButton({
    Name = "YourWelcome",
    callback = function(enabled)
        if enabled then
            print("No")
        else
            print("Yes")
        end
    end
})
local Phase2Test1 = NavigationsTest2:ToggleButton({
    Name = "Wassup",
    callback = function(enabled)
        if enabled then
            print("EE")
        else
            print("RR")
        end
    end
})
local Phase2Test2 = NavigationsTest2:ToggleButton({
    Name = "Yno",
    callback = function(enabled)
        if enabled then
            print("RR")
        else
            print("EE")
        end
    end
})
