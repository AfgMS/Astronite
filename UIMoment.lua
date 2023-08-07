local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local Library = {}
Library.totalWidth = 0

local function makeDraggable(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

function Library:validate(defaults, options)
    for i, v in pairs(defaults) do
        if options[i] == nil then
            options[i] = v
        end
    end
    return options
end

function Library:tween(object, properties)
    local tweenInfo = TweenInfo.new(properties.time or 0.2, properties.easingStyle or Enum.EasingStyle.Quad, properties.easingDirection or Enum.EasingDirection.Out)
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
end

function Library:createScreenGui()
    local screenGui = Instance.new("ScreenGui", game.CoreGui)
    screenGui.Name = "Sigma"
    return screenGui
end

function Library:createTabs(parentFrame, tabName)
    local TAB = {}
    TAB.Buttons = {}

    TAB.Tabs = Instance.new("Frame", parentFrame)
    TAB.Tabs.BorderSizePixel = 0
    TAB.Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TAB.Tabs.BackgroundTransparency = 0.25
    TAB.Tabs.Size = UDim2.new(0, 145, 0, 35)
    TAB.Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TAB.Tabs.Position = UDim2.new(0.03152666240930557, 0, 0.020082522183656693, 0)
    TAB.Tabs.Name = "Tabs"

    TAB.TabsName = Instance.new("TextLabel", TAB.Tabs)
    TAB.TabsName.BorderSizePixel = 0
    TAB.TabsName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TAB.TabsName.TextXAlignment = Enum.TextXAlignment.Left
    TAB.TabsName.Font = Enum.Font.SourceSans
    TAB.TabsName.TextSize = 20
    TAB.TabsName.TextColor3 = Color3.fromRGB(129, 129, 129)
    TAB.TabsName.Size = UDim2.new(0, -89, 0, 14)
    TAB.TabsName.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TAB.TabsName.Text = tabName
    TAB.TabsName.Name = "TabsName"
    TAB.TabsName.BackgroundTransparency = 1
    TAB.TabsName.Position = UDim2.new(0.7161290049552917, 0, 0.3333333730697632, 0)

    TAB.ScrollingPart = Instance.new("Frame", TAB.Tabs)
    TAB.ScrollingPart.BorderSizePixel = 0
    TAB.ScrollingPart.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TAB.ScrollingPart.BackgroundTransparency = 1
    TAB.ScrollingPart.Size = UDim2.new(0, 145, 0, 550)
    TAB.ScrollingPart.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TAB.ScrollingPart.Position = UDim2.new(0, 0, 1, 0)
    TAB.ScrollingPart.Name = "ScrollingPart"

    TAB.ScrollingModules = Instance.new("ScrollingFrame", TAB.ScrollingPart)
    TAB.ScrollingModules.Active = true
    TAB.ScrollingModules.BorderSizePixel = 0
    TAB.ScrollingModules.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TAB.ScrollingModules.Size = UDim2.new(0, 145, 0, 155)
    TAB.ScrollingModules.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    TAB.ScrollingModules.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TAB.ScrollingModules.ScrollBarThickness = 0
    TAB.ScrollingModules.Name = "ScrollingModules"

    local UIListLayout = Instance.new("UIListLayout", TAB.ScrollingModules)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    if Library.totalWidth < 99 * TAB.Tabs.Size.X.Offset then
        local newX = UDim2.new(0, Library.totalWidth, 0, 0)
        Library.totalWidth = Library.totalWidth + TAB.Tabs.Size.X.Offset

        TAB.Tabs.Position = newX

        makeDraggable(TAB.Tabs)
    else
        warn("Reached the maximum number of tabs. Cannot create more tabs.")
    end

    function TAB:ToggleButton(options)
        options = Library:validate({
            name = "BrokenUI",
        }, options or {})

        local ToggleButton = {
            Enabled = false
        }

        do
            local newButton = Instance.new("TextButton", TAB.ScrollingModules)
            newButton.BorderSizePixel = 0
            newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            newButton.TextXAlignment = Enum.TextXAlignment.Left
            newButton.Font = Enum.Font.SourceSans
            newButton.TextSize = 18
            newButton.TextColor3 = Color3.fromRGB(35, 35, 35)
            newButton.Size = UDim2.new(0, 155, 0, 35)
            newButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            newButton.Text = options.name
            newButton.Name = options.name
            newButton.Position = UDim2.new(0, 3, 0, 0)

            ToggleButton["8"] = newButton
        end

        do
            local function updateColors()
                if ToggleButton.Enabled then
                    Library:tween(ToggleButton["8"], {BackgroundColor3 = Color3.fromRGB(116, 184, 255)})
                    Library:tween(ToggleButton["8"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
                else
                    Library:tween(ToggleButton["8"], {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
                    Library:tween(ToggleButton["8"], {TextColor3 = Color3.fromRGB(35, 35, 35)})
                end
            end

            ToggleButton["8"].MouseButton1Click:Connect(function()
                ToggleButton.Enabled = not ToggleButton.Enabled
                updateColors()

                if options.callback then
                    options.callback(ToggleButton.Enabled)
                end
            end)

            updateColors()
        end

        function ToggleButton:Menu(options)
            options = Library:validate({
                name = "Probably",
                info = "Yes",
            }, options or {})

            local ButtonsMenu = {
                Enabled = false,
                Active = false,
                Slider = {}
            }

            do
                ButtonsMenu.Frame = Instance.new("Frame", CoreGui.Sigma)
                ButtonsMenu.Frame.BorderSizePixel = 0
                ButtonsMenu.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonsMenu.Frame.Size = UDim2.new(0, 285, 0, 137)
                ButtonsMenu.Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
                ButtonsMenu.Frame.Name = options.name
                ButtonsMenu.Frame.Visible = false

                local ButtonsMenuInner = Instance.new("ScrollingFrame", ButtonsMenu.Frame)
                ButtonsMenuInner.Active = true
                ButtonsMenuInner.BorderSizePixel = 0
                ButtonsMenuInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonsMenuInner.Size = UDim2.new(1, 0, 1, 0)
                ButtonsMenuInner.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
                ButtonsMenuInner.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ButtonsMenuInner.ScrollBarThickness = 3
                ButtonsMenuInner.Name = "SettingsScroll"

                local UIListLayout = Instance.new("UIListLayout", ButtonsMenuInner)
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local ButtonsMenuTitle = Instance.new("TextLabel", ButtonsMenuInner)
                ButtonsMenuTitle.BorderSizePixel = 0
                ButtonsMenuTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                ButtonsMenuTitle.TextXAlignment = Enum.TextXAlignment.Left
                ButtonsMenuTitle.Font = Enum.Font.SourceSans
                ButtonsMenuTitle.TextSize = 15
                ButtonsMenuTitle.TextColor3 = Color3.fromRGB(195, 195, 195)
                ButtonsMenuTitle.Size = UDim2.new(0, 74, 0, 15)
                ButtonsMenuTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ButtonsMenuTitle.Text = options.info
                ButtonsMenuTitle.Name = options.name
                ButtonsMenuTitle.BackgroundTransparency = 1
                ButtonsMenuTitle.Position = UDim2.new(0, 5, 0, 5)

                local ButtonsMenuTitleCorner = Instance.new("UICorner", ButtonsMenuTitle)
                ButtonsMenuTitleCorner.CornerRadius = UDim.new(0, 6)

                local ButtonsMenuTitleText = Instance.new("TextLabel", ButtonsMenu.Frame)
                ButtonsMenuTitleText.BorderSizePixel = 0
                ButtonsMenuTitleText.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                ButtonsMenuTitleText.Font = Enum.Font.SourceSans
                ButtonsMenuTitleText.TextSize = 30
                ButtonsMenuTitleText.TextColor3 = Color3.fromRGB(0, 0, 0)
                ButtonsMenuTitleText.Size = UDim2.new(0, 67, 0, 10)
                ButtonsMenuTitleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ButtonsMenuTitleText.Text = options.name
                ButtonsMenuTitleText.Name = options.name
                ButtonsMenuTitleText.BackgroundTransparency = 1
                ButtonsMenuTitleText.Position = UDim2.new(0, 5, 0, -25)
                ButtonsMenuTitleText.TextXAlignment = Enum.TextXAlignment.Left
            end

            ToggleButton["8"].MouseButton2Click:Connect(function()
                ButtonsMenu.Frame.Visible = not ButtonsMenu.Frame.Visible
                ButtonsMenu.Active = not ButtonsMenu.Active
            end)

            function ButtonsMenu:Slider(options)
                options = Library:validate({
                    title = "Preview Sliders",
                    min = 0,
                    max = 100,
                    default = 50,
                    callback = function(value) print(value) end
                }, options or {})

                local Slider = {}

                -- Rendering part
                local minValue = options.min
                local maxValue = options.max
                local initialValue = options.default

                local function clamp(value, min, max)
                    return math.max(min, math.min(max, value))
                end

                -- Rendering part
                local SlidersHolder = Instance.new("Frame", ButtonsMenuInner) -- Use ButtonsMenuInner here
                SlidersHolder.Name = "Slider"
                SlidersHolder.Size = UDim2.new(1, 0, 0, 30)
                SlidersHolder.Position = UDim2.new(0, 0, 0, 0)
                SlidersHolder.BorderSizePixel = 0
                SlidersHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SlidersHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)

                local SliderValueLabel = Instance.new("TextLabel", SlidersHolder)
                SliderValueLabel.Name = "Value"
                SliderValueLabel.Size = UDim2.new(0, 15, 0, 15)
                SliderValueLabel.Position = UDim2.new(0, 5, 0, 5)
                SliderValueLabel.Text = tostring(initialValue)
                SliderValueLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderValueLabel.TextSize = 15
                SliderValueLabel.Font = Enum.Font.SourceSans
                SliderValueLabel.BackgroundTransparency = 1
                SliderValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

                local SliderBack = Instance.new("Frame", SlidersHolder)
                SliderBack.Name = "SliderBack"
                SliderBack.Size = UDim2.new(0, 105, 0, 5)
                SliderBack.Position = UDim2.new(0, 25, 0, 20)
                SliderBack.BorderSizePixel = 0
                SliderBack.BackgroundColor3 = Color3.fromRGB(206, 233, 255)
                SliderBack.BorderColor3 = Color3.fromRGB(0, 0, 0)

                local SliderFill = Instance.new("Frame", SliderBack)
                SliderFill.Name = "SliderFill"
                SliderFill.Size = UDim2.new(initialValue / maxValue, 0, 1, 0)
                SliderFill.Position = UDim2.new(0, 0, 0, 0)
                SliderFill.BorderSizePixel = 0
                SliderFill.BackgroundColor3 = Color3.fromRGB(116, 184, 255)
                SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)

                local UISliderButton = Instance.new("TextButton", SliderFill)
                UISliderButton.Name = "UISliderButton"
                UISliderButton.Size = UDim2.new(0, 14, 0, 14)
                UISliderButton.AnchorPoint = Vector2.new(1, 0.5)
                UISliderButton.Position = UDim2.new(1, 0, 0.5, 0)
                UISliderButton.Text = ""
                UISliderButton.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
                UISliderButton.BorderSizePixel = 0
                UISliderButton.AutoButtonColor = false
                UISliderButton.ZIndex = 5
                UISliderButton.ClipsDescendants = true

                local UICorner = Instance.new("UICorner", UISliderButton)
                UICorner.CornerRadius = UDim.new(1, 0)

                -- Logic
                local dragging = false
                local dragStart
                local startPos
                local deltaOffset = 0

                UISliderButton.MouseButton1Down:Connect(function()
                    dragging = true
                    dragStart = UserInputService:GetMouseLocation().X
                    startPos = UISliderButton.AbsolutePosition.X

                    UISliderButton.MouseButton1Up:Connect(function()
                        dragging = false
                        deltaOffset = SliderFill.Size.X.Offset / SliderBack.AbsoluteSize.X
                    end)
                end)

                local function updateSlider(input)
                    if not dragging then return end
                    local mouseL = UserInputService:GetMouseLocation().X
                    local delta = (mouseL - dragStart) / (SliderBack.AbsoluteSize.X - UISliderButton.Size.X.Offset)
                    delta = clamp(delta, 0, 1)
                    local newValue = minValue + delta * (maxValue - minValue)
                    SliderValueLabel.Text = tostring(math.floor(newValue))

                    -- Update the position of SliderFill and UISliderButton based on the delta
                    local maxDelta = 105 / SliderBack.AbsoluteSize.X
                    delta = clamp(delta, 0, maxDelta - deltaOffset)
                    SliderFill.Size = UDim2.new(delta, 0, 1, 0)
                    UISliderButton.Position = UDim2.new(delta + deltaOffset, 0, 0.5, 0)
                    if options.callback then
                        options.callback(newValue)
                    end
                end

                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        updateSlider(input)
                    end
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
                        -- Stop dragging if the mouse is released outside the SliderBack
                        local mouseLocation = UserInputService:GetMouseLocation().X
                        if mouseLocation > SliderBack.AbsolutePosition.X + SliderBack.AbsoluteSize.X then
                            dragging = false
                            deltaOffset = SliderFill.Size.X.Offset / SliderBack.AbsoluteSize.X
                        end
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                        deltaOffset = SliderFill.Size.X.Offset / SliderBack.AbsoluteSize.X
                    end
                end)

                Slider.SliderHolder = SlidersHolder
                return Slider
            end

            return ButtonsMenu
        end

        return ToggleButton
    end

    return TAB
end

return Library
