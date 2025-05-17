function splitStringToTable(s, chunkSize)
    local t = {}
    for i = 1, #s, chunkSize do
        table.insert(t, string.sub(s, i, i + chunkSize - 1))
    end
    return t
end

local function sendCode(code)
    local seed = math.random(-10000,100000)
    if string.len(code) >= 18 then
        local chunks = splitStringToTable(code,18)
        for i,code in chunks do
            if i == #chunks then
                local chunk = Instance.new("Animation")
                stack.AnimationId="ce|" .. code .. "|" .. seed .. "|" .. i + 1
                local chunkl = game.Players.LocalPlayer.Character.Humanoid:WaitForChild("Animator"):LoadAnimation(chunk)
                chunk1:Play()
                task.wait(1)
                if chunk1 then
                    chunk1:Stop()
                    chunk1=nil
                end
            else
                local chunk = Instance.new("Animation")
                stack.AnimationId="c|" .. code .. "|" .. seed .. "|" .. i + 1
                local chunkl = game.Players.LocalPlayer.Character.Humanoid:WaitForChild("Animator"):LoadAnimation(chunk)
                chunk1:Play()
                task.wait(1)
                if chunk1 then
                    chunk1:Stop()
                    chunk1=nil
                end
            end
        end
    else
        local chunk = Instance.new("Animation")
        stack.AnimationId="c|" .. code .. "|" .. seed .. "|1"
        local chunkl = game.Players.LocalPlayer.Character.Humanoid:WaitForChild("Animator"):LoadAnimation(chunk)
        chunk1:Play()
        task.wait(1)
        if chunk1 then
            chunk1:Stop()
            chunk1=nil
        end
    end
end

local code = [[print("test")]]

sendCode()
