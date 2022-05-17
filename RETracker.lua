loadstring(game:HttpGet("https://raw.githubusercontent.com/coolguji/RobloxSafeChecker/main/JLog.lua",true))()

if shared.JConnects then
	for _,v in pairs(shared.JConnects) do
		v:DisConnect()
	end
end

shared.JConnects = {}

local function CheckRE(ins)
	if ins:IsA("RemoteEvent") then
		local conn = ins.OnClientEvent:Connect(function(...)
		    shared.JLog("=================================")
			shared.JLog("RE Received", ins:GetFullName())
			for k,v in ipairs({...}) do
				shared.JLog(tostring(k) , ": ", v)
			end
			
			shared.JLog("=================================")
		end)
		table.insert(shared.JConnects, conn)
	end
end

local function Execute()
	for _,v in pairs(game.Workspace:GetDescendants()) do
		CheckRE(v)
	end
	
	for _,v in pairs(game.ReplicatedStorage:GetDescendants()) do
		CheckRE(v)
	end

	shared.JLog("WOW!!!! RETradker Executed SUCCESS !!!!!!")
end

Execute()