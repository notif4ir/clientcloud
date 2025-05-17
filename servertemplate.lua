function splitStringToTable(s, chunkSize)
    local t = {}
    for i = 1, #s, chunkSize do
        table.insert(t, string.sub(s, i, i + chunkSize - 1))
    end
    return t
end

local function sendCode(code)
    local seed = math.random(-100,1000)
    if string.len(code) >= 15 then
        local chunks = splitStringToTable(code,15)
        for i,code in chunks do
            if i == #chunks then
                local chunk = Instance.new("Animation")
                chunk.AnimationId="rbxassetid://7e|" .. code .. "|" .. seed .. "|" .. i + 1
                local chunk1 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(chunk)
                chunk1:Play()
                task.wait(1)
        --[[if chunk1 then
            chunk1:Stop()
            chunk1=nil
        end]]
            else
                local chunk = Instance.new("Animation")
                chunk.AnimationId="rbxassetid://7|" .. code .. "|" .. seed .. "|" .. i + 1
                local chunk1 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(chunk)
                chunk1:Play()
                task.wait(1)
        --[[if chunk1 then
            chunk1:Stop()
            chunk1=nil
        end]]
            end
        end
    else
        local chunk = Instance.new("Animation")
        chunk.AnimationId="rbxassetid://7|" .. code .. "|" .. seed .. "|1"
        local chunk1 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(chunk)
        chunk1:Play()
        task.wait(1)
        --[[if chunk1 then
            chunk1:Stop()
            chunk1=nil
        end]]
    end
end

local code = [[print("test") print("-- yes this script works actually OMG --")]]

sendCode(code)
