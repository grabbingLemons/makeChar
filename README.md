# USE

This script's main and only use is to easily use characters I have made or make new characters that I can later load more easily.


## SCRIPT

```lua
--[[
     !!SCROLL TO BOTTOM TO PICK CHARACTER!! 
]]
local branch = "master"
--[[
    Does not include race switching
    Does not include use of in-game hats
        # will add soon
]]


function pickCharacter(choice)
    loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/grabbingLemons/makeChar/%s/characters/%s.lua"):format(branch, choice)), choice .. '.lua')()
end


--[[
    Available choices:
        mushy
        vincent
        guard
        ...and more to come soon
]]

pickCharacter("mushy")
```