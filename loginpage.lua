local login = {}
getrenv().HttpService = cloneref(game:GetService("HttpService"))

function login.login(pass)
	local url = "http://wh16126.web3.maze-host.ru/checkservice.php"

	url = url .. "?password=" .. pass
	local success, response = pcall(HttpService.GetAsync, HttpService, url)

	if success then
		local responseData = HttpService:JSONDecode(response)
		return responseData
	else
		warn("Failed to fetch data:", response)
		return nil
	end
end

return login
