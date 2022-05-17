local module = {}

local RS = game:GetService("RunService")
local TestService = game:GetService("TestService")
local tag = "[S]"
if not RS:IsServer() then
	tag = "[C]"
end

local LogIgnoreList = {}

shared.JLog = function(...)
	local Msg = tag
	local src = nil
	for k,v in ipairs({...}) do
		local vType = typeof(v)
		if vType == "Instance" then
			src = v
			for _,ignore in pairs(LogIgnoreList) do
				if v.Name == ignore then
					return
				end
			end
		else
			Msg = Msg .. tostring(v)
		end
	end
	TestService:Message(Msg, src)
end

shared.JWarn = function(...)
	local Msg = tag
	local src = nil
	for k,v in ipairs({...}) do
		local vType = typeof(v)
		if vType == "Instance" then
			src = v
		else
			Msg = Msg .. tostring(v)
		end
	end
	TestService:Warn(false, Msg, src)
end

shared.JTable = function(tb)
	
	if not tb then
		return "nil"
	end
	
	local str = ""
	for k,v in ipairs(tb) do
		str = str .. " [".. tostring(k).. " = " .. tostring(v) .. "] "
	end
	return str
end

shared.JDebug = function(...)
	if not shared.JLogDebugEnabled then
		return
	end
	
	shared.JLog("[Debug]", ...)
end

return module
