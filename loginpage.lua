local login = {}
local HttpService = cloneref(game:GetService("HttpService"))

function login.login(pass)
	local url = "https://stalcraft-catcher.online/checkservice.php"
	url = url .. "?password=" .. pass
	
	local success, response = pcall(function()
		return game:HttpGet(url)
	end)
	
	if success then
		local responseData = HttpService:JSONDecode(response)
		print(responseData["code"])
		print(responseData)
		return responseData
	else
		warn("Failed to fetch data:", response)
		return nil
	end
end

return login
