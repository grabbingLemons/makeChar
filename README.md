# USE

**This script's main and only use is to easily use characters I have made or make new characters that I can later load more easily.**

## SCRIPT

```lua

local branch = "master"

function pickCharacter(choice)
    loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/grabbingLemons/makeChar/%s/characters/%s.lua"):format(branch, choice)), choice .. '.lua')()
end


pickCharacter("mushy")
```


## UPDATES:

    Does not include race switching
    Added support for  in-game hats


## CHOICES
    Current Available Choices:
        Mushy[mushroom boy]
        Vincent[rich merchant boy]
        Guard[basic guard boy]