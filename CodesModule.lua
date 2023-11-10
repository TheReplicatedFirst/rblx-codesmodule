local codesModule = {}
local Settings = require(script.Settings)

-- You can implement this module in any server script, you will need to get the module in the server script:
-- local codeModule = require(MODULE_PATH)
-- Next, you need to call the module and the init() function
-- codeModule.init()
-- And that's it, the module is ready to use!

-- You can also edit the settings, and change the code as you like

codesModule.init = function()
	local success,errormessage = pcall(function()
		local event = script.SendCode 
		event.Parent = game:GetService("ReplicatedStorage")

		if Settings.CreateUserGUI == true then
			codesModule.cloneUI()
		end
		
		event.OnServerEvent:Connect(function(player,textbox)
			local modifiedString = (textbox:gsub('[%p%c%s]', ''))
			if Settings.Codes[modifiedString] then
				Settings.Codes[modifiedString](player) -- The code function is called, you can change the parameters that will be called in the function
			end
		end)
	end)
	if success then
		print("successfully initialized")
	else
		warn(errormessage)
	end
end

codesModule.cloneUI = function()
	script.CodesGUI:Clone().Parent = game:GetService("StarterGui")
end

return codesModule
