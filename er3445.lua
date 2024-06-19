-- Replace 'CreditScript' with the name of your script

-- Define the amount of credits to give
local creditsToGive = 100  -- Adjust this number as needed

-- Function to give credits to a player
local function giveCredits(player)
    -- Ensure the player exists and is still in the game
    if player then
        -- Check if the player has a leaderstats folder
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            -- Check if the player already has a credits value
            local credits = leaderstats:FindFirstChild("Credits")
            if credits then
                -- Increment existing credits
                credits.Value = credits.Value + creditsToGive
            else
                -- Create new credits value
                local newCredits = Instance.new("IntValue")
                newCredits.Name = "Credits"
                newCredits.Value = creditsToGive
                newCredits.Parent = leaderstats
            end
        else
            -- Create leaderstats folder and add credits
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

-- Connect the function to fire when a player joins the game
game.Players.PlayerAdded:Connect(function(player)
    giveCredits(player)
end)
