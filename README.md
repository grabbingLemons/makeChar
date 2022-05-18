local branch = "main"

local function wImport(file)
  return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/archiveHub/makeChar/%s/%s.lua")):format(branch, file)), file .. '.lua')()
 end
 
wImport("main")