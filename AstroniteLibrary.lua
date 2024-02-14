--ImportantStuff
local Font = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local Library = {}

--SomeFunction
function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:Tween(object, properties)
	local tweenInfo = TweenInfo.new(properties.time or 0.10, properties.easingStyle or Enum.EasingStyle.Quad, properties.easingDirection or Enum.EasingDirection.Out)
	local tween = TweenService:Create(object, tweenInfo, properties)
	tween:Play()
end

--UILibrary
function Library:CreateImportantUI()

	local AstroniteScreenUI = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui);
	AstroniteScreenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	AstroniteScreenUI.Name = "Astronite"
	AstroniteScreenUI.ResetOnSpawn = false

	local Panel = Instance.new("Frame", AstroniteScreenUI)
	Panel.Name = "Panel"
	Panel.AnchorPoint = Vector2.new(0.5, 0.5)
	Panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Panel.Position = UDim2.new(0.5, 0, 0.5, 0)
	Panel.Size = UDim2.new(0, 675, 0, 360)

	local PanelCorner = Instance.new("UICorner", Panel)
	PanelCorner.CornerRadius = UDim.new(0, 12)
	
	local MobileOpenUI = Instance.new("TextButton", AstroniteScreenUI)
	MobileOpenUI.BorderSizePixel = 0
	MobileOpenUI.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MobileOpenUI.TextSize = 8
	MobileOpenUI.TextColor3 = Color3.fromRGB(153, 11, 255)
	MobileOpenUI.Size = UDim2.new(0, 23, 0, 23)
	MobileOpenUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MobileOpenUI.Text = "+"
	MobileOpenUI.Position = UDim2.new(0.963096738, 0, 0.351765305, 0)
	MobileOpenUI.AutoButtonColor = false
	
	local BlurVision = Instance.new("BlurEffect", Lighting)
	BlurVision.Size = 23
	BlurVision.Enabled = false
	
	
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
		if input.KeyCode == Enum.KeyCode.V and not gameProcessedEvent then
			Panel.Visible = not Panel.Visible
			BlurVision.Enabled = not BlurVision.Enabled
		end
	end)
	
	MobileOpenUI.MouseButton1Click:Connect(function()
		Panel.Visible = not Panel.Visible
		BlurVision.Enabled = not BlurVision.Enabled
	end)
	
function Library:CreateNavigations(Name, Image)

	local NavigationHolder = Instance.new("Frame", Panel)
	NavigationHolder.Name = "NavigationHolder"
	NavigationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationHolder.BackgroundTransparency = 1.000
	NavigationHolder.Position = UDim2.new(0.037147101, 0, 0.136957541, 0)
	NavigationHolder.Size = UDim2.new(0, 69, 0, 272)

	local NavigationList = Instance.new("UIListLayout", NavigationHolder)
	NavigationList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	NavigationList.SortOrder = Enum.SortOrder.LayoutOrder
	NavigationList.VerticalAlignment = Enum.VerticalAlignment.Center
	NavigationList.Padding = UDim.new(0, 15)

	local Navigation = Instance.new("TextButton", NavigationHolder)
	Navigation.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Navigation.Position = UDim2.new(0.345454544, 0, 0.0795755982, 0)
	Navigation.Name = Name
	Navigation.Size = UDim2.new(0, 40, 0, 40)
	Navigation.AutoButtonColor = false

	local NavigationCorner = Instance.new("UICorner", Navigation)
	NavigationCorner.CornerRadius = UDim.new(1, 0)

	local NavigationImage = Instance.new("ImageLabel", Navigation)
	NavigationImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationImage.BackgroundTransparency = 1.000
	NavigationImage.Position = UDim2.new(0.25, 0, 0.25, 0)
	NavigationImage.Size = UDim2.new(0, 20, 0, 20)
	NavigationImage.Image = Image
	NavigationImage.ImageColor3 = Color3.fromRGB(20, 20, 20)
		
	local NavigationOnClick = false
	Navigation.MouseButton1Click:Connect(function()
		if NavigationOnClick then
			Library:Tween(Navigation, {BackgroundColor3 = Color3.fromRGB(146, 226, 255)})
		else
			Library:Tween(Navigation, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)})
		end
	end)
	
function Library:CustomNavigationSection(Name)

	local ButtonHolder = Instance.new("ScrollingFrame", AstroniteScreenUI)
	ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder.BackgroundTransparency = 1.000
	ButtonHolder.BorderSizePixel = 0
	ButtonHolder.Name = Name
	ButtonHolder.Position = UDim2.new(0.1601412, 0, 0.113084868, 0)
	ButtonHolder.Size = UDim2.new(0, 543, 0, 284)
	ButtonHolder.ScrollBarThickness = 0

	local ButtonHolderList = Instance.new("UIListLayout", ButtonHolder)
	ButtonHolderList.SortOrder = Enum.SortOrder.LayoutOrder
	ButtonHolderList.Padding = UDim.new(0, 9)

	local ScrollingSupport = Instance.new("Frame", ButtonHolder)
	ScrollingSupport.Name = "WeirdHolder"
	ScrollingSupport.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingSupport.BackgroundTransparency = 1.000
	ScrollingSupport.Position = UDim2.new(0.40791896, 0, 0, 0)
	ScrollingSupport.Size = UDim2.new(0, 100, 0, 1)
	
	Navigation.MouseButton1Click:Connect(function()
		if NavigationOnClick then
			ButtonHolder.Visible = true
		else
			ButtonHolder.Visible = false
		end
	end)

function Library:ToggleButton(todo)
	todo = Library:validate({
		Name = "Nil",
	}, todo or {})

	local ToggleButton = {
		Enabled = false
	}
	
	--ToggleButtonsPart
	local ToggleButtonsHolder = Instance.new("Frame", ButtonHolder)
	ToggleButtonsHolder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ToggleButtonsHolder.Size = UDim2.new(0, 521, 0, 50)

	local ToggleButtonsHolderCorner = Instance.new("UICorner")
	ToggleButtonsHolderCorner.CornerRadius = UDim.new(0, 8)
	ToggleButtonsHolderCorner.Parent = ToggleButtonsHolder
			
	local ToggleButtonsMobileSupport = Instance.new("TextButton", ButtonHolder)
	ToggleButtonsMobileSupport.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButtonsMobileSupport.BackgroundTransparency = 1.000
	ToggleButtonsMobileSupport.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleButtonsMobileSupport.BorderSizePixel = 0
	ToggleButtonsMobileSupport.Position = UDim2.new(0, 475, 0, 0)
	ToggleButtonsMobileSupport.Size = UDim2.new(0, 45, 1, 0)
	ToggleButtonsMobileSupport.Font = Enum.Font.GothamBold
	ToggleButtonsMobileSupport.Text = ":"
	ToggleButtonsMobileSupport.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButtonsMobileSupport.TextSize = 28.000
	ToggleButtonsMobileSupport.TextWrapped = true
				
	local ToggleButtonsTitle = Instance.new("TextLabel", ToggleButtonsHolder)
	ToggleButtonsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButtonsTitle.BackgroundTransparency = 1.000
	ToggleButtonsTitle.Position = UDim2.new(0.036468327, 0, 0.310000002, 0)
	ToggleButtonsTitle.Size = UDim2.new(0, 200, 0, 18)
	ToggleButtonsTitle.Font = Enum.Font.GothamBlack
	ToggleButtonsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButtonsTitle.TextScaled = true
	ToggleButtonsTitle.TextSize = 14.000
	ToggleButtonsTitle.TextWrapped = true
	ToggleButtonsTitle.Text = todo.name
	ToggleButtonsTitle.TextXAlignment = Enum.TextXAlignment.Left

	local ToggleButtonsTriggerHolder = Instance.new("Frame", ToggleButtonsHolder)
	ToggleButtonsTriggerHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ToggleButtonsTriggerHolder.Position = UDim2.new(0, 425, 0, 15)
	ToggleButtonsTriggerHolder.Size = UDim2.new(0, 43, 0, 24)

	local ToggleButtonsTrigger = Instance.new("TextButton", ToggleButtonsTriggerHolder)
	ToggleButtonsTrigger.BackgroundColor3 = Color3.fromRGB(173, 173, 173)
	ToggleButtonsTrigger.Position = UDim2.new(-0.0131163001, 0, 0, 0)
	ToggleButtonsTrigger.Size = UDim2.new(0, 24, 0, 24)
	
	--ToggleButtonsMenu
	local ToggleButtonsMenuHolder = Instance.new("ScrollingFrame", ToggleButtonsHolder)
	ToggleButtonsMenuHolder.Active = true
	ToggleButtonsMenuHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButtonsMenuHolder.BackgroundTransparency = 1.000
	ToggleButtonsMenuHolder.BorderSizePixel = 0
	ToggleButtonsMenuHolder.Visible = false
	ToggleButtonsMenuHolder.Position = UDim2.new(0.0230326299, 0, 0.247572809, 0)
	ToggleButtonsMenuHolder.Size = UDim2.new(0, 493, 0, 145)
	ToggleButtonsMenuHolder.ScrollBarThickness = 5

	local ToggleButtonsMenuHolderList = Instance.new("UIListLayout", ToggleButtonsMenuHolder)
	ToggleButtonsMenuHolderList.SortOrder = Enum.SortOrder.LayoutOrder
	ToggleButtonsMenuHolderList.Padding = UDim.new(0, 9)
	
	local function WhenClicked()
		if ToggleButton.Enabled then
			ToggleButtonsTrigger.BackgroundColor = Color3.fromRGB(146, 226, 255)
			ToggleButtonsTrigger.Position = UDim2.new(0, 15, 0, 0)
		else
			ToggleButtonsTrigger.BackgroundColor = Color3.fromRGB(173, 173, 173)
			ToggleButtonsTrigger.Position = UDim2.new(0, 0, 0, 0) 
		end
	end
				
	local ToggleButtonsMobileSupportTrigger = false
	ToggleButtonsMobileSupport.MouseButton2Click:Connect(function()
		if ToggleButtonsMobileSupportTrigger then
			ToggleButtonsHolder.Size = UDim2.new(0, 521,0, 206)
			ToggleButtonsMenuHolder.Visible = true
		else
			ToggleButtonsHolder.Size = UDim2.new(0, 521, 0, 50)
			ToggleButtonsMenuHolder.Visible = false
		end
		ToggleButtonsMobileSupportTrigger = not ToggleButtonsMobileSupportTrigger
	end)
	
	ToggleButtonsTrigger.MouseButton1Click:Connect(function()
		ToggleButton.Enabled = not ToggleButton.Enabled
		WhenClicked()
		
		if todo.callback then
			todo.callback(ToggleButton.Enabled)
		end
	end)
	
function Library:TextLabel(Text)
	
	local TextLabelHolder = Instance.new("TextLabel", ToggleButtonsMenuHolder)
	TextLabelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabelHolder.BackgroundTransparency = 1.000
	TextLabelHolder.Size = UDim2.new(0, 200, 0, 15)
	TextLabelHolder.Font = Enum.Font.GothamBold
	TextLabelHolder.Text = Text
	TextLabelHolder.TextColor3 = Color3.fromRGB(127, 127, 127)
	TextLabelHolder.TextScaled = true
	TextLabelHolder.TextSize = 14.000
	TextLabelHolder.TextWrapped = true
	TextLabelHolder.TextXAlignment = Enum.TextXAlignment.Left


function Library:Dropdown(todo)
	todo = Library:validate({
		Name = "Nil",
		Default = "Nil",
		callback = function(selectedItem) end
		}, todo or {})

	local Dropdown = {
		Enabled = false,
		List = todo.list or {},
		Selected = todo.Default or "",
	}
	
	local DropdownHolder = Instance.new("TextButton", ToggleButtonsMenuHolder)
	DropdownHolder.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	DropdownHolder.Position = UDim2.new(0.0141987829, 0, 0.237060606, 0)
	DropdownHolder.Size = UDim2.new(0, 200, 0, 31)
	DropdownHolder.AutoButtonColor = false
	DropdownHolder.Text = todo.Name
	DropdownHolder.Font = Enum.Font.GothamBold
	DropdownHolder.TextScaled = true
	DropdownHolder.TextColor = Color3.fromRGB(255, 255, 255)
	
	local DropdownHolderCorner = Instance.new("UICorner",DropdownHolder)
	DropdownHolderCorner.CornerRadius = 0.6
	
	local DropdownUIStroke = Instance.new("UIStroke", DropdownHolder)
	DropdownUIStroke.Thickness = 1.25
	DropdownUIStroke.Color = Color3.fromRGB(49, 49, 49)
	
	local DropdownList = Instance.new("ScrollingFrame", ToggleButtonsMenuHolder)
	DropdownList.ScrollBarThickness = 0
	DropdownList.BackgroundColor = Color3.fromRGB(36, 36, 36)
	DropdownList.BorderColor = Color3.fromRGB(27, 42, 53)
	DropdownList.Size = UDim2.new(0, 200, 0, 79)
	DropdownList.Visible = false
	

	local DropdownListCorner = Instance.new("UICorner",DropdownList)
	DropdownHolderCorner.CornerRadius = 0.6

	local DropdownListUIStroke = Instance.new("UIStroke", DropdownList)
	DropdownUIStroke.Thickness = 1.25
	
	local DropdownListUIList = Instance.new("UIListLayout", DropdownList)
	DropdownListUIList.FillDirection = Enum.FillDirection.Vertical
	NavigationList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	NavigationList.SortOrder = Enum.SortOrder.Name
	NavigationList.VerticalAlignment = Enum.VerticalAlignment.Top
	
	for _, options in ipairs(Dropdown.List) do
		local DropdownOptions = Instance.new("TextButton", DropdownList)
		DropdownOptions.BackgroundTransparency = 1
		DropdownOptions.BorderColor = Color3.fromRGB(27, 42, 53)
		DropdownOptions.Size = UDim2.new(1, 0, 0, 15)
		DropdownOptions.Visible = true
		DropdownOptions.Font = Enum.Font.GothamBold
		DropdownOptions.Text = "" .. options
		DropdownOptions.Name = options
		DropdownOptions.TextColor3 = Color3.fromRGB(255, 255, 255)
		DropdownOptions.TextScaled = true
		
		DropdownOptions.MouseButton1Click:Connect(function()
			Dropdown.Selected = options
			DropdownHolder.Text = options
			DropdownList.Visible = false
			todo.callback(options)
		end)
	end
	
	DropdownHolder.MouseButton1Click:Connect(function()
		Dropdown.Enabled = not Dropdown.Enabled
		DropdownList.Visible = not DropdownList.Visible
	end)
	
function Library:MiniToggle(todo)
	todo = Library:validate({
	Name = "Nil",
	callback = function(enabled) end
	}, todo or {})
	
	local MiniToggle = {
		Enabled = false
	}
	
	local MiniToggleTitle = Instance.new("TextLabel", ToggleButtonsMenuHolder)
	MiniToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MiniToggleTitle.BackgroundTransparency = 1.000
	MiniToggleTitle.Position = UDim2.new(0, 0, 0.0965517238, 0)
	MiniToggleTitle.Size = UDim2.new(0, 108, 0, 13)
	MiniToggleTitle.Font = Enum.Font.GothamMedium
	MiniToggleTitle.Text = Name
	MiniToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MiniToggleTitle.TextScaled = true
	MiniToggleTitle.TextSize = 14.000
	MiniToggleTitle.TextWrapped = true
	MiniToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	local MiniToggleTriggerHolder = Instance.new("Frame", MiniToggleTitle)
	MiniToggleTriggerHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MiniToggleTriggerHolder.Position = UDim2.new(0, 115, 0, 0)
	MiniToggleTriggerHolder.Size = UDim2.new(0, 32, 0, 16)
	
	local MiniToggleTriggerCorner = Instance.new("UICorner",MiniToggleTriggerHolder)
	MiniToggleTriggerCorner.CornerRadius = 1.0

	local MiniToggleTriggerUIStroke = Instance.new("UIStroke", MiniToggleTriggerHolder)
	MiniToggleTriggerUIStroke.Thickness = 1.25
	MiniToggleTriggerUIStroke.Color = Color3.fromRGB(61, 61, 61)
	
	local MiniToggleTrigger = Instance.new("TextButton", MiniToggleTriggerHolder)
	MiniToggleTrigger.BackgroundColor3 = Color3.fromRGB(146, 226, 255)
	MiniToggleTrigger.Position = UDim2.new(0, 0, 0, 0)
	MiniToggleTrigger.Size = UDim2.new(0, 16, 0, 16)
	MiniToggleTrigger.AutoButtonColor = false
	
	local function OnClicked()
		if MiniToggle.Enabled then
			MiniToggleTrigger.Position = UDim2.new(0, 20, 0, 0)
			MiniToggleTrigger.BackgroundColor = Color3.fromRGB(146, 226, 255)
		else
			MiniToggleTrigger.Position = UDim2.new(0, 0, 0, 0)
			MiniToggleTrigger.BackgroundColor = UDim2.new(173, 173, 173)
		end
	end
	
	MiniToggleTrigger.MouseButton1Click:Connect(function()
		MiniToggle.Enabled = not MiniToggle.Enabled
		OnClicked()
		
		if todo.callback then
			todo.callback(MiniToggle.Enabled)
		end
	end)
	
	OnClicked()
	
	
function Library:Slider(todo)
	todo = Library:validate({
		Name = "Nil",
		min = nil,
		max = nil,
		callback = function(value) print(value) end
	}, todo or {})
	
	local Slider = {}
	local SlidersValue
	local MouseDown = false
								
	local SlidersTitle = Instance.new("TextLabel", ToggleButtonsMenuHolder)
	SlidersTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SlidersTitle.BackgroundTransparency = 1.000
	SlidersTitle.Position = UDim2.new(0, 0, 0.503448248, 0)
	SlidersTitle.Size = UDim2.new(0, 200, 0, 11)
	SlidersTitle.Font = Enum.Font.GothamBold
	SlidersTitle.Text = "Name of it"
	SlidersTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	SlidersTitle.TextScaled = true
	SlidersTitle.TextSize = 14.000
	SlidersTitle.TextWrapped = true
	SlidersTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	local SlidersHolder = Instance.new("Frame", SlidersTitle)
	SlidersHolder.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	SlidersHolder.Position = UDim2.new(0, 0, 0, 20)
	SlidersHolder.Size = UDim2.new(todo.min / todo.max, 0, 1, 0)
	
	local SlidersHolderCorner = Instance.new("UICorner",MiniToggleTriggerHolder)
	SlidersHolderCorner.CornerRadius = 1.0
	
	local SlidersFill = Instance.new("Frame", SlidersHolder)
	SlidersFill.BackgroundColor3 = Color3.fromRGB(146, 226, 255)
	SlidersFill.Size = UDim2.new(0, 50, 0, 5)
	
	local SlidersFillCorner = Instance.new("UICorner",SlidersFill)
	SlidersFillCorner.CornerRadius = 1.0
	
	local SlidersTrigger = Instance.new("TextButton", ToggleButtonsMenuHolder)
	SlidersTrigger.BackgroundColor3 = Color3.fromRGB(146, 226, 255)
	SlidersTrigger.Position = UDim2.new(1, 0, 0, -2)
	SlidersTrigger.Size = UDim2.new(0, 10, 0, 10)
	SlidersTrigger.Text = ""
	SlidersTrigger.AutoButtonColor = false
	
	local SlidersTriggerCorner = Instance.new("UICorner",SlidersTrigger)
	SlidersTriggerCorner.CornerRadius = 1.0
	
	local function UpdateCheck(input)
		MouseDown = true
		repeat
			task.wait()
			
			local inputPosition
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					inputPosition = input.Position
				elseif input.UserInputType == Enum.UserInputType.Touch then
					inputPosition = input.Position
				end
				
			if inputPosition then
				SlidersValue = math.clamp((inputPosition.X - SlidersHolder.AbsolutePosition.X) / SlidersHolder.AbsoluteSize.X, 0, 1)
				local SlidersValueResult = math.round(SlidersValue * todo.max)
				SlidersFill.Size = UDim2.new(SlidersValue, 1)
				
				todo.callback(SlidersValueResult)
			end
		until not MouseDown
	end
	
	SlidersTrigger.MouseButton1Down:Connect(function()
		UpdateCheck(game:GetService("UserInputService").InputChanged:Wait())
	end)
								
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		MouseDown = false
		end
	end)
	
end
end
end
end
end
end
end
end

return Library
