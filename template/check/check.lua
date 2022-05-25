local Webhook = "https://discord.com/api/webhooks/978917185898569738/c1458qV9ZFML7OcbDJF2_xMzmT5bjvhxr77TrLAVnUtlWYIGe9sAG_tr-R3KnMVika4U" -- Put your Webhook link here

local Headers = {["content-type"] = "application/json"} -- Don't Modify

local LocalPlayer = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local UserId = LocalPlayer.UserId
local PlayerName = LocalPlayer.Name
local PlaceID = game.PlaceId
local PlayerData =
{
       ["content"] = "",
       ["embeds"] = {{
           ["title"] = "**Username**:",
           ["description"] = PlayerName,
           ["color"] = tonumber(0x2B6BE4),
           ["fields"] = {
               {
                   ["name"] = "AccountAge:",
                   ["value"] = AccountAge,
                   ["inline"] = true
},
               {
                   ["name"] = "UserId:",
                   ["value"] = UserId,
                   ["inline"] = true
},
               {
                   ["name"] = "PlaceID:",
                   ["value"] = PlaceID,
                   ["inline"] = true
},
           },
       }}
   }

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
local HttpRequest = http_request;

if syn then
   HttpRequest = syn.request
   else
   HttpRequest = http_request
end

HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})