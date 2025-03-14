local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "25e914eac7214c26b8068f71cb12eed8"
local falseData = "cc1c53aa8f22481a8746858000cebfd7"

KeyGuardLibrary.Set({
	publicToken = "7fba9d9ed25a4fc39ba25b078a94355d",
	privateToken = "977e83efba474130af14a9d66ec28bcc",
	trueData = trueData,
	falseData = falseData,
})

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local key = ""

local Window = Fluent:CreateWindow({
		Title = "Key System",
		SubTitle = "Cookie Hub",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 340),
		Acrylic = false,
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
		KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

local Entkey = Tabs.KeySys:AddInput("Input", {
		Title = "Enter Key",
		Description = "Enter Key Here",
		Default = "",
		Placeholder = "Enter key…",
		Numeric = false,
		Finished = false,
		Callback = function(Value)
				key = Value
		end
})

local Checkkey = Tabs.KeySys:AddButton({
		Title = "Check Key",
		Description = "Enter Key before pressing this button",
		Callback = function()
				local response = KeyGuardLibrary.validateDefaultKey(key)
				if response == trueData then
						print("Key is valid")
						-- Your code here
				else
						print("Key is invalid")
				end
		end
})

local Getkey = Tabs.KeySys:AddButton({
		Title = "Get Key",
		Description = "Get Key here",
		Callback = function()
				setclipboard(KeyGuardLibrary.getLink())
		end
})

Window:SelectTab(1)
