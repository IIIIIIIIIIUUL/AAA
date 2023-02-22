pcall(function()
    repeat task.wait() until game.IsLoaded
    repeat task.wait() until game:GetService("Players").LocalPlayer.Character
    
    getgenv().DoritosEXECUTED = false

    if getgenv().DoritosEXECUTE then
        return;
    end

    getgenv().DoritosEXECUTE = true

    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Doritos HUB IS LOADING", -- Required
        Text = "Please Wait.", -- Required
    })
end)

        --// Tables
        getgenv().setting = {
            ["SpeedHack"] = 2,
            ["SpeedKeybind"] = Enum.KeyCode.N,
            ["FlyKeybind"] = Enum.KeyCode.J,
            ["FlySpeed"] = 125,
        }
        function Decode(str)
			local K, F = 8186484168865098, 16384 + 4887
			return (str:gsub('%x%x', function(C)
				local L = K % 274877906944
				local H = (K - L) / 274877906944
				local M = H % 128
				local C = tonumber(C, 16)
				local G = (C + (H - M) / 128) * (2*M + 1) % 256
				K = L * F + H + C + G
				return string.char(G)
			end))
		end
	
		local Light = Decode('146510be2c8e86c7')
		local Lighting = game:GetService(Light)
        
        --// Services / Classes
        local PlayerService = game:GetService("Players")
        local CurrentCam = workspace.CurrentCamera
        local player = PlayerService.LocalPlayer
        local RunService = game:GetService("RunService")
        local mouse = player:GetMouse()
    
        --// Variables for global classes
        local ESP_TOGGLE = false
        local ESP_TOGGLE_NPC = false
        local ESP_TOGGLE_NPC2 = false
        local ESP_CHEST = false
        local Noclip = false
        local client = game:GetService'Players'.LocalPlayer
        local char = client.Character or client.CharacterAdded:Wait(1)
        local hrp = char:FindFirstChild'HumanoidRootPart' or char:WaitForChild'HumanoidRootPart'
        local run = game:GetService'RunService'
    
        getgenv().Distance = false
        getgenv().DistanceNPC = 0
        getgenv().DistanceEnemy = 0
        getgenv().DistanceChest = 0
        local function CreateESP(plr, character, type, font, size, color, typ)
            local hum = character:WaitForChild("Humanoid")
            local root = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")

        if tostring(type):lower() == "text" or tostring(type) == "Text" then
        local txt = Drawing.new("Text")
        txt.Visible = false
        txt.Center = true
        txt.Outline = true
        txt.Font = font
        txt.Color = color	
        txt.Size = size

        local connection = nil
        local connection2 = nil
        local connection3 = nil

        local function DestroyESP()
            txt.Visible = false
            txt:Remove()

            if connection then
                connection:Disconnect()
            end
            if connection2 then
                connection2:Disconnect()
            end
            if connection3 then
                connection3:Disconnect()
            end
        end

        connection2 = character.AncestryChanged:Connect(function(_,parent)
            if not parent then
                DestroyESP()
            end
        end)

        connection3 = hum.HealthChanged:Connect(function(hp)
            if (hp<=0) or (hum:GetState() == Enum.HumanoidStateType.Dead) then
            DestroyESP()
            end
        end)


        connection = RunService.RenderStepped:Connect(function()
            if ESP_TOGGLE == false then
                DestroyESP()
            end

            local rootpos, rootonscr = CurrentCam:WorldToViewportPoint(root.Position + Vector3.new(0,4,0))
            if rootonscr then
                txt.Position = Vector2.new(rootpos.X, rootpos.Y)

            if not getgenv().Distance then
                txt.Text = plr.Name .. " " .. "(" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "hp" .. ")"
            elseif getgenv().Distance then
                txt.Text = "[" .. GetMagnitude(root, player.Character.HumanoidRootPart, true) .. "m" .. "] " .. plr.Name .. " " .. "(" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "hp" .. ")"
            end

                txt.Visible = true
            else
                txt.Visible = false
            end

            if (root.Position - player.Character.HumanoidRootPart.Position).Magnitude < getgenv().currentEspDistance and rootonscr then
                txt.Visible = true
            else
                txt.Visible = false
            end
        end)
        end
    end

    --[[
        elseif tostring(typ):lower() == "npc" then
                txt.Text = "[" .. GetMagnitude(root, player.Character.HumanoidRootPart, true) .. "m" .. "] " .. plr.Name .. " " .. "(" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "hp" .. ")"

                ]]
    local function CreateNPCESP(plr, character, type, font, size, color, typ)
        local hum = character:WaitForChild("Humanoid")
        local root = character:WaitForChild("HumanoidRootPart") or character:WaitForChild("Torso")
        print('a')
    if tostring(type):lower() == "text" or tostring(type) == "Text" then
    local txt = Drawing.new("Text")
    txt.Visible = false
    txt.Center = true
    txt.Outline = true
    txt.Font = font
    txt.Color = color
    txt.Size = size
    print('b')

    local connection = nil
    local connection2 = nil
    local connection3 = nil

    local function DestroyESP()
        txt.Visible = false
        txt:Remove()

        if connection then
            connection:Disconnect()
        end
        if connection2 then
            connection2:Disconnect()
        end
        if connection3 then
            connection3:Disconnect()
        end
    end

    connection2 = character.AncestryChanged:Connect(function(_,parent)
        if not parent then
            DestroyESP()
        end
    end)

    connection3 = hum.HealthChanged:Connect(function(hp)
        if (hp<=0) or (hum:GetState() == Enum.HumanoidStateType.Dead) then
        DestroyESP()
        end
    end)


    connection = RunService.RenderStepped:Connect(function()
        if ESP_TOGGLE_NPC == false then
            DestroyESP()
        end

        local rootpos, rootonscr = CurrentCam:WorldToViewportPoint(root.Position + Vector3.new(0,4,0))
        if rootonscr then
            txt.Position = Vector2.new(rootpos.X, rootpos.Y)


        if tostring(typ):lower() == "npc" then
            txt.Text = "[" .. GetMagnitude(root, player.Character.HumanoidRootPart, true) .. "m" .. "] " .. plr.Name .. " " .. "(" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "hp" .. ")"
        end
            txt.Visible = true
        else
            txt.Visible = false
        end

        if (root.Position - player.Character.HumanoidRootPart.Position).Magnitude < getgenv().DistanceEnemy and rootonscr then
            txt.Visible = true
        else
            txt.Visible = false
        end
    end)
    end
    end

    local function CreateChest1(plr, character, type, font, size, color, typ)
        local root = character:WaitForChild("Lid")
        print('a')
    if tostring(type):lower() == "text" or tostring(type) == "Text" then
    local txt = Drawing.new("Text")
    txt.Visible = false
    txt.Center = true
    txt.Outline = true
    txt.Font = font
    txt.Color = color
    txt.Size = size
    print('b')

    local connection = nil
    local connection2 = nil

    local function DestroyESP()
        txt.Visible = false
        txt:Remove()

        if connection then
            connection:Disconnect()
        end
        if connection2 then
            connection2:Disconnect()
        end
    end

    connection2 = character.AncestryChanged:Connect(function(_,parent)
        if not parent then
            DestroyESP()
        end
    end)


    connection = RunService.RenderStepped:Connect(function()
        if ESP_CHEST == false then
            DestroyESP()
        end

        local rootpos, rootonscr = CurrentCam:WorldToViewportPoint(root.Position + Vector3.new(0,2,0))
        if rootonscr then
            txt.Position = Vector2.new(rootpos.X, rootpos.Y)

        if tostring(typ):lower() == "chest" then
            txt.Text = "[" .. GetMagnitude(root, player.Character.HumanoidRootPart, true) .. "m" .. "] " .. "Chest"
        end
            txt.Visible = true
        else
            txt.Visible = false
        end
        if (root.Position - player.Character.HumanoidRootPart.Position).Magnitude < getgenv().DistanceChest and rootonscr then
            txt.Visible = true
        else
            txt.Visible = false
        end
    end)
    end
    end

    local function CreateNPCESP2(plr, character, type, font, size, color, typ)
        local hum = character:WaitForChild("Humanoid")
        local root = character:WaitForChild("HumanoidRootPart") or character:WaitForChild("Torso")
        print('a')
    if tostring(type):lower() == "text" or tostring(type) == "Text" then
    local txt = Drawing.new("Text")
    txt.Visible = false
    txt.Center = true
    txt.Outline = true
    txt.Font = font
    txt.Color = color
    txt.Size = size
    print('b')

    local connection = nil
    local connection2 = nil
    local connection3 = nil

    local function DestroyESP()
        txt.Visible = false
        txt:Remove()

        if connection then
            connection:Disconnect()
        end
        if connection2 then
            connection2:Disconnect()
        end
        if connection3 then
            connection3:Disconnect()
        end
    end

    connection2 = character.AncestryChanged:Connect(function(_,parent)
        if not parent then
            DestroyESP()
        end
    end)

    connection3 = hum.HealthChanged:Connect(function(hp)
        if (hp<=0) or (hum:GetState() == Enum.HumanoidStateType.Dead) then
        DestroyESP()
        end
    end)


    connection = RunService.RenderStepped:Connect(function()
        if ESP_TOGGLE_NPC2 == false then
            DestroyESP()
        end

        local rootpos, rootonscr = CurrentCam:WorldToViewportPoint(root.Position + Vector3.new(0,4,0))
        if rootonscr then
            txt.Position = Vector2.new(rootpos.X, rootpos.Y)


        if tostring(typ):lower() == "npc" then
            txt.Text = "[" .. GetMagnitude(root, player.Character.HumanoidRootPart, true) .. "m" .. "] " .. plr.Name .. " " .. "(" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) .. "hp" .. ")"
        end
            txt.Visible = true
        else
            txt.Visible = false
        end
        if (root.Position - player.Character.HumanoidRootPart.Position).Magnitude < getgenv().DistanceNPC and rootonscr then
                txt.Visible = true
            else
                txt.Visible = false
            end
    end)
    end
    end
    local function AddedChar(player)
        if player.Character then
            CreateESP(player, player.Character, "Text", 3, 14, Color3.fromRGB(255,255,255), "plr")
        end
        player.CharacterAdded:Connect(function(char)
            CreateESP(player, char, "Text", 3, 14, Color3.fromRGB(255,255,255), "plr")
        end)
    end

    local function MobChar(char, clr)
        if char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
            print("added esp")
            CreateNPCESP(char, char, "Text", 3, 15, clr, "npc")
        end
    end

    local function MobChar2(char, clr)
        if char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
            print("added esp")
            CreateNPCESP2(char, char, "Text", 3, 14, clr, "npc")
        end
    end

    local function Chest1(obj, clr)
        if obj:FindFirstChild("Lid") and obj:FindFirstChild("RootPart") then
            print("added chestesp")
            CreateChest1(obj, obj, "Text", 3, 14, clr, "chest")
        end
    end
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Doritos Hub [DeepWoken Dev]", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "DoritosHubOnTop"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab2 = Window:MakeTab({
	Name = "Esp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Fly,press J to enable and disable",
	Callback = function()
        pcall(function()
            for i,v in next, getconnections(game:GetService("ScriptContext").Error) do
            v:Disable()
            end
        end)
        pcall(function()
        Flying = false
        _G.Key = Enum.KeyCode.J
        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        _G.Speed = 13
        function getRoot(char)
            local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
            return rootPart
        end
        RunService.RenderStepped:Connect(function()
            pcall(function()
            if Flying then
                    local root = getRoot(Players.LocalPlayer.Character)
                    root.Velocity = Vector3.new(0,2,0)
                    local travel = Vector3.new(0,0,0)
                    local looking = (Camera.CFrame.lookVector/60)*_G.Speed
                    local rightVector = (Camera.CFrame.RightVector/60)*_G.Speed
                    game:GetService("Workspace").Gravity = 0
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        travel += looking
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        travel -= looking
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        travel += rightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        travel -= rightVector
                    end
                    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').MoveDirection.Magnitude > 0 then
                    root.CFrame = root.CFrame + (travel * _G.Speed)
                    end
            end
            end)
        end)
        UserInputService.InputBegan:Connect(function(Input,t)
            if Input.KeyCode == _G.Key and not t then
                Flying = not Flying
                game:GetService("Workspace").Gravity = 196.2
            end
           end)
        end)
    end
})
Tab:AddToggle({
	Name = "Speed Hack [N]",
	Default = false,
	Callback = function(currentState)
        if currentState then
            getgenv().setting["SpeedKeybind"] = Enum.KeyCode.N

            local client = game.Players.LocalPlayer
            local char = client.Character
            local Root = char:WaitForChild("HumanoidRootPart")

            local Camera = workspace.CurrentCamera

            local loop = false
            local active = false

            local dir = {Left = false, Right = false, Forward = false, Backward = false}
                local uis = game:GetService("UserInputService")

                uis.InputBegan:Connect(function(key, chat)
                    if not chat then
                        if key.KeyCode == Enum.KeyCode.W then
                            dir.Forward = true

                        elseif key.KeyCode == Enum.KeyCode.A then
                            dir.Left = true

                        elseif key.KeyCode == Enum.KeyCode.S then
                            dir.Backward = true

                        elseif key.KeyCode == Enum.KeyCode.D then
                            dir.Right = true

                            end
                        end
                end)

                uis.InputEnded:Connect(function(key)
                        if key.KeyCode == Enum.KeyCode.W then
                            dir.Forward = false

                        elseif key.KeyCode == Enum.KeyCode.A then
                            dir.Left = false

                        elseif key.KeyCode == Enum.KeyCode.S then
                            dir.Backward = false

                        elseif key.KeyCode == Enum.KeyCode.D then
                            dir.Right = false

                            end
                end)

                uis.InputBegan:Connect(function(key,chat)
                    local character = client.Character
                    local Root = character.HumanoidRootPart
                    pcall(function()
                    if chat then return end
                    if character and character.Humanoid and character.Humanoid.Health ~= 0 then
                    if key.KeyCode == getgenv().setting["SpeedKeybind"] then
                        loop = true
                        while task.wait() do
                            if uis:IsKeyDown(getgenv().setting["SpeedKeybind"]) then
                                active = true
                                if active then
                    if dir.Forward then
                        Root.CFrame = Root.CFrame + (Root.CFrame.LookVector * (getgenv().setting["SpeedHack"]))
                    end
                    if dir.Backward then
                        Root.CFrame = Root.CFrame + (-Root.CFrame.LookVector * (getgenv().setting["SpeedHack"]))
                    end
                    if dir.Left then
                        Root.CFrame = Root.CFrame + (-Root.CFrame.RightVector * (getgenv().setting["SpeedHack"]))
                    end
                    if dir.Right then
                        Root.CFrame = Root.CFrame + (Root.CFrame.RightVector * (getgenv().setting["SpeedHack"]))
                    end
                                end
                            end
                            if loop == false then break end
                        end -- loop end
                    end

                end
            end)
            end)


            uis.InputEnded:Connect(function(key,chat)
                if chat then return end
                if key.KeyCode == getgenv().setting["SpeedKeybind"] then
                    loop = false
                end
            end)
        else
            getgenv().setting["SpeedKeybind"] = Enum.KeyCode.Unknown
        end
	end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
Tab2:AddToggle({
	Name = "Chest ESP",
	Default = false,
	Callback = function(state)
        while task.wait(0.5) do
            if state == true then
            for _,v in pairs(game:GetService("Workspace").Thrown:GetChildren()) do
                if v:FindFirstChild("Lid") then
                    Chest1(v, Color3.fromRGB(240,177,3))
                end
            end

            ESP_CHEST = true


            local con = game:GetService("Workspace").Thrown.ChildAdded:Connect(function(v)
                if v:FindFirstChild("Lid") then
                    Chest1(v, Color3.fromRGB(240,177,3))
                end
            end)

            break
        elseif state == false then
                if con then
                con:Disconnect()
                end
                ESP_CHEST = false
            end
            break
        end -- loop end
    end  
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
Tab:AddSlider({
	Name = "Fly Speed",
	Min = 0,
	Max = 20,
	Default = 13    ,
	Color = Color3.fromRGB(85, 230, 198),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
        _G.Speed = Value
	end    
})
Tab:AddSlider({
	Name = "Speed Slide",
	Min = 1,
	Max = 5,
	Default = 3,
	Color = Color3.fromRGB(98, 218, 0),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
        getgenv().setting["SpeedHack"] = Value
	end    
})
Tab2:AddSlider({
	Name = "Chest ESP Distance",
	Min = 100,
	Max = 15000,
	Default = 2000,
	Color = Color3.fromRGB(164, 7, 236),
	Increment = 1,
	ValueName = "Distance",
	Callback = function(Value)
        getgenv().DistanceChest = Value
	end    
})
