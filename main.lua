-- NEW TEST

--[[
     !!SCROLL TO BOTTOM TO PICK CHARACTER!! 
]]
local branch = "master"
--[[
    Does not include race switching
    Does not include use of in-game hats
        # will add soon
]]

--[[ Name Template:
    Place anything in between the quotation marks, for special characters like single quotes, quotation marks, or if you want to make a new line do:
        \" - Use quotes inside of string, you have to use the \ behind every quote you use
        \' -  Same as quotes.
        \n - Separates with a new line
]]
name = ""

--[[ 
    !! You must own donor to use it !!
    Hat Template:
     0000, 0001, 0002 ... so on and so forth; add them between the curcly brackets 
]]
hats = {

}

--[[
    !! You must own gamepasses you wish to use !!
    Ingame Hats and accesories syntax is very similar to how shirts and pants work
    
    [*]Will add hats I would normally use soon
]]

ingameHats = {
    [1] = {
        ["name"] = "Hat1",
        ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Premium.Hats.Hat49
    }
}

ingameAccessories = {
    [1] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets["Base Game"].Equipments.Equipment10
    }
}


--[[
    Add the FaceID you wish to use, for no face leave at 0 or nil
]]
    face = 0

--[[
    !! YOU MUST OWN THE  GAMEPASSES TO USE THE CLOTHES FROM !!

    Clothes are a little iffy since there's no real easy way to change them without going...
     through each and picking them out, but the table will be placed up here for convenience

     syntax will be:
      game:GetService("ReplicatedStorage").Assets[Gamepasses].Tops.Top#
      game:GetService("ReplicatedStorage").Assets[Gamepasses].Bottoms.Bottom#

      Available sections will be: 
       Base Game
       Christmas
       Halloween

       and using the Gamepasses extension to assets, the list is expanded to:
         Eastern
         Hreinngar
         Premium
         Town
         Fantasy+
        
    Path to tops I would use:
        brigandine vest - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top6
        suit-ish kind of top - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top15
        top with straps and bags - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Tops.Top22
        santa top - game:GetService("ReplicatedStorage").Assets.Christmas.Tops.Top1
        blacksmith top - game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Tops.Top5

    Path to pants I would use:
        basic pants - game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom5
        formal-ish pants - game:GetService("ReplicatedStorage").Assets.Gamepasses.Town.Bottoms.Bottom2
        homeless dude 11s - game:GetService("ReplicatedStorage").Assets.Gamepasses.Hreinngar.Bottoms.Bottom2
        santa pants - game:GetService("ReplicatedStorage").Assets.Christmas.Bottoms.Bottom1
        gambeson skirt thing - game:GetService("ReplicatedStorage").Assets.Gamepasses.Premium.Bottoms.Bottom2
]]



clothes = {
    [1] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Premium.Tops.Top1
    },
    [2] = {
        ["model"] = game:GetService("ReplicatedStorage").Assets.Gamepasses.Premium.Bottoms.Bottom1
    }
}


-- Colors for your shirt and pants
-- Uses HSV
topColor = Color3.new(0, 0, 0)
bottomColor = Color3.new(0, 0, 0)
hatColor = Color3.new(0,0,0)
accessoryColor = Color3.new(0,0,0)

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
        local addingameHats = "MorphModels"

        for _, v in pairs(hats) do
            game:GetService("ReplicatedStorage").Remotes.Donor.RemoteEvent:FireServer(addHat, v)
        end

        workspace.Replication.RemoteEvent:FireServer(addingameHats, ingameAccessories)
        workspace.Replication.RemoteEvent:FireServer(addingameHats, ingameHats)
    end
    function colorAccesories()
        local apply = "ApplyColor"
        local equipment =  "Equipment"
        local hat1 = "Hat1"

        workspace.Replication.RemoteEvent:FireServer(apply, hat1, hatColor)
        workspace.Replication.RemoteEvent:FireServer(apply, equipment, accessoryColor)
    end
    
    function setupName()
        local setName = "SetName"

        workspace.Replication.RemoteEvent:FireServer(setName, name)
    end

    findMorphs()
    wait()
    addClothes()
    addHats()
    colorAccesories()
    setupName()
end





function pickTemplate(choice)
    if tostring(choice) == "newChar" then
        makeNewChar()
    else
        print(choice)
        print(branch)
        loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/grabbingLemons/makeChar/%s/characters/%s.lua"):format(branch, choice)), choice .. '.lua')()
    end
end


--[[
    Available choices:
        newChar
        mushy
        vincent

        and more to come soon
]]


pickTemplate("vincent")
