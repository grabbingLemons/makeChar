# USE

This script's main and only use is to easily use characters I have made or make new characters that I can later load more easily.


## SCRIPT

<<<<<<< HEAD
```lua
=======
``lua
>>>>>>> 9c1747c9e64cedeff9ba7051b39ef6bff62043aa
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
<<<<<<< HEAD
```
=======
```
>>>>>>> 9c1747c9e64cedeff9ba7051b39ef6bff62043aa
