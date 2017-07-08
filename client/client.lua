RegisterNetEvent("GUI:Title")
AddEventHandler("GUI:Title", function(title)
	Menu.Title(title)
end)

RegisterNetEvent("GUI:Option")
AddEventHandler("GUI:Option", function(option, cb)
	cb(Menu.Option(option))
end)

RegisterNetEvent("GUI:Bool")
AddEventHandler("GUI:Bool", function(option, bool, cb)
	Menu.Bool(option, bool, function(data)
		cb(data)
	end)
end)

RegisterNetEvent("GUI:Int")
AddEventHandler("GUI:Int", function(option, int, min, max, cb)
	Menu.Int(option, int, min, max, function(data)
		cb(data)
	end)
end)

RegisterNetEvent("GUI:StringArray")
AddEventHandler("GUI:StringArray", function(option, array, position, cb)
	Menu.StringArray(option, array, position, function(data)
		cb(data)
	end)
end)

RegisterNetEvent("GUI:Update")
AddEventHandler("GUI:Update", function()
	Menu.updateSelection()
end)

Citizen.CreateThread(function()
	TriggerServerEvent("player_join")

	local menu = false
	local bool = false
	local int = 0
	local position = 1
	local array = {"TEST", "TEST2", "TEST3", "TEST4"}
	
	while true do

		if(IsControlJustPressed(0, 244)) then
			menu = not menu
		end

		if(menu) then
			TriggerEvent("GUI:Title", "test title")

			TriggerEvent("GUI:Option", "test", function(cb)
				if(cb) then
					Citizen.Trace("true")
				else
					
				end
			end)

			TriggerEvent("GUI:Bool", "bool", bool, function(cb)
				bool = cb
			end)

			TriggerEvent("GUI:Int", "int", int, 0, 55, function(cb)
				int = cb
			end)

			TriggerEvent("GUI:StringArray", "string:", array, position, function(cb)
				position = cb
			end)

			TriggerEvent("GUI:Update")
		end

		Wait(0)
	end
end)