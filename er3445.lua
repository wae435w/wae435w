local creditsToGive = 1244520  -- Adjust this number as needed
local function giveCredits(player)
    if player then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local credits = leaderstats:FindFirstChild("Credits")
            if credits then
                credits.Value = credits.Value + creditsToGive
            else
                local newCredits = Instance.new("IntValue")
                newCredits.Name = "Credits"
                newCredits.Value = creditsToGive
                newCredits.Parent = leaderstats
            end
        else
            leaderstats = Instance.new("Folder")
            leaderstats.Name = "leaderstats"
            leaderstats.Parent = player

            local newCredits = Instance.new("IntValue")
            newCredits.Name = "Credits"
            newCredits.Value = creditsToGive
            newCredits.Parent = leaderstats
        end

        print(player.Name .. " has been awarded " .. creditsToGive .. " credits.")
    end
end

game.Players.PlayerAdded:Connect(function(player)
    giveCredits(player)
end)

