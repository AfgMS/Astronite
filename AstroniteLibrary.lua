--localCore
local CoreGui = game:GetService("CoreGui")
local Font = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local Library = {}

--ImportantFunctions
function Library:checks(auto, set)
	for i, v in pairs(auto) do
		if set[i] == nil then
			set[i] = v
		end
	end
	return set
end

function Library:Tween(object, properties)
	local tweenInfo = TweenInfo.new(properties.time or 0.10, properties.easingStyle or Enum.EasingStyle.Quad, properties.easingDirection or Enum.EasingDirection.Out)
	local tween = TweenService:Create(object, tweenInfo, properties)
	tween:Play()
end

--LibraryPart
function Library:CreateCore()
	local AstroniteScreenUI = Instance.new("ScreenGui", CoreGui)
	AstroniteScreenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	AstroniteScreenUI.Name = "Astronite"
	AstroniteScreenUI.ResetOnSpawn = false

	local Panel = Instance.new("Frame", AstroniteScreenUI)
	Panel.Name = "Panel"
	Panel.AnchorPoint = Vector2.new(0.5, 0.5)
	Panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Panel.Position = UDim2.new(0.5, 0, 0.5, 0)
	Panel.Size = UDim2.new(0, 395, 0, 255)
	Panel.Visible = false

	local PanelCorner = Instance.new("UICorner", Panel)
	PanelCorner.CornerRadius = UDim.new(0, 12)

	local NavigationHolder = Instance.new("Frame", Panel)
	NavigationHolder.Name = "NavigationHolder"
	NavigationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationHolder.BackgroundTransparency = 1.000
	NavigationHolder.Position = UDim2.new(0, 0, 0, 0)
	NavigationHolder.Size = UDim2.new(0, 65, 1, 0)

	local NavigationList = Instance.new("UIListLayout", NavigationHolder)
	NavigationList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	NavigationList.SortOrder = Enum.SortOrder.LayoutOrder
	NavigationList.VerticalAlignment = Enum.VerticalAlignment.Center
	NavigationList.Padding = UDim.new(0, 15)

	local MobileOpenUI = Instance.new("TextButton", AstroniteScreenUI)
	MobileOpenUI.BorderSizePixel = 0
	MobileOpenUI.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MobileOpenUI.TextSize = 8
	MobileOpenUI.TextColor3 = Color3.fromRGB(153, 11, 255)
	MobileOpenUI.Size = UDim2.new(0, 23, 0, 23)
	MobileOpenUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MobileOpenUI.Text = "?"
	MobileOpenUI.Position = UDim2.new(0.963096738, 0, 0.351765305, 0)
	MobileOpenUI.AutoButtonColor = false

	local MobileOpenUICorner = Instance.new("UICorner", MobileOpenUI)
	MobileOpenUICorner.CornerRadius = UDim.new(0, 8)
	return AstroniteScreenUI
end

function Library:CreateTabs(Name, Image)
	local Tabs = {}
	Tabs.Toggles = {}

	Tabs.Navigation = Instance.new("ImageButton", CoreGui.Astronite:WaitForChild("Panel"):FindFirstChild("NavigationHolder"))
	Tabs.Navigation.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Tabs.Navigation.Position = UDim2.new(0, 0, 0, 0)
	Tabs.Navigation.Name = Name
	Tabs.Navigation.Size = UDim2.new(0, 30, 0, 30)
	Tabs.Navigation.AutoButtonColor = false
	Tabs.Navigation.ImageColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.Navigation.Image = "rbxassetid://" .. tostring(Image)

	Tabs.NavigationCorner = Instance.new("UICorner", Tabs.Navigation)
	Tabs.NavigationCorner.CornerRadius = UDim.new(1, 0)

	Tabs.ButtonHolder = Instance.new("ScrollingFrame", CoreGui.Astronite)
	Tabs.ButtonHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Tabs.ButtonHolder.BorderSizePixel = 0
	Tabs.ButtonHolder.Name = "Section" .. Name
	Tabs.ButtonHolder.BackgroundTransparency = 1.000
	Tabs.ButtonHolder.Position = UDim2.new(0.5, 25, 0.5, 0)
	Tabs.ButtonHolder.Size = UDim2.new(0, 305, 0, 205)
	Tabs.ButtonHolder.ScrollBarThickness = 0
	Tabs.ButtonHolder.Visible = false
	Tabs.ButtonHolder.AnchorPoint = Vector2.new(0.5, 0.5)

	Tabs.ButtonHolderList = Instance.new("UIListLayout", Tabs.ButtonHolder)
	Tabs.ButtonHolderList.SortOrder = Enum.SortOrder.LayoutOrder
	Tabs.ButtonHolderList.Padding = UDim.new(0, 9)

	Tabs.ScrollingSupport = Instance.new("Frame", Tabs.ButtonHolder)
	Tabs.ScrollingSupport.Name = "WeirdHolder"
	Tabs.ScrollingSupport.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.ScrollingSupport.BackgroundTransparency = 1.000
	Tabs.ScrollingSupport.Position = UDim2.new(0, 0, 0, 0)
	Tabs.ScrollingSupport.Size = UDim2.new(0, 100, 0, 1)
	
	local MobileOpenUI2 = CoreGui.Astronite:FindFirstChild("MobileOpenUI")
	local Panel2 = CoreGui.Astronite:FindFirstChild("Panel")
	MobileOpenUI2.MouseButton1Click:Connect(function()
		Panel2.Visible = not Panel2.Visible
		if not Tabs.ButtonHolder.Visible then
			Tabs.ButtonHolder.Visible = false
		end
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
		if input.KeyCode == Enum.KeyCode.V and not gameProcessedEvent then
			Panel2.Visible = not Panel2.Visible
			if not Tabs.ButtonHolder.Visible then
				Tabs.ButtonHolder.Visible = false
			end
		end
	end)

	local NavigationOnClick = false
	Tabs.Navigation.MouseButton1Click:Connect(function()
		NavigationOnClick = not NavigationOnClick
		if NavigationOnClick then
			Tabs.Navigation.BackgroundColor3 = Color3.fromRGB(146, 226, 255)
			Tabs.Navigation.ImageColor3 = Color3.fromRGB(20, 20, 20)
			Tabs.ButtonHolder.Visible = true
		else
			Tabs.Navigation.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
			Tabs.Navigation.ImageColor3 = Color3.fromRGB(255, 255, 255)
			Tabs.ButtonHolder.Visible = false
		end
	end)
end

return Library
