return {
	CreateUserGUI = true, --Put false if you have your own GUI
	Codes = {
		code1 = function(player) -- example
			print("code1")
		end,
		teleport = function(player) -- example
			player.Character:SetPrimaryPartCFrame(CFrame.new(0,5,0))
		end,
		-- [IMPORTANT] In the name of the function you should enter the name of the code for example "code", and then you can write whatever you like
	}
}
