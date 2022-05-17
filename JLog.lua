
local RS = game:GetService("RunService")
local TestService = game:GetService("TestService")
local tag = "[S]"
if not RS:IsServer() then
	tag = "[C]"
end

shared.JLogIgnoreList = {}

shared.JLog = function(...)
	local Msg = tag
	local src = nil
	for k,v in ipairs({...}) do
		local vType = typeof(v)
		if vType == "Instance" then
			src = v
			for _,ignore in pairs(JLogIgnoreList) do
				if v.Name == ignore then
					return
				end
			end
		elseif vType == "table" then
			Msg = Msg .. shared.JTable(v)
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
		elseif vType == "table" then
			Msg = Msg .. shared.JTable(v)
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

shared.JLogDebugEnabled = true
shared.JDebug("JLog Load Success!")