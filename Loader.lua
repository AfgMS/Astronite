local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AfgMS/Astronite/main/AstroniteLibrary.lua", true))()
local CoreGui = game:WaitForChild("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = game.Players.LocalPlayer

--Panel
Library:CreateImportantUI()

--Navigation
local NavigationsTest1 = Library:CreateNavigations("Gui", 12203817423)
local NavigationsTest2 = Library:CreateNavigations("test", 12203817778)
