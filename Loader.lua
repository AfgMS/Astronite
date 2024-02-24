local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AfgMS/Astronite/main/AstroniteLibrary.lua", true))()
local CoreGui = game:WaitForChild("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = game.Players.LocalPlayer

--Panel
Library:CreateCore()

--Navigation
local NavigationsTest1 = Library:CreateTabs("Guay", 12203817423)
local NavigationsTest2 = Library:CreateTabs("Six", 12203817778)
