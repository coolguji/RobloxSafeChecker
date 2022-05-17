loadstring(game:HttpGet("https://raw.githubusercontent.com/coolguji/RobloxSafeChecker/main/JLog.lua",true))()

local function CheckRE(ins)
	if ins:IsA("RemoteEvent") then
		ins.OnClientEvent:Connect(function(...)
		    shared.JLog("=================================")
			shared.JLog("RE Received", ins:GetFullName())
			shared.JLog(...)
			shared.JLog("=================================")
		end)
	end
end

local function Execute()
	for _,v in pairs(game.Workspace:GetDescendants()) do
		CheckRE(v)
	end
	
	for _,v in pairs(game.ReplicatedStorage:GetDescendants()) do
		CheckRE(v)
	end
end

Execute()