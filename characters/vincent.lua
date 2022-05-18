--[[
   !! VINCENT CHARACTER LOADER !!
]]
name = "\" Vincent Ashburn \" \nA Middle-aged rough looking man standing at about 5\'7\". The man has very coarse hands along with an irate looking face shrouded with few scars and a thick beard."

hats = {
    6871078433, 6682451716, 7435964657, 4820120408, 5355321395
}

face = 0

clothes = {
    [1] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets.Christmas.Tops.Top1
    },
    [2] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom5
    }
}


-- Colors for your shirt and pants
-- Uses HSV
topColor = Color3.new(0, 0, 0)
bottomColor = Color3.new(0.239215, 0.101960, 0.043137)

makeNewChar()

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
        for _, v in pairs(hats) do
            game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(addHat, v)
        end
    end
    
    function setupName()
        local setName = "SetName"

        workspace.Replication.RemoteEvent:FireServer(setName, name)
    end

    findMorphs()
    wait()
    addClothes()
    addHats()
    setupName()
end