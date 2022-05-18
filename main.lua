--[[
     !!SCROLL TO BOTTOM TO PICK CHARACTER!! 
]]
local branch = "master"

function pickCharacter(choice)
    loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/grabbingLemons/makeChar/%s/characters/%s.lua"):format(branch, choice)), choice .. '.lua')()
end


pickCharacter("mushy")
