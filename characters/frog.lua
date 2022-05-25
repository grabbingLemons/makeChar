--[[ MAKE FROG!!!! ]]


name = "A 4\'1\" Frog-like Humanoid Being With Wares to Trade\n\" Sir Toadie Croaks \""

hats = {
    9057403727, 7853226490, 6774021782
}
face = 0
clothes = {
    [1] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top22
    },
    [2] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom8
    }
}


-- Colors for your shirt and pants
-- Uses HSV
topColor = Color3.new(0.0784314, 0.137255, 0.0901961)
bottomColor = Color3.new(0.0666667, 0.0666667, 0.0666667)
hatColor = Color3.new(0,0,0)
accessoryColor = Color3.new(0,0,0)

--[[
Goblin/Orc/Frogg: 0.301961, 0.541176, 0.341176
Human/Anything(tan): 0.67451, 0.52549, 0.419608
]]
skinColor = Color3.new(0.301961, 0.541176, 0.341176)

function makeNewChar()
    local player = game.Players.LocalPlayer.Name 
    local character = game:GetService("Workspace")[player]

    function findMorphs()
        for  x, y in pairs(character:GetChildren()) do
            if y:IsA("Model") then
                local strFormat1, strFormat2, strFormat3 = "%.3s", "%.6s", "%.4s"
                local strFormatted1 = string.format(strFormat1, tostring(y))
                local strFormatted2 = string.format(strFormat2, tostring(y))
                local strFormatted3 = string.format(strFormat3, tostring(y))
                if strFormatted1 == "Top" or strFormatted2 == "Bottom" or strFormatted3 == "Hair" then
                    deleteMorphs(y)
                end
            end
        end
    end
    function deleteMorphs(item)
        local morphRemove = "RemoveMorphs"
        local itemTable = {
            [1] = item
        }

        for i, v in pairs(itemTable) do
            rconsoleprint(tostring(v) .. "\n")
        end
        workspace.Replication.RemoteEvent:FireServer(morphRemove, itemTable)
    end

    
    function addClothes()
        -- add the clothes
        local morphAdd = "MorphModels"
        local changeFace = "ChangeFace"   
        local apply = "ApplyColor"
        local top, bottom = "Top", "Bottom"

        workspace.Replication.RemoteEvent:FireServer(morphAdd, clothes)

        -- color the clothes
        workspace.Replication.RemoteEvent:FireServer(apply, top, topColor)
        workspace.Replication.RemoteEvent:FireServer(apply, bottom, bottomColor)
        game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(changeFace, face)
    end

    function addHats()
        local addHat = "AddHat"
        --local addingameHats = "MorphModels"

        for _, v in pairs(hats) do
            game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(addHat, v)
        end

        --workspace.Replication.RemoteEvent:FireServer(addingameHats, ingameAccessories)
        --workspace.Replication.RemoteEvent:FireServer(addingameHats, ingameHats)
    end

    function colorStuff()
        local apply = "ApplyColor"
        local model = "RaceModel"
        --local equipment =  "Equipment"
        --local hat1 = "Hat1"

        --workspace.Replication.RemoteEvent:FireServer(apply, hat1, hatColor)
        --workspace.Replication.RemoteEvent:FireServer(apply, equipment, accessoryColor)
        workspace.Replication.RemoteEvent:FireServer(apply, model, skinColor)
    end


    
    function setupName()
        local setName = "SetName"

        workspace.Replication.RemoteEvent:FireServer(setName, name)
    end

    findMorphs()
    wait()
    addClothes()
    addHats()
    colorStuff()
    setupName()

    
end

makeNewChar()