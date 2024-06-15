local login = {}
local HttpService = cloneref(game:GetService("HttpService"))

function login.login(pass)
	local url = "http://wh16126.web3.maze-host.ru/checkservice.php"
	url = url .. "?password=" .. pass
	
	local success, response = pcall(function()
		return game:HttpGet(url)
	end)

	
	if success then
		local successDecode, responseData = pcall(function()
			return HttpService:JSONDecode(response)
		end)
	else
		warn("Failed to fetch data:", response)
		return nil
	end
end

return login
